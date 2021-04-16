+++
title = "Search"
date = 2020-12-25T18:42:00+08:00
description = "教您如何在Hugo中建立搜尋"
tags = ["hugo", "search"]
draft = false
markmap = true
toc_markmap = true
body_classes = "embed-bk-img"
article_classes = "bg-white"
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

    - search.js 路徑 : ``Fuse-6.4.3/src/search/bitap/search.js``

      我是不知道為什麼要它，我是沒用到它。

    - fuse.js 路徑 : ``Fuse-6.4.3/dist/fuse.js``

4. Add searchbox html to bottom of ``layouts/_default/baseof.html``

    他把第3點取得道的兩個js放到baseof.html之中，

    常理上baseof.html會對所有頁面都會有作用，如果你只想要特殊頁面有用，可以自己選擇要放到哪邊去。

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

    值得一提的是，如果你抓官方給的CSS，預設會把input隱藏起來，靠快捷鍵觸發後才會顯示

    另外即便您調整css，讓它不隱藏，之後在搜尋上打字也是沒用，因為它的觸發條件用熱鍵！

    熱鍵觸發之後還會去init物件，也就是Fuse物件(fuse.js)它會去抓取index.json的資料

    以下是``fastsearch.js``的片段代碼內容
    ```js {linenos=inline,hl_lines=[3,7]}
    document.addEventListener('keydown', function(event) {
        // CMD-/ to show / hide Search
        if (event.metaKey && event.which === 191) {  // windows鍵 + /
        // Load json search index if first time invoking search
        // Means we don't load json unless searches are going to happen; keep user payload small unless needed
            if(firstRun) {
                loadSearch(); // loads our json data and builds fuse.js search index  // 會用到fuse.js 這會去抓取index.json的資料
                firstRun = false; // let's never do this again
            }
        }
    }
    ```

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

    他的預設用 {{< hotkey "Windows鍵 + /" >}} :

    > event.``metaKey`` && event.which === 191

    我自己是改成 {{< hotkey "Alt + /" >}} :

    > event.``altKey`` && event.which === 191

    - 關於:[event.which]
    - 關於:[KeyboardEvent.metaKey]


## 自己用JS做

我這邊提供比較簡單的方法來做

基本上我們可以用

> {{ range .Site.RegularPages.ByLastmod.Reverse }}

👉[代碼連結](https://github.com/CarsonSlovoka/gohugo-theme-ananke/blob/f1e6c4039958c529b7ea1dfe1923b32b160a784d/layouts/custom_layout/site/navigation/site-search.html#L26-L30)

來找到所有頁面

接著可以把內容取出來

再交由js去把結果抓出來

下面我介紹兩種方法，都能實現搜尋

1. simple-search: 自己刻一個搜尋欄位
2. dataTable:

   利用datatable來渲染整個搜尋結果

   可以排序、分頁，擁有一個不錯看的表格！

### simple-search

- [html代碼連結](https://github.com/CarsonSlovoka/gohugo-theme-ananke/blob/f1e6c4039958c529b7ea1dfe1923b32b160a784d/layouts/custom_layout/site/navigation/site-search-simple.html#L20)
- [js代碼](https://github.com/CarsonSlovoka/gohugo-theme-ananke/blob/f1e6c4039958c529b7ea1dfe1923b32b160a784d/static/js/search/simple-search.js#L165-L171)
- [demo連結](https://carsonslovoka.github.io/site-search-simple/)


### DataTables.js

因為這種方式用到DataTables，所以我先放上DataTables的相關資訊

[![DataTables.js](https://github-readme-stats.vercel.app/api/pin?username=DataTables&repo=DataTables)](https://github.com/DataTables/DataTables)

[demo網址](https://datatables.net/)

----

以下是我Hugo中主題的運用

- [site-search.html](https://github.com/CarsonSlovoka/gohugo-theme-ananke/blob/f1e6c4039958c529b7ea1dfe1923b32b160a784d/layouts/custom_layout/site/navigation/site-search.html#L20-L21)
- [js](https://github.com/CarsonSlovoka/gohugo-theme-ananke/tree/f1e6c4039958c529b7ea1dfe1923b32b160a784d/static/js/search/dataTables)
    - [jquery.dataTables.js](https://github.com/CarsonSlovoka/gohugo-theme-ananke/blob/f1e6c4039958c529b7ea1dfe1923b32b160a784d/static/js/search/dataTables/jquery.dataTables.js) : 這個就是dataTable的東西，我沒改
    - [search-by-datatable.js](https://github.com/CarsonSlovoka/gohugo-theme-ananke/blob/f1e6c4039958c529b7ea1dfe1923b32b160a784d/static/js/search/dataTables/search-by-datatable.js#L39-L72)
- [demo連結](https://carsonslovoka.github.io/site-search/)


## 參考資料

- [5分钟給Hugo博客增加搜索功能](https://ttys3.net/post/hugo/hugo-fast-search/)
- [為 Hugo 添加搜索功能](https://blog.humblepg.com/post/2019/06/hugo-search.html)


[algolia]: https://www.algolia.com/pricing/
[event.which]: https://docstore.mik.ua/orelly/webprog/DHTML_javascript/0596004672_jvdhtmlckbk-app-b.html
[KeyboardEvent.metaKey]: https://developer.mozilla.org/zh-TW/docs/Web/API/KeyboardEvent
[github fuse release page]: https://github.com/krisk/Fuse/releases
