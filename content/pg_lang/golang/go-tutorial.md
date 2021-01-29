+++
title = "golang基礎教學"
date = 2021-01-14T10:39:00+08:00
description = "golang安裝以及基礎教學"
tags = ["golang"]
bootstrap = true
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
    previous_page = ""
    next_page = "pg_lang/golang/go-oop"
    previous_section = ""
    next_section = ""
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


### 程式相關

#### go run, go install

> go run: 「編譯」+ 「執行」(本身需要是可執行的package才行)

> go install: 編譯成二進位執行檔 或 包存檔([.a]({{< ref "#``.a``" >}}))

- go run xxx.go  // 可以直接運行
- go run **--work** xxx.go
  > 加上--work會把他生成出來的東西(含執行檔)的資料夾告訴您，例如:

      WORK=C:\Users\xxx\AppData\Local\Temp\go-build284910950

#### 編譯

編譯並產生執行檔，此執行檔位於當前的工作目錄中
- go build  // compile packages and dependencies
- go build -o bin/main.exe src/main/main.go

  > :orange_book: 所有的路徑都是``相對於您的工作路徑``，如果目錄資料夾不存在會新增。

  > :orange_book: 忽略-o會直接在當前的路徑下產生與.go同名的執行檔

  > go build xxx.go

#### 正式的流程

- gosetup-root: ``GOROOT=C:\Go``
- gosetup-gopath: ``GOPATH=%userprofile%\go``
- build: ```%GOROOT%\bin\go.exe build -o %userprofile%\AppData\Local\Temp\___1go_build_hello_world_go.exe %userprofile%\go\src\tutorial\hello_world.go```
- run exe: ```%userprofile%\AppData\Local\Temp\___1go_build_hello_world_go.exe``

小節:

1. ``GOROOT``\: go.exe的路徑
2. ``GOPATH``\
3. ``go.exe -o output_exe_path  src_go_path``

    > 此步驟完成會把執行檔放到``output_exe_path``中
4. 執行打包出來的執行檔 (``output_exe_path``)

## Go程式執行順序

    go run *.go
    ├── 被執行的主包
    ├── 初始化所有被匯入的包 (執行init函數，init函數在一個檔案裡面可以有多個，但是會按造順序來執行)
    |  ├── 初始化所有被匯入的包 ( 遞迴定義 )
    |  ├── 初始化所有全域性變數
    |  └── INIt 函式以字母序被呼叫
    └── 初始化主包
    ├── 初始化所有全域性變數
    └── INIt 函式以字母序被呼叫

> :exclamation: 最需要記住的是， 每個包只初始化一次被匯入的包

## golang中的簡單函數介紹

### fmt.Print, Println, Printf 差異

{{< table/bootstrap-table >}}

他們全部都是輸出結果

| @@w=10em@@名稱 | 細節 |
| -------- | ---- |
Print | 沒有換行
Println | 會換行 (等同 Print(xxx\n)
Printf | 可以格式化字串

{{< /table/bootstrap-table >}}

## go packages

官方的文檔其實不錯，可以直接到官方文檔查看: [go packages]

## Go的關鍵字

總共有25個

    break    default      func    interface    select
    case     defer        go      map          struct
    chan     else         goto    package      switch
    const    fallthrough  if      range        type
    continue for          import  return       var

- fallthrough\: 用來在switch case中繼續向下執行


## 附檔名介紹

- {{< auto-id "``.a``" >}}(package **a**rchive):

  在您的package中只要不是``main``，

  在執行完``go install <Package(專案資料夾(相對於gopath)路徑)>``

  > :orange_book: 所謂的 package就是``%gopath%/src``下的第一層子目錄

  他會生成在``%GOPATH%/pkg/<OS_Arch>`` (例如: ``%GOPATH%/pkg/windows_amd64``)

  > :exclamation: 要打包到``%GOPATH%/pkg/<OS_Arch>``須滿足兩點
  >
  > 1. 有其他檔案他不是``package main``
  > 2. 在此package中**沒有任何一個**檔案中有main的宣告

  這種package我們稱之為「應用包」。主要用來讓執行包來導入，節省再編譯的時間

- ``.exe``: 可執行包(package)


## 安裝godoc

go doc和godoc是不同的東西

``go doc``把東西印在console上，很醜，大概也沒幾個人願意這樣看

``godoc``可以向網頁一樣顯示文件資訊

但從go 1.12之後godoc移除不再是您安裝完go就自帶的執行檔，

但是您還是可以套過

> go get -u -v golang.org/x/tools/cmd/godoc

- ``-u`` 更新 連同 相依套件也會一併更新  (一般的go get只會抓取遺失的檔案並不會去更新，所以要更新就用-u)
- ``-v`` 會顯示詳細資料(安裝下載的過程，會在console告訴您，我個人是建議加上)

來獲取。

接下來

> godoc -http=127.0.0.1:6060 -play
>
> *(play是可以利用它當作編輯器也能運行，測試用的)*

或

> godoc -http=:6060 -play
>
> *(埠號不一定要6060看您高興)*

或更省，直接

> godoc
>
> *預設埠號是6060*

您就可以直接看官方的文檔的離線版本，但看官方文件除非沒網路，不然直接去官網看就好了:laughing:


我們有興趣的其實是看自己的文件

> godoc -goroot=C:\Users\xxx\go\
>
> *(放您gopath的路徑)*

然後您就可以上

> http://127.0.0.1:6060/

看到自己的文檔了

> :exclamation: 他產生的文檔不包含``package main``的檔案

> :orange_book: godoc還可以對外公佈，所以不是只有自爽而已，有時間我會再補

## go get & go clean

- ``go get -u -v`` golang.org/x/tools/cmd/godoc
  - ``-u`` 更新 連同 相依套件也會一併更新  (一般的go get只會抓取遺失的檔案並不會去更新，所以要更新就用-u)
  - ``-v`` 顯示詳細資訊

  範例:
    > require github.com/stretchr/testify v1.7.0
    指定版本
    > go get github.com/stretchr/testify@v1.7.0

- ``go clean -i -n``  golang.org/x/tools/cmd/godoc
    - ``-i`` 移除二進位的執行檔
    - ``-n`` 不會真的移除讓您知道有那些東西會被移除


## 參考資料

- https://www.mdeditor.tw/pl/2J1M/zh-tw

[vim-plug]: https://github.com/junegunn/vim-plug
[fatih/vim-go]: https://github.com/fatih/vim-go
[安裝 Go]: https://github.com/astaxie/build-web-application-with-golang/blob/master/zh-tw/01.1.md
[教學]: https://github.com/astaxie/build-web-application-with-golang/blob/master/zh-tw/preface.md
[go packages]: https://golang.org/pkg/
