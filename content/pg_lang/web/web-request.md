+++
title = "Web Request"
description=""
date = 2021-03-30T10:59:08+08:00
lastmod = 2021-03-30
featured_image = ""
draft = false
weight = 0
tags = ["request"]
markmap = true
toc_markmap = true
toc_bootstrap = true
+++

## Header

| 名稱 | 設定值 |
| ---- | ---- |
Access-Control-Allow-Origin | *
Access-Control-Allow-Methods | POST, GET, OPTIONS, PUT, DELETE,...
Access-Control-Allow-Headers | Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization

```go
var w http.ResponseWriter
w.Header().Set("Access-Control-Allow-Origin", "*")
w.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
w.Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization")
```

### Content-Type種類有哪些？

| 名稱 | 描述 |
| ---- | ---- |
multipart/form-data |
image/jpeg | jpg
image/gif |
image/tiff |
application/json |
application/pdf |
application/msword | Word文檔格式
application/octet-stream | 二進制流數據（如常见的文件下载）
application/x-www-form-urlencoded |  ``<0form encType="">``中默認的encType的數值，form表單數據會被編為成key/value格式上傳到伺服器（表單默認的提交格式)
multipart/form-data | 表單中如果需要文件上傳，就要用這種格式
text/plain |
text/html | HTML

當然還有很多，我只是列出一部份而已，如果您有其他的數據格式再上網搜一下。

#### Form有哪些content type可以使用

1. ``application/x-www-form-urlencoded``
2. ``multipart/form-data``
3. ``text/plain``

#### [AJAX Content-type設定](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/setRequestHeader)

> XMLHttpRequest.setRequestHeader(header, value)

❗ 有可能會沒有辦法改，這時候需要server設定:  Access-Control-Allow-Headers 才可以

以下是golang的設定

```go
var w http.ResponseWriter
w.Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization")
```

## Cookie

### [SameSite Cookie](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie/SameSite)

通常網站會設定cookie，有這些cookie的資訊才可以做某些事情。

使用者如果在瀏覽正常網站的同時(正確的cookie已被寫入)，又去瀏覽惡意網站， 使用者就會受到攻擊。

post的內容惡意網站可以偽造，而網站的cookie因為已經設定了，所以也可以通過。

那麼如果瀏覽器有辦法做到，知道現在這個請求是跨站所發出，那麼他就沒辦法使用目的網站的cookie，就能避免掉這類的攻擊了

而SameSite Cookie就是這種機制: 要用這些cookie就必須在相同的網站才可以使用的到。

SameSite Cookie中還有一些選項，如下:

- Strict: 會嚴格限制，也就是任何的cross site request都不會被附加。包含``<a href="">``, ``<form>``, ``new XMLHttpRequest`` 這類的請求也不會附加這個cookie
- Lax: Lax 模式放寬了一些限制，例如說``<a>``, ``<link rel="">``, ``<form method="GET">`` 這些都還是會帶上 cookie。

  但是 POST 方法的 form，只要是 POST, PUT, DELETE 這些方法，就不會帶上 cookie。

  所以一方面你可以保有彈性，讓使用者從其他網站連進你的網站時還能夠維持登入狀態，一方面也可以防止掉 CSRF 攻擊。

  **但 Lax 模式之下就沒辦法擋掉 GET 形式的 CSRF！**。

所以可以準備兩組cookie，一組用在簡單的行為(使用Lax)，另一個需要比較嚴密的用Strict。

像是更改使用者設定，明明已經登入了，又跑出來叫你登一次就大概是用這類的方法。

## CSRF

CSRF Cross-site request forgery

一般來說來避免這種攻擊，有幾種方式:

1. 驗證referer:

    缺點:

      1. 設計邏輯不能出錯。
      2. referer的值有可能被串改
      3. 用戶可以選擇不提供referer

            referer會記錄下用戶的訪問來源，

            有些用戶認為這樣會侵犯到他們的隱私權(特別是有些組織擔心組織內中的某些訊息會洩漏到外網中)

            因此用戶可以設定，使瀏覽器不提供Referer。這種情況下您所看到的referer都是空值，就會被您誤認為是CSRF的攻擊。

2. 驗證碼: 使用者覺得麻煩，用戶體驗差
3. SameSite cookie: 很方便，主流的瀏覽器都已經支持
4. CSRF token: 公認的做法。 只要token不外洩就是很安全的方式

go中搭配gin框架來實現CSRF來實現中間件(Middleware) CSRF

> 所謂middleware: 是指請求前的預處理程序
>
> 也就是您希望在收到這個請求的時候，可以先做一些檢查之類的機制，當合乎您的要求，在正式的接受這個請求

gin框架中的gin.Context，本身具備Next方法，這個方法調用之後就會正式得到這個請求

```go
func MiddlewareCSRF(tokenLookupWay string) gin.HandlerFunc {
	return func(c *gin.Context) {
		var token string
		switch tokenLookupWay {
		case "get":
			token = c.Query(TokenKey) // 這個可以對url的網址篩選出指定的get參數
		case "post":
			token = c.PostForm(TokenKey) // post就從form中找出我們要的關鍵輸入(csrf)資料 (所以您要在form中篩一個csrf的數值進去)
		case "header":
			token = c.GetHeader(TokenKey) // 從header中取得csrf
		}

		cookie, err := c.Cookie(TokenCookie) // 去cookie查詢是否有csrf的token
		if token == "" || err != nil || cookie != token { // cookie查到的token應該要和請求的一樣
			c.AbortWithStatus(403)
		}
		c.Next() // ↑ before request ↓ after request
		// ...
	}
}
```

gin中要使用該Middleware只要使用USE的方法即可

```
r := gin.Default() // 回傳的其實是gin.Engine，但其實大多數的人都會喜歡把這個東西稱作router

r.Use(CSRF("header")) // 使用某個middleware

r.GET("/Home", func(c *gin.Context){ // Home的路由處理
    c.String(200, "ok")
})
r.Run(":8080")
```


## 參考資料

- [runoob http-content-type](https://www.runoob.com/http/http-content-type.html)
- [CSRF token bypass](https://shahmeeramir.com/methods-to-bypass-csrf-protection-on-a-web-application-3198093f6599)
- [Go語言中基予中間件避免CSRF攻擊](https://laravelacademy.org/post/22073)
