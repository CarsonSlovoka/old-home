+++
title = "Golang OOP"
description=""
date = 2021-01-22T16:57:58+08:00
lastmod = 2021-01-22
featured_image = ""
draft = false
weight = 0
tags = []
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = "pg_lang/golang/golang-tutorial"
  next_page = ""
  previous_section = ""
  next_section = ""
+++

## 載入其他package

在開始前有兩個重要的環境變數要知道:

1. ``GOROOT``\: *C:\Go*
2. ``GOPATH``\: *%userprofile%\go*


假設我們這樣寫

```go
package main

import (
	"my_pgk_dir/sub/main_file"
)
```

那麼就是抓以下這份檔案:

> ```%GOPATH%/src```/my_pgk_dir/sub/main_file.go

> :orange_book: 當然您要放在:
>  > ``%GOROOT%/src``/my_pgk_dir/sub/main_file.go
>
> 也是可以，但是這通常是擺放go系統內建的檔案

```go
// main_file.go

package myf  // 您的實際檔案只要用myf他就知道namespace是這個檔案了

func Sqrt(x float64) float64 {
    z := 0.0
    for i := 0; i < 1000; i++ {
        z -= (z*z - x) / (2 * x)
    }
    return z
}
```

```go
package main

import (
	"my_pgk_dir/sub/main_file"  // 它裡面寫: package myf
)

func main() {
    myf.Sqrt(5)  // 所以這裡可以用myf就可以抓到該檔案了
}
```
