+++
title = "Internal_templates"
description="Hugo所提供的內置樣版"
date = 2021-02-24T17:03:46+08:00
lastmod = 2021-02-24
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


## [Internal Templates](https://gohugo.io/templates/internal/)

有哪些？

> 您可以自己點標題連結去看🤣

### [Privacy Settings](https://gohugo.io/about/hugo-and-gdpr/#all-privacy-settings)

內置樣版要用到的變數可以在config.toml中設定，目前(2021-02-24)為止共有這些

```toml
[privacy]
  [privacy.disqus]
    disable = false
  [privacy.googleAnalytics]
    anonymizeIP = false
    disable = false
    respectDoNotTrack = false
    useSessionStorage = false
  [privacy.instagram]
    disable = false
    simple = false
  [privacy.twitter]
    disable = false
    enableDNT = false
    simple = false
  [privacy.vimeo]
    disable = false
    enableDNT = false
    simple = false
  [privacy.youtube]
    disable = false
    privacyEnhanced = false
```

### GoogleAnalytics

接著您可能會有興趣想要瞭解是怎麼實現

{{< table/code-by-example "|40%" >}}

主要是靠第二列來實現:

> ``google_analytics_async.html``

當然您可以在加入一些變數去控制是否生成，如右代碼。

> 📙 [getenv] 可以取得系統的環境變數，所以HUGO_ENV就是一個變數，如果你高興可以設置成別的或用別的邏輯取代


[getenv]: https://gohugo.io/functions/getenv/

@@NEW-COL@@

```go-html-template
{{ if eq (getenv "HUGO_ENV") "production" | or (eq .Site.Params.env "production")  }}
  {{ template "_internal/google_analytics_async.html" . }}
{{ end }}
```

{{< /table/code-by-example >}}

那麼``_internal/google_analytics_async.html``又是什麼？

> 👉 [_internal/google_analytics_async.html]

{{< table/code-by-example "　" "google_analytics_async.html">}}

首先要瞭解:

> ``Config.Privacy.GoogleAnalytics``

這是我們[一開始]({{< ref "#privacy-settingshttpsgohugoioabouthugo-and-gdprall-privacy-settings" >}})就提到的設定

接著``{{ with .Site.GoogleAnalytics }}``

所以我們知道還要在config.toml中提供一個GoogleAnalytics才可行，

> 如果是toml，``googleAnalytics``必須設定在object之前，詳請參考:[front-matter-object]({{< ref "hugo_front_matter#object-dict" >}})

接下來的東西就回到google analytics本身了(總之GA就是把那段script貼到您要的網頁上即可，只是hugo幫您包裝好這件事罷了)

@@NEW-COL@@

```go-html-template
{{- $pc := .Site.Config.Privacy.GoogleAnalytics -}}
{{- if not $pc.Disable -}}
{{ with .Site.GoogleAnalytics }}
    {{/* ...  以下略*/}}
{{ end }}
{{/* ...  以下略*/}}
```
{{< /table/code-by-example >}}

[_internal/google_analytics_async.html]: https://github.com/gohugoio/hugo/blob/master/tpl/tplimpl/embedded/templates/google_analytics_async.html
