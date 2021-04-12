+++
title = "Web API"
description="JS Web API教學"
date = 2021-02-21T18:19:00+08:00
lastmod = 2021-02-21
featured_image = ""
draft = false
weight=0
tags = ["js"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = "pg_lang/web/js/js_tutorial"
  next_page = ""
  previous_section = ""
  next_section = ""
+++

## DocumentFragment

他可以優化效率，請參考以下[範例](https://blog.csdn.net/aitangyong/article/details/50351400#:~:text=DocumentFragment%EF%BC%88%E6%96%87%E6%A1%A3%E7%89%87%E6%AE%B5%EF%BC%89%E6%8E%A5%E5%8F%A3%E8%A1%A8%E7%A4%BA,%E4%B8%8D%E4%BC%9A%E5%AF%BC%E8%87%B4%E6%80%A7%E8%83%BD%E9%97%AE%E9%A2%98%E3%80%82)

{{< table/code-by-example "不好的做法" "好的做法" >}}

循环中操作DOM效率很低

```js {linenos=inline,hl_lines=[10]}
var count = 1000;

var begin = new Date().getTime();
var end = begin;

for (var i = 0; i < count; i++)
{
	var el = document.createElement('p');
	el.innerHTML = i;
	document.body.appendChild(el);
}

end = new Date().getTime();

console.log("cost time: " + (end-begin));
```

@@NEW-COL@@

先插入到碎片下，再将碎片插入到body。就能使效率提高！

```js {linenos=inline,hl_lines=[6,12,15]}

var count = 100;
var begin = new Date().getTime();
var end = begin;

var frag = document.createDocumentFragment();

for (var i = 0; i < count; i++)
{
	var el = document.createElement('p');
	el.innerHTML = i;
	frag.appendChild(el);
}

document.body.appendChild(frag);
end = new Date().getTime();
```

{{< /table/code-by-example >}}


## [video speed](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector)

```
document.querySelector('video').playbackRate = 4;
```
