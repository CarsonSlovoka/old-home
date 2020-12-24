+++
title = "HTML常用元件介紹"
date = 2020-12-24T10:53:00+08:00
description = "教您如何打造一些HTML常用的元件"
tags = ["html"]
draft = false
toc = true
bootstrap = true
+++

## card設計

### 自己設計

#### justify-content

通常卡片都是一個區塊一個區塊排列再一起，

所以您要先了解: [CSS justify-content Property]

```css
justify-content {
  display: flex;
  justify-content: space-around;
}
```

> :collision: 這兩個屬性一定要一起搭配才會有效果

其中``space-around``沒有考慮上下，所以您可能要考慮使用margin-top(如果是使用bootstrap，可以用``mt``來幫忙)

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

```html
<section class="justify-around flex-wrap mt5">
    <div class="w-30">
        {{ partial "description-with-image" . }}
    </div>
</section>
```

### 使用bootstrap


[CSS justify-content Property]: https://www.w3schools.com/cssref/css3_pr_justify-content.asp
