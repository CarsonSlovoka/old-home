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

## 線上測試

### MDN Web Docs

直接在[MDN Web Docs]的範例中刪除，打上您的範例就可以線上測試了。

### [Plunker/plnkr](https://plnkr.co/)

我覺得很棒，裡面有很多範例可以參考，也可以編輯，同時也提供線上運行。

可以逛逛，有機會挖到寶😎

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

#### [splice (insert)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice)

語法
> splice(start, deleteCount, item1, item2, itemN)

```js
const months = ['Jan', 'March', 'April', 'June'];
months.splice(1, 2, 'Feb');
```

這是把Feb插入到index 1之後的結果
> 'Jan', ``'Feb'``, 'March', 'April', 'June'

而deleteCount為2所以從index 1之後的**2**個元素要刪除

> 'Jan', ``'Feb'``, ~~'March', 'April'~~ 'June'

得到最後結果

> 'Jan', ``'Feb'``, 'June'

這種效率很好，它不是重新產生新的陣列，而是在原本的陣列進行異動

### dict & Object

當變數名稱和key名稱相同的時候，可以直接放入該變數即可

```js
const [key, v] = ["Name", 123]
const myDict = {key, v}  //  等價於 {"key": key, "v": v}
```

#### Object.assign enumerate

```js
console.log(Object.assign({}, ["a", "b"]))
// > Object { 0: "a", 1: "b" }
````

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

const result_dict = {}
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

一些簡單的例子，求Array的加總:

```js
myArray = [1,3,5]
myArray.reduce((a,b)=>a+b, 4) // 4(初始值) + 1 + 3 + 5 = 13

myArray.reduce((a,b)=>{
    // console.log(`${a}!!`)
    console.log(a+b) // 第一輪他用初始值(0)當作a，然後用array的第一個元素當作b，因此第一輪是0+1 = 1
                     // 第二輪的a，為前一輪的結果，所以為4，而它的b為第二個元素(3) 所以打印7
                     // ... 依此類推
    return 4
}, 0)
// 最後結果很簡單一定是4

myArray.reduce((a, b)=>{}, []) // 初始值也可以是object，不限定只能數字
```

> Note: reduce如果省略初始值，第一輪的a和b會設置成array的第一個和第二個元素。

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

## [querySelector](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector)

```js
var el = document.querySelector("div.user-panel.main input[name='login']")
```

## async

```js
async function a(){
  await b();
  ...       // 等 b() 完成後才會執行
  await c();
  ...       // 等 c() 完成後才會執行
  await new Promise(resolve=>{
    ...
  });
  ...       // 上方的 promise 完成後才會執行
}
a();
a().then(()=>{
  ...       // 等 a() 完成後接著執行
}).catch(err => {
    //return false;
});
```


## Promise

當您拿到一個Promise的時候，代表在未來中這個 Promise 可能會有幾種狀況發生

1. 承諾 被兌現 (fulfilled)
    用 ``resolve()`` 來兌現

2. 承諾 被打破 (rejected)

    用 ``reject()`` 來表示失敗

3. 承諾 一直沒有回應 (pending)

    一直沒有回傳

而根據以上三種結果，我們有分別不同的處理動作

1. 承諾被兌現``resolve()``就繼續做下一下事 ``.then()``
2. ``reject()``使用``.catch()``去承接
3. 一直等待

Promise 可以帶入一個函式，代表著要給予承諾的函式

其中這個函式會被Promise傳入兩個參數(本身也是函數)，

分別為:

- ``fulfilled``我們通常用``resolve``命名
- ``rejected``

```js
var a = new Promise(function(resolve, reject) {
			// sync or async codes
  			// if success, resolve
  			// if fail, reject
		});
```

### Promise 一直沒有回應 (pending)

當我們並沒有成功 resolve 或是 reject 的時候，就會 pending，也就是說 .then 內的程式會一直等待，而 .catch 也不會抓到任何錯誤。

```js
var a = new Promise(function(resolve, reject) {})

console.log(a) // Promise {<pending>}
```

### 其他範例

```js
const newPromise = new Promise((resolve, reject)=>{
    setTimeout(()=>{resolve('changed')}, 3000)
}).then((data)=>{
    console.log(data)  // 'changed'
    return 'last changed' // resolve本身還是可以接受回傳值，這個回傳直會繼續往下傳遞
}).then((data)=>{
    console.log(data)  // 'last changed'
    throw new Error('Something failed')
}).catch(err => {
    console.log(err)
})
```

```js
async function foo() {
  try {
    let result = await doSomething();
    let newResult = await doSomethingElse(result);
    let finalResult = await doThirdThing(newResult);
    console.log(`Got the final result: ${finalResult}`);
  } catch(error) {
    failureCallback(error);
  }
}
```

#### [Awaiting a promise to be fulfilled](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/await#awaiting_a_promise_to_be_fulfilled)

If a ``Promise`` is passed to an ``await`` expression,

it waits for the ``Promise`` to be fulfilled and returns the ``fulfilled``{{< sup ``resolve`` >}} value.

```js
function resolveAfter2Seconds(x) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(x);
    }, 2000);
  });
}

async function f1() {
  var x = await resolveAfter2Seconds(10); // ``Promise`` is passed to an ``await``
  console.log(x); // 10
}

