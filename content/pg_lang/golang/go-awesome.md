+++
title = "Go Awesome"
description="推薦的go資訊"
date = 2021-04-01T13:36:29+08:00
lastmod = 2021-04-01
featured_image = ""
draft = false
weight = 0
tags = ["go"]
markmap = true
toc_markmap = true
toc_bootstrap = true
+++


## awesome-go

| Name | Desc |
| ---- | ---- |
[![negroni](https://github-readme-stats.vercel.app/api/pin?username=avelino&repo=awesome-go)](https://github.com/avelino/awesome-go) | 幫您整理了很多資料，您可以在裡面搜尋到特殊領域相關所推薦的套件


## net/http相關

### 推薦文章

| Name | Desc |
| ---- | ---- |
[Go 每日一库之 negroni](https://zhuanlan.zhihu.com/p/149908671) |
[Include js file in Go template](https://stackoverflow.com/a/28899786) | 一種是直接為URL進去，另一種是利用FileServer

### 相關套件

我這邊不說框架，framework有點限制，對於新手可能覺得很甜，

但一旦您熟練之後，其實會發現使用原生套件 [net/http](https://golang.org/pkg/net/http/) + [gorilla/mux](https://github.com/gorilla/mux)

就可以做很多事情了，而且寫出來都是自己能懂得，框架還要看別人是怎麼設計的，還且其實核心都會回到原始套件

| Name | Desc |
| ---- | ---- |
[![negroni](https://github-readme-stats.vercel.app/api/pin?username=urfave&repo=negroni)](https://github.com/urfave/negroni) |

### Forms

| Name | Desc |
| ---- | ---- |
[![gorilla/csrf](https://github-readme-stats.vercel.app/api/pin?username=gorilla&repo=csrf)](https://github.com/gorilla/csrf) | 我很喜歡gorilla出版的東西，他通常都不太用第三方套件，都是盡量以原生套件為主


### Web Framework

我雖然不鼓勵用框架，但新手學習還是先用框架為主，原因是先要讓人了解世界有多大

在你對世界觀有個理解之後再回去自己領地構建(整個世界大概有那些東西存在，然後您是否要跟進等等)

若是一開始直接從原始套件著手，可能會成為井底之蛙。

| Name | Desc |
| ---- | ---- |
[![gin-gonic/gin](https://github-readme-stats.vercel.app/api/pin?username=gin-gonic&repo=gin)](https://github.com/gin-gonic/gin) | 神級別的框架，新手可以先用這個框架，之後再回頭用原生框架
