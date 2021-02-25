+++
title = "Front Matter"
date = 2021-01-18T17:36:00+08:00
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
