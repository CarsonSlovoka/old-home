+++
title = "Go Build"
description=""
date = 2021-03-18T14:49:03+08:00
lastmod = 2021-03-18
featured_image = ""
draft = false
weight = 0
tags = ["exe", "go"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = ""
  next_page = ""
  previous_section = ""
  next_section = ""
+++


## 不顯示console視窗的方法

利用選項: ``-ldflags -H=windowsgui``

> ``go build -ldflags -H=windowsgui``

## 如何為您的程式加上詳細內容

這邊一共會教您兩樣東西

1. [manifest] : 可以幫助您設定icon
2. [VersionInfo] : 可以設定詳細資訊

    主要是依靠 [ResourceHacker] 其實透過他也能設定icon

如果您只要擺上icon，不想要詳細資訊只要參考 [manifest] 即可。

### [manifest]

#### Part 1: 建立manifest檔案

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0">
    <assemblyIdentity
        version="0.0.0.0"
        processorArchitecture="*"
        name="SOME FUNKY NAME HERE"
        type="win32"
    />  <!-- processorArchitecture: x64, x86 -->
    <dependency>
        <dependentAssembly>
            <assemblyIdentity
                type="win32"
                name="Microsoft.Windows.Common-Controls"
                version="6.0.0.0"
                processorArchitecture="*"
                publicKeyToken="6595b64144ccf1df"
                language="*"
            /> <!-- processorArchitecture: amd64, x86, ia64 -->
        </dependentAssembly>
    </dependency>
</assembly>
```

#### Part 2: 安裝rsrc

> ``go install github.com/akavel/rsrc@latest``

(我的版本: ``github.com/akavel/rsrc v0.10.2``)

完成之後會看到: rsrc.exe

> ``%gopath%/bin/rsrc.exe``

#### Part 3: 準備icon (可選)

您可以上 [fontawesome](https://fontawesome.com) 搜尋SVG

引入他的CSS，然後修改為顏色例如

> ``"<i class='fab fa-slideshare' style='color: #f783ac'></i>"``

之後把SVG轉PNG再用PNG轉ICO即可

#### Part 4: 利用 rsrc.exe 產生 syso檔案

建立一個 字尾為 ``.manifest`` 的檔案, 本示例使用 ``app.manifest``

輸出要是 字尾為 ``.syso`` 的檔案

ico可以不給，看您

> rsrc -manifest app.manifest -o app.syso -ico app.ico

syso-build.bat
```bat
@echo off
rsrc.exe -manifest app.manifest -o app.syso -ico app.ico
pause > nul
```

輸出是一個``syso``的檔案

#### Part 5: go build

將syso檔案放到和您的``主程式.go``同資料夾的位置，執行go build就可以了

### [VersionInfo]

#### 簡介

以下是您可能會常看到的 ``Version.txt`` 的內容

```
# UTF-8
#
# For more details about fixed file info 'ffi' see:
# http://msdn.microsoft.com/en-us/library/ms646997.aspx
VSVersionInfo(
    ffi=FixedFileInfo(
        # filevers and prodvers should be always a tuple with four items: (1, 2, 3, 4)
        # Set not needed items to zero 0.
        filevers=(0, 0, 0, 20210319),
        prodvers=(0, 0, 0, 20210319),
        # Contains a bitmask that specifies the valid bits 'flags'r
        mask=0x3f,
        # Contains a bitmask that specifies the Boolean attributes of the file.
        flags=0x0,
        # The operating system for which this file was designed.
        # 0x4 - NT and there is no need to change it.
        OS=0x4,
        # The general type of file.
        # 0x1 - the file is an application.
        fileType=0x1,
        # The function of the file.
        # 0x0 - the function is not defined for this fileType
        subtype=0x0,
        # Creation date and time stamp.
        date=(0, 0)
    ),
    kids=[
        StringFileInfo(
            [
                StringTable(
                    u'040904B0',
                    [StringStruct(u'CompanyName', u'xxx Taiwan Inc'),
                     StringStruct(u'FileDescription', u''),
                     StringStruct(u'FileVersion', u'0.0.0.0'),
                     StringStruct(u'InternalName', u''),
                     StringStruct(u'LegalCopyright', u'Copyright xxx Taiwan Inc'),
                     StringStruct(u'OriginalFilename', u''),
                     StringStruct(u'ProductName', u''),
                     StringStruct(u'ProductVersion', u'0.0.0.0 (Carson)')])
            ]),
        # https://docs.microsoft.com/zh-tw/windows/desktop/menurc/varfileinfo-block
        # 1033=美國 1200=unicode
        VarFileInfo([VarStruct(u'Translation', [1033, 1200])])
    ]
)
```

我把一些參考連結取出

- [VSVersionInfo中的欄位定義](http://msdn.microsoft.com/en-us/library/ms646997.aspx)
- [VarFileInfo-語言代碼查詢](https://docs.microsoft.com/zh-tw/windows/desktop/menurc/varfileinfo-block)
    - LangID
        - 0x0404: Traditional Chinese
        - 0x0409: U.S. English
        - 0x0411: Japanese
    - charsetID
        - 1200: unicode
        - 950: Taiwan (Big5)
        - 932: Japan (Shift – JIS X-0208)

以上您稍微看過有個概念即可

#### 設定教學

##### Part 1: 準備 rc 檔案

複製以下的內容再稍微修改即可

**resource.rc**
```json
VS_VERSION_INFO VERSIONINFO
    FILEVERSION    0,0,0,0
    PRODUCTVERSION 0,0,0,0
{
    BLOCK "StringFileInfo"
    {
        BLOCK "040904b0"
        {
            VALUE "CompanyName",        "\0"
            VALUE "FileDescription",    "\0"
            VALUE "FileVersion",        "0.0.0.0\0"
            VALUE "LegalCopyright",     "© 2020 Carson. All rights reserved.\0"
            VALUE "OriginalFilename",   ".exe\0"
            VALUE "ProductName",        "\0"
            VALUE "ProductVersion",     "0.0.0.0\0"
        }
    }
    BLOCK "VarFileInfo"
    {
        VALUE "Translation", 0x0404, 1200
    }
}
```

##### Part 2: Compile res into rc files

batch檔案使用``^``可以換行

```bat
ResourceHacker.exe -open resources.rc -save resources.res ^
 -action compile -log CONSOLE
```

##### Part 3: Download ResourceHacker

> choco install reshack -y

詳請參考: [套件安裝-常用安裝項目-reshack]({{< ref "package_manager#一些常用的安裝項目" >}})

如果您要直接上官網下載也是可以

> [ResourceHacker]

只是我比較喜歡用套件管理工具，方便我知道我總共裝了什麼，要移植到新的電腦也方便

##### Part 3: 執行Batch檔案

```bat
ResourceHacker.exe -open %OUTPUT_EXE% -save %OUTPUT_EXE% ^
 -resource resources.res ^
 -action addoverwrite ^
 -mask VersionInf ^
 -log CONSOLE
```

如果您對於ResourceHacker的指令感到困惑，請務必參考:[Command Line Syntax](http://www.angusj.com/resourcehacker) (點進去搜尋**Command Line Syntax**就會看到，真的寫得很詳細)


### 總結Script

使用以下的腳本稍微做一點更改就可以幫您完成三個項目

1. 打包go
2. 為執行檔加上icon
3. 加上詳細資料


```bat
@echo off
SET OUTPUT_EXE=xxx.exe
cd ..
SET outputDir=%cd%     <-- 也就是您的package main go的檔案資料夾
cd %~dp0

echo. ==============
echo "manifest" to "syso"
rsrc.exe -manifest app.manifest -o app.syso -ico app.ico

echo. ==============
echo "resource.rc" to "resource.res"
ResourceHacker.exe -open resources.rc -save resources.res -action compile -log CONSOLE
move resources.res %outputDir%

echo. ==============
echo move "syso" to main.go dir
move app.syso %outputDir%


echo. ==============
echo go build
cd %outputDir%
go build -o %OUTPUT_EXE%

echo. ==============
echo VersionInf
REM http://www.angusj.com/resourcehacker/
ResourceHacker.exe -open %OUTPUT_EXE% -save %OUTPUT_EXE% -resource resources.res -action addoverwrite -mask VersionInf -log CONSOLE

cd %~dp0
echo ==============
echo done! && pause > nul
```

### FAQ

#### rsrc.exe' 不是內部或外部命令、可執行的程式或批次檔。

請確認您的系統變數可以搜的到這個檔案，

如果可以，請確認您的環境變數的設定

如果rsrc.exe是能在「系統變數」找到

那麼您只能以「系統管理員身份」來執行程式才可以知道這個執行檔的位置

一般的執行只會以「當前的使用者」去查看「使用者變數」，所以如果使用者變數沒有設定，就會導致它不知道這個執行檔的位子。

❗ 如果系統管理員身分來執行，則當前的工作目錄是``C:WINDOWS\System2\cmd.exe``，所以您可以考慮在一開始的時候就``cd %~dp0``先切換到腳本的目錄

## linking stage

> ``go build -ldflags "..."``

這連結階段，我們有辦法去對程式的變數再進行修改

例如

{{< table/code-by-example >}}


```bat {linenos=inline,hl_lines=[5]}
@echo off
SET VERSION=0.0.0
SET NAME=TEST
REM -ldflags "-X packageName.var1='value1' -X pack2.var2='val2'"``
go build -ldflags "-X main.__VERSION__='%VERSION%' -X main.__NAME__='%NAME%'"
pause > nul
```

透過:

> ``-ldflags "-X packageName.variable='val'``

語句可以去修改變數的數值，如果有多個數值也只要放置多個``-X``即可

@@NEW-COL@@

```go {linenos=inline,hl_lines=["8-9"]}
package main

import (
    "fmt"
)

var (
    __VERSION__ = "在編譯時決定"
    __NAME__ = ""
)

func main() {
    fmt.Printf("ProgName:%s\n", __NAME__)
    fmt.Printf("Version:%s\n", __VERSION__)
}
```

{{< /table/code-by-example >}}

這樣做可以不需要在程式指定變數的數值，可以由外部的檔案來決定，

但其實放程式中也是還好，通常程式都有一個單獨寫一堆變數的檔案，

有一種情形使用這種方法可能有用，那就是其實程式沒有更動，只有修改外部的資源檔案

那打包的人員不用在開程式，只要改一下外部的定義，重新編譯即可。

但我還是覺得沒太大的幫助😆



## 參考資料

- [GoVersionInfo](https://github.com/josephspurrier/goversioninfo)
- [Resource Hacker](http://www.angusj.com/resourcehacker/)
- [how-do-i-set-the-version-information-for-an-existing-exe-dll](https://stackoverflow.com/questions/284258/how-do-i-set-the-version-information-for-an-existing-exe-dll)


[manifest]: https://docs.microsoft.com/en-us/windows/win32/sbscs/application-manifests
[VersionInfo]: https://docs.microsoft.com/en-us/windows/win32/menurc/versioninfo-resource
[ResourceHacker]: http://www.angusj.com/resourcehacker/
