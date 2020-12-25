+++
title = "Search"
date = 2020-12-25T18:42:00+08:00
description = "教您如何在Hugo中建立搜尋"
tags = ["hugo", "search"]
draft = false
toc = true
bootstrap = true
[article_image]
    src = "images/hugo/gohugoio-card.jpg"
+++

## Search實作分析

請點擊 [連結](https://gohugo.io/tools/search/) 至官方查看

製作搜尋分為兩種

1. 使用雲端搜尋(google, [algolia]...)

    這類不是進階服務要錢，要不然就是有廣告

2. 使用JS來搞

    缺點: 效率慢，搜尋不準

## JS搜尋

以下的東西都是官方有提到的搜尋

### [hugofastsearch](https://gist.github.com/cmod/5410eae147e4318164258742dd053993)

Setup

1. Add ``index.json`` file to ``layouts/_default``

    主要是利用Hugo去撈取每一個頁面的資料

    ```go-html-template
   {{- $.Scratch.Add "index" slice -}}
    {{- range .Site.RegularPages -}}
        {{/* 這裡對應 fastsearch.js
             dict 後面的東西要自己放好，如果抓不到就會出現undefine，如果一直有問題請用chrome來debug js檔案
        */}}
        {{- $.Scratch.Add "index" (dict "title" .Title "date" .Date "desc" .Description "tags" .Params.tags "section" .Section "categories" .Params.categories "contents" .Plain "permalink" .Permalink) -}}
    {{- end -}}
    {{- $.Scratch.Get "index" | jsonify -}}
    ```


2. Add JSON as additional output format in ``config.toml``

    ```toml
    [outputs]
    home = ["HTML", "RSS", "JSON"]
    ```

3. Add search.js and fuse.js (downloaded from fusejs.io) to ``static/js``

    這兩個請去[github fuse release page]下載  (我是找不到在fusejs.io的哪邊有可以載:laughing:，到release page載比較快:sunglasses:)

    - search.js 我是不知道為什麼要它，我是沒用到它。 它的路徑: ``Fuse-6.4.3/src/search/bitap/search.js``
    - fuse.js 路徑: ``Fuse-6.4.3/dist/fuse.js``

4. Add searchbox html to bottom of ``layouts/_default/baseof.html``

    這裡面很簡單，主要就是搞一個input的按鍵，導入兩個js即可完成

    ```html
    <div id="fastSearch">
      <input id="searchInput" tabindex="0">
        <ul id="searchResults">
      </ul>
    </div>
    <script src="/js/search/fuse/fuse.js"></script>
    <script src="/js/search/fuse/fastsearch.js"></script>
    ```

5. Add css styles to your site's main css file or top of baseof.html

    基本上css自己調整就可以了，自己在chrome用檢查去找到各個元素很快就知道了

    值得一提的是，如果你抓官方給的CSS預設了話它會把input隱藏起來，它的觸發是用快捷鍵所觸發的

    另外即便你調整css不隱藏，打上搜尋也是沒用，因為它的觸發條件用熱鍵！

    觸發之後還會去init物件，也就是Fuse物件(fuse.js)它會去抓取index.json的資料

    所以如果你只有改css是沒用的

    ```css
    #fastSearch { /* 整個div */
      visibility: hidden;  /* <--要不要隱藏看你 */
    }

    #fastSearch input { /* input控件 */
    }

    #searchResults li { /* 搜尋跑出來的li */
    }
    #searchResults li .title { font-size: 1.1em; margin-bottom: 10px; display: inline-block;}

    #searchResults { visibility: inherit; display: inline-block; width: 320px; }
    #searchResults a { text-decoration: none !important; padding: 10px; display: inline-block; }
    #searchResults a:hover, a:focus { outline: 0; background-color: #666; color: #fff; }
    ```

6. ``hugo server``
7. Visit ``localhost:1313/``
8. 按下 ``CMD-/``觸發搜尋

    它的觸發一定要按下快捷鍵

    他的預設用``event.metaKey && event.which === 191``)

    我自己是改成: ``event.altKey && event.which === 191``

    也就是用``ALT+/``

    - 關於:[event.which]
    - 關於:[KeyboardEvent.metaKey]


## 參考資料

- [5分钟给Hugo博客增加搜索功能](https://ttys3.net/post/hugo/hugo-fast-search/)
- [为 Hugo 添加搜索功能](https://blog.humblepg.com/post/2019/06/hugo-search.html)


[algolia]: https://www.algolia.com/pricing/
[event.which]: https://docstore.mik.ua/orelly/webprog/DHTML_javascript/0596004672_jvdhtmlckbk-app-b.html
[KeyboardEvent.metaKey]: https://developer.mozilla.org/zh-TW/docs/Web/API/KeyboardEvent
[github fuse release page]: https://github.com/krisk/Fuse/releases
