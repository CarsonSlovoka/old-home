+++
title = "Wi-Fi相關"
description=""
date = 2022-01-17T17:34:00+08:00
lastmod = 2022-01-17
featured_image = ""
draft = false
weight = 0
tags = ["request"]
markmap = true
toc_markmap = true
toc_bootstrap = true
+++

# 認識Wi-Fi

| name | desc |
| ---- | ---- |
Wi-Fi | 是泛指所有符合Wi-Fi認證的無線**設備**，你也可以看做是能讓你Wi-Fi上網的裝置。
Wifly | 是提供Wi-Fi上網的一項**服務**，你也可以看做是能Wi-Fi上網的地方。


## 取得Wifly密碼

```
netsh wlan show profiles # 顯示所有使用者資訊

使用者設定檔
-------------
    所有使用者設定檔 : MyIPhone

netsh wlan show profile "MyIPhone" key=clear  # 即可查詢該設備的密碼
```

> NOTE: 如果`key=clear`您還是看不到密碼，可能是因為權限的關係所導致，用admin權限即可解決。
