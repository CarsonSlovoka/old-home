+++
title = "Hugo Page"
date = 2020-12-15T14:19:00+08:00
description = "帶您客製化所有頁面"
tags = ["hugo"]
draft = false
toc = true
bootstrap = true
+++

## 前言

還記得我們曾講過: [Hugo的世界中所有的東西都是Page]({{< ref "hugo_deep_learning#甚麼是section-甚麼是page" >}})

這個章節就要帶您對Page有更深刻的體會。

在本章節中，有四點主題，全圍繞在[Index Pages]：

1. [Home page template]
2. [Content List template]
3. [Single Content templates]
4. [Taxonomy Terms templates]

最後在開始的時候，請確保您對URL的路徑已經有概念了，如果沒有請參閱:

1. [URL的路徑詳解]({{< ref "hugo_deep_learning#url的路徑詳解" >}})
2. [The Nested Sections]({{< ref "#nested-sections" >}})
3. [Hugo's Lookup Order]

----

## [Home page template]

這是找尋Home page模板時找尋的優先順序，找到後就會停止，並且以該模板進行渲染

- /layouts/index.html
- /layouts/_default/list.html
- /layouts/_default/single.html
- /themes/``THEME``/layouts/index.html
- /themes/``THEME``/layouts/_default/list.html
- /themes/``THEME``/layouts/_default/single.html

> **_NOTE_**: 找不到就找``THEME``就已經是很基本的概念了，後面我都會直接省略掉，``THEME``的部份

## [Content List template]

- /layouts/``SECTION``/list.html
  > ``SECTION`` 只的就是您的section名稱，例如 demo
- /layouts/section/``SECTION``.html
- /layouts/_default/section.html
- /layouts/_default/list.html

注意，要有list的前提是``要先有文件``，例如: content/demo/XXX.md

```toml
title = "Test"
draft = false
```

> :collision: 如果您設為true然後用的是hugo server 沒有加上-D 那麼還是等同沒有文件！

layouts/demo/list.html
```html
<p> demo list </p>
```

layouts/section/demo.html
```
<p> section demo list </p>
```

如果您有 demo/list.html 那麼 section/demo.html 就等同沒用

而如果沒有就會抓 section/demo.html


## [Single Content templates]

## [Taxonomy Terms templates]

----

## 額外主題

也就是寫這篇文章，而另外學習到的東西，也把它一併記錄下來

就放在這段落中...

### [.Site.RegularPages.Related]

它可以網羅所有: ``Related`` 的文章

實際運用如下

    {{ $related := .Site.RegularPages.Related . | first 5 }}
    {{ with $related }}
    <h3>{{ i18n "related" }}</h3>
    <ul>
        {{ range . }}
        <li><a href="{{ .RelPermalink }}">{{ .Title }}</a></li>
        {{ end }}
    </ul>
    {{ end }}

> :collision: 您也可以把: ``.Site.RegularPages.Related .`` 改成 ``.Site.RegularPages.RelatedIndices . "tags" "date"`` 但是不建議這樣，因為當您有自己新增taxonomies還要在自己修改這邊，反而麻煩

以上這種方式就可以把 ``相關文章`` 給用ul的方式呈現出來

你不要管這種東西在哪邊實作，他可以寫在``partials``也可以寫在``single.html``, ``list.html``等等

但一般而言會放在``partials``。假設您不知道您的主題是如何實作這部分，

不管三七二十一直接搜尋:

> .Site.RegularPages.Related

通常您就會了解該主題如何加入``{{ i18n "related" }}`` (也就是相關文章)

那現在您一定有一個困惑，

.Site.RegularPages.Related 到底是什麼，他是根據甚麼去抓文章？:confused:

> 老實說他真正的細節我不清楚 :laughing:

但是您可以對他做一些設定如下


```toml
# config.toml
[related]
  includeNewer = false  # 預設為false不會列出比目前該文章還新的主題
  threshold = 80
  toLower = false  # 使用true可以找更多結果，但是效率會變差

  [[related.indices]]
    name = "tags"  # .Site.RegularPages.RelatedIndices "[name]" 這邊的和這裡的名稱是一樣的
    weight = 100

  [[related.indices]]
    name = "date"
    weight = 10
```

值得一提的是它會把最新的文章放第一個(也就是陣列的第一個為最新的文章)

所以產生出來的列表就是最新的日期在最上面降羃排序。

再來我們談談includeNewer，我個人會偏向就使用預設值false。

當然這也看您怎麼想，如果您想找出**所有**和這個東西有關的內容，那當然是用true，

但是我會覺得如果是這樣還不如用``搜尋``；

使用false時，您就會知道在看這一篇文章的時候，有哪些相關的文章是在這篇之前寫的

所以您會有一個底知道點擊這些內容，所談的造理講不會比現在您讀的這一篇還新。

如果您有印像的東西在清單沒有，您就可以用搜尋並排除掉這些列表，所得大概就是您要的結果，

以及如果您是一位新的讀者，您讀完這篇文章，發現這些連結您都沒讀過，也可以考慮去看看，因為這些文章有可能都是這一篇的基礎。

### [Nested Sections]

    content
    └── blog        <-- Section, because first-level dir under content/
        ├── funny-cats
        │   ├── mypost.md
        │   └── kittens         <-- Section, because contains _index.md
        │       └── _index.md
        └── tech                <-- Section, because contains _index.md
            └── _index.md

> When we talk about a section in correlation with template selection,
> it is currently always the root section only (``/blog/funny-cats/mypost/`` => ``blog``).


接下來我們講section中的一些屬性(可參考: [section可以用的屬性參考])

- .Section:
    例如 content/animal/birds，假設當中含有_index.md

    所以 animal/birds也是一個section 但是他的根 section 只會有一個就是
    > animal
- .Section``s``:

      Pages(0)

    什麼時候Pages會有東西呢？
    > 當該section底下還有子section的時候(也就是在該section下一定還``存在含有_index.md的資料夾``
    > 看存在即個，index就有多少個，都沒有了話就是0


#### .Site.GetPage

要抓取有子資料夾有``_index``的項目要透過``.Site.GetPage``

animal/list.html

    {{ with .Site.GetPage "/animal/mammals" }}
    {{ .Title }}
        <article>{{ .Summary }}</article>
    {{ end }}

#### .Paginator.Pages

當您已經到達list.html，預設他抓您該``content/該section/``該層下的所有md檔案

如果您想要抓取子資料夾，例如:

    content/my_section/sub/*.md   # 注意，這一層沒有_index.md

那麼您需要建立_index.md:

    content/my_section/_index.md

這樣``.Paginator.Pages``就會讀到``sub/*.md``的檔案了

### .Render

假設您在您的section/list.html寫入以下內容

    {{ .Render "summary" }}

以上的抓取優先順序為:

1. layouts/section/summary.html
2. layouts/_default/summary.html

如果您想要把summary.html放到partial去，則可以把``section/list.html``改成

    {{- partial "summary.html" . -}}

partial還有一個好處是可以傳參數，.Render就只有layout一個參數而已

## REFERENCE

- [List pages of sub-sub-folders](https://discourse.gohugo.io/t/list-pages-of-sub-sub-folders/9436)
- [section可以用的屬性參考]
- [Page物件可以用的屬性參考]

[Index Pages]: https://gohugo.io/content-management/organization/#index-pages-_indexmd
[Hugo's Lookup Order]: https://gohugo.io/templates/lookup-order/#examples-layout-lookup-for-regular-pages

[Home page template]: https://bwaycer.github.io/hugo_tutorial.hugo/templates/homepage/
[Content List template]: https://bwaycer.github.io/hugo_tutorial.hugo/templates/list/
[Single Content templates]: https://bwaycer.github.io/hugo_tutorial.hugo/templates/content/
[Taxonomy Terms templates]: https://bwaycer.github.io/hugo_tutorial.hugo/templates/terms/

[.Site.RegularPages.Related]: https://gohugo.io/content-management/related/#list-related-content
[Nested Sections]: https://gohugo.io/content-management/sections/#nested-sections
[section可以用的屬性參考]: https://gohugo.io/content-management/sections/
[Page物件可以用的屬性參考]: https://gohugo.io/variables/page/#page-variables
[]:
[]:
[]:
[]:
