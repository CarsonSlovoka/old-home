+++
title = "CSS教學"
description=""
date = 2021-03-10T18:03:52+08:00
lastmod = 2021-03-10
featured_image = ""
draft = false
weight = 0
tags = ["CSS"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = ""
  next_page = ""
  previous_section = ""
  next_section = ""
+++


## [Selectors]

- [p ~ ul] : 和ul同層往前找可以找到p就為此ul設置屬性
- [div + p] : div之後(和div同層)首次出現的p元素
- [div > p] : p的父節點是div

----

- [::selection] : 反白的區域
- [:target] : 文內的連結(含有``#``)，點擊過去的目標屬性


[selectors]: https://www.w3schools.com/cssref/css_selectors.asp

[p ~ ul]: https://www.w3schools.com/cssref/tryit.asp?filename=trycss3_gen_sibling
[div + p]: https://www.w3schools.com/cssref/tryit.asp?filename=trycss_sel_element_pluss
[div > p]: https://www.w3schools.com/cssref/tryit.asp?filename=trycss_sel_element_gt

[::selection]: https://www.w3schools.com/cssref/tryit.asp?filename=trycss3_selection
[:target]: https://www.w3schools.com/cssref/tryit.asp?filename=trycss3_target
