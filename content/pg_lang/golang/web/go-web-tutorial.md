+++
title = "Go Web Tutorial"
description=""
date = 2021-03-19T16:30:56+08:00
lastmod = 2021-03-19
featured_image = ""
draft = false
weight = 0
tags = ["go", "web"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = ""
  next_page = ""
  previous_section = ""
  next_section = ""
+++

## go中好用的Web Framework

{{< table/bootstrap >}}

| Project | Desc |
| ----    |  ---- |
[![gin-gonic/gin](https://github-readme-stats.vercel.app/api/pin/?username=gin-gonic&repo=gin)](https://github.com/gin-gonic/gin#gin-web-framework) |

{{< /table/bootstrap >}}

## go中如何渲染HTML

我這邊講用原始的``html/template`` 或 ``text/template``

gin的框架範例很多，上網搜一下不難發現好文章。

但用原始的套件就很少(我自己是連一個都沒看到)

### html/template v.s. text/template

``html/template`` 和 ``text/template`` 有什麼不同？

- html/template: 網路上因為會有攻擊存在，所以go已經事先幫我對一些特殊的符號進行轉譯

  > 📙 有時候您用html/template但是您覺得是安全的不想要進行轉譯，可以用
  >
  > ``template.HTML(value.String())``
  >
  > 能把轉譯取消


- text/template: 當作文字檔，所以**不會**進行任何的轉譯

### http.template

原始套件生成HTML文件，就是用 ``http.template``

而從golang1.16開始推出了embed，

所以如果您想要把執行檔丟出去，可以把這些templates的檔案鑲嵌到執行檔之中

{{< table/code-by-example >}}

- 2列: 是embed的語法，這裡我們抓取當前目錄中的static和templates下所有的東西

  > ❗ 這句話會把這些資料夾中的檔案都包進去，不論您後面有沒有用到這些檔案

- 7列: ParseFS需要的是一個fs.FS的結構，後面指定要抓取這些結構的那些檔案

  完成之後回到前面的template.New，他的參數名稱Name，就是剛才ParseFS之中的檔案名稱

- 13列: 這一列是主要實作的核心

  HandleFunc第二個參數需要http.Handler，

  而http.Handler是一個

  ```go
  type Handler interface {
      ServeHTTP(ResponseWriter, *Request)
  }
  ```

  也就是只要具備ServeHTTP的方法就可以算是了，

  所以就可以去抄``html.template.Template.ServerHTTP``

  您可以這樣定義

  ```go
  type ht struct { *template.Template }

  func (t *ht) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	if err := t.Execute(w, t.context); err != nil {
		fmt.Println(err)
		w.WriteHeader(http.StatusBadRequest)
		_, _ = w.Write([]byte("BadRequest\n"))
	}
	return
  }
  ```

  最後創建一個ht的instance丟過去即可(可以參見[完整範例]({{< ref "#完整代碼" >}}) )



@@NEW-COL@@

```go {linenos=inline,hl_lines=[2,7,13]}

//go:embed static/* templates/*
var f embed.FS

func main() {
    homeTemplates := template.Must(
        template.New("index.go.html").ParseFS(f, "templates/*.go.html", "templates/shopping-car/*.go.html"),
    )

    http.HandleFunc("/home/", func(w http.ResponseWriter, r *http.Request) {
        switch r.Method {
        case http.MethodGet:
            homeT.ServeHTTP(w, r)
        default:
            return
        }
    })

    log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", "8080"), nil))
}
```

{{< /table/code-by-example >}}


#### 完整代碼

```go
package main

import (
	"embed"
	"fmt"
	"html/template"
	"log"
	"net/http"
)

type Setting struct {
	EnableBootstrap bool
	ProgramInfo
}

type ProgramInfo struct {
	Author  string
	Version string
}

var (
	Config Setting
)

//go:embed static/* templates/*
var f embed.FS

type ht struct {
	*template.Template
	context map[string]interface{}
}

func (t *ht) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	if err := t.Execute(w, t.context); err != nil {
		fmt.Println(err)
		w.WriteHeader(http.StatusBadRequest)
		_, _ = w.Write([]byte("BadRequest\n"))
	}
	return
}

func main() {
	homeTemplates := template.Must(
		template.New("index.go.html").ParseFS(f, "templates/*.go.html", "templates/shopping-car/*.go.html"),
	)
	Config.EnableBootstrap = true
	Config.ProgramInfo.Version = "0.0.0"
	Config.ProgramInfo.Author = "Carson"
	homeT := ht{homeTemplates,
		map[string]interface{}{
			"Site":  Config,
			"Title": "Welcome server!",
			"Msg":   "golang is awesome!",
		},
	}

	// localhost:8080/home/
	http.HandleFunc("/home/", func(w http.ResponseWriter, r *http.Request) {
		switch r.Method {
		case http.MethodGet:
			homeT.ServeHTTP(w, r)
		default:
			return
		}
	})

	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", "8080"), nil))
}

```





[html.template: Actions]: https://golang.org/pkg/text/template/#hdr-Actions
