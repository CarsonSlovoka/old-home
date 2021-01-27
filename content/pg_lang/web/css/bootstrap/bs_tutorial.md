+++
title = "bootstrap基礎教學"
date = 2021-01-18T13:24:00+08:00
lastmod= 2021-01-19
description = "網頁排版基礎教學"
tags = ["bootstrap"]
markmap = true
toc_markmap = true
toc_bootstrap = true

[next_and_previous.link]
    previous_section="/pg_lang/web/css/fontawesome/fa_tutorial"
+++

## 取得線上的CSS, JS

{{<fa-btn-link "/pg_lang/web/css/fontawesome/fa_tutorial#取得線上的css-js">}}get CSS, JS{{</fa-btn-link>}}


## SRI Hash

{{<fa-btn-link "/pg_lang/web/css/fontawesome/fa_tutorial#sri-hash" >}}SRI Hash{{</fa-btn-link>}}


## span顏色, p.s.顏色

```html
<p>This is some <small class="text-muted">smaller</small> text.</p>
```

> {{<raw_html>}}<p>This is some <small class="text-muted">smaller</small> text.</p>{{</raw_html>}}

> :orange_book: 也可以藉由 ``style="color:gray; opacity: 0.5;`` 達成類似text-muted的效果

運用small可以讓字變小，text-muted是bootstrap的CSS中的樣式之一，主要就是讓顏色變成灰色(``#6c757d!important``)

> :orange_book: ``!important``表示如果有多個css重複的時候他會優先使用這個屬性，當然如果大家都是``!important``那就看誰最後才加入就用該屬性(同一般狀況)

> :orange_book: 還可參考CSS屬性的[font-size]


[font-size]: https://www.w3schools.com/cssref/pr_font_font-size.asp
