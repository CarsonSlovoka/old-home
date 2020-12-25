+++
title = "HTML常用元件介紹"
date = 2020-12-24T10:53:00+08:00
description = "教您如何打造一些HTML常用的元件"
tags = ["html", "css", "bootstrap"]
draft = false
toc = true
bootstrap = true
+++

## px, em, rem

| {{<raw_html>}}<div style="width:64px">名稱</div>{{</raw_html>}} | 說明 |
| ---- | ---- |
| px | 絕對大小, 12px等於12像素，**不會受到外圍文字的影響**，表示螢幕中每個「點」 (pixel)
| em| 相對大小，每個``子元素``透過「倍數」乘以``父元素``的 px 值。
| rem| 相對大小，每個``元素``透過「倍數」乘以``根元素``的 px 值。 相對於``root``層級的文字大小(網頁中的``html``)
| %|相對單位，每個子``元素``透過「百分比」乘以``父元素``的 px 值。

----

### 測試:

px and em:

{{<raw_html>}}
<section>
    <div style="font-size: 18px; border: #cccccc solid 1px;">測試:18px
    <div style="font-size: 1em; border: #cccccc solid 1px;">測試:1em</div>
    </div>
</section>
{{</raw_html>}}

可以發現外層如果是18px內層的1em就等同18px

## html大小屬性

| {{<raw_html>}}<div style="width:120px">名稱</div>{{</raw_html>}} | 定義 |
| ---- | ---- |
| medium | 預設值，等於16px(h4預設值)
| xx-small | 0.6 * medium (h6預設值)
| x-small | 0.75 * medium
| small | 0.8 * medium (h5預設值, W3C定義0.89倍
| large | 1.1 , h3, W3C:1.2
| x-large | 1.5, h2
| xx=large | 2, h1
| smaller | 父層80%
| large | 父層120%

## bootstrap

### [color](https://getbootstrap.com/docs/5.0/utilities/colors/)

顏色是很多人都會想改的東西，當然他的宣告很簡單，但是如果每次都要自己來解未免有些麻煩，

更何況專案裡面或多或少都會引進一些其他的css，利用這些既有的設定是比較妥當的，

以下為bootstrap的顏色:

語法:
>bg-xxx

範例:

{{< raw_html >}}
<a name="bs5_color"></a>
<p class="p-3 mb-2 bg-primary text-white">.bg-primary</p>
<p class="p-3 mb-2 bg-secondary text-white">.bg-secondary</p>
<p class="p-3 mb-2 bg-success text-white">.bg-success</p>
<p class="p-3 mb-2 bg-danger text-white">.bg-danger</p>
<p class="p-3 mb-2 bg-warning text-dark">.bg-warning</p>
<p class="p-3 mb-2 bg-info text-dark">.bg-info</p>
<p class="p-3 mb-2 bg-light text-dark">.bg-light</p>
<p class="p-3 mb-2 bg-dark text-white">.bg-dark</p>
<p class="p-3 mb-2 bg-white text-dark">.bg-white</p>
<p class="p-3 mb-2 bg-transparent text-dark">.bg-transparent</p>
{{< /raw_html >}}

按鍵:

語法:
> btn btn-xxx

{{<raw_html>}}
<p class="btn btn-primary">primary</p>
<p class="btn btn-danger">danger</p>
<p class="btn btn-dark">dark</p>
{{</raw_html>}}

基本上顏色的名稱都是固定，所以按鍵上我只列了一些，如果要全部[顏色](#bs5_color)請參考


## card設計

### 自己設計

#### justify-content

通常卡片都是一個區塊一個區塊排列再一起，

所以您要先了解:

- [CSS justify-content Property]

```css
justify-content {
  display: flex;
  /* justify-content: space-around; 你可以設定一些間距之間的填充方式*/
  justify-content: flex-start; /* 預設就是靠左邊對齊，基本上不要去動它 */
}
```

> :collision: 這兩個屬性一定要一起搭配才會有效果

其中``justify-content``沒有考慮上下，所以您可能要考慮使用margin-top(如果是使用bootstrap，可以用``mt``來幫忙)

好啦，講了那麼多這邊的重點就是:
> display: flex;

#### [flex-wrap](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap)

當我們有能力把卡片分開之後，接下來我們要處理的是，如何在擁有多張卡片時，自動為卡片換行的問題，

可以使用:

```css
.flex-wrap {
    flex-wrap: wrap;
}
```

最後您只要設定卡片的大小即可，例如: ``w-30`` (設定width:30%)


#### 範例

```go-html-template
<section class="flex-wrap mt5" style="display:flex;">
    <div class="w-30">
        {{ partial "description-with-image" . }}
    </div>
</section>
```

如果您想要把物件放在中間，可以考慮用margin-left的方式，例如

```go-html-template
<article style="margin-left:10%;">
<section class="flex-wrap mt5" style="display:flex;">
    <div class="w-30">
        {{ partial "description-with-image" . }}
    </div>
</section>
</article>
```

#### 附加裝飾

圓滑的邊緣(四個角)

```css
#example {
  border: 2px solid red;  /* 邊框 */
  border-radius: 20px;  /* 圓角化 4 個角*/
  border-top-left-radius: 50px 20px;  /* 圓角化左上角 */
}
```

### [使用bootstrap](https://getbootstrap.com/docs/5.0/components/card/)

用法如下，大小可以用rem指定，架構安排很好，也提供按鈕

您還可以加上zoom-in

```go-html-template
<section class="zoom-in card" style="width: 20rem;">  {{/* 20rem來控制卡片的寬度 */}}
  <a href=""><img class="card-img-top" src="" alt=""></a>
  <div class="card-body">
    {{/* link dim 取消下畫線；style="color: inherit;可以讓鼠標hover的時候不會有顏色出來 */}}
    <a class="link dim" href="" style="color: inherit;"><h3 class="card-title">Title</h3></a>
    <p class="card-text">description</p>
    <a href="#" class="btn btn-primary">read more</a>
    {{/* text-muted 讓文字背景顏色是灰色(類似) small
      float-end是bootstrap5的東西可以讓文字偏右
      */}}
    <p class="card-text"><small class="text-muted float-end">2020/12/24</small></p>
  </div>
</section>
```

你還可以加上zoom-in這樣就可以放大
```css
.zoom-in {
  transition: transform .2s;
}
```

{{<raw_html>}}
<section class="zoom-in card" style="width: 20rem;">
  <a href=""><img class="card-img-top" src="" alt=""></a>
  <div class="card-body">
    <a class="link dim" href="" style="color: inherit;"><h3 class="card-title">Title</h3></a>
    <p class="card-text">description</p>
    <a href="#" class="btn btn-primary" style="color:white">read more</a>
    <p class="card-text"><small class="text-muted float-end">2020/12/24</small></p>
  </div>
</section>
<br><br>
{{</raw_html>}}

## 參考資料

- [一次搞懂 CSS 字體單位：px、em、rem 和 %](https://www.oxxostudio.tw/articles/201809/css-font-size.html)

[CSS justify-content Property]: https://www.w3schools.com/cssref/css3_pr_justify-content.asp
