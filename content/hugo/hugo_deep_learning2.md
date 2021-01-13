+++
title = "深入研究Hugo 2"
date = 2020-12-08T18:29:00+08:00
description = "正式開始教您如何近乎白手起家來打造專屬於您的Hugo網站！"
tags = ["hugo"]
draft = false
bootstrap = true
markmap = true
toc_markmap = true
toc_bootstrap = true
+++

在您看這篇文章的時候請您還是去看看我前兩篇文章(這兩篇是用[reST]寫的，有寫排版其實不是我的預期)

1. [深入學習Hugo 1]({{< ref "/hugo/hugo_deep_learning" >}})
2. [初探Hugo]({{< ref "/hugo/hugo_tutorial" >}})

## 閒話

在開始時，您也許使用Hugo只想快點記錄一些事情，那麼您最先遇到的問題應該是：「*文件的格式*」。

作者我因為有在用[Python]的關係，所以主要是用[reST]。

但是Hugo預設就是用markdown為主，所以用markdown生成文檔速度也是最快的！

所以我奉勸想用其它格式的使用者們，如果您在意這一點(如果是正式發佈，應該會用public的靜態資源為主，所以不會常常更新)渲染的速度

建議您就還是用markdown。


### Hugo中使用markdown怎麼產生註腳？

這是我在Hugo中使用markdown遇到的第一個問題，

