+++
title = "Go Content-Type"
description="Go Content-Type 應用"
date = 2021-05-06T09:36:35+08:00
lastmod = 2021-05-06
featured_image = ""
draft = false
weight = 0
tags = ["go", "web"]
markmap = true
toc_markmap = true
toc_bootstrap = true
+++

## What is the "idempotence"? 冪

idempotence中文翻成「冪」

HTTP/1.1 規範提到

> Methods can also have the property of "idempotence" in that
> (aside from error or expiration issues)
> the side-effects of N > 0 identical requests is the **same as for a single request**.

也就是如果他具有*冪*的特性，撇開送錯誤或者已到期的不談，那麼您送出N次的請求應該和送1次的請求是相同的

## Request

- GET : 具有idempotence的特性
- DELETE : 具有idempotence的特性 (理論上刪除1次和N次是一樣的結果)
- POST : **非idempotence**  創建資源 (其實也能更新)
- PUT : idempotence 更新資源(需要傳入完整的對象) (其實也能創建)
- PATCH : **非idempotence** 局部更新


## Go中如何接收Form的資料

[http.Request]有三種方式可以接收Form的資料

1. [ParseForm]
2. [ParseMultipartForm]
3. [PostFormValue]

### [ParseForm]

For all requests, ParseForm parses the raw query from the URL and **updates ``r.Form``**.

For

- POST
- PUT
- PATCH : 局部

requests, it *also reads the request body*,

parses it as a form and puts the results *into both r.PostForm and r.Form*.

Request body parameters take precedence over URL query string values in r.Form.

If the request Body's size has not already been limited by MaxBytesReader, the size is capped at ❗10MB❗.

For other HTTP methods, or when the Content-Type is **not** ``application/x-www-form-urlencoded``,

the request *Body is not read*, and r.PostForm is initialized to a non-nil, empty value.

建議這個只用在

> application/x-www-form-urlencoded

### [ParseMultipartForm]

```go
func (r *Request) ParseMultipartForm(maxMemory int64) error
```

ParseMultipartForm parses a request body as

> multipart/form-data.

The whole request body is parsed and up to a total of *maxMemory bytes of its file parts are stored in memory*,

因此會需要指定maxMemory的大小去讀，這部分讀到的東西保留在記憶體中

with the *remainder stored on disk in temporary files*.

不曉得臨時文件在哪?

### [PostFormValue]

PostFormValue returns the **first value** for the named component of the POST, PATCH, or PUT request **body**.

**URL query parameters are ignored.**

### 總結

說明看看就好，說明講得天花亂墜，還不如實際上去看一下代碼

例如您想查看 [ParseMultipartForm](https://golang.org/pkg/net/http/#Request.ParseMultipartForm)

說明只講一點點，你實際上點過去 [代碼連結](https://golang.org/src/net/http/request.go?s=41499:41558#L1282)

會發現如下

```go
func (r *Request) ParseMultipartForm(maxMemory int64) error {
	if r.MultipartForm == multipartByReader {
		return errors.New("http: multipart handled by MultipartReader")
	}
	if r.Form == nil {
		err := r.ParseForm()
		if err != nil {
			return err
		}
	}
	if r.MultipartForm != nil {
		return nil
	}

	mr, err := r.multipartReader(false)
	if err != nil {
		return err
	}

	f, err := mr.ReadForm(maxMemory)  // 🔔 您可以發現原來也是有大小上的限制
	if err != nil {
		return err
	}

	if r.PostForm == nil {
		r.PostForm = make(url.Values)
	}
	for k, v := range f.Value {
		r.Form[k] = append(r.Form[k], v...)
		// r.PostForm should also be populated. See Issue 9305.
		r.PostForm[k] = append(r.PostForm[k], v...)
	}

	r.MultipartForm = f

	return nil
}
```

你會發現很多細節，然後在debug進去會收入更多

## [關於boundary](https://developer.mozilla.org/zh-TW/docs/Web/HTTP/Headers/Content-Type)

通常是1~70各字元組成開頭

最後一個段落會再補上兩個``-``破折號

```
POST /foo HTTP/1.1
Content-Length: 68137
Content-Type: multipart/form-data; boundary=---------------------------974767299852498929531610575

-----------------------------974767299852498929531610575
Content-Disposition: form-data; name="description"

some text
-----------------------------974767299852498929531610575
Content-Disposition: form-data; name="myFile"; filename="foo.txt"
Content-Type: text/plain

(content of the uploaded file foo.txt)
-----------------------------974767299852498929531610575--
```

如果您用xmlHTTPRequest送POST

如果補上Content-Type

> xhr.setRequestHeader("Content-Type", "multipart/form-data; charset=utf-8")

可能會遇到

> ErrMissingBoundary = &ProtocolError{"no multipart boundary param in Content-Type"}

就是缺少boundary，一個是不寫Content-Type讓瀏覽器自己幫您解決

不然可能要參考這篇的做法

> [How to send multipart/form-data form content by ajax (no jquery)?](https://stackoverflow.com/a/5935286)



## 參考資料

- [PATCH和PUT方法的區別？](https://segmentfault.com/q/1010000005685904)
- [POST,PUT和PATCH的区别](https://www.jianshu.com/p/bee85cf4e33a)
- [georgehao/笔记.md](https://gist.github.com/georgehao/699d0d1ecf947f97a0bdc7e782ff2ba5)
- 私人連結[Get <input type="file"> with golang](https://github.com/CarsonSlovoka/go-src/issues/24#issuecomment-833267264)


[http.Request]: https://golang.org/pkg/net/http/#Request
[ParseForm]: https://golang.org/pkg/net/http/#Request.ParseForm
[ParseMultipartForm]: https://golang.org/pkg/net/http/#Request.ParseMultipartForm
[PostFormValue]: https://golang.org/pkg/net/http/#Request.PostFormValue
