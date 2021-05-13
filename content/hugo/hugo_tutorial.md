+++
title = "Hugo教學"
date = 2020-12-04T10:29:18+08:00
lastmod = 2021-04-23
description = "帶您快速的完成Hugo的Hello world"
tags = ["hugo"]
draft = false
markmap = true
toc_markmap = true
toc_bootstrap = true
bootstrap = true
+++

## Hugo簡介

它就是一個靜態的網頁生成器:**Static Site Generators**

這個網站列舉了很多[Static Site Generators]，您可以從中了解目前大家比較多人用的項目是甚麼

Hugo的優點是超級快速，而且很多人用，又是使用Go語言(可能是未來的後起之秀)

Pelican是用Python開發，預設也是用rst，且樣板是Jinja2，說實在對Python人員很友好，

但我覺得Hugo的快是無法取代，而且學點Go也是好的！


## Install Hugo

- 方法1: 使用brew或post指令

  > brew install hugo

  or

  > port install hugo


- 方法2: 用choco來安裝

    - [choco安裝](https://chocolatey.org/install)
    - ``choco install hugo``

如果安裝成功，打上``hugo version``會有版本資訊

## Getting Started

1. ``hugo new site your_site_name``
2. ``git init``
3. > ``git submodule add`` *https://github.com/budparr/gohugo-theme-ananke.git* **themes/ananke**

     粗體的部分是指這個submodule的位置會丟到``themes/ananke``此資料夾之中

----

再來請參考hugo: [官方教學](https://gohugo.io/getting-started/quick-start/#step-2-create-a-new-site)

我這邊只做補充說明:

- git submodule的坑:

    submodule建立之後基本上他會有幾項東西:

    1. 檔案: ``.gitmodules``
    2. 檔案: ``.git/config``
    3. 資料夾: ``.git/modules`` 之中會建立您給的資料夾。

        注意，這項不一定會有，如果您是透過自己添加的方式

        也就是您的專案其實是創建在本機端並非先透過remote的方式所產生

    submodule建立以後如果不滿意，就針對這幾項內容去刪除即可 (也可以參考: [How do I remove a submodule?])

    注意如果還是有問題可能您已經把這些東西 ``git add`` 了，只要``git reset``即可正常了

    一些設定::

        [submodule "themes/ananke"]  -> 這是指名稱，通常我會只接要最後面的名稱而已
            path = themes/ananke  -> 這個是指實際上放到哪一個位子
            url = https://xxx.git


- theme:

    我是只推:

    | 名稱  |  初始日期 | 星星數 | fork數 |
    | ---- | ---- | ---- | ---- |
    | [ananke] | 17 Jun 2018  | {{< github/get_info_img budparr gohugo-theme-ananke stars >}} | {{< github/get_info_img budparr gohugo-theme-ananke forks >}} |
    | [hugo-theme-cleanwhite] | 11 Apr 2017 | {{< github/get_info_img zhaohuabing hugo-theme-cleanwhite stars >}} | {{< github/get_info_img zhaohuabing hugo-theme-cleanwhite forks >}} |

    cleanwhite在官網的範例是用它當作例子，

    ananke可以從表中看出它比較有名氣

    不建議用一些很冷門的，避免沒人維護的問題，

    此外如果您是工程師強力建議自己fork一份到自己的倉庫中，

    次因是不擔心因為改版的問題，而有些設計與您習慣發生衝突

    主因是您能了解到改版改了甚麼，再決定自己是否要跟進，對成長比較有幫助！

    > **_NOTE_**: 如果您對這些都不滿意，也不妨參考: [hugo其他主題](https://themes.gohugo.io/)

## 寫文章

``hugo new file_path``: 會建立文件在content之中

  例如:

    hugo new posts/hello.rst

  輸出:

    content/posts/hello.rst

  通常在content中，我們會再用資料夾對文章做分類，``posts``一般有最近公布的項目的意味，總之名稱看您心情，爽就好！

> :orange_book: 實際上他是用``archetypes/posts.rst``的樣板去渲染的！

## Hugo的內文接受哪些格式?

[List of content formats](https://gohugo.io/content-management/formats/#list-of-content-formats)

| Name | Comment |
| ---- | ---- |
| Markdown| 預設
| rst| 裝python，把相關套件裝一裝即可(docutils好像就已經自帶了，不需要再去裝)，主要利用: ``Scripts/rst2html.py``
| org| [go-org](https://github.com/niklasfasching/go-org)
| AsciiDoc| Needs [Asciidoctor](https://asciidoctor.org/) installed.
| Pandoc| https://www.pandoc.org/
| HTML |


## Hugo 配置

[Hugo的設定檔案格式](https://gohugo.io/hugo-modules/theme-components) 目前支持三種格式:

1. toml
2. yaml
3. json

我個人是推薦: ``toml`` 因為純粹作為配置文件，這種格式確實比較容易給人讀

toml(**Tom's Obvious, Minimal Language**) 很像ini檔案，但是它可以嵌套很多層，更多可以參考 [TOML格式](https://www.bookstack.cn/read/GoFrame-1.13/os-gcfg-toml.md)

不過toml不支持 ``anchor`` 以及 ``reference`` 這些在yaml中其實很好用，可以不用重複寫，

但是如果配置沒有很複雜就算重覆寫一點來換取可讀性免強還是能接受。


- config.toml:

  theme: 可以在這邊就設定主題

  > ``hugo server --theme xxx`` 這裡的theme會**覆蓋**掉``config.toml``中的主題！

  > ``hugo -D`` 指令的主題也受到此影響


## Hugo指令

共有flags和command可以運用，其中command之後可以再用flags

    Usage:
        hugo [flags]
        hugo [command]

### 推薦Command
- ``hugo help``: 查看幫助
- ``hugo server --buildDrafts --buildExpired --buildFuture --theme ananke``: 啟動Server，主題使用ananke (注意如果這邊有設定主題它會覆蓋掉 config.toml中的theme設定)
- ``hugo --renderToMemory -s docs/`` :

    如果您使用github page，通常會把文件放到docs中去，hugo 可以使用(-s {{< sup "-\-source" >}})

    renderToMemory只是一個測試，不用實際把實體文件產生在硬碟上，您可以單純運行這個命令來查看是否能順利執行還是有錯誤，方便您測試


### 推薦flags

{{< table/bootstrap-table >}}
| @@w=15%@@name | desc | Example |
| ----| ----| ---- |
``--buildDrafts``\n``-D``| 會渲染draft的項目
``--minify`` | minify any supported output format (HTML, XML etc.) 非常有用的東西，不管您要運行還是打包都可以用，就能最小化打包檔 | ``hugo -D --minify``: 將資源檔打包，形成一個靜態包，預設放在``public``資料夾中
``--gc`` |  enable to run some cleanup tasks (remove unused cache files) after the build
``--quiet`` | build in quiet mode
{{< /table/bootstrap-table >}}

#### [minify](https://gohugo.io/getting-started/configuration/#configure-minify)

如果您對預設提供出來的minify項目還是不滿意，Hugo也提供您自定義

```toml
[minify]
  disableCSS = false
  disableHTML = false
  disableJS = false
  disableJSON = false
  disableSVG = false
  disableXML = false
  minifyOutput = false
  [minify.tdewolff]
    [minify.tdewolff.css]
      keepCSS2 = true
      precision = 0
    [minify.tdewolff.html]
      keepComments = false
      keepConditionalComments = true
      keepDefaultAttrVals = true
      keepDocumentTags = true
      keepEndTags = true
      keepQuotes = false
      keepWhitespace = false
    [minify.tdewolff.js]
      keepVarNames = false
      precision = 0
    [minify.tdewolff.json]
      precision = 0
    [minify.tdewolff.svg]
      precision = 0
    [minify.tdewolff.xml]
      keepWhitespace = false
```

## 疑難排解

- 為什麼我的資源已經更新，網頁上的內容卻沒有改變呢?:

    > 請用``Ctrl+F5``來更新頁面

    原因是因為，網頁會把一些靜態資源做緩存，減少每次都渲染，可以[參考](https://stackoverflow.com/questions/30717443/flask-does-not-load-css-file/44830012)

    像flask也有選項: SEND_FILE_MAX_AGE_DEFAULT 去針對這個議題去做設定



## config.toml 設定

- permalinks: [參考](https://gohugo.io/content-management/urls/#permalinks-configuration-example)

    ```
    [permalinks]
      posts = "/:year/:month/:title/"
      other_subject = ""  # 同理您可以也仿照posts的方式去更改其他資料夾的位置
    ```

    > **_NOTE_**: date的格式為: ``2020-12-06T19:18:00-08:00``

    這個參數主要是對靜態生成( ``hugo -D`` (通常您沒有更改資料夾時他的位置是 ``public`` )時的檔案結構的影響

    按照以上的設定，我們以 ``content/posts/my_doc.md`` 為例，

    他將變為 ``public/2020/12/my_doc/index.html``  (原本是的位置是: ``public/posts/my_doc/index.html``)

    而您在網址上對應的位置為: ``https::/example.com/2020/12/my_doc``


## [Introduction to Hugo Templating]

它是使用[go template](https://golang.org/pkg/text/template/) 來實現

Access a Predefined Variable:

    <title>{{ .Title }}</title>

The custom variables need to be prefixed with ``$``:

    {{ $address := "123 Main St." }}
    {{ $address }}

Function:

    {{ FUNCTION ARG1 ARG2 .. }}
    {{ add 1 2 }}
    <!-- prints 3 -->

    {{ lt 1 2 }}
    <!-- prints true (i.e., since 1 is less than 2) -->

Methods and Fields are Accessed via dot Notation::

    {{ .Params.bar }}

Parentheses Can be Used to Group Items Together::

    {{ if or (isset .Params "alt") (isset .Params "caption") }} Caption {{ end }}

For Hugo v0.48 and newer,

variables can be re-defined using the new ``=`` operator (new in Go 1.11).::

    {{ $var := "Hugo Page" }}
    {{ if .IsHome }}
        {{ $var = "Hugo Home" }}
    {{ end }}
    Var is {{ $var }}

> **_NOTE_**: 這裡要注意 ``:=`` 會有區域性(例如用with, range, if ...)，如果您要跨區最好在前面使用 ``:=`` 給定預設值，然後在內嵌中使用 ``=``

## 載入其他模板

The templates location will always be starting at the ``layouts/`` directory within Hugo.

您要載入的其他其他樣本，都是從``layouts/``這一個資料夾開始，

- [Partial](https://gohugo.io/templates/introduction/#partial): ``{{ partial "<PATH>/<PARTIAL>.<EXTENSION>" . }}``

    Example of including a ``layouts/partials/header.html`` partial:

      {{ partial "header.html" . }}

    所以\ ``layouts/partial``\資料夾的內容就是專門給\ ``partial``\函數所使用的

- [Template](https://gohugo.io/templates/introduction/#template>): 內嵌樣本

    Hugo提供了一些內嵌樣本([internal templates](https://gohugo.io/templates/internal/) 例如:

    - Google Analytics:

        - ``_internal/google_analytics.html``
        - ``_internal/google_analytics_async.html``

    - Google News: ``_internal/google_news.html``
    - Disqus: ``_internal/disqus.html``

    - Open Graph: ``_internal/opengraph.html``

        目的在於透過定義網站性質、Title、縮圖網址等等屬性，幫助社群平台爬蟲更輕鬆得梳理並找出你網站的重點

        - [教學1](https://medium.com/@JasonCK/%E5%A6%82%E4%BD%95%E4%B8%8D%E8%AE%93%E7%B8%AE%E5%9C%96%E6%AF%80%E6%8E%89%E4%BD%A0%E7%9A%84%E8%A8%AD%E8%A8%88-a6edd290981d)

    - pagination: ``_internal/pagination.html``
    - schema: ``_internal/schema.html``
    - twitter cards: ``_internal/twitter_cards.html``


## [Variables and Params]

這很重要，他們可以在HTML中運用

### Site Variables


### Shortcode Variables


### Page Variables


### Pages Methods


### Taxonomy Variables

### File Variables


### Menu Entry Properties


### Hugo-specific Variables



### Git Info Variables


### Sitemap Variables



### [The .Site.Params Variable]

config.toml

    [params]
      description = "Tesla's Awesome Hugo Site"

使用:

    <p>{{ $.Site.Params.description }}</p>



## REFERENCE

- SSG: [Staic Site Generators](https://jamstack.org/generators/)


[The .Site.Params Variable]: https://gohugo.io/variables/site/#the-siteparams-variable
[Introduction to Hugo Templating]: https://gohugo.io/templates/introduction/
[hugoDocs]: https://github.com/gohugoio/hugoDocs
[Static Site Generators]: https://jamstack.org/generators/
[How do I remove a submodule?]: https://www.atlassian.com/git/articles/core-concept-workflows-and-tips
[ananke]: https://github.com/budparr/gohugo-theme-ananke.git
[hugo-theme-cleanwhite]: https://github.com/zhaohuabing/hugo-theme-cleanwhite.git
[Variables and Params]: https://gohugo.io/variables/
