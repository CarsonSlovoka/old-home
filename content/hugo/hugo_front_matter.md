+++
title = "Front Matter"
date = 2021-01-18T17:36:00+08:00
lastmod = 2021-03-05
description = "Front Matter注意事項"
tags = ["hugo"]
markmap = true
toc_markmap = true
toc_bootstrap = true
weight=10
+++

## 前言

我這篇文章主要是以toml的立場去寫的，因為我自己就是用這個格式，然後把一些坑記錄下來

## Front Matter

### 設定

這個主題談論您想要用front matter做什麼事情？

當您在 single.html 或 list.html 時，您想讓front matter怎麼幫你

首先，我們要知道，你在這些頁面，都可以有辦法獲取這三個front matter

1. config.toml.params
2. 該檔案的front matter
3. sections


#### config.toml.params

```toml
[params]
  show_reading_time = true  # 這個只是舉例
  ...
```

寫在config.toml中的params，

當您切換到該頁面的時候，這些front matter**等於也直接寫在該頁面front matter**

也就是頁面下的``.Param``可以抓到的變數有

1. ``config.toml.params``
2. 該頁面自己的front matter

而如果您只想要取得config.toml.params中的而已，要用:

> ``.Site.``Param "xxx"

{{< table/bootstrap >}}

| @@w=20%@@語法 | 包含 |
| ---- | ---- |
``.Site.Param``    | ● 只有config.toml.params
``.Param "xxx"`` | ● config.toml.params\n● 自己的front matter

{{< /table/bootstrap >}}

寫在config.toml來控制的東西就是這些控制是比較全面的，

你不想要在每一個頁面都決定，想要統一管理的時候可以考慮加在這邊

#### 該檔案的front matter

不是那麼常態需要決定，很常要更動的項目可以考慮加在這邊

#### sections

您在頁面下，如果要取得該頁面是位於哪一個section

可以用

"[0.45](https://gohugo.io/functions/getpage/) 以前的做法" {{< details >}}

> ``{{- $section := .Site.GetPage "section" .Section -}}``

{{< /details >}}

現在的做法:

> ``{{- $section := .Site.GetPage .Section -}}``

當您希望某一個Section下都套用此設定時，就加在這邊。

好處是該section底下都會套用，又不像config中的那麼霸道，全域套用。

> 🔔: section是跟目錄下第一層的內容，裡頭再多的子資料夾的section也都是看第一層的而已


#### 小節

最後用一個範例來結束

{{< table/code-by-example "|35%" "" >}}

- 1: 取得該頁面的section
- 9: 由於.Param包含了:
    - global.params
    - page.front matter

  也就是能當作 1) 和 3) 條件的判斷

至於2) 就利用

> $section.Param

即可完成

本例子用來判別是否顯示「字數」和「閱讀時間」

@@NEW-COL@@

```go-html-template {linenos=inline, hl_lines=[1,"5-7",9]}
{{- $section := .Site.GetPage .Section -}}

{{/*
  Show "reading time" and "word count" but only if one of the following are true:
  1) A global config `params` value is set `show_reading_time = true`
  2) A section front matter value is set `show_reading_time = true`
  3) A page front matter value is set `show_reading_time = true`
*/}}
{{ if (or (eq (.Param "show_reading_time") true) (eq $section.Params.show_reading_time true) )}}
    <span class="f6 mv4 dib tracked"> - 🕒 {{ .ReadingTime}} minutes read</span>
    <span class="f6 mv4 dib tracked"> - {{ .WordCount}} words</span>
{{ end }}
```

{{< /table/code-by-example >}}

### [屬性介紹](https://gohugo.io/content-management/front-matter/#front-matter-variables)

{{< table/bootstrap-table table-primary>}}

| @@w=11em@@Name | 說明 |
| ---- | ---- |
| weight | 數值越低優先權越高。 :exclamation: 當您設置為0表示不使用weight，不代表它比1的優先權高 |
| [TranslationBaseName] | ``title = "{{ title (replace .TranslationBaseName "-" " ") }}"``\n可以忽略掉檔案的附檔名\n[title]:可以讓首字母大寫其他小寫 |

[TranslationBaseName]: https://gohugo.io/variables/files/
[title]: https://gohugo.io/variables/files/

{{< /table/bootstrap-table>}}

## if判斷

一種是利用shortcodes中本來就可以提供給HTML的變數，請參考: [Access Parameters](https://gohugo.io/templates/shortcode-templates/#access-parameters)

我這邊還是舉一些簡單的例子:

- [.Params](https://gohugo.io/templates/shortcode-templates/#params)
- ``$.Page.Params``: 這個是只當前的Page，即便shortcodes沒有額外的參數去描述當前的Page，透過這個變數也能取得到當前Page
- ``$.Site.``: 類似一般在HTML檔案中所使用的``.Site``

所以可以用

> {{ if .Params.xxx }} {{end}}
>
> :exclamation: 這個的缺點是，當您的屬性有``-``或者是一些另類的字元就沒辦法直接這樣存取

> {{ if ~~.Params "xxx"~~ }} 這種是錯誤的語法，他不支援這種方式


第二種方法是用[Functions](https://gohugo.io/functions/)

- [.Param](https://gohugo.io/functions/param/)
> :exclamation: ``.Param``(沒有s)

他的語法:

``.Param KEY``: Calls page or site variables into your template.

所以您可以這樣用

> {{ if .Param "xxx" }} {{ end }}

小結:

{{< table/bootstrap-table table-primary>}}
| Name | Syntax |
| ---- | ---- |
| .Param | .Param "KEY" |
| .Param**s** | .Param**s**.KEY |

{{< /table/bootstrap-table>}}


## Object (Dict)

如果您要使用dict，請把dict分一「塊」，一般變數分一「塊」。

例如:

{{< table/code-by-example "正確的範例" "錯誤範例" >}}

```toml {linenos=inline,hl_lines=[2]}
title="..."
description = "..."
[my_dict_1]
    item = "..."
[my_dict_2]
    item = "..."
```

@@NEW-COL@@

```toml {linenos=inline,hl_lines=[2,4,7]}
title="..."
[my_dict_1]
    item = "..."
description = "..."  # 這個元素之前有一個[my_dict_1]object(dict)，所以這個元素會沒有作用
[my_dict_2]
    item = "..."
description2 = "..."
```

description和description2都將無法顯示

實際上toml並沒有縮排的概念！

也就是
```toml
[my_dict_1]
    item = "..."
description = "..."
```

完全等價於

```toml
[my_dict_1]
    item = "..."
    description = "..."
```

並非我們預期的

```toml
description = "..."
[my_dict_1]
    item = "..."
```

{{< /table/code-by-example >}}



## Toml設定方式

假設您有一個朝巢狀的dict，如下:
```toml
[next_and_previous]
  [next_and_previous.link]
     previous_page=""
     next_page=""
```

如果您只要設定其中一項，其實可以直接抓取該結點即可，如:

```toml
[next_and_previous.link]
    previous_page=""
    previous_section=""
```
