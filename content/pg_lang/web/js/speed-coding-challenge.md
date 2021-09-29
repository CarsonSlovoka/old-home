+++
title = "speed coding challenge"
description="JS 線上競賽speed coding challenge"
date = 2021-09-29T11:10:00+08:00
lastmod = 2021-09-29
featured_image = ""
draft = false
weight=0
tags = ["js", "challenge"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
    previous_page = ""
    next_page = ""
    previous_section = ""
    next_section = ""
+++

## Speed Coding Challenge

類似

- [LeetCode](https://leetcode.com/)
- [LintCode](https://www.lintcode.com/)
- [hihoCoder](https://hihocoder.com/)

等等的網站，只是這個網站目前只接受javascript

基本上我覺得這些網站都蠻無聊的，你要找工作，人家要求你刷題在用的。

面試基本上要靠這種網站來評價一個人的素質，說實在我覺得很悲哀，

但這確實是一種方法(雖然不是最好)

好比不讀書未必就是笨，可能就是不想唸而已，不代表什麼，

以統計學來說，去名門貴校選材總比大海撈針的結果要好。

高手應該不屑刷題，頂多是抱持玩玩的心態...

那你如果能不刷題，就能行雲流水的解題，那才叫真的人材

## 題庫

我覺得這個網站，大多數的問題都很直白，使用者很容易只看數字的部分就能推敲出大概要問什麼。

但也有少數的題目出得不妥

1. 問羅馬數字的轉換(沒用過的人根本不曉得規則，題目的說明也說得不多)

```js
box = {}

/**
 * convert that HEX color code to RGB and return it as an array [R, G, B].
 * */
box.hexToRGB = (x) => {
    // x is a string
    // return an array
    // ex. x="#FFFFFF", you shuld return [255, 255, 255].

    // const R = parseInt(x.slice(1, 3), 16) // 即把FF轉為255

    // Number(255).toString(16) // "ff"

    return parseInt(x.slice(1, 3), 16), parseInt(x.slice(3, 5), 16), parseInt(x.slice(5, 7), 16)
}

box.rgbToHex = (r, g, b) => {
    // R: 11111111 (每個顏色都用8個bit來表示)

    const rgb = (r << 16) | (g << 8) | b
    console.log(rgb) // > 16715784
    // return '#' + (rgb).toString(16) // "#80c0"
    // return '#' + (0x000000 + rgb).toString(16)
    // return '#' + (0x1000000 + rgb).toString(16).slice(1)
    return '#' + rgb.toString(16).padStart(6, 0)
}
console.log(box.rgbToHex(0, 128, 192))
```

```js
box.multiplierCount = (x, y) => {
    // x and y are numbers
    // return a number
    // (ex. x=10, y=5, you should return 2)
    // (ex. x=11, y=2, you should return 5)
    return Math.floor(x / y)
}
```

```js
box.removeAllSpaces = (x) => {
    // x is a string
    // return a string
    // (ex. x="   Test   String! ", you should return "TestString!")
    return x.replaceAll(" ", "")
}
```

```js
/**
 If x is not a prime, then we can find "a" and "b" such that
 a**2 <= x <= b**2 , where a,b ∈ N+
 => a <= sqrt(x) <= b
 So check until the sqrt(x) its upper bound is enough.
 * */
box.isPrime = (x) => {
    // x is a number
    // return boolean
    // ex. x=11, you should return true because 11 is a prime number
    // 質數: 在大於1的正整數中，將該數字做質因數分解，其因數只有1和本身

    /* 解一，無腦，也沒考遇特殊情況 (1, 浮點數, 字串)
    for (const divisor=2; divisor < x; divisor++) {
        if (x % divisor === 0 ) {
            return false
        }
    }
    return true
     */

    if (!Number.isInteger(x)) return false

    if (x > 2 && x % 2 === 0) return false

    for (let divisor = 3; divisor <= Math.sqrt(x); ++divisor) {
        if (x % divisor === 0) return false
    }
    return x > 1
}
```

```js
/**
 * Given x is a string representing a Roman numeral,
 * convert Roman numerals to numbers.
 * Roman numerals are represented by seven different symbols: I, V, X, L, C, D, and M.
 * */
box.romanToInt = function romanToInt(x) {
    // x is a string; roman numeral
    // return a number
    // (ex. x="IV", you should return 4)

};
```

```js
/**
 Given password is a string, which consists of mixed characters (a-z, A-Z, 0-9), and x is an integer,
 hash the password by shifting every character by given x positions and reverse to lowercase/uppercase.

 x 是要增加的數值

 解題技巧: https://stackoverflow.com/a/9539389/9935654
 * */
box.hashPassword = (password, x) => {
    // password is a string, x is a number
    // return a string
    // (ex. password = 'ab1By', x = 3 so you should return "DE4eB")

    // 提示:
    // "ABC".charCodeAt(0) // returns 65
    // String.fromCharCode(65,66,67); // returns 'ABC'
    // ch = ch.charCodeAt() >= 65 && ch.charCodeAt() <= 90 ? ch.toLowerCase() : ch.toUpperCase() // 大變小、小變大(寫)

    /* 這樣寫有個問題 y 最後會轉成 "|" 題目的規則是y+3的過程是 z a b (再把b變大寫) 才變成最後的B
    return [...password].map(ch => {
        ch = String.fromCharCode((ch.charCodeAt(0) + x)) // 先轉成ascii的數字再相加之後再轉回來ascii的字串
        return ch.charCodeAt() >= 65 && ch.charCodeAt() <= 90 ? ch.toLowerCase() : ch.toUpperCase()
    }).join("")
     */

    /*
    [1, 2, 3, 4, 5] 初始index=0
    模擬在位子3 往後移 2 的情況 => 位子3是4往1個是最後再往後一個要回到開始所以是回到位置1。 3+2=>5
    (x+3) % len(5)  = 0 因此用這種取法可以快速得到，最後是哪一個位子
    測試: 2+6
    (2+6)%5=3 => 4 正確
     */


    // 待完成
    return [...password].map(ch => {
        if (isNaN(Number(ch))) {
            return ch + x
        }
        ch.charCodeAt()
        ch = ch.charCodeAt() >= 65 && ch.charCodeAt() <= 90 ? ch.toLowerCase() : ch.toUpperCase()
    })
}
```

```js
/**
 *
 * Given x is a string,
 * find the average of ASCII codes of all characters and round to the closest integer, then return the character representing that ASCII code.
 * */
box.averageAsciiChar = x => {
    // x is a string
    // return a character
    // (ex. x="Hello World!", you should return "Z")
    const asciiIndex = Math.round(
        [...x].reduce((a, b) => {
            return a + b.charCodeAt()
        }, 0) / x.length)
    return String.fromCharCode(asciiIndex)
}
```

```js
box.firstUniqueChar = function firstUniqueChar(x) {
    // x is a string
    // return a string
    // (ex. x="toptal", you should return "o" because "t" appeared twice)

};
```

```js
box.twoArrayAvg = (x, y) => {
    // x and y are arrays of numbers
    // return a number
    // (ex. x=[1,2,3],  y=[4,5,6], you should return 3.5)

    avg = (arr) => arr.reduce((a, b) => a + b) / arr.length
    return (avg(x) + avg(y)) / 2

    // // avg(x.concat(y)) // array合併之後再取平均
}
```

```js

/**
 * How many instances of string x are contained in y
 * */
box.charCountInString = (x, y) => {
    // x is a string of 1 character
    // y is a string
    // return a number
    // (ex. x='$', y="$he$llo$$$wo$rld", should return 6),
    return [...y].filter(e => e === x).length
}
```

```js
box.countUniqueNumbers = (x) => {
    // x is an array of numbers
    // return a number
    // (ex. x=[1,2,2,2,3,4,20,3] you should return 5 as we have 1,2,3,4,20)
    return [...new Set(x)].length
}
```

```js
/**
 * 物品出現次數和排序
 * 給定一個arr，先把他按照字幕的大小排序(由小到大)，之後計算個別的字元出現了幾次
 * */
box.numberRepresentation = (arr) => {
    // arr is an array
    // return a number
    // (ex. arr=[b,a,a,a,c,b,a] you should return 421 where 4 represents 'a' occurences, 2 for 'b', etc..)
    // [a,a,a,a,b,b,c] // 4a 2b 1c => 421
    // 排序看你要不要排，如果不排就是空間換時間

    // const arr = ["b", "a", "a", "a", "c", "b", "a"]
    const alphaSet = {}
    arr.forEach(e => {
        alphaSet[e] = alphaSet[e] === undefined ? 1 : alphaSet[e] + 1
    })
    const result = []
    for (const key of Object.keys(alphaSet).sort()) {
        result.push(alphaSet[key])
    }
    return Number(result.join(""))
}
```

```js
/**
 * 特定物品的價值
 * */
box.numberOfCircles = (x) => {
    // x is a number
    // return a number
    // 出現6, 9, 0 得一分 8得2分
    // (ex. x=1908, you should return 4)
    // (ex. x=9 you should return 1)
    // x = 1908
    // y = Array.from(x.toString()) // 輸出 Array ["1", "9", "0", "8"]

    return [...x.toString()].reduce((a, b) => {
        b = parseInt(b, 10) // 10近位
        if ([6, 9, 0].includes(b)) {
            return a + 1
        }
        if ([8].includes(b)) {
            return a + 2
        }
        return a
    }, 0)
}

box.numberOfCircles(1908) // 4
box.numberOfCircles(9) // 1
```

```js
/**
 * 反轉
 * 提示: 字串的字符塞到Array去，可以使用[...myString]=> [..."He"] => ["H", "e"]
 * */
box.reverseString = (x) => {
    // x is a string
    // return a string
    // (ex. x="Hello from Toptal", you should return "latpoT morf olleH")

    /* 解一: 先拆分，後反轉
    const arr = x.split(" ")
    const resultArr = arr.map(e => [...e].reverse().join(""))
    return resultArr.reverse().join(" ")
     */

    // 解二，直接順著做
    return [...x].reverse().join("")
}
box.reverseString("Hello from Toptal") // "latpoT morf olleH"
```

```js
box.matchingType = (x, y) => {
    // x and y are random types
    // return boolean
    // (ex. x = 7 and y = "Toptal", should return false),
    // (ex. x = 10 and y = 100, should return true),
    return typeof x === typeof y
}
```

```js
/**
 *  find the average of x and if tit is not a whole number, round it up.
 * */
box.findAverage = x => {
    // x is an array of numbers
    // return a number
    // (ex. x=[1,2,3,4] then you should return 4 because the average is 3.25)
    return Math.ceil(x.reduce((a, b) => a + b) / x.length)
}
```

```js
box.squareRoot = x => {
    // x is a number
    // return a number
    return Math.sqrt(x)
}
```

```js
box.cube = function cube (x) {
// x is a number
// return x cubed
// (ex. x=3, return 27)
  return Math.pow(x, 3)
}
```

Given x and y are strings,

a shift is taking the leftmost character in x and moving to the rightmost position.

Identify if x can become y after several shifts.
```js
box.isRotatedStr = function isRotatedStr(x, y) {
  // x and y are strings;
  // return boolean
  // (ex. x="vwxyz", y="xyzvw", you should return true because we when shifting v and w to the rightmost
  // it will match y)

};
```
