+++
title = "搜尋"
type = "custom_layout"
layout = "search/fuse/search-fuse"
+++

如果要指定特別的layout，則type要給，

type的預設為page

layout的文件如果是放在_default，預設不能再有子資料夾(它的好處是還是會經過``baseof.html``)

但是如果你把資料夾遷出去

也就是放在``layouts/type/layout``就是一個自由的架構，講白了type很像section

以本範例來說，他抓得html就是

> layouts/``custom_layout``/**search/fuse/search-fuse.html**


> :collision: 這樣不會經過``baseof.html``
