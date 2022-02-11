+++
title = "Makefile教學"
date = 2022-02-11T17:28:00+08:00
lastmod = 2022-02-11
description = "Makefile快速入門"
tags = ["makefile"]
bootstrap = true
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
    previous_page = ""
    next_page = ""
    previous_section = ""
    next_section = ""
+++


## 前言

如果您是linux應該很熟悉Makefile，我這邊是專為windows的使用者所講，環境也是針對**windows**

## 安裝

> [choco install make]({{< ref "package_manager#一些常用的安裝項目" >}})

您也可以參考:
> [How to run a makefile in Windows?](https://stackoverflow.com/a/57042516/9935654)


### IDE: [jetbrains/goland](https://www.jetbrains.com/go/)

我自己是用這個IDE開發，

您可以下載Makefile的plugin

> [Makefile Language](https://plugins.jetbrains.com/plugin/9333-makefile-language)

完成之後在設定裡面搜尋 `make`

然後找到

```
▼ Build, Execution, Deployment
    ▼ Build Tools
        Make:
            Path to Make executable: 選擇您的 make.exe 的路徑: %programdata%\chocolatey\bin  (假設您用choco安裝，則應該和這個差不多)
```

做這個動作只是讓您可以直接用IDE來運行。如果您只需要突顯不打算靠IDE運行，則可以不管它

## makefile內文

- 縮排建議用: `Tab`
- 如果不想要打印出cmd，要在命令前面加上`@`

### 取得變量 Variable:

使用`${}`或者`$()`都可以得到變量
```
$(myVar)
${myVar}
```

### 賦值

使用`:=`和`=`都可以，

但他們還是有些微差異

`:=` 可以想成是copy value

```Makefile
x := foo
y := $(x) bar    // y的內容僅看當下該x的數值(之後的不管)
x := later

# x later
# y foo bar
```

`=` 想像成，此值的來源要參考其位址

```Makefile
x = foo
y = $(x) bar   // y的內容可能會隨著x而改變
x = later

# x later
# y later bar
```

### 範例

```Makefile
# 我是註解

# 多行註解(其實沒有)，但您可以善用換行符號 \
我也是註解，因為上面有未完「\」待續

# 縮排建議用tab，雖然後面的版本可以透過修改設定達到也能用space


# Detect system OS.
ifeq ($(OS),Windows_NT)
    detected_OS := Windows
else
    detected_OS := $(shell sh -c 'uname -s 2>/dev/null || echo not')
endif

# make 預設執行最先找到的標籤(也就是第一個標籤)

# make [...LABEL] 表示執行某標籤，以下範例表示執行init, main, end這三個標籤
all: init main end

init:
# label之後的註解也必須是在開頭，不能縮排
#   可以用這種方式，也就是#還是在開始，後面文字再縮排
	@go env -w GOOS=js GOARCH=wasm

main:
	@go env GOOS GOARCH
#   @go build -o main.wasm

end:
#   改回來
	@go env -w GOOS=windows GOARCH=amd64
	@go env GOOS GOARCH

```

## 參考資料:

- [Creating a Golang Makefile](https://earthly.dev/blog/golang-makefile/)
- [Makefile大補丸](https://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_6.html)
- [Wiki/Make](https://zh.wikipedia.org/wiki/Make)