f1();
```

#### [讀取檔案內容](https://stackoverflow.com/a/67513624/9935654)

```js
export async function ReadFile(file) {
    return await file.text()
    /*
    const reader = new FileReader()
    reader.onload = (event) => {
      return event.target.result
    }
    reader.readAsText(file)
     */
}

const selectedFile = document.getElementById('uploadFile').files[0] // https://developer.mozilla.org/en-US/docs/Web/API/File/Using_files_from_web_applications
const promise = new Promise(resolve => {
  const fileContent = ReadFile(selectedFile) // 因為讀取是異步的，所以我們必須借用Promise來確保真的讀取完了
  resolve(fileContent)
})

promise.then(fileContent => {
  console.log(fileContent)
})
```

## regex

```js
regex = new RegExp(".*", "gm")
"test".match(regex)

"test".match(/.*/gm)
```

注意以下這種寫法可能會有問題，exec會消耗掉前面的regex，所以第二次就可能會出錯
```js
const regex = /(\[(?<fieldName>.*): (?<valString>.*),?)\]/gm
const filterObj = {}
for (const curColSelectString of items) {
    const { groups: { fieldName, valString } } = regex.exec(`${curColSelectString}`)
    filterObj[fieldName] = valString.split(",").map(e=>e.trim())
}
```

可以改成

```js
const { groups: { fieldName, valString } } = /(\[(?<fieldName>.*): (?<valString>.*),?)\]/gm.exec(`${curColSelectString}`)
```

### [Named capturing groups](https://stackoverflow.com/a/5367407/9935654)

```js
const auth = 'Bearer AUTHORIZATION_TOKEN'
const { groups: { token } } = /Bearer (?<token>[^ $]*)/gm.exec(auth)
console.log(token) // "Prints AUTHORIZATION_TOKEN"
```

## [addEventListener](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)

他有三種型態 (不考慮firefox)

```js
target.addEventListener(type, listener);
target.addEventListener(type, listener, options);
target.addEventListener(type, listener, useCapture);
```

其中listener是一個function

而比較疑惑的會是`options` 以及 `useCapture`

- `options`: 是一個Object。共有

    ```js
    {
        capture = false, // 這個和useCapture是一樣的，請參考useCapture
        once= false // 是否指運行一次
        passive = false, // 如果是true，則這個listener將不會執行preventDefault，換言之它一定會執行預設的行為(例如你按下Enter會主動提交、按下超連結等等之類的)
        single = AbortController() // 如果你想在某些情況有辦法取消掉這個event時，這個參數就對你有用
    }
    ```

  預設都是false，single是一個AbortController，幹嘛用的？

  用法

    ```js
    const controller = new AbortController()
    document.addEventListener("scroll", () => {
      // ...
    }, {
      signal: controller.signal,
      once: false
    })

    if ("cond") {
        controller.abort() // 當abort被觸發，他就會把含有他的event給取消掉 // The listener will be removed when the given AbortSignal’s abort() method is called.
    }
    ```

  以上的範例可以想成，你可以做一個scroll的時候就顯示導欄列，但你可能會想讓這個功能是否啟用，交由使用者來決定，這時候如果使用者決定停用，你就可以讓它運行`controller.abort()`即可


- `useCapture`

    ```js
    addEventListener("click", () => {
    }, false)
    ```

根據[Introduced in DOM Level 2](https://www.w3.org/TR/DOM-Level-2-Events/events.html#Events-interface)

你可以看到它定義PhaseType有三種
```
 // PhaseType
const unsigned short      CAPTURING_PHASE                = 1;
const unsigned short      AT_TARGET                      = 2;
const unsigned short      BUBBLING_PHASE                 = 3;
```

這是什麼？

- 從父元素 => target: 這個階段為CAPTURING_PHASE
- 在target本身 => AT_TARGET
- 從target => 父元素: BUBBLING_PHASE

當你定義一個event，你會有一個target的元素，而這個target的元素，有可能有父元素。

當子元素被觸發，父元素也會被觸發，這時候誰先執行就是看CAPTURING來決定

- 當為true時執行的順序依次為父到子 (上層的結果會優先執行)
- 反之為false，就由子到父。而這也是預設的行為。

一般來說如果你的event沒有很複雜，甚至就只是單純檢查一個click等等基本上不需要管這個參數，不寫讓他為false即可


## 參考資料

- [web.dev: promises](https://web.dev/promises/)
- [JavaScript Tester]
- [1.5万字概括ES6全部特性(已更新ES2020)](https://segmentfault.com/a/1190000020678240)
- [JavaScript Await 與 Async](https://wcc723.github.io/javascript/2017/12/30/javascript-async-await/)
- [使用 Promise 處理非同步](https://wcc723.github.io/javascript/2017/12/29/javascript-proimse/)
- ★我覺得寫得很棒！ 👉 [JavaScript - Promise (2)](https://ithelp.ithome.com.tw/articles/10197529)

[MDN Web Docs]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce
[JavaScript Tester]: https://www.webtoolkitonline.com/javascript-tester.html
[MDN Web Docs-JavaScript]: https://developer.mozilla.org/en-US/docs/Web/JavaScript
[JSON.stringify()]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify
[JSON.parse()]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse
[reduce]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce
