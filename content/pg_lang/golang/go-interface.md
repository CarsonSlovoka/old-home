+++
title = "Go Interface"
description=""
date = 2021-03-15T10:03:39+08:00
lastmod = 2021-03-29
featured_image = ""
draft = false
weight = 0
tags = []
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = ""
  next_page = ""
  previous_section = ""
  next_section = ""
+++


## Interface的範例

### http.Handler & http.HandlerFunc

以下的代碼都是在 ``net.http.server.go``

{{< table/code-by-example >}}

```go
func StripPrefix(prefix string, h Handler) Handler {
	// ...
	return HandlerFunc(func(w ResponseWriter, r *Request) {
		// ...
	})
}
```

可以看到StripPrefix需要的是一個 ``Handler``

但是他的回傳值直接來看，得到的應該是 ``HandlerFunc``

換句話說 ``HandlerFunc`` 是可以當作 ``Handler`` 來使用的

因為 ``HandlerFunc`` 確實有實作``ServeHTTP``所以確實可以這樣用

@@NEW-COL@@

```go
type Handler interface {
	ServeHTTP(ResponseWriter, *Request)
}

type HandlerFunc func(ResponseWriter, *Request)

// ServeHTTP calls f(w, r).
func (f HandlerFunc) ServeHTTP(w ResponseWriter, r *Request) {
    f(w, r)
}
```

HandlerFunc到底在幹嘛，我們發現它就是在執行一次 ``f(w, r)``

那因為這個f本身又是一個 ``HandlerFunc`` 所以其實就是一直``巢狀``的跑完所有``HandlerFunc``的內容
也就是

> ServeHTTP

所以當您要生成``HandlerFunc``，

除了可以把實作寫在本身的函數之中， 也能把內容寫在「``ServeHTTP``」。

{{< /table/code-by-example >}}


### http.Fileserver

這一個是我們在http很常用到的東西，

```go
_ = http.StripPrefix("/public/",
    http.FileServer(http.Dir("./public/everyone")),
)
```

它對傳入的URL做修正移除前綴``/public/``，例如: ``/public/index.html``

如果不用StripPrefix，他訪問的會是:

> .public/everyone/public/index.html

現在我們有興趣的是，如何改寫FileServer，也就是控制我們那些東西應該呈現，哪些不要

*(預設的情況下，用http.Dir會把所有東西都顯示出來包含資料夾，如果您用在根目錄，那別人可以訪問到您所有的文件！)*


{{< table/code-by-example >}}

```go
func FileServer(root FileSystem) Handler {
	return &fileHandler{root}
}
```

這是net.http.fs.go中的定義

可以發現FileServer的參數需要一個FileSystem

@@NEW-COL@@

```go
type FileSystem interface {
	Open(name string) (File, error)
}
```

而FileSystem是一個interface，

也就是說這一個interface只要有實現Open這一個方法，那麼就可以算這個interface

一般建議用http.Dir，所以我們知道http.Dir是一個可行的方式

因此只要我們去仿照http.Dir即可

```go
http.FileServer(http.Dir("./public/everyone"))
```

{{< /table/code-by-example >}}

剛剛說過FileServer的參數需要FileSystem

而這個Dir有實現Open所以確實是FileSystem的interface

所以您只要去抄襲http.Dir後即可。

反正您就對您的檔案做篩選，如果檔案要呈現，回傳該File，

如果不呈現就回傳``nil, error``即可。

```
type Dir string

func (d Dir) Open(name string) (File, error) {
    ...
    if err != nil {
		return nil, mapDirOpenError(err, fullName)
	}
	return f, nil
}
```
