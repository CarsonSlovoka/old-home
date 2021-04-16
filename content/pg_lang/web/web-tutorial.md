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

## ngrok 外網代理

1. 下載: [https://ngrok.com/download](https://ngrok.com/download)
2. unzip /path/to/ngrok.zip
3. cd
4. ``ngrok.exe http 8080``  (port埠號可以隨意

    ```
    Session Expires   7 hours, 49 minutes    <-- 免費版本只能持續8小時，到期之後要重新再來
    Web Interface     http://127.0.0.1:8080    <-- 這個可以用來管理查看整個請求的狀況
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
