+++
title = "Hugo Table的製作"
date = 2021-01-13T11:43:00+08:00
description = "bootstrap table以及使用shortcode來客製化table"
tags = ["hugo", "bootstrap", "table"]
draft = false
bootstrap = true
markmap = true
toc_markmap = true
toc_bootstrap = true
+++

## bootstrap table

可以先到這邊參考他們樣式 [bootstrap-5.0-table]

我們這邊要談的主要就是利用bootstrap提供的css去讓table的外觀變得好看

## shortcodes

我們想要的概念很簡單，語法如下:
```
{{</* table/bootstrap-table */>}} 可以替換成 {{</* table/bootstrap-table class="table-primary" */>}} 或者省略關鍵字 {{</* table/bootstrap-table table-primary */>}}
| Animal  | Sounds |
|---------|--------|
| [Cat]     | Meow   |
{{</* /table/bootstrap-table */>}}
[Cat]: http://...
```

> :exclamation: 因為我們直接利用 ``.Inner | markdownify`` 所以如果有連結在裡面，在此段markdown中必須給出連結，要不直接寫在table之中，如果是在table之外一定要把連結告訴他

在裡頭的實作，你可以用``partial``來幫助您，partial是對html的檔案才可以引用，

而我們的markdown不能直接在裏頭使用partial，但可以用shortcode，然後shortcode裡面在寫partial

像我自己是另外寫了個``partial/func/get_table.html``，因為table有可能有其他樣式，不一定是bootstrap，所以在shortcode可以選擇，

而不管shortcode選擇的是哪一個table，都是呼叫

> ``partial/func/get_table.html``

layouts/shortcodes/table/bootstrap-table:
```go-html-template
{{ $class := "" }}
{{ if .IsNamedParams }}
  {{ $class = .Get "class" }}
{{ else }}
  {{ $class = .Get 0 }}
{{ end }}

{{ $class := printf `table %s table-sm table-striped table-bordered` (default "table-dark" $class) }}
{{ partial "func/get_table.html" (dict "html_table" (.Inner | markdownify) "class" $class) }}
```

基本上就是把.Inner渲染成html，然後把參數0又來當作是``<table class="...">``的參數

layouts/partials/func/get_table.html:
```go-html-template
{{ $html_table := .html_table }}
{{ $class := .class }}

{{ $old := "<table>" }}
{{ $new := printf "<table class=\"%s\">" $class }}
{{ $html_table = replace $html_table $old $new }}
{{ $html_table = replace $html_table "\\n" "<br>" }}  {{/* 在裏頭可以使用\n來換行，模擬list */}}

{{/* 使的欄寬可以用更簡單的方式來設定
  | @@w=5em@@name | desc |
  | ---- | ---- |
*/}}
{{ $th_list := findRE "<th>.*</th>" $html_table }}
{{ range $th_list }}
  {{ $inner_html := replaceRE `.*@@w=(?P<width>.*)@@(?P<value>.*)` "$value" (. | plainify) }}
  {{ $width_value := replaceRE `.*@@w=(?P<width>.*)@@.*` "$width" . }}
  {{ if not (in $width_value "<th>") }}  {{/* 如果沒找到他會回傳找尋物件的本身(它含有th) 至於如果找到了話就只會有數值5em之類的 */}}
    {{ $html_table = replace $html_table . (printf `<th style="width:%s;">%s</th>` $width_value $inner_html) }}
  {{ end }}
{{ end }}

{{ return ($html_table | safeHTML) }}
```

以上大致上分兩段，

1. 只是把``<table class=``放入以及接受\n當作新行來模擬向li的感覺
2. 因為table的欄寬有時候不是自己想要的，所以可以用模板的方式來改變欄寬的數值

## 範例

```go-html-template
{{</* table/bootstrap-table table-info */>}}

| @@w=5em@@name | desc |
| ---- | ---- |
| Python | Hello world

{{</* /table/bootstrap-table */>}}
```

{{< table/bootstrap-table table-info >}}

| @@w=5em@@name | desc |
| ---- | ---- |
| Python | Hello world

{{< /table/bootstrap-table >}}

----

### :exclamation: 注意事項

  當您config.toml的unsafe設置為false時

  ```toml
  [markup.goldmark.renderer]
    unsafe= false  # true: cancel "hugo raw html omitted"
  ```

  假設您的短代碼中有使用到HTML，則要避免使用``{%``。

  用``%``會跑正常流程，而您的unsafe為false，所以結果還是會出現``hugo raw html omitted``

  因此我們建議您改用角括號代替``<``，至於您的文本如果需要markdown的支持，可以透過``{{ .Inner | markdownify }}``來幫忙

## 參考資料
- [regex-capturing-group-in-hugo](https://stackoverflow.com/questions/65267977/regex-capturing-group-in-hugo)
- [style-a-markdown-table-with-bootstrap-classes-in-hugo](https://zwbetz.com/style-a-markdown-table-with-bootstrap-classes-in-hugo/)
- [how-to-give-a-hugo-markdown-table-a-class-when-the-table-contains-shortcodes](https://stackoverflow.com/questions/64609165/how-to-give-a-hugo-markdown-table-a-class-when-the-table-contains-shortcodes)

[bootstrap-5.0-table]: https://getbootstrap.com/docs/5.0/content/tables/
