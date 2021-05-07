+++ title = "Golang Module"
description="教您如何管理模塊"
date = 2021-01-22T16:57:58+08:00
lastmod = 2021-04-29
featured_image = ""
draft = false
weight = 0
tags = ["golang"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
previous_page = "pg_lang/golang/go-tutorial"
next_page = "pg_lang/golang/go-publish2github"
previous_section = ""
next_section = ""
+++

## 前言

雖然標題叫做OOP但是您看完後可能會覺得關物件導向什麼事...

這是因為和當初計畫不同所導致...我本來想，要達成物件導向，至少要先會拆分模塊，當然也需要會管理第三方模塊

豈料，這些動作有些複雜，因此這個主題都圍繞在``go mod``之中...


## 載入其他package

### 初階

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

如果GO111MODULE非啟用，那麼就是抓以下這份檔案:

> ```%GOPATH%/src```/my_pgk_dir/sub/main_file.go

如果GO111MODULE=on時是抓

> %GOPATH%/pkg/mod

:orange_book: 您可以有多個GOPATH，他會去抓您每一個GOPATH底下的src檔案

> :orange_book: 當然您要放在:
>  > ``%GOROOT%/src``/my_pgk_dir/sub/main_file.go
>
> 也是可以，但是這通常是擺放go系統內建的檔案

```go
// main_file.go

package myf // 您的實際檔案只要用myf他就知道namespace是這個檔案了

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
    "my_pgk_dir/sub/main_file" // 它裡面寫: package myf
)

func main() {
    myf.Sqrt(5) // 所以這裡可以用myf就可以抓到該檔案了
}
```

#### 如何取得第三方套件

> go get "github.com/user-name/repository-name/"

您也可以

> ``go get -t`` "github.com/user-name/repository-name/package-name"

-t: 指令還會幫您測試，然後會把相依的套件(如其他用到的第三方套件)，一併下載

完成之後您的src底下會多出您下載的套件資料夾，例如:

> ``github.com/user-name/repository-name/``

同時``%GOPATH%/bin``也會有東西跑出來

### 進階

管理模組其實是很複雜的問題，如果您只是個人工作站，可能會說我要用哪一個就切換到哪一個``GOPATH``即可

但這樣的缺點是，您每換一個專案可能就要切換一次。

您可能還會說，``GOPATH``又不是一次只能限定放一個目錄，我可以``GOPATH=C://my_go;C://my_go2;...;``

對，這樣可以解決不需要再去切換目錄的問題，但是卻可能存在相依代碼``誰要先引入的``問題，

前面的會先加入沒問題，但重點不是了解誰先加入誰後加入，不管誰先加後加，都沒辦法讓``所有``您的專案都適用。

也因此go陸續推出了

- 官方

    - go 1.5前，完全依賴GOPATH
    - [go 1.5 vendor](https://golang.org/doc/go1.5)
    - [go 1.9 dep](https://golang.org/doc/go1.9)
    - [go 1.11 modules](https://golang.org/doc/go1.11), 簡稱mod

- 第三方

    - [glide]
    - [govendor]
    - [godep]

我們只會介紹從Go 1.11加入的[go mod] (前身是[vgo])。
(*因為其他的都已算非主流或過去式了*)

> :orange_book: 詳請可參考: [Go Release History](https://golang.org/doc/devel/release.html)

#### [go mod應用](https://blog.golang.org/using-go-modules)

1. go mod init ``github.com/username/my_project_name``
2. cd 到含有go.mod的資料夾中
3. ``go {install, test, build, mod download}`` 四擇一

   完成之後會產生相對應的require文件，例如

   > require github.com/shomali11/util v0.0.0-20200329021417-91c54758c87b
   >
4. ``go list -m all``:可以查看目前package用到那些相依的套件
   - ``go list -m -u all`` : 更新所有套件
5. ``go get``

    - 如果您所在的資料夾含有``go.mod`` go get下載回來的檔案是放在``%gopath%\pkg\mod\``之中
    - 如果不含``go.mod`` ge get下載的東西會放到``%gopath%\src\``中
6. ``go mod tidy``: 移除沒有用到的相依模塊 (也會更新``go.sum``)

    有模塊還會運用到其他的模塊，如果您只有運用到該模塊的一些功能，其實有很多相依的模塊都不需要，

    所以這個指令可以幫你刪除那些多餘的模塊

:point_up_2:以上是總結，如果有看懂就可以跳過，如果看不懂再往下看:point_down:

----

##### 初始化 go mod init

> go mod init 專案資料夾(相對於%gopath%)

假設您未來有意放到github去，那建議用``github.com/username/my_project_name``的方式，

> 不管您現在有沒有打算丟到github，我覺得還是用這種方式比較好，因為您用了此方式沒有損失，未來您想丟上去的時候不需要重新再更名，您可以有後悔的機會！

完成 ``go mod init 專案資料夾路徑`` 會在該專案資料夾下產生``go.mod``檔案

```
module github.com/username/my_project_name

go 1.15  // 您的go版本
```

##### go build | test | install

當您建立好``go.mod``檔案，

緊接著您可以使用，以下三種的其中一種

- go build

  預設把執行檔放在當前工作路徑中，您可以用-o來指定位置
  > go build -o bin/main.exe src/main/main.go

- go test
  > 會執行xxx_test.go的文件，
  > 文件中的func使用Test開頭
- go install
  > 創建執行檔在``%GOPATH%/bin``

完成之後，它會自動幫您找尋和下載「最新」(假設您沒有指定)版本，並下載到``%GOPATH%/pkg/mod/您的套件``資料夾中

並產生一個``go.sum``的檔案

如果您用go mod其實就不在需要像前面一樣利用[go get]({{< ref "#如何取得第三方套件">}})去取得檔案，

> :orange_book:
>
>   我自己在學的時候，對mod有相當大的困惑，因為我把它和go get的行為搞混
>
>   用go get會下載檔案到``gopath/src/該下載的包目錄``
>
>   今天有其他的go專案底下也用到此包目錄，但如果有兩個專案要分別用到此包不同版本的檔案時，用go get顯然會有衝突沒得選擇
>
>   也就是因為這樣有mod，mod把檔案下載到``%GOPATH%/pkg/mod/該package目錄``，而且很跩的是它還會區分版本
>
>   > 假設我用的是 ``import "github.com/shomali11/util/xconditions"``
>
>   他會載到
>
>   > ``%gopath%\pkg\mod\github.com\shomali11\util@v0.0.0-20200329021417-91c54758c87b``
>
>   後面那東西就是版本，當您有其他的專案用到不同版本的時候就能避免掉衝突
>
>   其實我卡的也不是我上面講的這些:laughing: 上面這些我在一開始都有弄懂，
>
>   我真正卡的是我沒有cd到go.mod的資料夾做事情:sweat_smile:
>
>   當您有go get的時候，不需要cd到您的目錄當然也可以成功
>
>   go install 可以選擇您的package的路徑，或者cd到您的資料夾go install your.go檔案
>
>   當您用了go mod然後把go get的項目砍掉，除非您已經在go.mod所在的工作目錄，不然他根本就不知道您的第三方檔案是在``%GOPATH%/pkg/mod/``中！
>
>   我其實會中這個坑還有被[jetbrains.golang IDE]({{<ref "#jetbrainsgolang-無法得知第三方路徑位置" >}})所害:triumph:



#### 更新專案 go get -u

``go get -u`` The -u flag instructs get to use the network to update the named packages and their dependencies
(or you can update a specific package via ``go get -u FULL_PACKAGE_NAME``


## Go範例區參考

- [物件導向寫法](https://github.com/astaxie/build-web-application-with-golang/blob/master/zh-tw/02.5.md)
- [Go Web Examples](https://gowebexamples.com/)
- [Go Getting Started](https://learn.go.dev/)
- [Go by Example](https://gobyexample.com/)


## jetbrains.golang 無法得知第三方路徑位置

您如果用go get的話，應該不會遇到這個問題，

go get造理講不應該再用到(當然go mod的套件要更新還是要套過go get，我指的不用到是您不應該在沒有使用go mod的情況下直接用go get)，

身為現代人的你應該使用go mod來幫助您

而在您``go mod init``之後會發現IDE整麼還是傻傻不知道第三方套件的位置

請參考:

1. [cannot resolve directory of all the import](https://intellij-support.jetbrains.com/hc/en-us/community/posts/360008537499/comments/360002425559)
2. [Introduce an environment variable in a project](https://www.jetbrains.com/help/go/create-a-project-with-go-modules-integration.html#environment-variables)

以上有興趣在自己看，我這邊當然會直接告訴您原因來節省您寶貴的時間:relaxed:

總之上面叫你把``Enable Go modules integration``這項打勾

> Settings → Go → Go Modules → Enable Go modules integration ☑

那勾與不勾的差異是什麼？

您會發現勾了之後在 ``Project → External Libraries``

會多了: ``Go Modules <your go mod xxx name>``

假設您的指令是go mod init **tutorial**

那會多了``Project → External Libraries → Go Modules <tutorial>`` 這項東西

如果沒有勾您在``Project → External Libraries`` 只會看到``Go SDK version``而已

勾了當然也能看到SDK的東西，例如

```
Project → External Libraries
           |---- Go Modules <tutorial>  <--勾了會多出這一項。 它的位置就是%GOPATH%/pkg/mod
           |          |
           |          |-- github.com/shomali11/util@v0.0.0-20200329021417-91c54758c87b
           |
           |
           |---- Go SDK 1.15.6
                      |
                      |----src
```

所以勾了IDE才能知道原來你的套件是放到``%GOPATH%/pkg/mod/...``中，也才能智能提示您該套件的用法

> :exclamation: 建議您如果要下go get的指令不要在ide的console進行，它可能都會認為您就是要在go.mod的資料夾下命令
>
> 例如：我們可能只想要取得godoc.exe並沒有要加到專案下

## go.sum是什麼？

您可以想像，當使用者從網站抓取檔案下來，如果檔案沒有checksum，那麼怎麼知道抓下來的內容，和自己期望的有沒有相同呢？

我指的是作者可能自己去修改這類的事情。

因此有checksum是很合理的事情，go.sum主要用途就是在確保您的go mod的版號，以及下載回來的東西，這包東西的checksum和go.sum是相符的

而go.sum的格式如下

> ``<module> <version> <hash>``

例如:

    github.com/shomali11/util v0.0.0-20200329021417-91c54758c87b h1:vtWV9/bCF2tgRxv1R/tEENMwJaR8bXNhUimLMSUMVXw=
    github.com/shomali11/util v0.0.0-20200329021417-91c54758c87b/go.mod h1:89COV+EXrLrwQBk6nTUtYS5qVvTa2R0UMWSvUpHaX0Y=

hash開頭用h1表示，

此外，每一個項目都會有兩個，

1. 紀錄本身
2. 紀錄當前依賴(go.mod)的checksum(還保留了歷史上每次的checksum)，

> :orange_book: 這邊談的歷史上的checksum，如果他的版控有用tag來記錄，就是用tag，不然每次commit就是會多一個


一般情況，如果您用知名的庫，不會遇到``go.sum``的衝突問題

比較可能會遇到的可能是需要更新go.sum

go.sum您不需要動，go.sum是跟著go.mod的檔案，

所以您只要確保您的go.mod正確，接著使用``tidy``，go.sum就會正確了

> ``go mod tidy``

## [pkg.go.dev]

這邊的資料是抓github的東西

當您從別人的專案fork回去，其實您在 [這邊](https://pkg.go.dev/) 就可以馬上搜到該份代碼

同時也意味著您已經可以在您的專案import該項目

舉例:

- pkg: [CarsonSlovoka/go-windows-programming](https://pkg.go.dev/github.com/CarsonSlovoka/go-windows-programming)
- [github](https://github.com/CarsonSlovoka/go-windows-programming/tree/ff0b400)

在github中如果您進行了新的commit，並且也已經送到了github上去

但您會發現

> go mod tidy

還是沒有更新成功

```
module xxx

go 1.16

require (
	github.com/CarsonSlovoka/go-windows-programming v0.0.0-20190526062745-ff0b400d8c7b
)
```

- v0.0.0-20190526062745-ff0b400d8c7b (後面是 日期|時間 - sha1前12碼)

您要通知pkg.go有更新，所以要利用``go get -u``指令

> go get -u github.com/CarsonSlovoka/go-windows-programming

接著您就會發現 [pkg.go.dev-go-windows-programming](https://pkg.go.dev/github.com/CarsonSlovoka/go-windows-programming?tab=versions) 已經更新了

總之所有您的github專案都可以透過go get -u 去發佈到 [pkg.go.dev]

然後通常他們會要求幾項東西:

Details

1. Valid go.mod file : 要有go.mod檔案
2. Redistributable license : 要添加license
3. Tagged version : 要用tag來標籤(通常是標籤在release的地方)
4. Stable version : 至少要達到v1才算穩定

## go.mod的版號

您可能會看到v2, v3, ...

在官方有建議兩種做法，如果您要發佈一個與前面不兼容的版本

1. 直接改go.mod，在後面直接補上主版號:

    ```
    module xxx/v2

    go 1.16

    require (

    )
    ```

2. 建立子資料夾:

    建立v2的資料夾，然後複製一份到v2裡面接著改... 個人不建議這種方式


## GO好用的指令

| Name | Desc  | Example  |
| ---- | ----  | ---- |
``go help <cmd>`` | 顯示幫助
``go env <OPTIONS>`` | 可以顯示環境變數，後面可以指定要顯示什麼 | go env GOPATH GOROOT
``go list -m -u all`` | 更新所有套件 |
``go list -m all`` | 顯示所有套件 |
``go get -u`` | 更新某套件
``go get -u -d`` | 更新某套件，但不執行任何動作，只要下載就好了
``go build -x -v`` | build並且顯示詳細資訊 |  -x: print the commands  -v: print the names of packages as they are compiled.


## GO特殊套件安裝

這些是比較難安裝的套件

| Name | Desc |
| ---- | ---- |
[![magefile/mage](https://github-readme-stats.vercel.app/api/pin?username=magefile&repo=mage)](https://github.com/magefile/mage) |
{{% github/st mattn go-sqlite3 %}} |



### magefile/mage

因為他要跑特殊的.go專案，所以預設用-d不要做任何動作下載就好

```
go get -u -d github.com/magefile/mage
cd %GOPATH%/src/github.com/magefile/mage 或 cd %GOPATH%/pkg/mod/github.com/magefile/mage
go run bootstrap.go
```

以上的作法您可能會遇到 .git 的錯誤訊息，我不曉得這麼做關 git 什麼事

您可以改直接抓專案的方式，我會推薦以下這種作法(至少對我來說是可行的)

```
git clone https://github.com/magefile/mage
cd mage
go run bootstrap.go
```

#### mage -init

> mage -init

會生成檔案

> magefile.go

> 📙 名稱不一定要是 magefile.go 但不建議改

#### mage -h

```
mage [options] [target]

Mage is a make-like command runner.  See https://magefile.org for full docs.

Commands:
  -clean    clean out old generated binaries from CACHE_DIR
  -compile <string>
            output a static binary to the given path
  -h        show this help
  -init     create a starting template if no mage files exist
  -l        list mage targets in this directory
  -version  show version info for the mage binary

Options:
  -d <string>
            directory to read magefiles from (default ".")
  -debug    turn on debug messages
  -f        force recreation of compiled magefile
  -goarch   sets the GOARCH for the binary created by -compile (default: current arch)
  -gocmd <string>
		    use the given go binary to compile the output (default: "go")
  -goos     sets the GOOS for the binary created by -compile (default: current OS)
  -h        show description of a target
  -keep     keep intermediate mage files around after running
  -t <string>
            timeout in duration parsable format (e.g. 5m30s)
  -v        show verbose output when running mage targets
  -w <string>
            working directory where magefiles will run (default -d value)
```

#### 如何使用

magefile.go
```go
// +build mage

package main

// ...
// Build hugo binary
func Hugo() error {
	return runWith(flagEnv(), goexe, "build", "-ldflags", ldflags, buildFlags(), "-tags", buildTags(), packageName)
}
```

> mage -v hugo

表示執行``Hugo()``的函數，指令中都用小寫

#### 錯誤訊息

> magefile.go doesn't match to target system. File will be ignored by build tool

這是因為go1.16不支持開頭的這種寫法

```
// +build mage
```

### mattn/go-sqlite3

- ``go get -u -d`` : 先只下載
- cd 過去 ( mod啟用的狀態下是在 ``GOPATH/pkg/mod/github.com/mattn/go-sqlite3`` )
- ``go build -v``: 完成之後會看到套件名稱 ``github.com/mattn/go-sqlite3``

一定要先這樣做，不能每一次專案都還會再重新編譯，可能光編譯就至少耗掉一分多鐘了...

完成了之後在執行您的專案，應該是秒執行😎



## 參考資料

- [go_84pdf](https://www.openmymind.net/assets/go/go.pdf)
- [go interface](https://github.com/astaxie/build-web-application-with-golang/blob/master/zh-tw/02.6.md)
- [gvm + go mod](https://medium.com/golang-%E7%AD%86%E8%A8%98/gvm-go-mod-492a54c15c41)
- [談談go.sum](https://studygolang.com/articles/25658)

[govendor]: https://github.com/kardianos/govendor
[godep]: https://github.com/tools/godep
[glide]: https://github.com/Masterminds/glide
[vgo]: https://github.com/golang/go/wiki/vgo#projects-related-to-vgo
[go mod]: https://blog.golang.org/using-go-modules
[pkg.go.dev]: https://pkg.go.dev
