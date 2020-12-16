+++
title = "深入學習Hugo 1"
date = 2020-12-07T09:43:12+08:00
description = "本篇是在對Hugo懵懵懂懂時邊學邊做記錄下來的東西"
tags = ["hugo"]
draft = false
toc = true
bootstrap = true
featured_image = ''
+++


## 前言

Hugo本身就是個: **Static Site Generator** 后面简称为 [SSG](https://jamstack.org/generators/)

為什麼要學Hugo?:
> 因為快！

次因:
- 使用Go所開發
- 模板也算好學


并不是每一个网站都需要一个 Server 来动态生成内容，也不是每一个网站都需要数据库。博客系统，文档系统，企业官网等等，都是静态网站的好用例。

hugo除了是SSG以外，它還是SSG中最快速的！


您可能會看到*spf13*而不曉得這到底是甚麼意思？

> 他是Hugo的作者名稱**Steve Francia**(13我覺得是因為他的名子加上空白共有13個字)

Hugo 是一個用 Go 編寫的靜態網站生成器，2013由 [Steve Francia](https://github.com/spf13) 原創

----

~~網路上很多的教學，都只講皮毛，包含看官方的文件，也很難找到入門點(我指的是自己刻製化)~~

官方文件不好看，但是官方影片(**Mike Dane**))拍的，我覺得非常有用，您可以先看影片，然後再回頭看文檔補足剩下部分即可。

> :+1:  如果您覺得影片有幫助，請給個讚，以鼓勵這些願意奉獻的人們，一個讚用不了您多少時間，但是卻能給作者帶來許多正能量！

> :collision: 影片有些東西已經很舊了，看完影片請務必回來再看官方文檔，官方文檔講得更多也更細，而且內容都是新的不會有過時的語法！

我自己再讀完[Getting Started]({{< ref "/hugo/hugo_tutorial#getting-started" >}})後找了[hugoDocs]的專案來看，以下是一些心得，希望能幫助到有需要的人。

## 第一課


### hugoDocs是什麼?

就是您逛Hugo官方文件所看到的官方網站，就是用那一個主題所生成，


| Themes | 專案初始日期  |  |   |
| ------ | ----- | ----- |  ----- |
| [hugoDocs] | 2013-07-04 | {{< github/get_info_img gohugoio hugoDocs stars >}} | {{< github/get_info_img gohugoio hugoDocs forks >}} |


### hugo的目錄結構

    content
    ├── posts  # 您的分類資料夾
    │   ├── demo.md  # 張貼的檔案內容
    layouts
    ├── index.html  # 載入 include.html, menu.html,  footer.html
    ├── LICENCE.txt
    ├── chrome
    │   ├── header.html  # 載入 <title>{{ .Title }}</title>(<-- 這一個是tab上的頁籤名稱)  {{ template "chrome/includes.html" . }}  {{ template "chrome/menu.html" . }}
    │   ├── footer.html  # 一個純寫html footer的檔案
    │   ├── include.html  # 載入 css  # <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    │   └── menu.html  # 利用li連結各個檔案，以當作menu項目  # <li> <a href="/doc/source-directory.html">Input Directory Layout</a> </li>
    |
    ├── doc
        └── single.html  # ★用來渲染文件整體


> :collision: template其實有經過改版，在後續的版本中，建議使用 ``partial`` 來代替 template


- doc/single.html:

    ```
    {{ template "chrome/header.html" . }}  # 載入header: 包含 {include {css, js}, menu}
              <h1>{{ .Title }}</h1>
              {{ .Content }}
    {{ template "chrome/footer.html" . }}  # 載入footer
    ```



- demo.md:

    ```
    ---
    title: "..."
    date: 2020-12-07T09:43:12+08:00
    draft: false
    ---
    ```

    這些開頭的變數都會保存在``.Params``的變數中，讓``templates``可以使用


hugo張貼出來的文章架構(Organization):

    .
    └── content
        ├── post
        |   ├── firstpost.md   // <- http://site.com/post/firstpost.html
        |   └── secondpost.md  // <- http://site.com/post/secondpost.html
        └── quote
            ├── first.md       // <- http://site.com/quote/first.html
            └── second.md      // <- http://site.com/quote/second.html


以下這是最初版時作者希望做到的事情:

* Pagination
* Support for top level pages (other than homepage)
* Series support
* Syntax highlighting
* Previous & Next
* Related Posts
* Support for TOML front matter
* Proper YAML support for front matter
* Support for other formats

### 樣板render (shortcode)


很像jinja，而 ``{{ }}`` 他們稱之為: 「``shortcode``」

----

#### example youtube

    {{</* youtube youtube-id */>}}
    {{</* youtube id="youtube-id" autoplay="true" */>}}

    {{< youtube 2xkNJL4gJ9E >}}

很酷吧，直接就能在您的靜態網站撥放youtube的影片

This would be rendered as::

    <div class="embed video-player">
    <iframe class="youtube-player" type="text/html"
        width="640" height="385"
        src="http://www.youtube.com/embed/09jf3ow9jfw"
        allowfullscreen frameborder="0">
    </iframe>
    </div>

----

#### example: image with caption

    {{%/* figure src="/media/spf13.jpg" title="Steve Francia" */%}}

Would be rendered as::

    <figure >
        <img src="/media/spf13.jpg"  />
        <figcaption>
            <h4>Steve Francia</h4>
        </figcaption>
    </figure>

實際範例:

{{< figure src="../../images/tab_icon.jpg" title="神氣的媽媽熊" >}}
> {{</* figure src="../../images/tab_icon.jpg" title="神氣的媽媽熊" */>}}  :sunglasses:

> **_NOTE_**: figure src是相對路徑，也就是以您文章所在的資料夾為主，所以如果您要取根路徑下的``static``資料夾，您可以用``..``幫您回到前一層，最後注意，回到baseURL之後您**不用**再加上static資料夾，預設您的圖片資源就會在static資料夾中找尋

> 圖片實際路徑: ./static/images/tab_icon_.jpg

## 第二課

關於您各個文件的內容，都必須是**小寫**(推測後面還是有更動，因為以目前來說，並非總是小寫)

> 請參考: `Now support for config files as yaml, json or toml sha:a54e04e6fd0084224cad5b` ``configuration.md``

例如:

    sourcedir = "content"  # 於sha: 3db18bca9c37280e9 改名就做 contentdir
    layoutdir = "layouts"
    publishdir = "public"
    builddrafts = false
    baseurl = "http://yoursite.com/"
    [indexes]
       category = "categories"
       tag = "tags"

``Default is now pretty urls (without .html) sha: af5e4d1a56e4dfe94c`` 更改了 內部連結，不在需要加上 ``.html`` 例如::

    原來的版本: <li> <a href="/doc/configuration.html">Configuration</a> </li>
    新版:      <li> <a href="/doc/configuration">Configuration</a> </li>


在早期的版本，一些static的檔案是存放在``public``資料夾，於 ``sha: 37eb9bae7ad49f6d744e0c`` 才將其改放置 ``static`` 資料夾


## ★★★補充教材

您會發現hugoDocs早期的代碼中(``sha1 id:3db18bca9c37280``以前)，只有範例，沒有真實的文件運用，因此還是很難搞懂一些原理

例如 indexes.md 中，提及:

    ---
    indexes:
        tag: "tags"       <--- 這是什麼東東?
        topic: "topics"   <--- 這是什麼東東?
    baseurl: "http://spf13.com/"
    title: "Steve Francia is spf13.com"
    ---

這邊光這樣寫實在不知道在幹甚麼...

### 甚麼是section? 甚麼是Page?

section是什麼？

> 在Hugo/content中，每一個目錄稱為一個 ``section`` !

Hugo世界中，[所有的東西都是 **Page**](https://bwaycer.github.io/hugo_tutorial.hugo/content/using-index-md#index-md-and-everything-is-a-page)

每一個Page都會對應一個 ``原文件``， 例如::

    hugo new c1/_index.md
    hugo new c1/p1.md

    content/c1/_index.md
    content/c1/p1.md

他我們訪問:

- ``/c1/`` 時，他的原文件是``content/_index.md``
- ``c1/p1`` => ``content/c1/p1.md``

### ★用哪一個樣版來render

Hugo模板系統主要分為3大類:

1. 首頁: 使用 ``index.html`` 或者 ``baseof.html``
2. 列表行頁面 使用 ``_default/list.html`` 來渲染 : 對應的文件為某個 ``_index.md`` ，例如我們剛才提及的::

    他我們訪問 ``/c1/`` 時，他的原文件是\ ``content/_index.md``

3. 一般頁面 使用 ``_default/single.html``\，例如::

    當我們訪問 ``c1/p1`` 原文件對應 ``content/c1/p1.md``

> :collision: 我們這邊所說的不管是 list.html 還是 single.html 都是只在 ``./layouts`` 底下模板用的html


所有的模板都在 ``./layouts`` 中可以找到

默認的樣板會放在 ``./layouts/_default``\之中，

而既然是默認，就代表您還可以客製更多的樣板，並且能夠選擇您想使用哪一個樣版

關於: 選擇要使用哪個樣板，可以在 [FrontMatter] 指定，

> **_NOTE_** 我說的是樣版而不是主題喔！

所謂的``FrontMatter`` 就是在文章開頭一開始的那些東西，例如::

    categories = ["Development", "VIM"]
    date = "2012-04-06"
    description = "spf13-vim is a cross platform distribution of vim plugins and resources for Vim."
    slug = "spf13-vim-3-0-release-and-new-website"
    tags = [".vimrc", "plugins", "spf13-vim", "vim"]
    title = "spf13-vim 3.0 release and new website"

而要選樣版，則是要設定 [layout](https://gohugo.io/templates/lookup-order/) 這個參數

範例

假設您的文件為::

    content/doc/xxx.md

也就是我們建立一個名稱為doc的section

那麼要統一將這一個section中樣式都套用某一個layouts時，我們可以在layouts這樣說明:

    ./layouts/doc/single.html

也就是layout中也建立一個doc和我們的section名稱一樣即可

至於我們的首頁的內容，則是要自己新建一個index.html在layouts底下，

附上完整的layouts結構如下::

    ./layouts/index.html  # 這是主頁的內容， 可以使用: {{ template "chrome/includes.html" . }}  {{ template "chrome/menu.html" . }}  {{ template "chrome/footer.html" }}
    ./layouts/doc/single.html  # 這是負責處理content/doc/*.md 的樣板  可以使用 {{ template "chrome/header.html" . }}
    ./layouts/chrome/{footer, header, includes, menu}.html  # 您可以在設定其他樣版，這些樣版可以讓樣版中再做嵌套


在.layouts之中，還有一個很強大的角色， ``baseof.html``

像是我們可以於``layouts/_default/baseof.html``定義
(您也可以直接參考[base](https://gohugo.io/templates/base)) :

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <title>{{ block "title" . }}
          {{ .Site.Title }}
        {{ end }}</title>
      </head>
      <body>
        {{ block "main" . }}
        {{ end }}
        {{ block "footer" . }}
        {{ end }}
      </body>
    </html>

可以利用 {{ block }} 來讓子樣版來決定其真正的內容

As a default template, it is the shell from which **all your pages** will be rendered *unless you specify another* *baseof.html closer to the beginning of the lookup order.

這是list的寫法 ``layouts/_default/list.html`` :

    {{ define "main" }}
      <h1>Posts</h1>
      {{ range .Pages }}
        <article>
          <h2>{{ .Title }}</h2>
          {{ .Content }}
        </article>
      {{ end }}
    {{ end }}

    <!-- 你也可以用 Paginator 在 homePage, 或者 listPage -->
    {{ range .Paginator.Pages }}
        {{ .Title }}
    {{ end }}

以上我們重新修改了 {{ block main }} 的內容，也就是block定義完之後，我們要用的時候就使用 ``define`` 即可來實作他的定義

這是single的寫法  ``layouts/_default/single.html`` ::

    {{ define "title" }}
      {{ .Title }} &ndash; {{ .Site.Title }}
    {{ end }}
    {{ define "main" }}
      <h1>{{ .Title }}</h1>
      {{ .Content }}
    {{ end }}


在block中您也可以加上預設的內容。

> :collision: 以下兩種方式都會以主樣版的內容為主 (類似jinja的super)
>
> - 子樣版沒有define
> - 子樣板有define，但是沒有實作
>   ```
>   {{ define "xxx" }}
>   {{ end }}
>   ```
也就是當您設定了block預設就會帶入，如果您不想要帶入沒有辦法，只能重新define他並塞一下空資料進去

### 總整理

Hugo編譯我們的站點時，發現 ``content/_index.md`` (如果您缺少了這個文件，完整的內容就是 ``layouts/index.html`` )

會使用 ``layouts/index.html`` + ``layouts/_defaulte/baseof.html``

| 文件 | 對應 |
| ---- | ---- |
| content/_index.md  | ``layouts/index.html`` + ``layouts/_defaulte/baseof.html`` |
| content/doc |  ``layouts/_defaulte/baseof.html`` + ``layouts/_defaulte/list.html`` |
| content/doc/my_site.md | ``layouts/_defaulte/baseof.html`` + ``layouts/_defaulte/single.html`` |


## 第三課

### aliases

``xxx.md`` :

    ---
    title: "Aliases"
    Pubdate: "2013-07-09"
    Aliases:
        - /doc/redirects/
        - /doc/alias/
    ---

也就是說我url中使用 ``/doc/redirects`` 或者 ``/doc/alias/`` 都會連到 ``xxx.md``

可參考: ``sha: f37e425e32eb769473b6``  (一開始這個不叫 aliases而是redirects 這是由 Ross Lawley所提交)

也因為有了alias的出現，所以在 ``sha: 66c87441bd70cc003bd`` 把 ``content/doc/example.md`` 改成了 ``content/content/example.md``

至於內容還是維持原樣，所以他用alias來表示:

    ---
    aliases: ["/doc/example/"]
    ---

### URL的路徑詳解

#### Content

    .             path           slug
    .       ⊢-------^----⊣ ⊢------^-------⊣
    content/extras/indexes/category-example/index.html


    .       section              slug
    .       ⊢--^--⊣        ⊢------^-------⊣
    content/extras/indexes/category-example/index.html


    .       section  slug
    .       ⊢--^--⊣⊢--^--⊣
    content/extras/indexes/index.html

跟我們之前講過的一樣 [section是什麼]({{< ref "#甚麼是section-甚麼是page" >}})

- section: 就是content緊接著的那一個資料夾就是 section
- slug: 主文件 **前面一個** 的資料夾名稱

#### Destination

               permalink
    ⊢--------------^-------------⊣
    http://spf13.com/projects/hugo


       baseUrl       section  slug
    ⊢-----^--------⊣ ⊢--^---⊣ ⊢-^⊣
    http://spf13.com/projects/hugo


       baseUrl       section          slug
    ⊢-----^--------⊣ ⊢--^--⊣        ⊢--^--⊣
    http://spf13.com/extras/indexes/example


       baseUrl            path       slug
    ⊢-----^--------⊣ ⊢------^-----⊣ ⊢--^--⊣
    http://spf13.com/extras/indexes/example


       baseUrl            url
    ⊢-----^--------⊣ ⊢-----^-----⊣
    http://spf13.com/projects/hugo


       baseUrl               url
    ⊢-----^--------⊣ ⊢--------^-----------⊣
    http://spf13.com/extras/indexes/example


- baseUrl: config.toml 設定的東西
- section: 緊鄰baseUrl後的一個即為之
- slug: url後的最後一項
- path: 等於baseUrl和slug之間的就是path
- url: baseUrl後面的所有東西都是

### category

config.toml:

    ---
    indexes:
        category: "categories"  # 我們就要在layouts/indexes
    baseurl: "http://spf13.com/"
    title: "Steve Francia is spf13.com"
    ---

``/layouts/indexes/category.html``:

    For each index type a template needs to be provided to render the index page.
    In the case of categories, this will render the content for ``/categories/CATEGORYNAME/``\. ::

        {{ template "chrome/header.html" . }}
        {{ template "chrome/subheader.html" . }}

        <section id="main">
          <div>
           <h1 id="title">{{ .Title }}</h1>
            {{ range .Data.Pages }}
                {{ .Render "summary"}}
            {{ end }}
          </div>
        </section>

        {{ template "chrome/footer.html" }}


假設我們的文件內容如下:

    {
        "title": "Hugo: A fast and flexible static site generator",
        "categories": [
            "Development",
            "golang",
            "Blogging"
        ],
        "slug": "hugo"
    }


### 如何制定Menu

https://gohugo.io/templates/menu-templates/#section-menu-for-lazy-bloggers

https://cjting.me/2017/06/04/migrate-to-hugo-from-jekyll/



## Mike Dane Youtube

### [archetypes](https://www.youtube.com/watch?v=bcme8AzVh6o)

幫助您建立文件的模型，例如，我建立了以下檔案

``./archetypes/defaulte.md``

    ---
    title: "{{ replace .TranslationBaseName "-" " " | title }}"
    date: {{ .Date }}
    draft: false
    author: "Carson"
    ---

那麼所有的文件在建立的時候都會，就會產生以上內容

當然您也可以只針對section做處理，例如

``.archetypes/post.md``: 這樣他影響的內容，只有是 ``hugo new post/xxx.md``  也就是section為post的才會影響

### [shortcode]

#### 官方提供的shortcode

| Name | 描述 | 語法
| ---- | ---- | ----
| <img width=200/> | <img width=400/> | <img width=400/>
| figure, 圖片加上描述| ``{{</* figure src="/media/spf13.jpg" title="Steve Francia" */>}}`` |
| gist| github使用者的連結| "``{{</* gist spf13 7896402 >}`` (等同: https://gist.github.com/spf13/7896402 |
| highlight | highlight| "``{{</* highlight html >} ... {< /highlight html */>}}``" |
| instagram | instagram| ``{{</* instagram instagram-id */>}}`` |
| tweet| twitter| ``{{</* tweet 877500564405444608 */>}}`` |
| vimeo| vimeo 一個影片的播放媒體| ``{{</* vimeo 146022717 */>}}`` |
| param| 如果Page's有此值就回傳他，沒有了話log中會記錄ERROR| ``{{</* param testparam */>}}`` |
| ``ref`` and ``relref`` | 連結到其他的文件 | ``{{</* ref "/my_section/my_doc#inside_link" */>}}`` |
| youtube| youtube| ``{{</* youtube youtube-id */>}}`` |

>  ``{% 表示代碼中間的內容要渲染``

>  ``{< 表示代碼中間的內容不用渲染``


#### Create Custom Shortcodes

1. 創建 shortcode資料夾: ``./layouts/shortcodes/``

    ```
    # ./layouts/shortcodes/my_shortcodes.html

    <p> This is my shortcodes</p>
    <p> {{ .Get "color" }} </p>  # color是我們自己定義的傳入參數
    <p style="color:{{ .Get "color" }}"</p>  # 這是錯誤的用法，因為"在外層也有，所以會混淆，要使用`來幫忙
    <p style="color:{{ .Get `color` }}"</p>

    # ./layouts/shortcodes/my_shortcodes2.html
    <p style="color:{{ .Get 0 }}"</p>  # .Get 0 表示我們抓第一個參數，這樣我們就可以省略掉參數的名稱變得更簡短

    # ./layouts/shortcodes/doubly_tagged_shortcodes.html
    {{.Inner}}  # 這樣他就會把tag中間的東西全部都給渲染出來

    <p style="background-color:yellow">{{.Inner}}</p>
    ```

2. xxx.md:

    ```
    {< my_shortcodes color="blue" >}

    {< my_shortcodes2 blue }

    {< doubly_tagged_shortcodes >}
        This is the text inside the shortcode tags
    {< /doubly_tagged_shortcodes >}


    {% doubly_tagged_shortcodes %}  # 用 {% 中間的文字會渲染
        **is bold text**
    {% /doubly_tagged_shortcodes %}

    {< doubly_tagged_shortcodes >}  # 用 {< 中間的文字「不會」渲染
        **it not bold text**
    {< /doubly_tagged_shortcodes >}
   ```


### [Taxonomies Tutorial 10]

官方文件: [taxonomies](https://gohugo.io/content-management/taxonomies)

這些分類您只要設定完之後就能在 ``list.html``所渲染的頁面中，看到這些標籤，

並且當您點擊這些標籤時，他會跳到 ``baseUrl/[categories, tags, ..., define_by_you]`` 的頁面，讓您知道有哪些文章也是標記這些標籤

    ---
    title: "A"
    date: 2020-12-07T19:13:00-08:00
    draft: true
    tags: ["tag1", "tag2", "tag3"]
    categories: ["cat1"]
    moods: ["happy", "Upbeat"]  # 這是一個不存在hugo的分類
    ---

- tags: 會生成在: ``baseUrl/tags/YOU_TAG_NAME`` 然後 可以被 ``layouts/_default/list.html`` 所管理
- categories: 會生成在: ``baseUrl/categories/YOU_TAG_NAME`` 然後 可以被 ``layouts/_default/list.html`` 所管理

當我們想要自己建立出一個 ``Taxonomies`` 則需要再``config.toml``中 新增以下內容:

    [taxonomies]
        tag = "tag"  # 這是預設hugo會給的，但是一旦您重新更動了taxonomies就要附加上去，不然等同失效
        category = "categories"  # 這是預設hugo會給的，但是一旦您重新更動了taxonomies就要附加上去，不然等同失效
        mood = "moods"

> **_NOTE_**: 如果您不想要hugo創建這些分類標籤，則要做這些設定 ``disableKinds = ["taxonomy", "term"]``


### [Data Files Tutorial 20]

官方文件: [Data templates](https://gohugo.io/templates/data-templates/)

#### Hugo的Data files是什麼?

> 它可以讀取**靜態的**yaml, toml, json之類的檔案，並且可以用很簡單的語法就能運用他在您的文章之中

> :collision: 我說的是*靜態的*，也就是這些檔案您必須先準備好！

#### 如何進行

1. 首先您要準備一個資料夾----**data**

    ``./data/[your_dir]/[your.{json, yaml, toml}]``

    假設我們的文件為 ``.data/info/states_A.json`` 如下所示:

    ```
    {
        "AL": {
            "name": "Alabama",
            "capital": "Montgomery"
        }

        "AK": {
            "name": "Alaska",
            "capital": "Juneau"
        }
    }
    ```

    假設我們的文件為 ``.data/info/states_B.json`` 如下所示::

        {
            "BL": {
                "name": "Bl...",
                "capital": "..."
            }

            "BK": {
                "name": "BK...",
                "capital": "..."
            }
        }

2. 於``layouts``資料夾開始寫語法即可，舉例來說我們寫在``layouts/_default/single.html``:

    ```
    <!-- single.html-->
    <h1>Single Template</h1>

    {{ range .Site.Data.info.states_A }}
        {{ .name }} <br> {{ .capital }} <br>
    {{ end }}

    <p> {{ .Site.Data.info.states_A.AK.name }} </p>


    {{ range $.Site.Data.info }}  # 我們遍歷每一個於info之下的資料夾
        {{ partial "my_view.html" . }}  # . 指的就是info資料夾當中的一個元素
    {{ end }}


    <!-- my_view.html -->
    <ul>
    {{ range . }}
        {{ .name }} <br> {{ .captial }}
    {{ end }}
    ```

> :collision: 我們是準備data資料夾，而Hugo會把這些東西轉成一個 ``map`` 存放到 ``.Site.Data`` 變數中 (是大寫的Data)

#### getJSON, getCSV

您的資料夾檔案可以來自:

1. 網路上
2. 本機端: 附檔名是什麼都無所謂，只要內容是符合該格式即可 (The file extension does not matter, but the content does.)

    本的端的檔案需存在於data資料夾:

    1. ``./data/*``
    2. ``./themes/<THEME>/data/*``

    可以來自於您自己主題內的data資料夾或者是您引用的主題中的data資料夾

以下的範例都是以網路當作範例

- **getJSON**

    語法:

        {{ $dataJ := getJSON "url_prefix" "arg1" "arg2" "arg n" }}

    > 其實他就是可以餵一個完整的url，該url的回傳是一個json檔案，參數arg可以和url_prefix串接起來

    範例:

        {{ $urlPre := "https://api.github.com" }}
        {{ $gistJ := getJSON $urlPre "/users/GITHUB_USERNAME/gists" }}

    等同以下:

        ```
        {{ $gistJ := getJSON "https://api.github.com/users/GITHUB_USERNAME/gists" }}
        ```

    > **_NOTE_**: ``https://api.github.com/users/GITHUB_USERNAME/gists`` 這一個網址本身就是json，您可以把GITHUB_USERNAME換成您自己的就可以看到消息了

    實際運用，抓取使用者前5個gists的項目:

    ```
    <ul>
      {{ $urlPre := "https://api.github.com" }}
      {{ $gistJ := getJSON $urlPre "/users/GITHUB_USERNAME/gists" }}
      {{ range first 5 $gistJ }}  # 因為gists.json他是以list開頭當作物件，所以這個gistJ就是一個陣列
        {{ if .public }}  # 要取變數一律都要加上 "." 號 public 也是 gists中的其中一個欄位，且這個欄位剛好是 boolean的數值，所以可以用if來判別
          <li><a href="{{ .html_url }}" target="_blank">{{ .description }}</a></li>
        {{ end }}
      {{ end }}
    </ul>
    ```


- **getCSV**

    語法::

        {{ $dataC := getCSV  "separator" "url prefix" "arg1" "arg2" "arg n" }}

    範例::

        <table>
            <thead>
              <tr>
              <th>Name</th>
              <th>Position</th>
              <th>Salary</th>
              </tr>
            </thead>
            <tbody>
            {{ $url := "https://example.com/finance/employee-salaries.csv" }}
            {{ $sep := "," }}
            {{ range $i, $r := getCSV $sep $url }}  # r只的就是當前的row
              <tr>
                <td>{{ index $r 0 }}</td>  # 取得當前 r 中 首個 欄的內容
                <td>{{ index $r 1 }}</td>
                <td>{{ index $r 2 }}</td>
              </tr>
            {{ end }}
            </tbody>
          </table>

#### Cache URLs

如果您的資料來至於URL，他會把資料載下來，會載到 ``$TMPDIR/hugo_cache`` 其中 ``$TMPDIR`` 仰賴於您本身的系統的暫存資料夾

如果您不喜歡這樣的安排，您可以親自設定 ``--cacheDir`` 變數

而如果您壓根就不想要什麼cache，可以直接把緩存給取消掉: ``--ignoreCache``

> :collision: 我們強烈不建議把 ``--ignoreCache`` 加上去，因為如果沒有緩存文件，那就意味著每次的載入都必須再查詢一次，這樣的流量很驚人！

#### [LiveReload with Data Files]

如果您的頁面本身有用到Data Files

如果這些資源來至於 網路上，那麼他不會觸發 (所以您要更新網上的資源可能要把Cache清除掉)

至於本機端的文件，只要有更動，就會自動觸發LiveReload

##### [LiveReload是什麼？]

當您使用: ``hugo server`` 除了啟動server以外，它還會持續的監看文件是否被改便，以重新渲染。

其中監看的資料夾有以下位子:

- /static/*
- /content/*
- /data/*
- /i18n/*
- /layouts/*
- /themes/<CURRENT-THEME>/*
- config

只要有異動(新增、刪除、修改) Hugo會執行重建的任務(但是網頁上的服務還是會進行，並不會中斷)，

等到重建完成，LiveReload會告訴瀏覽器要重新加載頁面達成更新。

如果您不希望使用\ ``LiveReload``\例如作為正式發佈，那麼您可已使用

- ``hugo server --watch=false``
- ``hugo server --disableLiveReload``

這樣兩者都能關閉

這些設定也能在 config.toml 中新增，例如::

    # config.toml
    disableLiveReload = true


[hugoDocs]: https://github.com/gohugoio/hugoDocs.git
[shortcode]: https://gohugo.io/content-management/shortcodes/#readout
[Taxonomies Tutorial 10]: https://www.youtube.com/watch?v=pCPCQgqC8RA&list=PLLAZ4kZ9dFpOnyRlyS-liKL5ReHDcj4G3&index=10
[Data Files Tutorial 20]: https://www.youtube.com/watch?v=FyPgSuwIMWQ&feature=youtu.be
[LiveReload with Data Files]: https://gohugo.io/templates/data-templates/#livereload-with-data-files
[LiveReload是什麼？]: https://gohugo.io/getting-started/usage/#livereload
[FrontMatter]: https://gohugo.io/content-management/front-matter/
