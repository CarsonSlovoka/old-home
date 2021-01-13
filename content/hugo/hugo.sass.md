+++
title = "SASS"
date = 2021-01-11T16:52:00+08:00
description = "如何在Hugo中使用sass或scss"
tags = ["hugo", "scss", "sass"]
draft = false
bootstrap = true
markmap = true
toc_markmap = true
toc_bootstrap = true
+++


> :exclamation: 當您用Hugo來幫你轉換成CSS，他會建立緩存，並存放於``resources/_gen/``資料夾中！

## 使用方法

### 確認安裝版本

我在這裡遇到一個坑，就是只有參考官方的[SASS/SCSS]

然後就ooxx怎麼樣都不行，只到看了很多篇論壇才注意到關鍵字[Hugo extended](https://discourse.gohugo.io/t/hugo-extended-needed-for-hugo-fresh-theme/13844/4)

雖然教程[SASS/SCSS]講的也沒有錯，但最大的問題就是您安裝的Hugo是什麼版本?

如果您安裝的是

> ``choco hugo install`` 那您就倒大楣了:smiling_imp:

請解除安裝: ``choco hugo uninstall``

然後再安裝``extended``的版本，[指令]如下:

> choco install hugo-extended -confirm

### 語法

這裡是所有[options]可以用的參數

```go-html-template
dict "targetPath" "sass/my_main.min.css" "outputStyle" "compressed" "enableSourceMap" false
```

比較常弄得設定應該如上所示

值得一提的是:

- ``targetPath``: 後面不管您要把你的檔案變成怎樣，前面一開始一定要放``sass``(假設您的檔案是sass)他才會放對地方，其實如果您搞不清楚要放什麼可以把它拿掉，然後他會用預設的名稱加載，您再看他是怎麼放的(他就是放在sass中)模仿他就可以了

再來他會叫你用``resources.Get``去得到你的檔案

- ``resources.Get`` 所作用的資料夾是: ``/assets`` (您的根目錄再建立一個assets)

    > 如果您不爽放在/assets可以去``config.toml``更改``assetDir``即可，詳請[參考](https://gohugo.io/hugo-pipes/introduction/#asset-directory)


```go-html-template
{{ $sass_options := dict "outputStyle" "compressed" "enableSourceMap" false }}
{{ $sass_file_path := "sass/main.sass" }}  {{/* assets/sass/main.sass */}}
{{ $style := resources.Get $sass_file_path | resources.ToCSS $sass_options | resources.Minify | resources.Fingerprint "sha256" }}
<link rel="stylesheet" href="{{ $style.Permalink }}" integrity="{{ $style.Data.Integrity }}">
```

其中又能做一些簡化，例如可以把全名寫成縮寫

| 全名  | 縮寫 | 功能描述 |
| ---- | ---- | ---- |
| ``resources.ToCSS`` | ``toCSS`` | 他有一些選項，如果你要補上其他選項，就餵給他dict即可，他的[參數](https://gohugo.io/hugo-pipes/scss-sass/#options)
| ``resources.Minify`` | ``minify``|  最小化，加了就對了
| ``resources.Fingerprint`` | ``fingerprint`` |  預設是用``sha256``，如果你要別的可以在後面加上參數例如``sha512``等等

> :exclamation: 注意縮寫版的字首為小寫

[SASS/SCSS]: https://gohugo.io/hugo-pipes/scss-sass/
[指令]: https://gohugo.io/getting-started/installing/#chocolatey-windows
[options]: https://gohugo.io/hugo-pipes/scss-sass/#options
