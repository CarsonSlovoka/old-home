+++
title = "Hugo Menu"
date = 2020-12-22T11:49:00+08:00
description = "教您如何產生Menu"
tags = ["hugo"]
draft = false
markmap = true
toc_bootstrap = true
bootstrap = true
[article_image]
    src = "images/hugo/gohugoio-card.jpg"
    bg-color = "success"
    btn-color = "danger"
    text-muted_color = "white"
+++

## [設定檔](https://gohugo.io/content-management/menus/#add-non-content-entries-to-a-menu)

從官方連結可以得知:

```toml
[menu]

  [[menu.main]]
    identifier = "about"
    name = "about hugo"
    pre = "<i class='fa fa-heart'></i>"
    url = "/about/"
    weight = -110

  [[menu.main]]
    name = "getting started"
    post = "<span class='alert'>New!</span>"
    pre = "<i class='fa fa-road'></i>"
    url = "/getting-started/"
    weight = -100
```

這也就是說，一定有一個變數:``.Site.menu``在做這些事情

因為我的主題用的是ananke。

他的設定為:

```toml
[menus]
  [[menus.main]]
    name = "Hugo教學"
    url = "/Hugo/"
    weight = 30
  [[menus.main]]
    name = "動物"
    url = "/animal/"
    weight = 40
```

> :collision: 有些人是用menus有些是用menu~~s~~ 看你的主題怎麼去定義

權重(wight)會影響list取得的順序:

    {{ range .Site.Menus.main }}
      {{ .Name }}
    {{ end }}

數字越低排在最前面，假設:

    A.weight = 40
    B.weight = 30

則以上先輸出B再輸出A

----

再來我們看要怎麼定義，您可以先參考:[Menu Templates](https://gohugo.io/templates/menu-templates/)

其實我們應該是先定義好再去[設定]({{< ref "#設定檔httpsgohugoiocontent-managementmenusadd-non-content-entries-to-a-menu" >}})

因為設定其實仰賴於寫法，寫法(定義)如下:

baseof.html

    {{ block "header" . }}
      {{/* 包含頁面上方的featured_image、左上角的.Site.Params.site_logo、Menu清單 */}}
      {{ partial "site-header.html" .}}
    {{ end }}

site-header.html

    {{ partial "site-navigation.html" .}}

這個區塊分為兩個部份，一個是如果你有給予featured_image那麼它就會在頁面上方呈現該內容，

如果沒有給，頁面上方的就以文字來取代

featured_image可以在front matter中加入

p.s. *如果您的主頁也想要加入，請建立一個content/_index.md，並在此_index.md中加入featured_image*

但不管怎麼樣menu都是在``site-navigation``中搞定


site-navigation.html

```html
<div>
  {{ partial "i18nlist.html" . }}  {{/* 管多個語言的切換*/}}
  {{ if .Site.Menus.main }}
    <ul>
      {{ range .Site.Menus.main }}  {{/* <---- 此為menu的主要動作 */}}
      <li>
        <a href="{{ .URL }}" title="{{ .Name }} page">
          {{ .Name }}  {{/*  雖然您的設定檔名稱是小寫，但是用的時候字母開頭一定是大寫 */}}
        </a>
      </li>
      {{ end }}
    </ul>
  {{ end }}
  {{ partialCached "social-follow.html" . }}
</div>
```

p.s. 這個頁面其實也是管控: ``.Site.Params.site_logo``的地方

經由上面的代碼您會發現，menu的建立，在官方只是給予建議，他建議您在config中可以設定一些變數來幫忙，

所以其實只要你高興，可以自定義自己的不一定要遵守，只是造約定俗成來比較容易讓別人搞懂您的架構。

