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

    return [parseInt(x.slice(1, 3), 16), parseInt(x.slice(3, 5), 16), parseInt(x.slice(5, 7), 16)]
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
box.romanToInt = x => {
    // x is a string; roman numeral
    // return a number
    // (ex. x="IV", you should return 4)
    const romanMap = {
        I: 1,
        V: 5,
        X: 10,
        L: 50,
        C: 100,
        D: 500,
        M: 1000,
    }

    const arr = [...x]

    if (x.length === 0) {
        return 0
    }

    if (!arr.every(e => Object.keys(romanMap).includes(e))) {
        throw new Error("Invalid roman string")
    }

    if (x.length === 1) {
        return romanMap[x]
    }

    if ((new Set(arr)).size === 1) { // a number repeat over 4 times.
        const arrLen = arr.length
        if (arrLen >= 4) {
            // Variant forms
            if (arrLen === 4 && x === "IIII") {
                return 4
            }
            switch (x) {
                case "IIIII":
                    return 5
                case "XXXXX":
                    return 50
                case "IIIIII":
                    return 6
                case "XXXXXX":
                    return 60
            }
            throw new Error(`You can't repeat the same character over three times.`)
        }
        return romanMap[arr[0]] * arr.length
    }

    let rNum = romanMap[arr[arr.length - 1]]
    let sum = rNum
    for (let i = arr.length - 2; i >= 0; --i) {
        const lNum = romanMap[arr[i]]
        if (lNum >= rNum) {
            sum += lNum
        } else {
            sum -= lNum
        }
        rNum = lNum
    }
    return sum
}
console.log(box.romanToInt("XIV"))  // 14
console.log(box.romanToInt("MCDXXXVII")) // 1437
console.log(box.romanToInt("CXCIX")) // 199
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

    // 循環有一個技巧，利用%就可以達到了，%原本Array的長度，如果該index小於，那不會有事，如果等於剛好就會跑到第一個元素去
    return [...password].map(ch => {
        if (!isNaN(Number(ch))) {
            // return Number(ch) + x // 只能0~9所以如果超過就要循環
            return (Number(ch) + x) % 10
        }
        const asciiUppercaseArray = Array.from([...Array(26).keys()], x => x + 65)
        const curIndex = asciiUppercaseArray.indexOf(ch.toUpperCase().charCodeAt())
        const newIndex = (curIndex + x) % 26
        switch (ch.charCodeAt(0) >= 65 && ch.charCodeAt(0) <= 90) {
            case true: // convert it from uppercase to lowercase
                return String.fromCharCode(newIndex + 97) // ascii 97 = a
            case false:
                return String.fromCharCode(newIndex + 65) // ascii 65 = A
        }
    }).join("")
}
console.log(box.hashPassword("ab1By", 3))
console.log(box.hashPassword("H4sh3D", 101)) // expected: "e5PE4a"
```

```js
/**
 *
 * Given x is a string,
 * find the average of ASCII codes of all characters and round to the closest integer, then return the character representing that ASCII code.
 *
 * 提示:
 [...x] 可以改成 Array.from代替。
 Array.from('foo') // ["f", "o", "o"]
 Array.from([1, 2, 3], x=>x+x) // [2, 4, 6] // 它可以接一個函數，類似map的效果
 * */
box.averageAsciiChar = x => {
    // x is a string
    // return a character
    // (ex. x="Hello World!", you should return "Z")

    // 解法: 把各個字符轉成ascii的數值相加之後取平均
    const asciiIndex = Math.round(
        [...x].reduce((a, b) => {
            return a + b.charCodeAt()
        }, 0) / x.length)
    return String.fromCharCode(asciiIndex)
}
```

```js
/**
 * find the first unique character in x
 * Return false if there isn't a unique characcter in x.
 * */
box.firstUniqueChar = x => {
    // x is a string
    // return a string
    // (ex. x="toptal", you should return "o" because "t" appeared twice)

    /* 這種解法有問題
    const arr = [...x]
    for (let i = 0; i < arr.length; ++i) {
        if (arr.filter(ch => ch === ch).length > 1) {
            return i + 1 < arr.length ? arr[i + 1] : false
        }
    }
    // firstUniqueChar("aabcbd") = "a" expected: "c"
    // firstUniqueChar("hello") = "e" expected: "h"
    // firstUniqueChar("aabcbd") = "a" expected: "c"
    // firstUniqueChar("holloh") = "o" expected: false
     */


    const counter = {}
    const set = [...new Set(x)]
    const arr = [...x]
    set.forEach(ch =>
        counter[ch] = arr.filter(e => e === ch).length
    )
    if (Object.values(counter).every(val => val > 1)) {
        return false
    }
    const oneArr = Object.entries(counter).map(([key, val]) => {
        return val === 1 ? key : undefined
    }).filter(e => e !== undefined)
    for (const ch of arr) {
        if (oneArr.includes(ch))
            return ch
    }
    return false
}
console.log(box.firstUniqueChar("toptal"))
console.log(box.firstUniqueChar("aabcbd"))
console.log(box.firstUniqueChar("hello"))
console.log(box.firstUniqueChar("aabcbd"))
console.log(box.firstUniqueChar("holloh"))
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
 * 給定一個arr，先把他按造字符的大小排序(由小到大)，之後計算各別的字元出現了幾次
 * */
box.numberRepresentation = (arr) => {
    // arr is an array
    // return a number
    // (ex. arr=[b,a,a,a,c,b,a] you should return 421 where 4 represents 'a' occurences, 2 for 'b', etc..)
    // [a,a,a,a,b,b,c] // 4a 2b 1c => 421

    // const arr = ["b", "a", "a", "a", "c", "b", "a"]

    /* 解一: 先計算各個字符出現了幾次，之後排序再印出打案
    const alphaSet = {}
    arr.forEach(e => {
        alphaSet[e] = alphaSet[e] === undefined ? 1 : alphaSet[e] + 1
    })
    const result = []
    for (const key of Object.keys(alphaSet).sort()) {
        result.push(alphaSet[key])
    }
    return Number(result.join(""))
     */

    // 解二，先排序, 4a 2b 1c=> 4*10^2 + 2*10^1 + 1*10^0 = 421
    const set = [...new Set(arr.sort())]
    let ratio = set.length - 1
    let answer = 0
    for (const ch of set) {
        answer += arr.filter(e => e === ch).length * Math.pow(10, ratio--)
    }
    return answer
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
box.cube = x => {
// x is a number
// return x cubed
// (ex. x=3, return 27)
    // return Math.pow(x, 3)
    return x * x * x
}
```
