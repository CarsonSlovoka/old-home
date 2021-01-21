+++
title = "golang基礎教學"
date = 2021-01-14T10:39:00+08:00
description = "golang安裝以及基礎教學"
tags = ["golang"]
bootstrap = true
markmap = true
toc_markmap = true
toc_bootstrap = true
+++

## 下載

> 請參考: [套件安裝-常用安裝項目-golang]({{< ref "/os/windows/package_manager#一些常用的安裝項目" >}})

## IDE

要先完成[下載]({{< ref "#下載" >}})

### [Neovim](https://github.com/fatih/vim-go)

如果您用的是Neovim使用的安裝方式應該為[vim-plug]

> Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

完成之後使用指令:

> :GoInstallBinaries

他會開始幫你裝很多東西，這些指令等同您直接用``go get``是一樣的意思，只是他幫你統一包裝好，省的您去``go get``很多東西

以下就是他會幫您裝上的東西:

{{< table/bootstrap-table >}}

| @@w=10em@@名稱 | 安裝指令 | 安裝到哪裡去 |
| -------- | ---- | ---- |
guru | ``golang.org/x/tools/cmd/guru@master`` | ``%userprofile%\go\bin``
gopls | ``golang.org/x/tools/gopls@latest`` | ``%userprofile%\go\bin\``
fillstruct | ``github.com/davidrjenni/reftools/cmd/fillstruct@mater`` | ``%userprofile%\go\bin``
godef | ``github.com/rogpeppe/godef@master`` | ``%userprofile%\go\bin``
motion | ``github.com/fatih/motion@master`` | ``%userprofile%\go\bin``
errcheck | ``github.com/kisielk/errcheck@master`` | ``%userprofile%\go\bin``
dlv | ``github.com/go-delve/delve/cmd/dlv@master`` | ``%userprofile%\go\bin``
gorename | ``golang.org/x/tools/cmd/gorename@master`` | ``%userprofile%\go\bin``
iferr | ``github.com/koron/iferr@master`` | ``%userprofile%\go\bin``
golint | ``golang.org/x/lint/golint@master`` | ``%userprofile%\go\bin``
gotags | ``github.com/jstemmer/gotags@master`` | ``%userprofile%\go\bin``
impl  | ``github.com/josharian/impl@master`` | ``%userprofile%\go\bin``
goimports | ``golang.org/x/toolscmd/goimports@master`` | ``%userprofile%\go\bin``
golangci-lint | ``github.com/golangci/golangci-lint/cmd/golangci-lint@master`` | ``%userprofile%\go\bin``
gommodifytags | ``github.com/fatich/gomodifytags@master`` | ``%userprofile%\go\bin``
keyify | ``honnef.co/go/tools/cmd/keyify@master`` | ``%userprofile%\go\bin``
staticcheck | ``honnef.co/go/tools/cmd//staticcheck@latest`` | ``%userprofile%\go\bin``
asmfmt | ``github.com/klauspost/asmfmt@master`` | ``%userprofile%\go\bin``

{{< /table/bootstrap-table >}}

### [安裝 Go]

:point_up_2: 這是另外的參考資料有興趣可以看看(如果您不是windows的在看，是windows的造我上面的弄就好了)

## [教學]

### GOPATH

從 go 1.8 開始，GOPATH 環境變數現在有一個預設值，如果它沒有被設定，他的預設值在這些系統分別是這樣設定:

  - Unix: ``$HOME/go``
  - Windows``%USERPROFILE%/go``

以下我只談Windows的設定:

如果您要設定GOPATH，就建立一個新的環境變數，名稱為``GOPATH``

GOPATH可以允許多個目錄，用分隔號隔開即可(LINUX是冒號)

值得一提的是如果有多個GOPATH時，預設會將``go get``放在第一個目錄下

#### GOPATH結構

- src: 放原始碼(例如:.go, .c, .h, .s等)
- pkg: 編譯後產生的檔案(如: .a)
- bin: 編譯後產生出來的可執行檔案。
  > :orange_book: 可以考慮也把這個Path加入到環境變數之中，方便直接就用cmd來執行

## CLI命令

``go help xxx`` 查看幫助

### gofmt and go fmt

如果您本身是使用[fatih/vim-go]在保存文件的時候他就會把go的代碼給代碼自動格式化，所以基本上不用管他。

他的實現應該和以下的行為是類似的
```vim
augroup xxx
    au!
    au BufLeave *.go normal! mG
augroup END
```
以上的用法是指當離開副檔名為go的文件時，自動把該檔案加入倒mark為G的名稱之中

----

``gofmt``: 格式化。
``go fmt``: 等同 ``gofmt -l -w`` (-w會直接把格式化的結果寫到檔案去)

> :exclamation: golang的縮排預設是使用tab，這點我個人是不喜歡，不過既然人家的標準就已經這樣定，就遵守吧

.editorconfig

```
[*.go]
indent_style = tab
```

總之不管您是有哪個IDE，理論上都會有支持自動格式化的東西，尤其go又特別搞出一個fmt，代表他希望統一標準

所以，要不就是您自己需要手動設置一次之後就一勞永逸(JetBrains出版的[Goland.fmt](https://stackoverflow.com/a/33776710/9935654) )，不然就是他已經幫您設定好了，連動都不用


[vim-plug]: https://github.com/junegunn/vim-plug
[fatih/vim-go]: https://github.com/fatih/vim-go
[安裝 Go]: https://github.com/astaxie/build-web-application-with-golang/blob/master/zh-tw/01.1.md
[教學]: https://github.com/astaxie/build-web-application-with-golang/blob/master/zh-tw/preface.md
