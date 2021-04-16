+++
title = "Curl教學"
description=""
date = 2021-03-17T13:49:52+08:00
lastmod = 2021-03-17
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


## 下載&安裝

> 請參考: [套件安裝-常用安裝項目-curl]({{< ref "package_manager#一些常用的安裝項目" >}})

## 指令

### curl -\-help

> Usage: curl [options...] <url>

{{< table/bootstrap >}}

| @@w=20%@@選項 | 語法範例 |
| ---- | ---- |
-v, --verbose | 可以顯示更多詳細內容\nMake the operation more talkative
-H, --header  | <header/@file> Pass custom header(s) to server
-i, --include | 把回應請求的header也顯示到輸出的結果之中\nInclude protocol response headers in the output
-X, --request | <command> Specify request command to use\n例如``-XGET``, ``-XPOST``
-d, --data    | <data>   HTTP POST data\n用在post之中，表示post的內容

{{< /table/bootstrap >}}

### 範例

{{< table/bootstrap >}}

| @@w=20%@@描述 | 語法範例 |
| ---- | ---- |
傳入帳號和密碼 | ``curl -v username:psw@localhost:8080/admin/secrets``
加上標頭 | ``curl -v -H 'Authorization: Basic YXVzdGluOjEyMzQ=' localhost:8080/admin/secrets``
送出一個post資料為json的格式 | ``curl --header "Content-Type: application/json" -d "{\"value\":\"node JS\"}" http://localhost:3000/test``
夾帶[cookie]來訪問 | ``curl --cookie "my-cookie-filed=M^IT123..." http://localhost:8080/user/secret``
帶有CSRF TOKEN和COOKIE | ``curl http://google.com -H "Cookie: 0f8c5bS8673ESS69b" -H "X-CSRF-Token: T12lKP3JKO678JsB3p3kLbjQ45O96bQWvGJAE1APUZM" -X POST``
gorilla的post測試 | ``curl --cookie "_gorilla_csrf=MTYxNzI0MjQxM3xJbVZLUlZsR00xTjBaa29yTVZkd1UwZFFlbEY1Y25wQmMyeFpaWGN6UW1JeVltVktRMFpPWWpKMGFIYzlJZ289fP9akZ53K4q_HawmqU3FF3IKwIClo5CHK71tQeTcu0m1" -XPOST  -d "{\"value\":\"node JS\"}"  http://localhost:8000/signup/post  -H "X-CSRF-Token: lW4wczUowPMdSBpBLvcVEq+8XIhf4hQ5aO37w3NXKQTt/yhkQYW8bKgSjscRwye9n5DJD+8+As8FD7nXpaGfGA=="``
content-type and CSRF | ``-H "content-type: application/json"  -H "X-CSRF-Token: /deU123=="``


[cookie]: https://docs.microsoft.com/en-us/troubleshoot/iis/xmlhttprequest-setrequestheader-method-cookies

{{< /table/bootstrap >}}


## XMLHttpRequest

```js
const xhr = new XMLHttpRequest();
xhr.open("POST", ".", true);
xhr.setRequestHeader("Content-Type", "application/json");  // 要放在open之後設定才有用，放在open之前之後又open就覆蓋掉了
xhr.setRequestHeader("X-CSRF-Token", "xxx...")
xhr.setRequestHeader("Cookie", "cookie1=value1; cookie2=value2")  // https://docs.microsoft.com/en-us/troubleshoot/iis/xmlhttprequest-setrequestheader-method-cookies

const jsonData = JSON.stringify(
    {
        /* 這裡的名稱可以是id或者name */
        "username": htmlFormControlsCollection["username"].value,
        "password": htmlFormControlsCollection["password"].value
    });
xhr.send(jsonData);  // https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/send
```


## 參考資料

- [How to Easily use cURL for HTTP Requests](https://adityasridhar.com/posts/how-to-easily-use-curl-for-http-requests)
- [XMLHttpRequest/send](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/send)
- [xmlhttprequest-cookie](https://docs.microsoft.com/en-us/troubleshoot/iis/xmlhttprequest-setrequestheader-method-cookies)
