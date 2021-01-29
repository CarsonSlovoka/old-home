+++
title = "將go代碼發佈到github上去"
description="將go代碼發佈到github上去"
date = 2021-01-26T17:43:12+08:00
lastmod = 2021-01-26
featured_image = ""
draft = false
weight = 0
tags = ["golang"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = "pg_lang/golang/go-oop"
  next_page = ""
  previous_section = ""
  next_section = ""
+++


## 前言

在閱讀前，請一定要弄懂

- [go mod應用]({{< ref "pg_lang/golang/go-oop#go-mod應用httpsbloggolangorgusing-go-modules" >}})

或者

- [Using Go Modules](https://blog.golang.org/using-go-modules)

本篇主要就是造官方的教學，講解2-5

- [Part 1 — Using Go Modules]
- [Part 2 — Migrating To Go Modules]
- [Part 3 — Publishing Go Modules]
- [Part 4 — Go Modules: v2 and Beyond]
- [Part 5 — Keeping Your Modules Compatible]

## [Part 2 — Migrating To Go Modules]

他跟您講可以建立一種特殊的文件來管理相依的套件

特殊文件可以支援以下這幾種格式的檔案

```go
var Converters = map[string]func(string, []byte) (*modfile.File, error){
	"GLOCKFILE":          ParseGLOCKFILE,
	"Godeps/Godeps.json": ParseGodepsJSON,
	"Gopkg.lock":         ParseGopkgLock,
	"dependencies.tsv":   ParseDependenciesTSV,
	"glide.lock":         ParseGlideLock,
	"vendor.conf":        ParseVendorConf,
	"vendor.yml":         ParseVendorYML,
	"vendor/manifest":    ParseVendorManifest,
	"vendor/vendor.json": ParseVendorJSON,
}
```

詳請參考:[other supported formats](https://go.googlesource.com/go/+/362625209b6cd2bc059b6b0a67712ddebab312d9/src/cmd/go/internal/modconv/modconv.go#9)


[Part 1 — Using Go Modules]: https://blog.golang.org/using-go-modules
[Part 2 — Migrating To Go Modules]: https://blog.golang.org/migrating-to-go-modules
[Part 3 — Publishing Go Modules]: https://blog.golang.org/publishing-go-modules
[Part 4 — Go Modules: v2 and Beyond]: https://blog.golang.org/v2-go-modules
[Part 5 — Keeping Your Modules Compatible]: https://blog.golang.org/module-compatibility
