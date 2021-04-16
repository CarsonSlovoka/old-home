+++
title = "PostgreSQL教學"
description=""
date = 2021-02-27T22:49:50+08:00
lastmod = 2021-02-27
featured_image = ""
draft = false
weight = 0
tags = ["sql", "postgresql", "db"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = ""
  next_page = ""
  previous_section = "db_introduce"
  next_section = ""
+++

## Install

PostgresSQL下載: {{< btn/download "https://www.postgresql.org/download/" "" "2x" >}}

如果您是選擇: [Download the installer for Windows](https://www.postgresql.org/download/windows/)

每一個版本的流程可能略有不同，所以請參考您要裝的版本

### Version 13

他的流程如下:

1. 選要安裝什麼
    - ``PostgreSQL Server``
    - ``pgAdmin 4``
    - ``Stack Builder``
    - ``Command Line Tools``
2. 檔案的儲放位置: ``C:\Program Files\PostgreSQL\13\data``
3. 建立superuser
    - 預設user為:``postgres``(不能改)
    - password: 自己輸入

## 什麼是Stack Builder?

它可以擇選很多東西裝，例如不同版本的postgres以及一些額外的套件。

在安裝完之後，如果有勾安裝``Stack Builder``它就會問您是否要啟動，

以下以``PostGIS``為例子:

- Categories

    - Add-ons, tools and utilities:
    - Database Drives:
    - Database Server:
    - Registration-required and trial products:
    - Spatial Extensions:
        - PostGIS: 把這個打勾，就能裝上PostGIS
            - ``Create spatial database`` 這個**不用勾**，要用在自己建就好
            - 預設會把資料裝在:\ ``C:\Users\User``
            - ``C:\Program Files\PostgreSQL\13``
    - Web Development:


## 服務

``postgresql-x64-13``(最後面的那一個數字是版本)

這一項服務必須啟動，連線才會正常！

如果您長時間都不用，可以把這些服務關閉，不然開機的時候背景會跑一些和``postgresql``相關東西


## pgadmin

### 如何設定登入資訊

1. 點擊Properties…
2. 之後可以打上資訊，第一次看到的應該是postgres這個database，port是5432，username必須填入，密碼是在連接的時候會問

### 更改使用者名稱

可以直接點擊該user然後改更(``Login/Group Roles(n) -> Properties -> Definition -> Password``)

但是如果您是用該user登入就沒辦法用UI的方式改，

但您可以直接改Table:``update pg_authid set rolname ='new_username' where rolname = 'old_username';``\

### 修改密碼

有兩種改法

- UI改法: ``Login/Group Roles(n) -> Properties -> Definition -> Password``就可以改更了，不需要原先的密碼，也沒有二次的確認。
- 指令改法:

  ```sql
  ALTER USER "username" WITH PASSWORD 'new-password'
  ```


### 系統的資料表

``Databases -> postgres -> Catalogs`` 中有儲放了一些非使用者自己創件的資料表，

像是pa_authid(使用者的資料表也在這邊)

如果有些東西沒辦法，則直接對這些資料表做更改都可以成功(但要小心，改底層的東西改壞了會很慘)
