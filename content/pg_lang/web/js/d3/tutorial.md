+++
title = "基礎教學"
description = "d3.js基礎教學"
date = 2020-09-22T14:15:00+08:00
lastmod = 2021-09-22
featured_image = ""
tags = ["html", "d3.js", "js"]
draft = false
weight=0
markmap = true
toc_markmap = true
toc_bootstrap = true
+++

## [What is a sprite sheet?](https://www.youtube.com/watch?v=crrFUYabm6E)

簡單來說，他準備一張表，存放很多項目，來解省空間

- MEMORY = COLOR_DEPTH * WIDTH * HEIGHT

    例如rgba，4通道全彩則color depth=32(bit) (每一通道一位全彩，該通道可以有0~255的選擇，所以佔了8個**bit**)

    如果長寬都是140pixel，所需要的記憶體就是

    140*140*4(32bit=4byte) =  78400 byte 約 78KB
