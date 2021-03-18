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
-H, --header | <header/@file> Pass custom header(s) to server

{{< /table/bootstrap >}}

### 範例

{{< table/bootstrap >}}

| @@w=20%@@描述 | 語法範例 |
| ---- | ---- |
傳入帳號和密碼 | ``curl -v foo:bar@localhost:8080/admin/secrets``
加上標頭 | ``curl -v -H 'Authorization: Basic YXVzdGluOjEyMzQ=' localhost:8080/admin/secrets``

{{< /table/bootstrap >}}
