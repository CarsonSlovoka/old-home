+++
title = "Javascript module"
description="如何模組化您的JS文件"
date = 2021-05-11T16:07:59+08:00
lastmod = 2021-09-08
featured_image = ""
draft = false
weight = 0
tags = ["js"]
markmap = true
toc_markmap = true
toc_bootstrap = true
+++


## 前言

當您的系統很大，勢必需要把您的JS拆分為多個檔案，本篇的重點就圍繞於此

## ESM

ES6開始推出的module，或者稱為JavaScript modules

強烈建議看看官方的[說明文檔](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules#renaming_imports_and_exports)

### [ESM的特性](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules#other_differences_between_modules_and_standard_scripts)

- 具備安全性它不允許CORS，所以最好由server來啟動您的腳本
- 要使用ESM必須加上module: ``<script type="module" src="..."></script>``
- 使用ESM的模塊，會自動使用[strict mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode)
- 使用ESM之後不用再加上``defer``它會自動加上
- 不論您寫了多少次script，ESM的模塊都只會加載一次
- ★ 不在具備全局性，例如你不使用ESM的時候，不同script的東西可以相互溝通，但ESM的東西都是自己獨立一個空間，不同空間無法溝通。


### 其它ESM很酷的功能

-  ``import myJSON from "./foo.json" assert {type: "json"}``

## [Import](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import#syntax)

## [Export](https://developer.mozilla.org/en-US/docs/web/javascript/reference/statements/export#syntax)


## [JSDoc](https://jsdoc.app/)

[JSDdoc Block Tags](https://jsdoc.app/#block-tags)

- [JSDoc的語法](https://jsdoc.app/#block-tags)

## 參考資料

- [Set type for function parameters?](https://stackoverflow.com/a/67482472/9935654)
