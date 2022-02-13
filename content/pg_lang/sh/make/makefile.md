+++
title = "Makefile教學"
date = 2022-02-11T17:28:00+08:00
lastmod = 2022-02-13
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

### [IDE:jetbrains/goland](https://www.jetbrains.com/go/)

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

## GNU程式打包標準

> - https://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_14.html#SEC121
> - https://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_9.html#SEC85

以上是GNU[^GNU]程式建議該有的流程，您可以參考類似的模式去建立Label，所產生的項目就比較容易被大眾接受。


## 命令

> `Usage: make [options] [target]`


> If you do not use the `-f' or `--file' flag, the default is to try `GNUmakefile`, `makefile`, and `Makefile`

`-f`指令可以指定文件名，預設會用`GNUmakefile`, `makefile`, `Makefile`下去找尋，所以這些文件名都是建議的。

而如果您是用`GNUmakefile`，當然也建議您的LICENSE是GNU，不然就還是用makefile等相關就好了。

```
-n
--just-print
--dry-run
--recon
```

可以顯示那些命令將被執行

----

其他的命令可以直接查看幫助

`make -h`

## makefile內文

- 縮排建議用: `Tab`
- 如果不想要打印出cmd，要在命令前面加上`@`  (可以直接用make `-s` -s表示silent: Don't echo recipes.)

### 取得變量 Variable:

使用`${}`或者`$()`都可以得到變量
```
$(myVar)
${myVar}
```

### 賦值

有四種方法`=`,`?=`,`:=`,`+=`

```
immediate = deferred
immediate ?= deferred
immediate := immediate
immediate += deferred or immediate
```


#### `:=`

靜止: static。永不改變。 可以想成是copy value

```Makefile
x := foo
y := $(x) bar    // y的內容僅看當下該x的數值(之後的不管)
x := later

# x later
# y foo bar
```

#### `=`

遞迴: 以最後的為準。 或者可以想像成，此值的來源要參考其位址

```Makefile
x = foo
y = $(x) bar   // y的內容可能會隨著x而改變
x = later

# x later
# y later bar
```


#### `+=`

附加

+= 看成和 = 類似只是還有+的成分在裡頭

```
x += foo
y += $(x) bar
x += later

# x foo later
# y foo later bar
```


#### `?=`

條件: 若變數有定義就用該定義，沒有了話就使用該值

```
x ?= foo        // 因為一開始x沒有定義，所以x就會直接被設定成foo
y ?= $(x) bar   // 由於x已經有定義，所以就維持原樣foo，因此y= foo bar
x ?= later      // x已經有定義了，所以就用原本定義的，不改變。

# x foo
# y foo bar
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
#### wildcard

```
files := $(wildcard ./*.txt ./**/*.go */**/*.py))
```

包含:
- 表示選擇當前資料夾內的txt(首層而已)
- 首層內的下一層資料含有go的所有檔案
- 找尋所有資料夾(含子資料夾)的py檔案

#### Foreach

> `$(foreach var,list,text)`

```makefile
#宣告dirs是一個array，第一個元素為`.` 第二個元素為`pkg` 用來表示目錄
dirs := . pkg
# curDir是解析$(dirs)之後所得到的產物，後面的text又吃一個函數，這個函數可吃正規式
files := $(foreach curDir, $(dirs), $(wildcard $(curDir)/*))

main:
	echo $(files)

#   列出所有pkg/* 以及/*.go的檔案
	echo $(wildcard pkg/* ./*.go)
```

#### call

> `$(call variable,param,param,...)`

注意有`,`不是用空格

```
myFunc = \
	echo $(1)  && \
 	echo ${2}  && \
 	echo. \

test:
	$(call myFunc, Hello, world)
```

----

[刪除檔案](https://stackoverflow.com/a/71100371/9935654)
```
files := $(wildcard ./*.txt ./**/*.go */**/*.js )

showFileFunc = echo "$(abspath ${1})\${2}"
delFileFunc = del "$(abspath ${1})\${2}"
cmdSEP = &
targetDisplay:
$(foreach curFile, ${files}, ${call showFileFunc,${dir $(curFile)},${notdir $(curFile)}} ${cmdSEP})
targetDelete:
$(foreach curFile, ${files}, ${call delFileFunc,${dir $(curFile)},${notdir $(curFile)}} ${cmdSEP})
```



## 參考資料:

- [Creating a Golang Makefile](https://earthly.dev/blog/golang-makefile/)
- [Makefile大補丸](https://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/)
    > 可以從1看到make_19.html

    - [Conditional: if else](https://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_7.html)
    - [func (含內建函數)](https://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_8.html)


- [Wiki/Make](https://zh.wikipedia.org/wiki/Make)


[^GNU]: https://zh.wikipedia.org/wiki/GNU%E8%A8%88%E5%8A%83
