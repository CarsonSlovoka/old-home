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
[![gorgonia/gorgonia](https://github-readme-stats.vercel.app/api/pin?username=gorgonia&repo=gorgonia)](https://github.com/gorgonia/gorgonia) | 範例: [mnist](https://gorgonia.org/tutorials/mnist/#image-representation) 範例: [iris 鳶尾花](https://gorgonia.org/tutorials/iris/)


## net/http相關

### 推薦文章

| Name | Desc |
| ---- | ---- |
[Go 每日一库之 negroni](https://zhuanlan.zhihu.com/p/149908671) |
[Include js file in Go template](https://stackoverflow.com/a/28899786) | 一種是直接為URL進去，另一種是利用FileServer

### 相關套件

我這邊不說框架，framework有點限制，對於新手可能覺得很甜，

但一旦您熟練之後，其實會發現使用原生套件 [net/http](https://golang.org/pkg/net/http/) + [gorilla/mux](https://github.com/gorilla/mux)

就可以做很多事情了，而且寫出來都是自己能懂，框架還要看別人是怎麼設計，核心也還是回到原始套件。

如果您是團隊那就用框架(方便交接)

個人工作者，我會推自己寫，畢竟框架因為要包山包海，適用性要很強，但不是所有專案都必須用到那麼多東西，另外能加強對底層的印象以及因為是原作者後續如果要異動也比較好改。

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


### 爬蟲

| Name | Desc |
| ---- | ---- |
[![colly](https://github-readme-stats.vercel.app/api/pin?username=gocolly&repo=colly)](https://github.com/gocolly/colly) |


## 其他github不錯的項目

此區的項目可能與golang無關

| Name | Desc |
| ---- | ---- |
{{% github/st ventoy Ventoy %}} |

### 參考資料

- [免費USB多重系統選單](https://walker-a.com/archives/6571) |
