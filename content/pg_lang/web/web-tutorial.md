+++
title = "Web相關"
description=""
date = 2021-03-11T13:55:24+08:00
lastmod = 2021-03-11
featured_image = ""
draft = false
weight = 0
tags = ["web"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = ""
  next_page = ""
  previous_section = ""
  next_section = ""
+++

## [網址的意涵](https://developer.mozilla.org/en-US/docs/Web/API/Location#result)

以 ``https://example.org:8080/foo/bar?q=baz#bang`` 為例

| Name | Desc |
| ---- | ---- |
href     | https://example.org:8080/foo/bar?q=baz#bang
origin   | https://example.org:8080
protocol | https: (http, ftp, ...)
host     | example.org:8080
hostname | example.org
port     | 8080
pathname | /foo/bar
search   | ?q=baz
hash     | bang

這些東西可以透過[Location](https://developer.mozilla.org/en-US/docs/Web/API/Location#result)去取得

document 表示的是一個文檔對象，windows 表示一個窗口對象。
一個窗口下面可以有很多的document對象。每個document 都有 一個URL。



## ngrok 外網代理

1. 下載: [https://ngrok.com/download](https://ngrok.com/download)
2. unzip /path/to/ngrok.zip
3. cd
4. ``ngrok.exe http 8080``  (port埠號可以隨意

    ```
    Session Expires   7 hours, 49 minutes    <-- 免費版本只能持續8小時，到期之後要重新再來
    Web Interface     http://127.0.0.1:8080    <-- 這個可以用來管理查看整個請求的狀況
    ```

----

ngrok已經不在提供給沒有註冊的帳號使用，必須註冊帳號之後才能用

註冊好帳號登入之後

它會自動根據您的OS，提供給您zip檔案下載

完成之後解壓縮該zip檔案，之後使用您的token進行連接

token可以進入到`Your AuthToken`進行修改.

取得token之後執行命令

> ngrok config add-authtoken 2KoRvRwnNKlqdZHWDfsX01dP93z_4hFtrS6XusYzo3tmu3PoL
(以上的token已經無效，僅當作範例說明而已)

即可完成設定，其中他會告訴您設定檔存放在哪裡，例如:

> AuthToken saved to configuration file: `%localAppdata%/ngrok/ngrok.yml`

其中ngrok.yml的內容如下:

```yaml
version: "2"
authtoken: 2KoRvRwnNKlqdZHWDfsX01dP93z_4hFtrS6XusYzo3tmu3PoL # token已經無效，僅當作範例說明而已
```

----

之後使用以下指令，即可連線(port可以自己更改)

```
ngrok http 80
```

### 額外命令

- Install your auth token: ``ngrok authtoken <YOUR_AUTHTOKEN>``
- Password protecting your tunnel: ``ngrok http -auth="username:password" 8080``

### 參考資料

- [ngrok_doc](https://ngrok.com/docs)


## Python的http服務

```bat
@echo off
SET port_number=8080
start python -m http.server %port_number%
start http://localhost:%port_number%/
ngrok http %port_number%
```


## 區域連線

如果您只想要區域網路可以連接到您本機，可以直接新增防火牆的規則就可以了

- 開啟防火牆
- 輸入規則
    - 新增規則
        - 選擇自訂
    - 程式: 路徑最好不要用`%userprofile%`[^absPath]使用`C:\users\`代替
    - 一般
        - 可以選擇IPsec的安全連線(設定這個可以新增使用者，讓只有這些使用者才能連過來) (如果真的不行就改允許連線)
    - 通訊協定及連接埠
        - 選TCP
        - 埠編號: 同您程式上指定的埠編號 (建議您選，不要開放所有埠編號)
    - 領域
        - 本機IP位址: 表示只開放這個ip為只給外面使用

            放`ipconfig /all`中給的`ipv4`位址
        - 遠端IP位址: 哪些IP位址有權來訪問您指定的IP位址

            同本機IP位址，只是這些IP改為遠端電腦的IP V4位址
    - 進階: 好像要都勾才會生效
        - [V] 網域
        - [V] 私人
        - [V] 公用

## IP

[為什麼網路上查到的IP與ipconfig所查到的不一樣?](https://blog.csdn.net/gui951753/article/details/79210535)

> 當我們真正聯網的時候，會先把數據發送道路由，然後再由路由進行處理實現真正的關聯操作，
>
> 路由的地址才是真正聯網的IP位址，也就是public ip，而ipconfig查到的是「私有」ip

私有ip不能對外傳播(只能用在**內部網路**)


[^absPath]: 不曉得為什麼，總之如果這麼做可能會失敗
