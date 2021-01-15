+++
title = "套件管理"
date = 2021-01-11T17:43:00+08:00
description = "安裝一些常用的套件"
tags = ["choco"]
draft = false
bootstrap = true
markmap = true
toc_markmap = true
toc_bootstrap = true
+++

## choco

### 安裝

1. install Chocolatey

    - ``Get-ExecutionPolicy -List`` 查看所有scope的ExecutionPolicy為何。記下來，弄完之後還原

        - ``Get-ExecutionPolicy``  (預設是察看Scope為Process的那個)

2. 至官網按造步驟下載: https://chocolatey.org/install
3. 打開powershell(用系統管理員身分開啟):
4. ``Set-ExecutionPolicy AllSigned -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) -Force``:

   > 打完指令按下Enter之後就開始下載
   >
   > 會先載到: ``%userprofile%/AppData/Local/Temp/chocolatey/chocInstall/chocolatey.zip``
   >
   > 然後裝到: ``%programdata%\chocolatey``
   >
   > 接著會把``%programdata%\chocolatey\bin``寫到環境變數去(所以在cmd打choco才會有作用)
   >
   > 弄完之後還原: ``Set-ExecutionPolicy Restricted -Scope Process -Force;``  表示更改``Scope``為``Process``的改為``Restricted`` (其中``-Force``不是必要的，如果沒加會再問一次是否要執行)


### 常用指令

打開cmd

- ``choco --version``
- ``choco list --localonly``  ( 或者 ``choco list --lo`` ``choco list -lo`` ``choco list -al``)

    可以列出當前local端裝了哪些東西，基本上這些套件都安裝在: ``%programdata%\chocolatey\lib`` 或者 ``%programdata%\chocolatey\lib-bad`` 中

    例如:[ctags]也可以從中安裝

- ``choco list [name]``: 他就只會列出該項名稱，名稱可以是模糊的

- ``choco upgrade chocolatey``: [更新chocolate](https://chocolatey.org/docs/commandsupgrade)的應用程序
- ``cup all`` 等同 ``choco upgrade all``: 可以更新所有套件

如果您不清楚指令，可以用: ``choco -?`` 這一招幫您解所有東西，例如:

    choco -?
    choco upgrade -?
    choco upgrade all
    choco install -?
    choco uninstall -?
    choco list -?

choco install 通常都會跟您說去網上的哪裡(``from``)下載，以及把下載包放到哪裡 (``Completed download of %localappdata%/Temp/chocolatey/pdftk/2.02/pdf....win-setup.exe (3.52MB)``

最後完成還會跟你說該套件安裝在哪邊: **Software installed to** ``'C:\Program Files (x86)\PDFtk\'``

- choco log位置: ``%ProgramData%\chocolatey\logs\chocolatey.log``

choco安裝的套件如果是安裝的檔案也能在``新增移除``找到，如果是zip的版本就找不到，

但不管是哪一種，都能透過choco來管理。


## 一些常用的安裝項目

{{< table/bootstrap-table scrollable=true >}}

| @@w=5em@@名稱 | 安裝指令 | 安裝到哪裡去 | 描述 |
| -------- | ---- | ---- | ---- |
| curl     |  ``choco install curl`` |  ``%programdata%\chocolatey\lib\curl\tools`` |  驗證: curl --version\n它可以透過cmd來做一些``Get``, ``Post``等等的操作，作為測試這個工具很棒
| neovim   | ``choco install neovim --pre``\n(意思是(pre-release) | ``C:\tools\neovim\Neovim\bin`` | 注意neovim裡面也有一個``curl``要用的時候要自己區分一下！
| ~~pdftk~~| ``choco install pdftk`` | ``%PROGRAMFILES(X86)%\PDFtk\``\n這個不建議安裝!
| jre      | ``choco install javaruntime`` | ● ``%PROGRAMFILES%\Java\jre1.8.0_271``\n● ``%PROGRAMFILES(X86)%\Java\jre1.8.0_271`` | 他會裝兩個版本
| protoc   | ``choco install protoc --pre -y``\n(y會確認執行，不會再問你)| ``%programdata%\chocolatey\lib\protoc\tools`` | [protobuf_google] [protobuf_github]
| hugo     | ● ``choco install hugo -y``\n● ``choco install hugo-extended -confirm``\n(裝``hugo-extended``才可以進行Sass/SCSS的操作) | ● ``%programdata%\chocolatey\lib\hugo\tools``\n● ``%programdata%\chocolatey\lib\hugo-extended\tools`` | 這可以做靜態網頁，類似[Jekyll]
| git      | ``choco install git -y`` | ``%programfiles%\Git`` | 執行檔位置：\n ``%programfiles%\Git\bit\git.exe``\n您也可以在新增移除中找到 | 版本管理工具 (:exclamation: 當您的版本不是最新的，有可能您在執行git等等相關的操作會出現錯誤(可能說你帳密不正確等等)
| [sass]   | ``choco install sass -y`` | ● ``C:\tools\dart-sdk``\n● ``%programdata%\chocolatey\lib\sass\bin\sass.exe``\n他需要用到dart-sdk還有sass所以需要裝兩個東西 | 使用方法:\n● ``sass input.scss:output.css``\n● ``sass --watch input.scss:output.css --style compressed``\n加上 ``watch`` 可以監測使得檔案異動就自動更新 ``compressed`` 可以壓縮，以一行解決\n● ``sass input.scss:output.css --style compressed --no-source-map``\n不產生``.css.map``檔案\n● ``sass --help``
| golang   | ``choco install golang -y``| ``C:\Go\bin\go.exe`` | 安裝完之後: ``go version`` 確認有無安裝成功

[protobuf_google]: https://developers.google.com/protocol-buffers/docs/overview
[protobuf_github]: https://github.com/protocolbuffers/protobuf
[Jekyll]: https://jekyllrb.com/
[sass]: https://chocolatey.org/packages/sass#install
{{< /table/bootstrap-table >}}

## 如何查找執行檔位置 (Where)

> :orange_book: 有些的安裝可能不會跟你說安裝到哪裡去(像``golang``就沒說)，這時候您可以用powershell，然後使用: ``gcm [your_exe]`` 來幫助您

[gcm](https://superuser.com/a/1605156/1093221)


[protobuf_google]: https://developers.google.com/protocol-buffers/docs/overview
[protobuf_github]: https://github.com/protocolbuffers/protobuf
[Jekyll]: https://jekyllrb.com/
[ctags]: https://en.wikipedia.org/wiki/Ctags#:~:text=Ctags%20is%20a%20programming%20tool,so%20on%20may%20be%20indexed.
