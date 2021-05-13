+++
title = "Bootstrap Table"
description=""
date = 2021-04-15T15:05:57+08:00
lastmod = 2021-04-15
featured_image = ""
draft = false
weight = 0
tags = ["bootstrap", "bootstrap-table", "datatables"]
markmap = true
toc_bootstrap = true
toc_markmap = true
+++

## 前言

如果您想要使用bootstrap建立一個酷炫的Table，這裡有一些推薦的項目可以參考

| Name | Desc |
| ---- | ---- |
[![wenzhixin/bootstrap-table](https://github-readme-stats.vercel.app/api/pin?username=wenzhixin&repo=bootstrap-table)](https://github.com/wenzhixin/bootstrap-table) |
[![DataTables/DataTables](https://github-readme-stats.vercel.app/api/pin?username=DataTables&repo=DataTables)](https://github.com/DataTables/DataTables) |

## bootstrap-table

可以用HTML也可以用JS來產生資料

### 我該怎麼學習bootstrap-table

相信大家或多或少有瀏覽過此網頁

> https://examples.bootstrap-table.com

而點擊View Source出來的東西卻不是所預期的...

首先 https://examples.bootstrap-table.com 這個是github page所生成，它位於

> https://github.com/wenzhixin/bootstrap-table/tree/gh-pages

資料夾的分類和網站基本差不多，例如您可以找到這個檔案。

> https://github.com/wenzhixin/bootstrap-table/blob/gh-pages/docs/api/methods/index.html

(以上動作其實直接在 [網頁](https://examples.bootstrap-table.com/#methods/load.html) 上檢查HTML也是可以)，你會發現這個內容

> ``<p><strong>Example:</strong> <a href="https://examples.bootstrap-table.com/#methods/load.html">Load</a></p>``

``https://examples.bootstrap-table.com`` 這其實是作者的另一個專案，專門寫EXAMPLE的

[![wenzhixin/bootstrap-table-examples](https://github-readme-stats.vercel.app/api/pin?username=wenzhixin&repo=bootstrap-table-examples)](https://github.com/wenzhixin/bootstrap-table-examples/tree/gh-pages)

接著您找尋分支[gh-pages](https://github.com/wenzhixin/bootstrap-table/tree/gh-pages)

裡面的資料夾和網站上的差不多，您可以找到該檔案就能真的知道網站上的demo的source是怎麼出來的，

例如:

> https://github.com/wenzhixin/bootstrap-table-examples/blob/f9e66185/methods/load.html

了解了這個之後，其實以下的東西您可看可不看😆，直接看代碼比較快！

### 用HTML生成資料

範例 (您也可以到[這邊](https://stackoverflow.com/a/45938210) 直接運行，來觀看結果)

```html {linenos=inline, hl_lines=["71-85"]}
<!DOCTYPE html>
<html>
<head>
  <!-- bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

  <!-- bootstrap-table-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.18.3/bootstrap-table.min.css" integrity="sha512-5RNDl2gYvm6wpoVAU4J2+cMGZQeE2o4/AksK/bi355p/C31aRibC93EYxXczXq3ja2PJj60uifzcocu2Ca2FBg==" crossorigin="anonymous" />
  <script defer src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.18.3/bootstrap-table.min.js" integrity="sha512-Wm00XTqNHcGqQgiDlZVpK4QIhO2MmMJfzNJfh8wwbBC9BR0FtdJwPqDhEYy8jCfKEhWWZe/LDB6FwY7YE9QhMg==" crossorigin="anonymous"></script>
  <script defer src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.18.3/extensions/export/bootstrap-table-export.min.js" integrity="sha512-cAMZL39BuY4jWHUkLWRS+TlHzd/riowdz6RNNVI6CdKRQw1p1rDn8n34lu6pricfL0i8YXeWQIDF5Xa/HBVLRg==" crossorigin="anonymous"></script>

  <!-- font-awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
  <script defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" integrity="sha512-RXf+QSDCUQs5uwRKaDoXt55jygZZm2V++WUZduaU/Ui/9EGp3f/2KZVahFZBKGH0s774sd3HmrhUy+SgOFQLVQ==" crossorigin="anonymous"></script>

  <!-- jquery -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"></script>

  <style>
    html {
      font-family: sans-serif;
      line-height: 1.15;
      -webkit-text-size-adjust: 100%;
      -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    }

    h1, h2, h3, h4, h5, h6 {
      margin-top: 0;
      margin-bottom: 0.5rem;
      color: #004a88;
      text-align: center;
    }

    .table-blue {
      font-family: Arial, Helvetica, sans-serif;
      border-collapse: collapse;
      width: 100%;
    }

    .table-blue td, .table-blue th {
      border: 1px solid #ddd;
      padding: 8px;
    }

    <!-- .table-blue tr:nth-child(even){background-color: #f2f2f2;} -->

    .table-blue tr:hover {background-color: #ddd;}

    .table-blue th {
      background-color: #004a88;
      font-size: larger;
      font-weight: bold;
      padding-top: 5px;
      padding-bottom: 5px;
      text-align: left;
      color: white;
    }

  </style>
</head>

<body>
<!-- 更多的選項請參考Table-options: https://bootstrap-table.com/docs/api/table-options/
data-show-fullscreen="true"
data-show-toggle 一列整合在一起的功能(會多出這個圖標可以按)
     data-single-select="true"
   data-click-to-select = "true"
-->
<table id="myTable" class="table table-striped table-blue"
       data-toggle="table"
       data-search="true"
       data-search-highlight="true"
       data-show-refresh="true"
       data-show-toggle="true"
       data-show-columns="true"
       data-show-export="true"
       data-minimum-count-columns="2"
       data-show-pagination-switch="true"
       data-pagination="true"
       data-id-field="id"
       data-page-list="[10, 25, 50, 100, ALL]"
       data-show-footer="false"
       data-side-pagination="client"
       data-url="https://jsonplaceholder.typicode.com/photos">
  <thead>
  <tr>
    <th data-sortable="true" data-field="id">Id</th>
    <th data-sortable="true" data-field="title">Title</th>
    <th data-sortable="true" data-field="url">URL</th>
    <th data-sortable="true" data-formatter="imageFormatter" data-field="thumbnailUrl">Thumbnail URL</th>
  </tr>
  </thead>
  </table>
</body>
</html>

<script>
  function imageFormatter(value, row) {
    return '<img src="'+value+'"  style="width:60px;height:60px" loading="lazy" />';
  }
</script>

```

71-85列有很多[選項](https://bootstrap-table.com/docs/api/table-options/) ，您可以視情況來調整

另外它有一些extension的項目，

具體的內容您可以上cdnjs視情況來加入

> https://cdnjs.com/libraries/bootstrap-table

像是上面的export的選項，如果要使用就必須加入export的js

> ``<script defer src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.18.3/extensions/export/bootstrap-table-export.min.js"></script>``

----

以上的資料 ``data-url="https://jsonplaceholder.typicode.com/photos"`` 來至:

> https://jsonplaceholder.typicode.com/photos

如果您點進去看，會發現其實裡面有一個列中有5個欄位

以上的範例，只有提供4個而已，至於要哪些欄位，可以透過

> data-field

來指定，其中data-field中放的名稱要是檔案中的欄位名稱

### 用JS生成資料

```js
$("#tb_user").bootstrapTable({
  columns: [
    {
      checkbox: true,
    },
    {
      field: 'username',
      title: '用户名',
      width: '10%',
      align: 'center',
      editable: {
        type: 'text',
        placement: 'right',
        emptytext: "...",
        validate: function (v) {
          if (!v) return 'username is null';
        }
      },
    },
    {
      field: 'password',
      title: '密码',
      editable: {
        type: 'text',
        placement: 'right',
        validate: function (v) {
          if (!v) return 'password is null';
        }
      },
    },
  ],

  // 👇👇👇👇below is options👇👇👇👇
  idField: "id",
  striped: true,
  url: 'json/data1.json',
  cache: false,
  pagination: true,
  sortable: false,
  sortOrder: "asc",
  sidePagination: "client",
  pageNumber: 1,
  pageSize: 10,
  pageList: [10, 25, 50, 100],
  search: false,
  strictSearch: false,
  showColumns: false,
  showRefresh: false,
  minimumCountColumns: 2,
  clickToSelect: false,
  // height: 500,
  showToggle: false,
  cardView: false,
  detailView: false,
  onLoadSuccess: function () {
  }
});
```

除了column以外，還有table-options

> https://bootstrap-table.com/docs/api/table-options/

裡面的東西都可以放

舉idField來說

```
idField
- Attribute: data-if-field
- Type: string
- ...
```

Attribute是給html用，例如

```html
<table data-id-field="id"></table>
```

至於header: ``idField`` 這是用在js

```js
$("#tb_user").bootstrapTable({
  columns: [
  ],
  // 👇👇👇👇below is options👇👇👇👇
  idField: "id",
});
```

其他的東西以此類推

### [Table Editable](https://bootstrap-table.com/docs/extensions/editable/)

```js
<script src="extensions/editable/bootstrap-table-editable.js"></script>
```

### [API](https://bootstrap-table.com/docs/api/table-options/)

裡面分為5大類

- [Table Options]
- [Column Options]
- [Events]
- [Methods]
- [Localizations]

#### [Table Options]

##### [Table Classes](https://examples.bootstrap-table.com/#options/table-classes.html)

這個東西比較無關，基本上就是class的屬性而已，因為bootstrap本身就有提供table屬性，也可以去參考 [bootstrap table](https://getbootstrap.com/docs/5.0/content/tables/#variants)

- table
- table-bordered
- table-hover
- table-striped
- table-dark
- table-sm
- table-borderless


##### button

客製化按鈕
- [文檔](https://bootstrap-table.com/docs/api/table-options/#buttons)
- [js代碼](https://github.com/wenzhixin/bootstrap-table-examples/blob/5fc409e/options/buttons.html#L32-L55)
- [data-show-button-text](https://github.com/wenzhixin/bootstrap-table-examples/blob/f9e6618564a/options/show-button-text.html#L13)

在您的table定義
```html
<table data-buttons="buttons"
       data-show-button-text="true"
></table>
```

- data-buttons : 指的是在js中的函數名稱，他會用這個函數名稱的實作餵入資料給Table
- data-show-button-text : 看您需不需要按鈕旁邊有文字出現
- data-search-highlight : 搜尋後會突顯搜尋的文字 (如果有錯誤時，將不會突顯文字)


```js
function buttons () {
    return {
        btnUsersAdd: {
            text: 'Highlight Users', // 僅當data-show-button-text=true才會有效
            icon: 'fa-users',
            event: function () {
                alert('Do some stuff to e.g. search all users which has logged in the last week')
            },
            attributes: {
                title: 'Search all users which has logged in the last week'
            }
        },
        btnAdd: {
            text: 'Add new row',
            icon: 'fa-plus',
            attributes: {
                title: 'Add a new row to the table'
            },
            event: {
                'click': () => {alert('Do some stuff to e.g. add a new row')},
                'mouseenter': () => { },
                'mouseleave': () => { }
            }
        }
    }
}
```


#### [Column Options]

#### [Events]

#### [Methods]

所謂的Methods指的是表生成以後，可以利用該表來訪問或做某些事情，語法

> $('#table').bootstrapTable('method', parameter)

##### Append

Append the data to table.

> $table.bootstrapTable('append', data)

##### [getData](https://bootstrap-table.com/docs/api/methods/#getdata)

Get the loaded data of table at the moment that this method is called

----

```js
const jsonData = JSON.stringify(table.bootstrapTable('getData', {
useCurrentPage: false, // 全部分頁都要進來
includeHiddenRows: true, // 包含隱藏的欄位
unfiltered: true // true 全部的資料沒有經過篩選
}))
```

詳可[參考](https://github.com/wenzhixin/bootstrap-table-examples/blob/f9e6618564a97ba13dd5898d4508afd3d133b2cc/methods/get-data.html#L36)


##### load

Load the data to table, the **old rows will be removed**.

> $table.bootstrapTable('getData')

#### [Localizations]

本地化，可以用給定的js來達成目的，您可以參考官方文檔，如果連結有異動，則可以瀏覽

> https://github.com/wenzhixin/bootstrap-table/tree/347897f7/src/locale

第一步先導入css，之後看您是要在html中改還是js改

HTML
```html
<table data-toggle="table" data-locale="en-US"> </table>
```

JS
```js
$('#table').bootstrapTable({
  locale: 'en-US'
})
```

### 範例集

| demo網址 | issue# |
| ---- | ---- |
[欄位排序](https://live.bootstrap-table.com/code/UtechtDustin/4162) | [#5217](https://github.com/wenzhixin/bootstrap-table/issues/5217#issuecomment-665721945)
[排序搭配js](https://live.bootstrap-table.com/code/wenzhixin/6948) | [#5642](https://github.com/wenzhixin/bootstrap-table/issues/5642#issuecomment-801585168)
[點擊+號可以出現圖片](https://live.bootstrap-table.com/code/wenzhixin/3784) | [#5143](https://github.com/wenzhixin/bootstrap-table/issues/5143#issuecomment-653894753)

### Plugin

#### Export

請參考

> https://github.com/hhurz/tableExport.jquery.plugin#installation

| Name | Desc |
| ---- | ---- |
[![hhurz/tableExport.jquery.plugin](https://github-readme-stats.vercel.app/api/pin?username=hhurz&repo=tableExport.jquery.plugin)](https://github.com/hhurz/tableExport.jquery.plugin) | 有了這個才可以支持export的選項(多數的格式csv, xml, json, txt...如果有特殊的(pdf, png...)還是要加載其他的js才能辦到)
[![stefanpenner/es6-promise](https://github-readme-stats.vercel.app/api/pin?username=stefanpenner&repo=es6-promise)](https://github.com/stefanpenner/es6-promise/) |
[![niklasvh/html2canvas](https://github-readme-stats.vercel.app/api/pin?username=niklasvh&repo=html2canvas)](https://github.com/niklasvh/html2canvas/) | [Screenshots with JavaScript](https://html2canvas.hertzen.com/) 匯出png的時候會用到，您可能會納悶，匯出png得到的是什麼東東🤔 其實匯出png就是截圖當前的table而已😆
[![MrRio/jsPDF](https://github-readme-stats.vercel.app/api/pin?username=MrRio&repo=jsPDF)](https://github.com/MrRio/jsPDF) | PDF


## dataTable

```html
<head>
<link href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" rel="stylesheet">
<script defer src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
</head>

<script>
var dataSet = [
    [ "Tiger Nixon", "System Architect", "Edinburgh", "5421", "2011/04/25", "$320,800" ],
    [ "Garrett Winters", "Accountant", "Tokyo", "8422", "2011/07/25", "$170,750" ],
    [ "Ashton Cox", "Junior Technical Author", "San Francisco", "1562", "2009/01/12", "$86,000" ],
    [ "Cedric Kelly", "Senior Javascript Developer", "Edinburgh", "6224", "2012/03/29", "$433,060" ],
    [ "Airi Satou", "Accountant", "Tokyo", "5407", "2008/11/28", "$162,700" ],
    [ "Brielle Williamson", "Integration Specialist", "New York", "4804", "2012/12/02", "$372,000" ],
    [ "Herrod Chandler", "Sales Assistant", "San Francisco", "9608", "2012/08/06", "$137,500" ],
];

$(document).ready(function() {
    var table = $('#example').DataTable( {
        data: dataSet,
        columns: [
            { title: "Name" },
            { title: "Position" },
            { title: "Office" },
            { title: "Extn." },
            { title: "Start date" },
            { title: "Salary" }
        ]
    } );

	table.column( 5 )
    .data()
    .filter( function ( value, index ) {
        return value > 8000 ? true : false;
    } );
} );

</script>
<table id="example" class="display" width="100%"></table>
```

[出處](https://editor.datatables.net/examples/api/confirmClose)


## 製作好看的 select multiple

您可以使用預設HTML中提供的方法 {{< sup "[multiple](https://www.w3schools.com/tags/tryit.asp?filename=tryhtml_optgroup) | [tag_optgroup](https://www.w3schools.com/tags/tag_optgroup.asp) " >}} ，但是外觀不太好看。

我會推薦用以下的第三方專案來解決

[![wenzhixin/multiple-select](https://github-readme-stats.vercel.app/api/pin?username=wenzhixin&repo=multiple-select)](https://github.com/wenzhixin/multiple-select)

### Usage

可以npm或cdn都行 {{< sup "[下載](https://multiple-select.wenzhixin.net.cn/docs/en/download)" >}}

- cdn

    ```
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.js"></script>
    ```

- npm

    ```
    $ npm install multiple-select
    ```

[usage](https://multiple-select.wenzhixin.net.cn/docs/en/usage)

```html {linenos=inline, hl_lines=[24]}
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.css">
    <script src="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.js"></script>
</head>

<style>
  .ms-choice>span {
    position: initial; // 和某些css有衝突，所以強制更改
    overflow: initial;
  }
  button.ms-choice {
    height: 2rem;
  }
</style>

<select id="mySelect">
  <option value="1">January</option>
  <option value="2">February</option>
  <option value="3">March</option>
</select>

<script>
    $('#mySelect').multipleSelect()
</script>
```

可以覆寫他css的屬性

24行: 注意最後一定要初始化才會成功


也可以給於額外的[options](https://multiple-select.wenzhixin.net.cn/docs/en/options)

{{<table/code-by-example>}}

如果您想要一列有很多個勾選框，如下

```
item 1 ☑  item 2 ☐  item 3 ☐
item 4 ☑  item 5 ☐  item 6 ☐
item 7 ☐  item 8 ☑  item 98765... ☐
...
```

@@NEW-COL@@

```
$("#selectTag").multipleSelect({
  width: 600,
  multiple: true,
  multipleWidth: 160,
  dropWidth: "728"
})
```

- multiple : 是必須加上去才會顯示出左側的效果
- multipleWidth : 表示每一個元素的欄寬，如果您發現您的字被省略了，例如 ``98765...`` 那就表示寬度不夠要增加才可以完整顯示
- width : 總寬度
- dropWidth : 我個人很推這個屬性，只調整drop時的欄位寬度，因此在不點擊的時候，可以維持按鈕小小的，當點擊後才會有比較大的下拉選單可選。


{{</table/code-by-example>}}





### 其他參考資料

- [範例搭配代碼](https://www.dumbino.com/assets/multiple-select-master/docs/index.html)

## 相關連結
- [How to add json data instead of data-url to populate the grid?](https://stackoverflow.com/a/45973096)
- [★bootstrap-table文件無法導出](https://blog.csdn.net/qq_25482087/article/details/105566364)
- https://stackoverflow.com/users/1531096/wenyi



[Table Options]: https://bootstrap-table.com/docs/api/table-options/
[Column Options]: https://bootstrap-table.com/docs/api/column-options/
[Events]: https://bootstrap-table.com/docs/api/events/
[Methods]: https://bootstrap-table.com/docs/api/methods/
[Localizations]: https://bootstrap-table.com/docs/api/localizations/
