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
  previous_page = "pg_lang/golang/go-tutorial"
  next_page = ""
  previous_section = ""
  next_section = ""
+++

## 載入其他package

在開始前有兩個重要的環境變數要知道:

1. ``GOROOT``\: *C:\Go*
   > 或者說Go SDK [version] 如 Go SDK 1.15.7
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

:orange_book: 您可以有多個GOPATH，他會去抓您每一個GOPATH底下的src檔案

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

## 如何取得第三方套件


> go get "github.com/user-name/repository-name/"

您也可以

> ``go get -t`` "github.com/user-name/repository-name/package-name"

-t: 指令還會幫您測試，然後會把相依的套件(如其他用到的第三方套件)，一併下載

完成之後您的src底下會多出您下載的套件資料夾，例如:``github.com/user-name/repository-name/```

同時```%GOPATH%/bin``也會有東西跑出來
