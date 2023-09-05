+++
title = "MongoDB教學"
description="MongoDB教學"
date = 2021-12-30T13:48:00+08:00
lastmod = 2021-12-30
featured_image = ""
draft = false
weight = 0
tags = ["sql", "mongodb", "db"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
    previous_page = ""
    next_page = ""
    previous_section = ""
    next_section = ""
+++

# 入門手冊

## 註冊

> https://www.mongodb.com/

> 如果您是用google登入
>
> 想要換或重設密碼，可以到以下連結
>
> https://account.mongodb.com/account/reset/password
>
> 輸入完email之後到信箱點擊郵件，會引導您到修改密碼的頁面

## 建立第一個資料庫

mongodb的世界觀長這樣

```
- Project (您可以邀請其他人參於專案)
    - Cluster: 一個文件夾(可以放很多檔案)
        - Database: 可以有很多檔案
            - Collection1: 可想像成一個檔案
                - Document: 檔案內的每一筆資料
            - CollectionN
        - Database N
```

一開始他會叫你建立cluster，

然後叫你選擇Server相關的資訊，共有三種可選

1. Serverless: 不用server，要免費了話，這個選項也可以參考
2. Dedicated: server的一些配置，包含記憶體的大小, cluster的儲存空間，有很多個方案可以選。 (要信用卡資訊)
3. Shared: 意思是和其他人共享設備上的資源(記憶體等等)
   如果您只要學習就好，我建議選這個方案，不需要信用卡, `512MB storage, AWS M0 General class, Shared RAM, Shared vCPU, 500 connections max`

這些設定日後都可以再更改(有一個Edit Configuration)，改完之後會有一個preview，讓您對照舊方案和新方案。(您一開始選免費就是免費的，修改他預設都會幫你選一個推薦的要付費專案(
不代表您目前是付費的專案，總之看完Review Changes就會明白了)

選完之後會叫你輸入cluster的名稱(不可改)

接下來他會有以下教學，叫你完成這些事情

1. Database Access: 哪些人有存取那些資料庫的權限

    - Role: 大方向的設定，直接設定read, write等等的權限
    - Specific Privileges: 可以針對只能對某一個database的某collection有權限而已

   > Role 和 Specific Privileges 須至少有設定一個。(如果您設定了Specific Privileges，那麼Role就可以選擇刪除)

2. Network Access: 那些 [public ip]({{< ref "/pg_lang/web/web-tutorial#ip" >}}) 有辦法訪問您的cluster
3. 設定databases: 您可以自己建立資料或者匯入教學資料，您可以先匯入教學資料就大概知道該怎麼玩
    - 請到Collections的頁籤:
        - Create Database
            - Create Collection: 這個在您建立完database的旁邊會有一個箭頭就可新建collection
                - Insert Document: 插入資料
4. Connect: 這是一個引導，教您如何讓mongoDB和您的程式結合在一起
    - 選擇您的程式語言
    - 程式語言的版本
    - 貼上範例代碼: 以下我舉golang當作例子 (不過這其實沒什麼屁用，您接下來要看專門的document才能入手，請參考 [MongoDB Drivers](#mongodb-drivers)

        ```go
        import "go.mongodb.org/mongo-driver/mongo"

        clientOptions := options.Client().
            ApplyURI("mongodb+srv://<username>:<password>@my-mongo-cluster.jkj8c.mongodb.net/myFirstDatabase?retryWrites=true&w=majority")
        ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
        defer cancel()
        client, err := mongo.Connect(ctx, clientOptions)
        if err != nil {
            log.Fatal(err)
        }
        ```

> 其中的username, password與登入mongoDB的帳號密碼無關，都就是指是誰可以訪問資料庫
>
> 它可以在Database Access(`https://cloud.mongodb.com/v2/88888888888888888888888#/security/database/users`)裡面新增使用者，以及該使用者可以有哪些權限訪問該資料庫
>
> (將以上的一堆8改成您自己的識別碼即可訪問到Database Access的連結)

## [MongoDB Drivers]

這裡就是各個語言如何和MongoDB連接的參考

如果您是node.js也可以快速地看一下[w3school的教學](https://www.w3schools.com/nodejs/nodejs_mongodb.asp)

我這邊重點放在golang

### Go

```go
clientOptions := options.Client().ApplyURI("mongodb+srv://<username>:<password>@my-mongo-cluster.jkj8c.mongodb.net/<myFirstDatabase>?retryWrites=true&w=majority")
```

其中的username, password, dbName都要經過[url encoding]( https://docs.atlas.mongodb.com/troubleshoot-connection/#special-characters-in-connection-string-password)

這邊需要把以下東西經過url編碼

```
: / ? # [ ] @
```

例如 `p@ssw0rd'9'!` 編碼後須為

> p%40ssw0rd%279%27%21

在golang之中，可以透過

```go
import "net/url"
url.QueryEscape("p@ssw0rd'9'!")
```

好文章推薦

- [Quick Start: Golang & MongoDB - How to Create Documents](https://www.mongodb.com/blog/post/quick-start-golang--mongodb--how-to-create-documents)
- [刪除資料](https://kb.objectrocket.com/mongo-db/how-to-delete-mongodb-documents-using-the-golang-driver-443)


常用的library

```go
import (
	"context"
	"log"
	"time"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)
```

#### [BSON](https://docs.mongodb.com/drivers/go/current/fundamentals/bson/)

就是JSON，只是他是BINARY的形式所以取名為BSON

- D: An ordered representation of a BSON document (slice)
- M: An unordered representation of a BSON document (map)
- A: An ordered representation of a BSON array
- E: A single element inside a D type


```go
import "go.mongodb.org/mongo-driver/mongo"
clientOptions := options.Client().
    ApplyURI("mongodb+srv://<username>:<password>@my-mongo-cluster.jkj8c.mongodb.net/<myFirstDatabase>?retryWrites=true&w=majority")
ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
defer cancel()
client, err := mongo.Connect(ctx, clientOptions)
if err != nil {
    log.Fatal(err)
}
myDB := client.Database("myDbName")
myCollection := myDB.Collection("myCollection")
myCollection.InsertOne(ctx, bson.D{ // bsonD {D指的是Document} 一般資料，同json依樣
    {Key: "title", Value: "The Polyglot Developer Podcast"},
    {Key: "author", Value: "Nic Raboy"},
	{Key: "tags", Value: bson.A{"development", "programming", "coding"}}, // bsonA array 也就是 tags: ["development", "programming", "coding"]
})


// InsertMany 相對於 addOne，一次插入很多筆資料
episodeResult, err := episodesCollection.InsertMany(ctx, []interface{}{
    bson.D{
        {"podcast", podcastResult.InsertedID},
        {"title", "GraphQL for API Development"},
        {"description", "Learn about GraphQL from the co-creator of GraphQL, Lee Byron."},
        {"duration", 25},
    },
    bson.D{
        {"podcast", podcastResult.InsertedID},
        {"title", "Progressive Web Application Development"},
        {"description", "Learn about PWA development with Tara Manicsic."},
        {"duration", 32},
    },
})
if err != nil {
    log.Fatal(err)
}
fmt.Printf("Inserted %v documents into episode collection!\n", len(episodeResult.InsertedIDs))
```

## MongoDB設定

- 帳單資訊: [Organizations](https://cloud.mongodb.com/v2#/preferences/organizations) 選擇您的組織，點進去之後有一個**Billing**，就可以設定


## 其他參考

- [redis文章](https://iter01.com/550108.html) : redis感覺管理不方便


[clusters管理]: https://cloud.mongodb.com/v2#/clusters
[MongoDB Drivers]: https://docs.mongodb.com/drivers/


