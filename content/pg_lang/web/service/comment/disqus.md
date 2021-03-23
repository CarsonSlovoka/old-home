+++
title = "Disqus"
description=""
date = 2021-03-22T14:52:50+08:00
lastmod = 2021-03-22
featured_image = ""
draft = false
weight = 0
tags = ["service", "comment"]
markmap = true
toc_markmap = true
+++

## 前言

如果您不想自己建立一個評論系統，可以仰賴第三方的服務來幫助您

以下有一些推薦的項目供您參考

- [Disqus]
- [Staticman]

## [Disqus]

我是很推這個！透過google帳號授權給它之後可以直接登入不需要在註冊

使用上也很簡單，把您要分析的網站加上特定的代碼即可:

[hugo/tpl/tplimpl/embedded/templates/disqus.html](https://github.com/gohugoio/hugo/blob/59d15c97d877cb62c6721100974fc46d0a9f76fe/tpl/tplimpl/embedded/templates/disqus.html#L10-L19)

要導入以上連結的代碼只要

> {{- template "_internal/disqus.html" . -}}

通常會放置到single.html之中

您可以在加一些設定來決定是否啟用，例如:

```go-html-template
{{- if .Site.DisqusShortname -}}
    {{- template "_internal/disqus.html" . -}}
{{- end -}}
```

## [Staticman]

[![Staticman](https://github-readme-stats.vercel.app/api/pin/?username=eduardoboucas&repo=staticman)](https://github.com/eduardoboucas/staticman)

[簡介連結](https://staticman.net/docs/index.html)

我覺得他的好處是可以自己管控評論，因為評論也是用git的方式推播上去儲存庫，但相對的您也要把儲存庫的權限開出來供staticman使用

另外您需要自己做一些機制來防止惡意人士的攻擊，其中一個是可以透過 google reCAPTCHA 新增一些機器人的驗證增加一些困難，來降低被攻擊的可能。

[Disqus]: https://blog.disqus.com/
[Staticman]: https://github.com/eduardoboucas/staticman

