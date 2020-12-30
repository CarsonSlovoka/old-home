+++
title="網站樹"
date = 2020-12-28T18:41:00+08:00
description = "這是一個可以看出整個網站列表的站點"
type = "custom_layout"
layout = "site/navigation/site-markmap"
+++


可以線上下載成HTML: https://markmap.js.org/repl


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
((e,t)=>{const{Markmap:r}=e();
window.mm=r.create("svg#mindmap",null,t)})(
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
]
}
);
</script>
```
