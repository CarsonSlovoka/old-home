+++
title = "Go Test"
description="教您如何寫golang的測試"
date = 2021-03-10T10:59:27+08:00
lastmod = 2021-03-10
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
