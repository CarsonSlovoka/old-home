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
toc_markmap = true
+++

## 前言

如果您想要使用bootstrap建立一個酷炫的Table，這裡有一些推薦的項目可以參考

| Name | Desc |
| ---- | ---- |
[![wenzhixin/bootstrap-table](https://github-readme-stats.vercel.app/api/pin?username=wenzhixin&repo=bootstrap-table)](https://github.com/wenzhixin/bootstrap-table) |
[![DataTables/DataTables](https://github-readme-stats.vercel.app/api/pin?username=DataTables&repo=DataTables)](https://github.com/DataTables/DataTables) |

## bootstrap-table

範例 (您也可以到[這邊](https://stackoverflow.com/a/45938210) 直接運行，來觀看結果)

```html {linenos=inline, hl_lines=["21-34"]}
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

</head>

<body>
<table data-toggle="table"
       data-search="true"
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
    <th data-field="id">Id</th>
    <th data-field="title">Title</th>
    <th data-field="url">URL</th>
    <th data-field="thumbnailUrl">Thumbnail URL</th>
  </tr>
  </thead>
</body>
```

21-34列有很多選項，您可以視情況來調整

另外它有一些extension的項目，

具體的內容您可以上cdnjs視情況來加入

> https://cdnjs.com/libraries/bootstrap-table

像是上面的export的選項，如果要使用就必須加入export的js

> ``<script defer src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.18.3/extensions/export/bootstrap-table-export.min.js"></script>``


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


## 相關連結
- [How to add json data instead of data-url to populate the grid?](https://stackoverflow.com/a/45973096)
