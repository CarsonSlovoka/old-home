+++
title = "go-admin"
description=""
date = 2021-02-26T18:45:47+08:00
lastmod = 2021-02-26
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


## go-admin是什麼？

| repository |  |  |
| ------ | ----- | ----- |
| [go-admin] | {{< github/get_info_img GoAdminGroup go-admin stars >}} | {{< github/get_info_img GoAdminGroup go-admin forks "https://www.google.com/" >}} |

- 🚀 高生产效率: 10分钟内做一个好看的管理后台
- 🎨 主题: 默认为adminlte，更多好看的主题正在制作中，欢迎给我们留言
- 🔢 插件化: 提供插件使用，真正实现一个插件解决不了问题，那就两个
- ✅ 认证: 开箱即用的rbac认证系统
 -⚙ 框架支持: 支持大部分框架接入，让你更容易去上手和扩展

好，總之就各種好棒棒...讓我們繼續往下看要怎麼弄


## Getting Started

### 為您的資料庫新增一些資料表和欄位

你可能自己已經在一些網站爬過文，那麼人家一開就叫你匯入SQL...

他會要求導入sql，是因為go-admin可以讓您客製化面板，那麼您總不希望成功運行之後什麼東西都沒看到對吧，

所以面板的一些資訊就是從資料庫過來，

如果您的資料庫是My SQL那麼就用以下這個腳本即可

> [SQL](https://github.com/eddycjy/go-gin-example/blob/master/docs/sql/blog.sql)

阿嘞，我不是用My SQL怎麼辦呢😕

還是可以參考上面的腳本，反正無非就是在資料庫新增一些資料表，和在資料表中設定一些欄位罷了

{{< set-id "三個資料表" "他要這三個資料表">}}
```
- blog_article
- blog_auth
- blog_tag
```

### 安裝GoAdmin的工具

```
GO111MODULE=on
GOPROXY=https://goproxy.cn go install github.com/GoAdminGroup/go-admin/adm
```

您可能會有一些疑問:
- GO111MODULE不能用auto嗎？
  > 其實也是可以，你就先建立個go.mod就好了。
- GOPROXY一定要用cn的那個嗎？
  > go-admin就是中國人設計的，所以就用https://goproxy.cn應該是最完善的

----

完成以後您就可以下指令:

> adm -V
>
> 輸出: GoAdmin CLI v1.2.7

如果沒有成功請檢查``$GOPATH/bin``這個路徑是不是有在您的環境變數之中，因為adm.exe就放在這邊。

### 再匯入goadmin需要用到的資料表

連同我們前面講的[三個blog資料表]({{<ref "#三個資料表" >}})

```
- blog_article
- blog_auth
- blog_tag
- goadmin_menu
- goadmin_operation_log
- goadmin_permissions
- goadmin_role_menu
- goadmin_role_permissions
- goadmin_role_users
- goadmin_roles
- goadmin_session
- goadmin_user_permissions
- goadmin_users
```

至此，請確保您的資料庫有以上這些資料表

### 生成數據模型代碼

建立一個您想要的專案名稱，然後cd過去，接著

> adm generate

他會問你要的資料庫是哪一個，選擇您要的就好了

```
? choose a driver  [Use arrows to move, type to filter, enter to select]
  mysql
> postgresql
  sqlite
  mssql
```

問相關的設定

```
? choose a driver mysql
? sql address 127.0.0.1
? sql port 3306
? sql username root
? sql password ****
? sql database name gin-example-blogs
```

可以管理那些資料表

```
? choose table to generate  [Use arrows to move, space to select, type to filter]
> [x]  [select all]
  [ ]  blog_article
  [ ]  blog_auth
  [ ]  blog_tag
```

接著還有一些相關的設定，我們都用預設的即可

```
? set package name main
? set connection name default
? set file output path ./
```

最後您可以看到這些文件被生成:

```
.
├── tables.go
├── blog_article.go
├── blog_auth.go
└── blog_tag.go
```

### 編寫main.go

{{ table/code-by-example }}

注意本篇代碼是使用gin-gonic他配go-admi，他也有其他的配法不一定要用gin-gonic。

@@NEW-COL@@

```go
package main

import (
    _ "github.com/GoAdminGroup/go-admin/adapter/gin"               // 适配器
    _ "github.com/GoAdminGroup/go-admin/modules/db/drivers/mysql" // sql 驱动
    _ "github.com/GoAdminGroup/themes/adminlte"                    // ui主题

    "github.com/GoAdminGroup/go-admin/engine"
    "github.com/GoAdminGroup/go-admin/examples/datamodel"
    "github.com/GoAdminGroup/go-admin/modules/config"
    "github.com/GoAdminGroup/go-admin/modules/db"
    "github.com/GoAdminGroup/go-admin/modules/language"
    "github.com/GoAdminGroup/go-admin/template"
    "github.com/GoAdminGroup/go-admin/template/chartjs"
    "github.com/gin-gonic/gin"
    "io/ioutil"
)

func main() {
    r := gin.Default()

    gin.SetMode(gin.ReleaseMode)
    gin.DefaultWriter = ioutil.Discard

    eng := engine.Default()

    template.AddComp(chartjs.NewChart())

    if err := eng.AddConfig(config.Config{
        Databases: config.DatabaseList{
            "default": {
                Host:       "127.0.0.1",
                Port:       "3306",
                User:       "root",
                Pwd:        "root",
                Name:       "gin-example-blogs",
                MaxIdleCon: 50,
                MaxOpenCon: 150,
                Driver:     db.DriverMysql,
            },
        },
        UrlPrefix: "admin",
        IndexUrl:  "/",
        Debug:     true,
        Language:  language.CN,
    }).
        AddGenerators(Generators).
        Use(r); err != nil {
        panic(err)
    }

    r.Static("/uploads", "./uploads")

    eng.HTML("GET", "/admin", datamodel.GetContent)

    _ = r.Run(":9033")
}
```

{{ /table/code-by-example }}

寫完代碼之後

> go run .

```
> go run .

[GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

GoAdmin is now running.
Running in "debug" mode. Switch to "release" mode in production.
```

看到GoAdmin is now running.就表示成功了

您可以開始訪問: http://localhost:9033/admin/login

預設的帳號密碼都是:``admin``

## 客製化

如果您要訪問menu頁面，即: http://localhost:9033/admin/menu

那麼您要編寫一個``tables.go``文件，如下:

```go
package main

import "github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"

// The key of Generators is the prefix of table info url.
// The corresponding value is the Form and Table data.
//
// http://{{config.Domain}}:{{Port}}/{{config.Prefix}}/info/{{key}}
//
// example:
//
// "blog_article" => http://localhost:9033/admin/info/blog_article
// "blog_auth" => http://localhost:9033/admin/info/blog_auth
// "blog_tag" => http://localhost:9033/admin/info/blog_tag
//
// example end
//
var Generators = map[string]table.Generator{
    "blog_article": GetBlogArticleTable,
    "blog_auth":    GetBlogAuthTable,
    "blog_tag":     GetBlogTagTable,

    // generators end
}
```



## 參考資料

- [使用GoAdmin极速搭建golang应用管理后台]


[go-admin]: https://github.com/GoAdminGroup/go-admin
[★使用GoAdmin极速搭建golang应用管理后台]: https://segmentfault.com/a/1190000022215579
