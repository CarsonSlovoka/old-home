+++
title = "bootstrap基礎教學"
date = 2021-01-18T13:24:00+08:00
lastmod= 2021-03-28
description = "網頁排版基礎教學"
tags = ["bootstrap"]
markmap = true
toc_markmap = true
toc_bootstrap = true

[next_and_previous.link]
    previous_section="/pg_lang/web/css/fontawesome/fa_tutorial"
+++

## 取得線上的CSS, JS

你可以用官方提供的，或者由第三方的資源來獲取
1. 官方: [quick-start](https://getbootstrap.com/docs/5.0/getting-started/introduction/#quick-start)
2. 第三方: {{<fa-btn-link "/pg_lang/web/css/fontawesome/fa_tutorial#取得線上的css-js">}}cdnjs.com{{</fa-btn-link>}}


## SRI Hash

{{<fa-btn-link "/pg_lang/web/css/fontawesome/fa_tutorial#sri-hash" >}}SRI Hash{{</fa-btn-link>}}

## Forms

### form-control

選擇的時候可以有邊框跑出來

```html
<input type="text" class="form-control" placeholder="Your Email *" value="" autofocus />
<input type="password" class="form-control" placeholder="Your Password *" value="" />
```

{{<raw_html>}}
<input type="text" class="form-control" placeholder="Your Email *" value=""/>
<input type="password" class="mt-1 form-control" placeholder="Your Password *" value="" />
{{</raw_html>}}


### [input-group]

> 📙 在bs4是用 [form-group] 而bootstrap5已經沒有這種東西

假設我們想在input前面加上一些文字或者圖標(比較常見應該是圖標)

例如新增一個鎖頭的圖標，來表示輸入密碼

```html
<div class="input-group">
  <span class="input-group-text"><i class="fa fa-key icon" style="color:#892fff;"></i></span>
  <input type="password" class="form-control" placeholder="Your Password *" value="" />
</div>
```

{{<raw_html>}}
<div class="input-group">
  <span class="input-group-text"><i class="fa fa-key icon" style="color:#892fff;"></i></span>
  <input type="password" class="form-control" placeholder="Your Password *" value="" />
</div>
{{< /raw_html >}}


input-group可以幫我們把這些東西給**綁**在一塊

如果我們把``input-group``省略時，那他會呈現出以下情況

{{<raw_html>}}
<span class="input-group-text"><i class="fa fa-key icon" style="color:#892fff;"></i></span>
<input type="password" class="form-control" placeholder="Your Password *" value="" />
{{</raw_html>}}


### [color-picker](https://getbootstrap.com/docs/5.0/forms/form-control/?#color)


```html
<label for="exampleColorInput" class="form-label">Color picker</label>
<input type="color" class="form-control form-control-color" id="exampleColorInput" value="#00ff00" title="Choose your color">
```

{{<raw_html>}}
<label for="exampleColorInput" class="form-label">Color picker</label>
<input type="color" class="form-control form-control-color" id="exampleColorInput" value="#00ff00" title="Choose your color">
{{</raw_html>}}

## Components

### [Grid System](https://getbootstrap.com/docs/5.0/layout/grid/#grid-options)

{{< table/code-by-example >}}

``only screen``: here is used to prevent older browsers that do not support media

``max-width: 1248px``:
- max-width當您的螢幕寬度小於等於定義值就設定為定義值，
- 而當寬度已經大於定義值，就會設定為新的數值

因此如果您的螢幕width<=1248px此項就會為true

`12`列可以當作測試，調整瀏覽器的大小，過小可以隱藏住item這個選項，放大後此選項又會出來

> 📙 通常用media都會把此屬性放在後面，或者直接加上!important，才能讓此屬性覆蓋原來的屬性

@@NEW-COL@@

```html {linenos=inline,hl_lines=[12,"3-7"]}
<header>
  <style>
    @media only screen and (max-width: 1248px) {
        #navbar {
            display: none;
        }
    }
  </style>
</header>

<p>normal</p>
<p id="navbar">item</p>
```

{{< /table/code-by-example >}}

{{< table/bootstrap-table>}}

| @@w=10%@@　| @@w=10%@@xs\n<576px | @@w=10%@@sm\n>=576px | @@w=10%@@md\n>=768 | @@w=10%@@lg\n>=992 | @@w=10%@@xl\n>=1200px | @@w=10%@@xxl\n>=1400px |
| :---- | :----: | :----: | :----: | :----: | :----: | :----: |
Container\n``max-width``| None (auto) | 540px | 720px | 960px | 1140px | 1320px
Class prefix | ``.col-`` | ``.col-sm-`` | ``.col-md-`` | ``.col-lg-`` | ``.col-xl-`` | ``.col-xxl-``

{{< /table/bootstrap-table>}}

#### center

{{< table/code-by-example >}}

- ``container``: 對於不同的 @media (min-width: px) 有不同的處理方法
- ``text-center``: 把文字在該區塊內置中
- ``justify-content-center``: to center the children **horizontally**
- ``align-items-center``: to center the children **vertically**
- ``offset-md-3``: set an offset equal to half of the remaining size of the row. 以這個例子就是兩邊各留白3單位
- ``mx-auto``: margin-right: auto!important; margin-left: auto!important;


@@NEW-COL@@

```html
<section class="text-light">
<div class="container bg-primary">
<div class="row">
  <div class="col-md-6 bg-success text-center">text-center</div>  <!-- text-center指的是text-align: center!important; 他只能對文字而已，所以這種置中，是以「目前此區塊的中心」當作基準 -->
</div>
<div class="row justify-content-center">
  <div class="col-md-6 bg-success">justify-content-center</div>
</div>
<div class="row">
  <div class="col-md-6 bg-success offset-md-3">offset-md-3</div>
</div>
<div class="row">
  <div class="col-md-6 bg-success mx-auto">mx-auto</div>  <!-- mx-auto  margin-right: auto!important; margin-left: auto!important;-->
</div>
<div class="row justify-content-center text-center">
  <div class="col-md-6 bg-success">justify-content-center text-center</div>
</div>
</div>
</section>
```

{{< /table/code-by-example >}}

成品如下

{{<raw_html>}}
<section class="text-light">
  <div class="container bg-primary">
    <div class="row">
      <div class="col-md-6 bg-success text-center">text-center</div>  <!-- text-center指的是text-align: center!important; 他只能對文字而已，所以這種置中，是以「目前此區塊的中心」當作基準 -->
    </div>
    <div class="row justify-content-center">
      <div class="col-md-6 bg-success">justify-content-center</div>
    </div>
    <div class="row">
      <div class="col-md-6 bg-success offset-md-3">offset-md-3</div>
    </div>
    <div class="row">
      <div class="col-md-6 bg-success mx-auto">mx-auto</div>  <!-- mx-auto  margin-right: auto!important; margin-left: auto!important;-->
    </div>
    <div class="row justify-content-center text-center">
      <div class="col-md-6 bg-success">justify-content-center text-center</div>
    </div>
  </div>
</section>

{{</raw_html>}}

### Jumbotron

{{< table/code-by-example "CSS講解|40%" "HTML" >}}

```css
.bg-light {
    background-color: #f8f9fa!important;  // 偏白色
}

.p-5{
    padding: 3rem!important;
}

.rounded {
    border-radius: .25rem!important;
}

.m-3{  // 四周都有一定的留白
    margin: 1rem!important;
}

.display-4 {
    font-size: calc(1.475rem + 2.7vw);
    font-weight: 300; // 粗細
    line-height: 1.2;
}

.lead {
    font-size: 1.25rem;
    font-weight: 300;
}

.my-4 {
    margin-top: 1.5rem!important;
    margin-bottom: 1.5rem!important;
}
```

@@NEW-COL@@

```html
<div class="bg-light p-5 rounded m-3">
  <h1 class="display-4">主題名稱</h1>
  <p class="lead">摘要</p>
  <hr class="my-4">
  <p>內文</p>
  <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
</div>
```

{{< /table/code-by-example >}}

成品如下:
{{< raw_html >}}
<div class="bg-light p-5 rounded m-3">
  <h1 class="display-4">主題名稱</h1>
  <p class="lead">摘要</p>
  <hr class="my-4">
  <p>內文</p>
  <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
</div>
{{< /raw_html >}}

## span顏色, p.s.顏色

```html
<p>This is some <small class="text-muted">smaller</small> text.</p>
```

> {{<raw_html>}}<p>This is some <small class="text-muted">smaller</small> text.</p>{{</raw_html>}}

> :orange_book: 也可以藉由 ``style="color:gray; opacity: 0.5;`` 達成類似text-muted的效果

運用small可以讓字變小，text-muted是bootstrap的CSS中的樣式之一，主要就是讓顏色變成灰色(``#6c757d!important``)

> :orange_book: ``!important``表示如果有多個css重複的時候他會優先使用這個屬性，當然如果大家都是``!important``那就看誰最後才加入就用該屬性(同一般狀況)

> :orange_book: 還可參考CSS屬性的[font-size]

## 範例區

### [snippets](https://bootsnipp.com/)

這裡面有相當多的範例，而且相當有水準，稍微修改一下就能很貼合自己的主題！

在搜尋區塊打上關鍵字，就會出現相符的很多樣版供您選擇

舉例搜尋用的關鍵字:

- [timeline](https://bootsnipp.com/search?q=timeline):
    - [我覺得不錯的主題](https://bootsnipp.com/snippets/QMrM5)

- [Shopping](https://bootsnipp.com/search?q=shopping)
    - [Shopping Demo](https://bootsnipp.com/snippets/xrXp9)

[font-size]: https://www.w3schools.com/cssref/pr_font_font-size.asp
[input-group]: https://getbootstrap.com/docs/5.0/forms/input-group/
