+++
title = "Minifier"
description="壓縮js文件"
date = 2021-09-02T15:13:00+08:00
lastmod = 2021-09-02
featured_image = ""
draft = false
weight = 0
tags = ["js", "minifier"]
markmap = true
toc_markmap = true
toc_bootstrap = true
+++


# minifier

## [mishoo/UglifyJS](https://github.com/mishoo/UglifyJS)

### 安裝

你可以3個都試試看，我最後是用第三個才成功(終端機可以啟動``uglifyjs``)

- ``npm install uglify-js -g``
- ``npm install uglify-js``
- [npm install uglify-js -save--dev](https://stackoverflow.com/a/44193120/9935654)

### USAGE

> uglifyjs test.js -o test.min.js

- ``-m`` 指令可以修飾名稱，會將變數用比較短的名稱取代，這個可以大大的降低代碼的大小

    > uglifyjs test.js -m -o test.min.js

- ``-c`` 壓縮，例如``a["name"]``變成a.name之類的

    > uglifyjs test.js -c -o test.min.js

推薦指令

> ``uglifyjs .js -m -c -o .min.js``

## 參考資料

- [15個最好用的JavaScript代碼壓縮工具](https://my.oschina.net/u/3970421/blog/3034757)