[解法](https://stackoverflow.com/questions/60917572/hugo-or-grunt-handle-automatically-numbering-footnotes):

```markdown
Lorem ipsum[^foo] dolor sit amet[^bar], consectetur adipiscing elit[^3].

[^bar]: second footnote
[^3]: third footnote
[^foo]: first footnote
```

這是我在Stackoverflow上找到的答案，我不得不說，Hugo的論談有點差(我比較客氣，所以我說有點差...)

講一狗票東西沒有一個講到重點，要不就是貼Github的issue叫你連過去看...

結論是當您在Hugo中的論壇找不到答案，不妨在Stackoverflow上搜尋一下。(您在google的搜尋引擎搜，先跑出來的通常都是Hugo官方資料，要不就是Hugo的討論區)

更多Markdown的[特殊語法](https://www.markdownguide.org/extended-syntax/)


## 入門

在一開始許多的教學都是教您去找一個主題然後套用，說實在這樣很不好，也很容易迷失方向...

不過我在這邊也是和一般教學一樣，請您去找一個主題:laughing:

不過別擔心，這裡會慢慢的帶你:smiley:

> **_NOTE:_**
>
> 看到這裡您可能已經先好奇，這些表情符號(emoji)怎麼搞出來，其實只要來到此[連結](https://www.webfx.com/tools/emoji-cheat-sheet/)然後只接把表情符號貼到您的文件中即可
>
> 對了 config.toml還要新增此行才可以:
>
> **enableEmoji = true**

> **_NOTE:_** 如果您運氣不好可能會正好挑到還沒支援的表情符號，請在換換其他的試試看！


### 推薦主題:ananke

| Themes |  |  |
| ------ | ----- | ----- |
| [ananke](https://github.com/budparr/gohugo-theme-ananke.git) | {{< github/get_info_img budparr gohugo-theme-ananke stars >}} | {{< github/get_info_img budparr gohugo-theme-ananke forks "https://www.google.com/" >}} |


為什麼用這個主題?
> 沒為什麼因為我自己就是這樣過來的:laughing:

```toml
[params]
  # 仔細去看 themes/ananke/layouts/index.html 他有使用到 .Site.Params.mainSections
  # .Site指的就是config這個東西， Params 就是我們前面定義的 [params] ，所以我們在這邊還要定義 mainSections
  mainSections = [  # 這個東西才可以讓index知道我們有那些主題，才可以用滑鼠點的到，也才能夠連結到 baseURL/xxx
    "posts",  # baseURL/posts
    "hugo"  # baseURL/hugo
  ]
```

## [如何連結到其他文章 cross-reference](https://gohugo.io/content-management/cross-references/)

語法:

    {{</* ref "/page/about" */>}}

會產生連結，例如:

    baseURL/page/about

所以要產生可以點擊的連結，就可以用:

    [About]({{</* ref "/page/about" */>}} "About Us")

> **_NOTE:_** 您可能會覺得奇怪 ``[name](url "xxx")`` 後面的xxx是什麼?
> 他是鼠標移過去的時候，會顯示出來的名稱，這個東西可加可不加


## formspree (Contact Us)
他可以把email送信的功能輕鬆的加在您的網站，讓使用者直接在您的瀏覽頁面，填完相關的內容(由您決定)，寄出去就可以送到您的信箱了。

### formspree簡介
首先您要到官網先申請一個帳號，

驗證完畢您的信箱之後，就可以開始建立form，並制定該form的主題

預設是您申辦的那個信箱，您也可以再加入其他信箱 (免費版本最多只允許兩個您可以升級，就可以無上限了)。

### 提供的服務

formspree有提供以下[服務](https://formspree.io/plans)

| 名稱      |  說明 | Free | Gold | Platinum |
|:----------- | ----------- | :-----------: | :----------: |  :-------: |
| FileUploads| 允許上傳檔案 | 5個檔案，每個檔案不超過26MB       | 2GB | 10GB
| 匯出Submission   |  可以把使用者寄過來的信件內容轉成CSV或者JSON然後匯出 | X        | V | V |
| Custom Thank You Redirect | 客製化提交後的內容，您可以設計此頁面，在使用者提交之後他會幫您導向此URL | X | V | V |
| Submission Archive | 幫您保存提交的內容 (Days) | 30  | 90  | 365  |
| reCAPTCHA | [google reCAPTCHA] | V | V | V |
| Advanced Spam Filtering | 進階的垃圾信件過濾 (每個方案其實都有提供reCAPTCHA可以用)，但您可以在設計您自己的 | X |　V | V |
| Autoresponses | 自動回覆使用者 | X | V | V |
| Third-party Plugins | Google Sheets, Mailchimp and Webhooks, ... | X | V | V |

### 售價

| 內容  | Free | Gold | Platinum |
| ---- | :----: | :----: | :----: |
| 售價 (mo) | 0 | 10 | 40 |
| 每月寄信上限 | 50 | 1000 | 5000 |

> **_NOTE:_** 很多東西都可能再改，像以前可以一個月1000封現在只能50封... 更多的細節請參考[官網](https://formspree.io/plans)

### 語法
表單刻製可以參考: `layouts/shortcodes/tutorial/formspree_mail.html`  (主要就是運用Hugo的shortcodes)

完成之後就能在markdown運用，如下:

    {{</* tutorial/formspree_mail action="https://formspree.io/f/brabrabra" */>}}

而 ananke 主題 提供比較好看(HTML有設計過)的介面，它的使用方法為:

    {{</* form-contact action="https://formspree.io/f/brabrabra" */>}}


### 安全性

formspree有提供 [Restrict to Domain](https://help.formspree.io/hc/en-us/articles/360038664534-Restrict-to-Domain)

簡單來說，它可以只接受您是在某個domain執行post的他才算是，要不然每一個人都取得到您的id之後，都可以隨意建立，傳送過去的信件還是到您的那裡去。


## Hugo 表達式

這裡要介紹:

- {{-/* */-}}
- {{%/* */%}}
- {{</* */>}}

是什麼?

### about {{-

> [消除空白兩側的](https://gohugo.io/templates/introduction/#whitespace)

當我們使用傳統的方式:

    <div>
      {{ .Title }}
    </div>

will output

    <div>
      Hello, World!
    </div>

而

    <div>
      {{- .Title -}}
    </div>

Which then outputs:

    <div>Hello, World!</div>

當然連字號(-) 也不一定要兩邊都用，您也可以只用一側！

### about {{%/* */%}}

> 表示代碼中間的內容「要」渲染

例如:

    {{%/* my_shortcodes */%}}
        **bold**
    {{%/* /my_shortcodes */%}}

輸出: **bold**


### about {{</* */>}}

> 表示代碼中間的內容「不用」渲染

例如:

    {{</* my_shortcodes */>}}
        **bold**
    {{</* /my_shortcodes */>}}

輸出: ``**bold**``


## [Static Files](https://gohugo.io/content-management/static-files/)

## [Hugo如何處理多國語?](https://gohugo.io/functions/i18n/)

您可以在i18n[^i18n]資料夾放至屬於您的語系的語言，

然後做以下操作

```toml
# i18n/zh-tw.toml
[readMore]
other = "繼續閱讀"
```

使用:

    {{ i18n "readMore" . }}
    or
    {{ i18n "readMore" }}

有 「**.**」 沒 「**.**」 都一樣

更簡單的語法,使用**T**ranslation

    {{ T "readMore" }}


## 如何製作大鋼(contents, navigation)
大綱分兩類:
1. contents: 指的是文章的大鋼
2. global navigation: 指的是您的網站有哪些文章

但是在開啟談要怎麼做之前，要先知道[Hugo URL的機制]({{< ref "/hugo/hugo_deep_learning#url" >}} "URL的機制")

### [連結種類](https://gohugo.io/content-management/urls/)

- [permalinks](https://gohugo.io/content-management/urls/#permalinks): 永久連結

    ```
    [permalinks]
    posts = "/:year/:month/:title/"   # 讓 baseURL/posts > baseURL/year/month/title
    ```

    我覺得比較好用的

    - section: the content’s section
    - sections: the content's sections hierarchy??
    - year: the-4-digit year
    - month: the 2-digit month (``00-12``)
    - monthname: the name of the month
    - day: the 2-digit day (``00-31``)
    - weekday: the 1-digit day of the week (Sunday=0)
    - weekdayname: the name of the day of the week
    - yearday: the 1- to 3-digit day of the year (``1-365``)
    - title: the content's title
    - slug: the content's slug (or title if no slug is provided in the front matter 沒有slug就用title)
    - filename: the content's filename (without extension)

    > **_NOTE:_**: Additionally, a Go time format string prefixed with : may be used. 日期前面記得加上 「:」

    詳請參考: [Permalink Configuration Values](https://gohugo.io/content-management/urls/#permalink-configuration-values)

- Aliases

    ```toml
    # content/posts/demo.md
    aliases = [
        "/posts/my-original-url/",
        "/2010/01/01/even-earlier-url.html"
    ]
    ```

    也就是當您的網址:

      baseURL/posts/my-original-url/
      baseURL/2010/01/01/even-earlier-url.html

    都會連結到這篇文章

      baseURL/posts/demo.md

    請注意如您是多語言的網站，要為其前綴加上語言代碼，因為 **aliases必須唯一**

    ```toml
    # posts/demo.es.md
    aliases = [
        "/es/posts/my-demo/"
    ]
    ```

    但是在Hugo 0.55以後路徑變成相對路徑，所以可以簡化成

    ```toml
    # posts/demo.es.md
    aliases = [
        "my-demo/"
    ]
    ```

    > **_NOTE:_** 別名如果有重複，會覆蓋，以最後一個別名為主

    您也可以客制化alias只需要新建:

      layouts/alias.html

    在這裡面可以用兩個變數:

    1. Permalink
    2. Page


- Pretty URLs Aliases

    這一種格式是Hugo預設的

    ```
    content/posts/_index.md
    => baseURL/posts/index.html

    content/posts/post-1.md
    => baseURL/posts/post-1/
    ```

- Ugly URLs

    ```toml
    # config.toml
    uglyurls =  true
    ```

    以下是Pretty與Ugly的對比

    **_Pretty_**
    ```
    .
    └── content
        └── about
        |   └── _index.md  // <- https://example.com/about/
        ├── posts
        |   ├── firstpost.md   // <- https://example.com/posts/firstpost/
        |   ├── happy
        |   |   └── ness.md  // <- https://example.com/posts/happy/ness/
        |   └── secondpost.md  // <- https://example.com/posts/secondpost/
        └── quote
            ├── first.md       // <- https://example.com/quote/first/
            └── second.md      // <- https://example.com/quote/second/
    ```

    **_Ugly_**
    ```
    .
    └── content
        └── about
        |   └── _index.md  // <- https://example.com/about.html
        ├── posts
        |   ├── firstpost.md   // <- https://example.com/posts/firstpost.html
        |   ├── happy
        |   |   └── ness.md    // <- https://example.com/posts/happy/ness.html
        |   └── secondpost.md  // <- https://example.com/posts/secondpost.html
        └── quote
            ├── first.md       // <- https://example.com/quote/first.html
            └── second.md      // <- https://example.com/quote/second.html
    ```

    可以看到Ugly後面會多了**.html**

- Relative URLs

### [contents](https://gohugo.io/content-management/toc)

在開始前先看兩個變數:

- [RelPermalink](https://gohugo.io/variables/page/ "variable"): the **relative permanent** link for this page.
- [TableOfContents](https://gohugo.io/variables/page/): the rendered **table of contents** for the page.

官方的教學教我們在single.html建立 .TableOfContents 因為它會蒐集所有<h>的連結

```go-html-template
# layout/_default/single.html

{{ define "main" }}
<main>
    <article>
    <header>
        <h1>{{ .Title }}</h1>
    </header>
        {{ .Content }}
    </article>
    <aside>
        {{ .TableOfContents }}  {{/* <-- 注意這邊 您也可以替換成 RelPermalink 去察看兩者的不同，其實我是看不出來差異:laughing:，而且在網頁上他們都是顯示完整的連結 */}}
    </aside>
</main>
{{ end }}
```

另一個方式是建立一個shortcode然後您可以用partial去呼叫他

官方是用toc.html當作shortcode，即:

```go-html-template
# layout/partials/toc.html

{{ if and (gt .WordCount 400 ) (.Params.toc) }}
<aside>
    <header>
    <h2>{{ .Title }}</h2>
    </header>
    {{ .TableOfContents }}
</aside>
{{ end }}
```

那麼您的md就可以這麼用

```
# posts/demo.md
+++
title = '...'
toc = true
+++
```

layouts/_default/single.html

```html
{{- partial "toc.html" . -}}
```

所以toc只是一個隨便的名子，要命名什麼只要你爽就好了

總結:
> 其實整個的概念就是利用，RelPermalink或者TableOfContents因為他們幫我們收集到了各個h的連結，
> 剩下的利用以前的觀念就可以實現了。

當您是使用別人的主題，不妨先搜尋一下:

- RelPermalink
- TableOfContents
- .Params.toc

也許就能知道該主題的導覽是怎麼實現的


### global navigation
就是menu

## 函數使用方法參考

將文字轉為一般文本

```go-html-template
plainify: <p>hello</p> => hello
htmlEscape: & => &amp;
{{ $anchorId := ($header | plainify | htmlEscape | urlize) }}

anchorize: my book => my-book
{{ $anchorId := ($header | plainify | htmlUnescape | anchorize) }}
```

list (slice)

```go-html-template
{{ $slice := (findRE `id=\"(.*)\">` $header 1) }}
{{ $anchorId := index $slice 0 }}
{{ $anchorId := replace $anchorId "id=" "" 1 }}
```


刪除開頭的"和結尾的"

```go-html-template
找出開頭為" 或者 結尾"
{{ $anchorId := replaceRE `(^\"*)|(\"*$)` "" $anchorId }}

排除開頭和結尾
{{ $anchorId := substr $anchorId 1 -1 }}
```


變數轉換

```go-html-template
{{ $href := (printf `href=#%s` $anchorId ) | string }}
{{ $max_heading := (int .) }}
```

字串處理

```go-html-template
slice 將元素合併成一個新的list
delimit 再將此slice展開，並使用#符號連結成為一個新的字串
{{ $href := delimit (slice $base $anchorId) "#" | string }}

使用printf也能合併字串
{{ $href := (printf `href=#%s` $anchorId ) | string }}
```

### regex 表示法

#### by order

```go-html-template
{{ $my_var := `id="demo"` }}
{{ $result := replaceRE `id=\"(.*)\"` "$1" $my_var }}
{{ $result }} → "demo"
```

#### name group

基本範例:

```go-html-template
{{ $my_var := `id="demo2"` }}
{{ $result := replaceRE `id=\"(?P<my_id>.*)\"` "$my_id" $my_var }}  # my_id是對應?P<>裡面的名稱，一定要一模一樣才可以！
{{ $result }} → "demo2"
```

進階範例:

```go-html-template
{{ $my_var := `<h2 id="#demo+1-3%./2\"><a href="https://www.google.com/"></a></h2>` }}
{{ $id := replaceRE `.*id=\"(?P<my_id>([:#a-z0-9+\-%./\\])*)\">(<a href=\"(?P<my_href>[:#a-z0-9+\-%./\\]*)\">.*)?` "$my_id" $my_var }}
{{ $id }}  → #demo+1-3%./2\
{{ $href := replaceRE `.*id=\"(?P<my_id>([:#a-z0-9+\-%./\\])*)\">(<a href=\"(?P<my_href>[:#a-z0-9+\-%./\\]*)\">.*)?` "$my_href" $my_var }}
{{ $href }}  → https://www.google.com/
```

## 參考資料

- [Create navigation from page anchors? 文章大綱](https://discourse.gohugo.io/t/create-navigation-from-page-anchors/12112)
- [Shields IO 取得github PyPI等等的icon](https://shields.io/category)
- [Hugo Function大全](https://bwaycer.github.io/hugo_tutorial.hugo/templates/functions/)
- [regex線上模擬](https://regex101.com/)


## Footnote

[^i18n]: **_i18n_**: 指的是: internationalization 這個單字，i + 中間 18個單字 + n = i18n。也有些人會用 [^L10n]。 您可以參考[wiki](https://en.wikipedia.org/wiki/Internationalization_and_localization)
[^L10n]: **_L10n_**: localization. L + 中間 10個單字 + n = L10n



[Python]: https://www.python.org/
[reST]: https://docutils.sourceforge.io/rst.html
[emoji]: https://www.webfx.com/tools/emoji-cheat-sheet/
[google reCAPTCHA]: https://www.google.com/recaptcha/admin/create
