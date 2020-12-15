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

----

## [Home page template]

## [Content List template]

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

[Index Pages]: https://gohugo.io/content-management/organization/#index-pages-_indexmd
[Home page template]: https://bwaycer.github.io/hugo_tutorial.hugo/templates/homepage/
[Content List template]: https://bwaycer.github.io/hugo_tutorial.hugo/templates/list/
[Single Content templates]: https://bwaycer.github.io/hugo_tutorial.hugo/templates/content/
[Taxonomy Terms templates]: https://bwaycer.github.io/hugo_tutorial.hugo/templates/terms/
[.Site.RegularPages.Related]: https://gohugo.io/content-management/related/#list-related-content
[]:
[]:
[]:
[]:
[]:
[]:
