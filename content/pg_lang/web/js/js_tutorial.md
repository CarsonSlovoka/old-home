+++
title = "JS tutorial"
description="JS基礎教學"
date = 2021-01-19T19:16:26+08:00
lastmod = 2021-02-21
featured_image = ""
draft = false
weight=0
tags = ["js"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = ""
  next_page = "pg_lang/web/js/js_web_api"
  previous_section = ""
  next_section = ""
+++

## [線上測試]

直接在[線上測試]的範例中刪除，打上您的範例就可以線上測試了。

## Docs

- [MDN Web Docs-JavaScript]

## if else

### === v.s. ==
{{< table/bootstrap-table >}}
| @@w=10%@@name | desc |
| ---- | ---- |
 == | in JavaScript is used for comparing two variables, but it **ignores** the datatype of variable.\n表面上等於
=== | is used for comparing two variables, but this operator **also checks datatype** and compares two values.\n完全等於
{{< /table/bootstrap-table >}}

## Variable

### json

- [JSON.parse()]\: 字串變物件(dict, list...)

  ```js
  const dict_data = JSON.parse('{"result":true, "count":42}')
  console.log(dict_data.count);
  // expected output: 42
  ```

- [JSON.stringify()]\: 物件變字串

  ```js
  console.log(JSON.stringify({ x: 5, y: 6 }));
  // expected output: "{"x":5,"y":6}"

  JSON.stringify(my_dict, null, 2)  // 也可以格式化字串(2個空白)
  ```

### list

[destructuring assignment syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)

```js
let a, b, rest;
[a, b, ...rest] = [10, 20, 30, 40, 50];
// a = 10, b = 20
console.log(rest);
// expected output: Array [30,40,50]
```

### dict

當變數名稱和key名稱相同的時候，可以直接放入該變數即可

```js
const [key, v] = ["Name", 123]
const myDict = {key, v}  //  等價於 {"key": key, "v": v}
```

#### Set

在value和key值是相同的情況下，可以允許只寫key值就好

```js
const [title, date] = ['hello', '2021-01-20']
my_dict = {title, date}
// title: title, date: date
```

#### iterate

```js
const object = {'a': 1, 'b': 2, 'c' : 3};
for (const [key, value] of Object.entries(object)) {
  console.log(key, value);
}
```

#### 順序的問題

Key值會自動排序，

假設有以下列表:

```js
my_list = ['2021-09-01', '2021-08-01', '2020-07-01']

const result_dict = {]
my_list.forEach(date => {
    const [yy, mm, dd] = date.split('-')
    if (result_dict[yy] === undefined) {
        resuld[yy] = {}
    }
    if (result_dict[yy][mm] === undefined) {
        resuld[mm] = {}
    }
    result_dict[yy][mm].push('...')
})
```

依造邏輯進行，一開始會先送2021最後才是2020

但是他我們進行迭代的時候最先出來的資料反而是2020
```js
for ([year, dict_mm] of Object.entries(result_dict))
```
所以dict的key會自己排序，這點要小心。

#### [排序](https://stackoverflow.com/a/51725400/9935654)

開始前我們會用到[reduce]，所以先了解他一下
```js
arr.reduce(
    // 參數1是一個可呼叫的函數，此函數需要有兩個必要參數，和一個可選參數
    callback( accumulator, currentValue, [, index[, array]] )
    [, initialValue]  // 中括號表示可以省略，非必要參數
)
```

在瞭解後，我們看個實際例子

```js
const dict_test = {
  '2000': 'Articel1',
  '4000': 'Articel2',
  '1000': 'Articel3',
  '3000': 'Articel4',
};

console.log(Object.keys(dict_test))
const result = Object.keys(dict_test).sort().reduce(
    // 一開始的cur_value就是排序後的數值迭帶進來，然後acc是一個累加器，
    // 在一開始的時候會初始化，acc[cur_value] = dict_test[cur_value]完成之後把結果傳到``, acc``去
    // 所以acc這個字典才能越來越大
    (acc, cur_value) => (acc[cur_value] = dict_test[cur_value], acc)
    ,{} // initial value，這個要加上去才會回傳整個dict的數值
)
```

### string

format: 使用``${}``把變數涵蓋在內

```js
`<a href="${dict_info["link"]}">${dict_info["title"]}</a>`
```

### [Date](https://www.w3schools.com/jsref/jsref_obj_date.asp)

- Date().toLocaleDateString(): 轉換為2021/01/20

## Function

可以用箭頭函數來取代function，例如以下

```js
var id = 1
var foo = () => {
console.log(this.id)
}

function foo() {
 console.log(this.id)
}
```


## 參考資料

- [JavaScript Tester]
- [1.5万字概括ES6全部特性(已更新ES2020)](https://segmentfault.com/a/1190000020678240)


[線上測試]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce
[JavaScript Tester]: https://www.webtoolkitonline.com/javascript-tester.html
[MDN Web Docs-JavaScript]: https://developer.mozilla.org/en-US/docs/Web/JavaScript
[JSON.stringify()]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify
[JSON.parse()]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse
[reduce]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce
