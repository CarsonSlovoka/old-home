+++
title = "Hugo Menu"
date = 2020-12-22T11:49:00+08:00
description = "教您如何產生Menu"
tags = ["hugo"]
draft = false
toc = true
bootstrap = true
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
      {{/* 主題頁的導欄設定(含主題圖片等等) */}}
      {{ partial "site-header.html" .}}
    {{ end }}

site-header.html

    {{ partial "site-navigation.html" .}}

> 這裡面其實分兩段，一個是有圖片一個是沒圖片的處理，但不管怎麼樣menu都是在``site-navigation``中搞定


site-navigation.html

```html
<div>
  {{ partial "i18nlist.html" . }}  {{/* 管多個語言的切換*/}}
  {{ if .Site.Menus.main }}
    <ul>
      {{ range .Site.Menus.main }}  {{/* <---- 此為menu的主要動作 */}}
      <li>
        <a href="{{ .URL }}" title="{{ .Name }} page">
          {{ .Name }}
        </a>
      </li>
      {{ end }}
    </ul>
  {{ end }}
  {{ partialCached "social-follow.html" . }}
</div>
```

經由上面的代碼您會發現，menu的建立，在官方只是給予建議，他建議您在config中可以設定一些變數來幫忙，

所以其實只要你高興，可以自定義自己的不一定要遵守，只是造約定俗成來比較容易讓別人搞懂您的架構。

