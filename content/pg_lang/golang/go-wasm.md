+++
title = "將go編譯成wasm檔案"
date = 2022-02-10T17:30:00+08:00
lastmod = 2022-02-10
description = "將go編譯成wasm檔案"
tags = ["golang", "go", "wasm"]
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


## [打包命令](https://github.com/golang/go/wiki/WebAssembly)

先查看您原先的環境變數配置

> go env GOOS GOARCH GOENV

- windows系統可能會看到的範例:

    - 作業系統: windows
    - 架構: amd64
    - env在哪一個資料夾 %userprofile%/AppData/Roaming/go
        > 這個的優先權低於系統變數

- linux: `GOOS=linux`
- osx: `GOOS=darwin`

設定成wasm的架構
> go env -w GOOS=js GOARCH=wasm


還原成windows的配置
> go env -w GOOS=windows GOARCH=amd64


> 建議您用 [Makefile]({{< ref "pg_lang/sh/make/makefile" >}}) 來幫忙

下載: [wasm_exec.js](https://github.com/golang/go/tree/252324e/misc/wasm)

index.html (您也可以參考: [go/misc/wasm/wasm_exec.html](https://github.com/golang/go/blob/252324e/misc/wasm/wasm_exec.html)
```html
<html>
	<head>
		<meta charset="utf-8"/>
		<script src="wasm_exec.js"></script>
		<script>
			const go = new Go();
			WebAssembly.instantiateStreaming(fetch("main.wasm"), go.importObject).then((result) => {
				go.run(result.instance);
			});
		</script>
	</head>
	<body></body>
</html>
```

## go:generate


`go generate`: 是Go所提供的工具之一，他可以查找Go文件中的magic comments(這裡指的是`//go:generate`)並且運行

另外go build不會執行go generate的內容，要由開發人員自己去手動執行`go generate`命令才可以，



### [運行指令](https://github.com/golang/go/blob/2580d0e/src/cmd/go/internal/generate/generate.go#L34)


執行命令
> `go generate [-run regexp] [-n] [-v] [-x] [build flags] [file.go... | packages]`

腳本內的敘述

> `//go:generate command arg1 arg2...`

command可以是可執行的內容，例如[yacc](https://zh.wikipedia.org/wiki/Yacc)


### 範例

```go
package main
import "fmt"

//go:generate echo hello
//go:generate go run main.go
//go:generate go version
func main() {
    fmt.Println("hello world")
}
```

執行`go generate -x`

可以取得以下結果
```
echo hello  // 這是-x的功勞，表示在執行命令的時候，也把命令顯示出來
hello
go run main.go
hello world
go version
go version go1.17.1 windows/amd64
```

其他範例

- [生成圖片](https://github.com/icza/golab/blob/55e5016/view/images.go#L16)
- [深入理解Go之generate](https://segmentfault.com/a/1190000020158429)


### 常用命令

| cmd | desc |
| ---- | ---- |
`go generate -n` | 顯示所有`將被`generate的文件
`go generate github.com/author/repo` | 對象為package中所有包含關鍵字的go文件


## Goland

如果您使用jetbrains/Goland當成IDE

當您

> import "syscall/js"

出現錯誤的時候，請記得設定成

- GOOS=js
- GOARCH=wasm

即可解決

## 參考資料

- https://github.com/icza/golab/tree/master
- https://github.com/golangbot/webassembly/blob/tutorial2/cmd/wasm/main.go
- https://blog.csdn.net/alai04/article/details/112259160
