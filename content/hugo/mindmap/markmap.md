+++
title = "markmap教學"
date = 2020-12-30T16:14:00+08:00
description = "教您如何在自己的網站使用markmap"
tags = ["hugo"]
t_lang = ["Go"]
featured_image = ""
toc_bootstrap = true
+++

## 前言

這篇文章到底要講什麼?

請先參考這個網站: [markmap線上生成器]

## 出處

| Themes |  |  |
| ------ | ----- | ----- |
| [markmap](https://github.com/gera2ld/markmap) | {{< github/get_info_img gera2ld markmap stars >}} | {{< github/get_info_img gera2ld markmap forks "https://www.google.com/" >}} |

## 核心


他的實現主要靠兩個:

1. 運用D3.js[^D3.js]語法: ``<script src="https://cdn.jsdelivr.net/npm/d3@6.3.0"></script>``
2. 導入他自己的寫的markmap-view@x.x.x.js: ``<script src="https://cdn.jsdelivr.net/npm/markmap-view@0.2.0"></script>``


### d3.js

:point_right: [dj.js教學]({{< ref "/pg_lang/web/js/d3/tutorial" >}})

## 範例

### 概述

這是主要的邏輯
```html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Markmap</title>
    <style>
        * {
          margin: 0;
          padding: 0;
        }
        #mindmap {
          display: block;
          width: 100vw;
          height: 100vh;
        }
    </style>
</head>

<script>
((e,t)=>{
    const{Markmap:r}=e();
    window.mm=r.create("svg#mindmap",null,t)
})(
    ()=>window.markmap,{
    "t":"root","d":0,"v":"","c":[  <!-- 這一層不一定要建，但是如果你有多個首層，也就是頂層的權重都相同，就勢必還要有一層包含他們 -->
      {"t":"heading","d":1,"p":{},"v":"教學", "c":[
          {"t":"heading","d":2,"p":{},"v":"<a href=\"https://markmap.js.org/repl/\">Hugo</a>"},  <!-- 超連結要用backslash來輔助引號 -->
          {"t":"heading","d":2,"p":{},"v":"JS", "c":[
              {"t": "heading", "d":3, "p":{}, "v":"jquery"},
              {"t": "heading", "d":3, "p":{}, "v":"bootstrap"}
            ]
          }
        ]},
        {"t":"heading","d":1,"p":{},"v":"科技", "c":[]}
]});
</script>
```

### 完整的範例

```html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Markmap</title>
    <script src="https://d3js.org/d3.v6.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/markmap-view@0.2.0"></script>
    <style>
        * {
          margin: 0;
          padding: 0;
        }
        .mindmap {
          display: block;
          width: 100vw;
          height: 100vh;
        }
    </style>
</head>

<body>
    <svg id="mindmap-lang" class="mindmap"></svg>
	<svg id="mindmap-other" class="mindmap"></svg>
</body>

<script>
((e,t)=>{
    const{Markmap:r}=e();
    window.mm=r.create("svg#mindmap-lang",null,t)
})(
    ()=>window.markmap,{
    "t":"root","d":0,"v":"","c":
	[
      {"t":"heading","d":1,"v":"Lang", "c":[
          {"t":"heading","d":2,"v":"<a href=\"https://www.python.org/\">Python</a>"},
          {"t":"heading","d":2,"v":"JS", "c":[
              {"t": "heading", "d":3, "v":"jquery"},
              {"t": "heading", "d":3, "v":"d3js"}
            ]
          }
        ]},
	  {"t":"heading","d":1,"v":"News", "c":[]}
	]}
);
</script>

<script>
((e,t)=>{
    const{Markmap:r}=e();
    window.mm=r.create("svg#mindmap-other",null,t)
})(
    ()=>window.markmap,{
      "t":"heading","d":0,"v":"MyRoot", "c":
	  [
		{"t":"heading","d":1,"v":"H1"},
	    {"t":"heading","d":1,"v":"H1", "c":[
		    {"t": "heading", "d":2, "v":"H2"},
		    {"t": "heading", "d":2, "v":"H2"}
		  ]
	    }
	  ]}
);
</script>
```

### 抓取根結點下的各個section不含(子section)

```js
{{ $cur_list := slice }}
{{- range .Site.Sections -}}
  {{- $cur_list =  $cur_list | append ( printf `{"t":"heading", "d":1, "v": "%s", "p":{}, "c":[] }` .Title ) -}}
{{- end -}}
{{ $cur_list }}
<script>
((e,t)=>{
    const{Markmap:r}=e();
    window.mm=r.create("svg#mindmap",null,t)
    }
)(()=>window.markmap,{
  "t":"root","d":0,"v":"","c":[
    {{- delimit $cur_list "," | safeJS -}}
  ]
  }
);
```

## markmap測試

> :exclamation: js有先後順序front matter的markmap不能放在article_image之後！

語法:
```json
{
    "t": "",
    "d": 0,
    "v": "",
    "p": {},
    "c": []
}
```

- t: title的名稱，只是一個名稱，隨便你要打上什麼都可以，例如:heading或者root等等都行
- d: 只能放數字，代表樹層的意思，最低為0，表示根結點。
- v: 心智圖上此根結點的名稱，你也可以放上HTML的語法例如``"<a href=\"https://markmap.js.org/repl/\">Hugo</a>"``
- p: 功能未知，推測可能與parent有關
- c: 容器，底下可以再放其子元素


基本範例
```markmap
{"t":"h1","d":1,"v":"教學", "c":[
        {"t":"header_name","d":2,"v":"Lesson1"}
    ]
}
```


範例一:
```markmap
{"t":"heading","d":1,"p":{},"v":"教學", "c":[
  {"t":"heading","d":2,"p":{},"v":"<a href=\"https://markmap.js.org/repl/\">Hugo</a>"},
  {"t":"heading","d":2,"p":{},"v":"JS", "c":[
      {"t": "heading", "d":3, "p":{}, "v":"jquery"},
      {"t": "heading", "d":3, "p":{}, "v":"bootstrap"}
    ]
  }
]}
```

範例二:

可以利用: ``"t":"root","d":0,"v":"Root","c":`` 來創造出根節點

```markmap
{
"t":"root","d":0,"v":"Root","c":
    [
      {"t":"heading","d":1,"v":"Lang", "c":[
        {"t":"heading","d":2,"v":"<a href=\"https://www.python.org/\">Python</a>"},
        {"t":"heading","d":2,"v":"JS", "c":[
          {"t": "heading", "d":3, "v":"jquery"},
          {"t": "heading", "d":3, "v":"d3js"}
        ]
        }
      ]},
      {"t":"heading","d":1,"v":"News", "c":[]}
    ]
}
```

## 註腳
[^D3.js]: 簡單來說也是一種javascript的封裝，詳請可參考官網: [D3.js_official_site]


[markmap線上生成器]: https://markmap.js.org/repl
[D3.js_official_site]: https://d3js.org/
