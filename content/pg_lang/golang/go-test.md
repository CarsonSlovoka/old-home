+++
title = "Go Test"
description="教您如何寫golang的測試"
date = 2021-03-10T10:59:27+08:00
lastmod = 2022-02-27
featured_image = ""
draft = false
weight = 0
tags = []
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = ""
  next_page = ""
  previous_section = ""
  next_section = ""
+++


## golang測試教學

通常我們會創建一個和您的package檔案同名的檔案名稱後面加上``_test``

例如:

    my_mod.go
    my_mod_test.go

測試的檔案名稱其實要怎麼取都無所謂，主要看的是裡面的內容，唯一的要求就是檔案的名稱結尾要是 ``_test`` ！

這是因為當您使用

> go test

他的規則就是執行所有``*_test.go``的檔案


## 範例

以下範例參考至: [shomali11/util/xconditions/](https://github.com/shomali11/util/tree/master/xconditions)

{{< table/code-by-example "xconditions.go" "xconditions_test.go" >}}

```go
package xconditions

// IfThen evaluates a condition, if true returns the parameters otherwise nil
func IfThen(condition bool, a interface{}) interface{} {
    if condition {
        return a
    }
    return nil
}
```

@@NEW-COL@@

```go
package xconditions

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

// 在您要測試的函數前面加上Test
func TestIfThen(t *testing.T) {
	assert.Equal(t, IfThen(1 == 1, "Yes"), "Yes")
	assert.Equal(t, IfThen(1 != 1, "Woo"), nil)
	assert.Equal(t, IfThen(1 < 2, "Less"), "Less")
}

// 要把檔案名稱也寫進去也是可以
//  p.s. 如果檔案名稱有「_」用空格取代掉，然後緊接後面的單字字首用大寫
//  (多個檔案都有這個包的時候會有用，但其實IDE已經很強大了，這個動作可以考慮省略)
func TestXconditions_IfThen(t *testing.T) {
    assert.Equal(t, IfThen(1 == 1, "Yes"), "Yes")
}
```

{{< /table/code-by-example >}}


完成之後cd到該資料夾，之後

> go test

即可執行測試


## go test指令


`go help test` 可以列出test的命令

```
go test [-c] [-i] [build flags] [packages] [flags for test binary]
...
```


其中`[flags for test binary]`又可以輸入那些東西可以再打上

> `go help testflag`

### testflag

以下列出我覺得比較有用的

| Name | Desc |
| ---- | ---- |
-bench regexp | 執行那些Benchmark的函數，例如`-bench=.`會執行所有benchmark的函數。`-bench=BenchmarkMy` 會執行所有BenchmarkMy開頭的函數
-benchtime t | 效能測試執行的時間，預設為1秒
-cover -coverprofile=myCover.log | 覆蓋率測試，這個很有用！
-failfast | 如果有錯誤產生，就不在往下執行
-parallel n | 並行的cpu數量，預設為`GOMAXPROCS`
-timeout d | d=0表示不啟用，預設為10 (10分鐘)，表示超過10分鐘就panic
-v | Verbose output，可以顯示顯示資訊
-outputdir | 預設為go test命令所在的資料夾


> `go test -cover -coverprofile=coverage.out`

完成之後會產生出coverage.out的檔案

這個檔案其實很簡單，格式大概長的如下

```
mode: set
github.com/CarsonSlovoka/myrepo/demo.go:22.66,23.11 1 1
github.com/CarsonSlovoka/myrepo/demo.go:36.2,36.48 1 1
github.com/CarsonSlovoka/myrepo/demo.go:39.2,39.12 1 0     <-- 最後面有0表示這個沒有覆蓋到，也就是程式沒有執行到
```


您可以在用

> `go tool cover -html=coverage.out`

他會瀏覽器開啟這份檔案，告訴你覆蓋率測試的結果

他會直接標示出SOURCE之中哪些有執行到(綠色)，哪些沒有執行到(紅色)，你就能知道要再補上那些測試


可以考慮使用這個批次檔，coverage.bat
```bat
@echo off
go test -cover -coverprofile=coverage.out
go tool cover -html=coverage.out
REM 完成之後把coverage.out檔案刪掉，理論上這個檔案沒有用處了，因為網頁上的元素會讀取這份檔案的內容直接寫在HTML之中，所以即便網頁重新整理也不會消失
del /f coverage.out
```

完成之後把coverage.out檔案刪掉，理論上這個檔案沒有用處了，

因為網頁上的元素會讀取這份檔案的內容直接寫在HTML之中，所以即便網頁重新整理也不會消失

該html是寫在TEMP資料夾

例如:

> %temp%/cover4038056132/coverage.html

cover後面會接一段流水號，而最後的coverage.html，就是您給的coverage.out的內容，名稱也可以換成您想要的。
