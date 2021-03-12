+++
title = "Docker教學"
description=""
date = 2021-03-10T15:35:37+08:00
lastmod = 2021-03-10
featured_image = ""
draft = false
weight = 0
tags = ["docker"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = ""
  next_page = ""
  previous_section = ""
  next_section = ""
+++

## 安裝

安裝請參考: [套件安裝-常用安裝項目-docker-cli]({{< ref "package_manager#一些常用的安裝項目" >}})

> choco install docker-cli

秒安裝，很快就完成了😎 (不過這個只是cli而已，還要再裝docker的主程式)

## CLI指令

- 查看幫助: ``docker --help``
- 萬用指令: ``docker xxx --help``

  例如查看create指令:

  > ``docker create --help``

## Docker架構

你先要知道它總體的來說，有三樣東西是重要的
1. Image
2. Container
3. Repository

### Image (映像檔)

掌管Container的基底。

舉例來說，我如果需要建立一個container來處理某項事務。

那這個container需不需服務？(例如HTTP的功能)

然後又要搭載於哪一個OS下？

### Container

#### 建立:

指令:

> ``docker create [OPTIONS] IMAGE [COMMAND] [ARG...]``

舉例:

> ``docker create --name xxx --publish 80:80 nginx:alpine``

以上這段指令的意思是:

新建一個名稱為xxx的container

其中``-p, --publish list``後面可以接一個list，表示要暴露出去給localhost的port(s)編號，80:80表示80~80所以就只有一個80port而已

nginx:alpine[^alpine]這個就是IMAGE，


其中:

- [nginx]: 能提供高性能的HTTP以及反向代理服務器，同時包含TCP/UDP, SMTP, IMAP等服務器的功能。
- alpine:是一個簡易版的linux內核

如果沒有這個東西他會自己下載。

### 查看系統中存在的Image

> docker images



### Repository


## 指令

## 參考資料

- [HOW TO CREATE A DOCKER IMAGE FROM A CONTAINER](https://www.scalyr.com/blog/create-docker-image/)
- [Docker 基礎教學與介紹](https://cwhu.medium.com/docker-tutorial-101-c3808b899ac6)
- [Docker的歷史](https://www.ithome.com.tw/news/113899)


[^alpine]: alpine: 指的是Alpine Linux内核(5 MB左右)，比ubuntu内核要小很多。更多請詳:[Alpine Linux，一个只有 5M 的 Docker 鏡像](https://www.infoq.cn/news/2016/01/Alpine-Linux-5M-Docker/])



[nginx]: https://nginx.org/en/
