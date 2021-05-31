+++
title = "Shodan Tutorial"
description="Shodan搜尋引擎介紹"
date = 2021-05-31T10:41:19+08:00
lastmod = 2021-05-31
featured_image = ""
draft = false
weight = 0
tags = ["spy", "shodan"]
markmap = true
toc_markmap = true
toc_bootstrap = true
+++

## 簡介

Shodan是一個搜尋引擎，可以搜尋IoT{{< sup "[Internet of things(物聯網)](https://en.wikipedia.org/wiki/Internet_of_things)" >}}設備


## 使用教學

### 前置動作

1. 申請帳號
    > https://www.shodan.io/

2. 查看api key
    > https://account.shodan.io

    請記好您的API KEY，後面會用到！

    另外API KEY可以隨時更換，不用擔心外洩

## 使用教學

有兩種方法

1. 直接使用網頁搜尋
2. 使用cmd指令

### 指令

查看

> https://www.shodan.io/search/filters

有全部可以使用的指令，如果要細節也可以點選右上的[EXAMPLES](https://www.shodan.io/search/examples)

### CMD指令

shodan有提供python的套件可以使用

> pip install shodan

完成之後會把shodan裝到

> Python安裝路徑\Scripts\shodan.exe


```py
import shodan
VISITOR_IP = "xxx.xxx.xxx.xxx"
API_KEY = "TEST123456789zAWmYlhYn4gFl7zbZ61"  # Free API key from https://account.shodan.io
api = shodan.Shodan(API_KEY) # Setup the API wrapper
print(api.info())
host = api.host(VISITOR_IP)
```

而如果您要用cmd，要記得先用init告知api_key才可以下指令

```
shodan init [api_key]
shodan count net:xxx.xxx.xxx.xxx
```
