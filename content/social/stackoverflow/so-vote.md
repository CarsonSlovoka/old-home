+++
title = "SO Vote"
description="Stackoverflow的投票清單"
date = 2021-01-28T11:51:54+08:00
lastmod = 2021-01-28
featured_image = ""
draft = false
weight = 0
tags = ["stackoverflow"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
previous_page = ""
next_page = ""
previous_section = ""
next_section = ""
+++


## Stackoverflow投票清單

{{< table/bootstrap-table table-info >}}

| @@w=50%@@name | desc |
| ---- | ---- |
| [Default value in Go's method]
| [How to create new file using go script]
[How to get the directory of the currently running file?] |
[How to add new methods to an existing type in Go?] |
[Rendering template.HTML directly into templates] |
[Stop goroutine execution on timeout] |
[What is the idiomatic Go equivalent of C's ternary operator?] |
★[Golang Gin-Gonic Split Routes into Multiple Files]\n- ``%userprofile%\AppData\Local\Temp\___go_build_*.exe``\n- ``%userprofile%\AppData\Local\Temp\___TestDemo*.exe`` |
[Go programs hanging on Windows 10 avast shut up] |
[(Go) How to use toml files?] |
[How to access struct fields in a template] |
[Simple if not working go template] |
[go-template error calling eq: invalid type for comparison in Go template] |
[Why does z-index not work?] |
[How to create jumbotron in Bootstrap 5?] |
[I want to align the text in a <td> to the top] |
[Does Sass have a switch function?] |
[CSS - Equal Height Columns?] |
[How to 'add watch' in Chrome developer tools?] | Ctrl+Shift+A
[How to render/show images in HTML created on the fly with Golang and gin-gonic] | ``data:image/png;base64,{{.}}``
[How to check whether a file or directory exists?] |
[Repository size limits for GitHub.com] | 2021年，每個庫5GB以上開始有警告(建議最好在1GB下)，最多不可超過100GB，單個檔案不可超過100MB
[How to fix curl: (60) SSL certificate: Invalid certificate chain] | curl -k\n-k or --insecure Allow insecure server connections when using SSL
[Seeking a way to clone the issues for github projects] | It is **not** possible to clone issues of GitHub repositories.
[How can I delete my posted issue on GitHub?] | [Deleting an issue](https://docs.github.com/en/github/managing-your-work-on-github/deleting-an-issue)
[Removing input background colour for Chrome autocomplete?] | 更改autocomplete的顏色
[Where are the golang environment variables stored?] | [go env GOENV](https://stackoverflow.com/a/64021609)
[How do I add Add text below font awesome icon Links?] |
[Access struct property by name] |
★[Using reflect, how do you set the value of a struct field?] |
[Can I target all <H> tags with a single selector?] | ``:is(h1, h2, h3, h4, h5, h6) {color: red;}`` [is](https://developer.mozilla.org/en-US/docs/Web/CSS/:is)
[How to make <details> drop down on mouse hover] |
[SASS (not SCSS) syntax for css3 keyframe animation] |
[How do you serve a static html file using a go web server?] |
[How can I commit with no fast forward option (--no-ff) in SourceTree?] |
[How can I handle http requests of different methods to / in Go?] |
[In Go's http package, how do I get the query string on a POST request?] | ```http.Request.URL.Query()["param1"]```
[Make a line break when requesting user input (/P) in batch?] | 可以在 /p 之前或之後使用echo
[How to unmarshall viper config to struct with dash character] | ``mapstructure``
[Unmarshaling nested JSON objects] |
[Split long commands in multiple lines through Windows batch file] |
[How to format current time using a yyyyMMddHHmmss format?] | ``fmt.Println(t.Format("20060102150405"))``
[How to set default values in Go structs] |
[How to gracefully shutting down a golang server?] | [go1.8 http.Shutdown](https://golang.org/pkg/net/http/#Server.Shutdown)
[How to change the current directory in Go] |
[Bcrypt password hashing in Golang (compatible with Node.js)?] | [![golang/crypto](https://github-readme-stats.vercel.app/api/pin/?username=golang&repo=crypto)](https://github.com/golang/crypto)
[Adding a favicon to a static HTML page] | ```<link href="data:image/x-icon;base64,YourBase64StringHere" rel="icon" type="image/x-icon" />```
[Range over string slice in golang template] | https://golang.org/pkg/text/template/
[Embed javascript as base64] |
[How can I read a whole file into a string variable] | ``io.ReadAll``
[Include js file in Go template] |
[Correct way of getting Client's IP Addresses from http.Request] |
[Enable CORS in Golang] |
[Difference between id and name attributes in HTML] | The name attribute is used when sending data in a form submission. Different controls respond differently. For example, you may have several radio buttons with different id attributes, but the same name.
[Gorilla mux custom middleware] |
[How to redirect to a url] | ``http.Redirect(w, r, "/login/", http.StatusSeeOther)`` http.StatusSeeOther 303 這個是關鍵！
[Golang Gorilla mux with http.FileServer returning 404] |
[How can I get the user's AppData folder path] | 🐬
[Golang FileServer with custom css] |
[Is there any way to access private fields of a struct from another package?] | ``reflect.ValueOf(*f).FieldByName("y")``
[How to serve up a JSON response using Go?] | ``json.NewEncoder(w).Encode(goObj)``
[Static Data Grid - 10K records with search, pagination, export options]
[How to insert and update data in Bootstrap table?]
[What is the difference between jQuery's mouseout() and mouseleave()?]
[How to bind an event listener only once in pure JavaScript?]
[How can I add an event for a one time click to a function?] | ``EventTarget.addEventListener("click", function() { }, {once : true});``
[Including image in Wenhixin bootstrap-table] |
[Table fixed header and scrollable body] | ``thead, tbody tr {display: table; width: 100%; table-layout: fixed;}  tbody {display: block; overflow-y: auto; table-layout: fixed; max-height: 768px;}``
[.tableExport is not a function] | 確保載入的順序和此 [網站](https://github.com/hhurz/tableExport.jquery.plugin) 是一樣的
[Add “contenteditable” attribute to element using Javascript?] | ``elemText.contentEditable = "true";`` or ``elemText.setAttribute("contenteditable", "true");``
[How can I get the corresponding table header (th) from a table cell (td)?] |
[wait till bootstrapTable is fully loaded before doing something] |
[error parsing regexp: invalid or unsupported Perl syntax: \`(?!\`] | https://github.com/google/re2/wiki/Syntax \n
[Negate match in RE2 syntax?] |
[Golang: find string in file and show line number] |
[How to negate specific word in regex?] |
[How to filter issues on GitHub by issue id?] | ``issue: 339, 310, 2``
[How to use Checkbox inside Select Option] | https://github.com/wenzhixin/multiple-select \n https://multiple-select.wenzhixin.net.cn/docs/en/download \n https://multiple-select.wenzhixin.net.cn/docs/en/usage
[Converting HTML string into DOM elements?] | ``var doc = new DOMParser().parseFromString(xmlString, "text/xml");``\n``doc.firstChild.innerHTML``
[Add icon tray on Windows using native Golang API] |
[No data sources are configured to run this SQL] | View -> Tool Windows -> Database
[Convert array to slice in Go] | ``myArray[:]``
[Go HTTP Post and use Cookies] |
[Open file dialog box in JavaScript] | ``<input type="file" id="file-input"/>`` 可以把 ``#file-input {display: none;}`` 把請``選擇檔案``隱藏起來
★[Golang GET multipart form-data] |
[Postman Chrome: What is the difference between form-data, x-www-form-urlencoded and raw] |
[How to send multipart/form-data form content by ajax (no jquery)?] |
[Need a basename function in Javascript] |
[How can you encode a string to Base64 in JavaScript?] |
[In Go, is there similar feature like “f-string” in Python?] |
[In-memory file for testing] |
[What’s the best way to reload / refresh an iframe?] |
[javascript xhr load iframe in response] |
[Remove all child elements of a DOM node in JavaScript] | 解一: ``div.querySelectorAll('*').forEach(node => node.remove())`` 解二: ``while (parent.firstChild) {parent.firstChild.remove()}``
[Selecting an element in iFrame jQuery] |
[Get element from within an iFrame] | ``iframe.contentWindow.document.getElementsByTagName("H1")[0]``
[Access a variable of iframe from parent] | ``document.getElementById("iframeid").contentWindow.a``
[JS map return object] | ``myArray.map(e=>({field: e, title: e}))``
["Uncaught SyntaxError: Cannot use import statement outside a module” when importing ECMAScript 6] | 要補上**type="module"** ``<script defer type="module" src="/static/js/file/file.js"></script>``
[Set type for function parameters?] | https://jsdoc.app/#block-tags
[Reading file contents on the client-side in javascript in various browsers] |
[Push to GitHub without a password using ssh-key] |
[How to read data From *.CSV file using javascript?] |
[Is it possible to add dynamically named properties to JavaScript object?] | ``(obj = {}, obj[field] = 123, obj)``
[Is it possible to dynamically load Go code?] | - https://golang.org/pkg/os/exec/#example_Cmd_Run  - https://golang.org/pkg/plugin/
[Load package dynamically (GO)] | https://mojotv.cn/go/golang-plugin-tutorial
[How do you add Bootstrap buttons in Bootstrap Table] |
[Trim string's suffix or extension?] | ``strings.TrimSuffix(basename, filepath.Ext(basename))``
[How can I reference a commit in an issue comment on GitHub?] |
[How do I (succinctly) remove the first element from a slice in Go?] | queue: ``x, a = a[0], a[1:]`` stack: ``x, a = a[len(a)-1], a[:len(a)-1]`` push: ``a = append(a, x)``
[error: template: “…” is an incomplete or empty template] |


[Default value in Go's method]: https://stackoverflow.com/a/23650312/9935654
[How to create new file using go script]: https://stackoverflow.com/a/46749116/9935654
[How to get the directory of the currently running file?]: https://stackoverflow.com/a/53913521/9935654
[How to convert interface{} to string?]: https://stackoverflow.com/a/27158543/9935654
[How to add new methods to an existing type in Go?]: https://stackoverflow.com/a/28800807/9935654
[Rendering template.HTML directly into templates]: https://stackoverflow.com/a/21435808/9935654
[Stop goroutine execution on timeout]: https://stackoverflow.com/a/50579561/9935654
[What is the idiomatic Go equivalent of C's ternary operator?]: https://stackoverflow.com/a/34636594/9935654
[Golang Gin-Gonic Split Routes into Multiple Files]: https://stackoverflow.com/q/42967235/9935654
[How do I list the public methods of a package in golang]: https://stackoverflow.com/q/41629293/9935654
[Go programs hanging on Windows 10 avast shut up]: https://stackoverflow.com/a/34057027/9935654
[(Go) How to use toml files?]: https://stackoverflow.com/a/61209118/9935654
[How to access struct fields in a template]: https://stackoverflow.com/a/49230385/9935654
[Simple if not working go template]: https://stackoverflow.com/a/40495123/9935654
[go-template error calling eq: invalid type for comparison in Go template]: https://stackoverflow.com/a/51923491/9935654
[Why does z-index not work?]: https://stackoverflow.com/a/9191845/9935654
[How to create jumbotron in Bootstrap 5?]: https://stackoverflow.com/a/63142090/9935654
[I want to align the text in a <td> to the top]: https://stackoverflow.com/q/5671687/9935654
[Does Sass have a switch function?]: https://stackoverflow.com/a/33207817/9935654
[CSS - Equal Height Columns?]: https://stackoverflow.com/q/2114757/9935654
[How to 'add watch' in Chrome developer tools?]: https://stackoverflow.com/a/27247584/9935654
[How to render/show images in HTML created on the fly with Golang and gin-gonic]: https://stackoverflow.com/a/57020723/9935654
[How to check whether a file or directory exists?]: https://stackoverflow.com/a/51077254/9935654
[Repository size limits for GitHub.com]: https://stackoverflow.com/a/59479166/9935654
[How to fix curl: (60) SSL certificate: Invalid certificate chain]: https://stackoverflow.com/a/22170951/9935654
[Seeking a way to clone the issues for github projects]: https://stackoverflow.com/q/56437562/9935654
[How can I delete my posted issue on GitHub?]: https://webapps.stackexchange.com/a/124784/9935654
[Removing input background colour for Chrome autocomplete?]: https://stackoverflow.com/a/46829178/9935654
[Where are the golang environment variables stored?]: https://stackoverflow.com/q/40825613/9935654
[How do I add Add text below font awesome icon Links?]: https://stackoverflow.com/a/41285702/9935654
[Access struct property by name]: https://stackoverflow.com/q/18930910/9935654
[Using reflect, how do you set the value of a struct field?]: https://stackoverflow.com/a/6396678/9935654
[Can I target all <H> tags with a single selector?]: https://stackoverflow.com/q/7539125/9935654
[How to make <details> drop down on mouse hover]: https://stackoverflow.com/q/15193606/9935654
[SASS (not SCSS) syntax for css3 keyframe animation]: https://stackoverflow.com/a/18895522/9935654
[How do you serve a static html file using a go web server?]: https://stackoverflow.com/a/26563418/9935654
[How can I commit with no fast forward option (--no-ff) in SourceTree?]: https://stackoverflow.com/q/23587750/9935654
[How can I handle http requests of different methods to / in Go?]: https://stackoverflow.com/a/15253422/9935654
[In Go's http package, how do I get the query string on a POST request?]: https://stackoverflow.com/a/29237567/9935654
[Make a line break when requesting user input (/P) in batch?]: https://stackoverflow.com/a/16536823/9935654
[How to unmarshall viper config to struct with dash character]: https://stackoverflow.com/a/51228490/9935654
[Unmarshaling nested JSON objects]: https://stackoverflow.com/a/48651916/9935654
[Split long commands in multiple lines through Windows batch file]: https://stackoverflow.com/a/69079/9935654
[How to format current time using a yyyyMMddHHmmss format?]: https://stackoverflow.com/a/20234207/9935654
[How to set default values in Go structs]: https://stackoverflow.com/a/37135458/9935654
[How to gracefully shutting down a golang server?]: https://stackoverflow.com/a/54978843/9935654
[How to change the current directory in Go]: https://stackoverflow.com/a/46028772/9935654
[Bcrypt password hashing in Golang (compatible with Node.js)?]: https://stackoverflow.com/a/23259804/9935654
[Adding a favicon to a static HTML page]: https://stackoverflow.com/a/34699173/9935654
[Range over string slice in golang template]: https://stackoverflow.com/a/54163753/9935654
[Embed javascript as base64]: https://stackoverflow.com/a/383442/9935654
[How can I read a whole file into a string variable]: https://stackoverflow.com/a/66804541/9935654
[Include js file in Go template]: https://stackoverflow.com/a/28899786/9935654
[Correct way of getting Client's IP Addresses from http.Request]: https://stackoverflow.com/a/55738279/9935654
[Enable CORS in Golang]: https://stackoverflow.com/a/48302768/9935654
[In Go, how can I reuse a ReadCloser?]: https://stackoverflow.com/q/33532374/9935654
[Difference between id and name attributes in HTML]: https://stackoverflow.com/q/1397592/9935654
[Gorilla mux custom middleware]: https://stackoverflow.com/q/26204485/9935654
[How to redirect to a url]: https://stackoverflow.com/a/35934496/9935654
[Golang Gorilla mux with http.FileServer returning 404]: https://stackoverflow.com/q/21234639/9935654
[How can I get the user's AppData folder path]: https://stackoverflow.com/a/66189296/9935654
[Golang FileServer with custom css]: https://stackoverflow.com/q/51881361/9935654
[Is there any way to access private fields of a struct from another package?]: https://stackoverflow.com/a/17982725/9935654
[How to serve up a JSON response using Go?]: https://stackoverflow.com/a/31622112/9935654
[Static Data Grid - 10K records with search, pagination, export options]: https://stackoverflow.com/a/45938210/9935654
[How to insert and update data in Bootstrap table?]: https://stackoverflow.com/a/31289326/9935654
[What is the difference between jQuery's mouseout() and mouseleave()?]: https://stackoverflow.com/a/53408794/9935654
[How to bind an event listener only once in pure JavaScript?]: https://stackoverflow.com/q/60498051/9935654
[How can I add an event for a one time click to a function?]: https://stackoverflow.com/a/46291530/9935654
[Including image in Wenhixin bootstrap-table]: https://stackoverflow.com/q/33667836/9935654
[Table fixed header and scrollable body]: https://stackoverflow.com/a/63412885/9935654
[.tableExport is not a function]: https://stackoverflow.com/a/36197525/9935654
[Add “contenteditable” attribute to element using Javascript?]: https://stackoverflow.com/q/20906895/9935654
[How can I get the corresponding table header (th) from a table cell (td)?]: https://stackoverflow.com/a/37312707/9935654
[wait till bootstrapTable is fully loaded before doing something]: https://stackoverflow.com/a/30336509/9935654
[error parsing regexp: invalid or unsupported Perl syntax: \`(?!\`]: https://stackoverflow.com/a/38935027/9935654
[Negate match in RE2 syntax?]: https://stackoverflow.com/a/28197295/9935654
[Golang: find string in file and show line number]: https://stackoverflow.com/a/37255484/9935654
[How to negate specific word in regex?]: https://stackoverflow.com/a/1240333/9935654
[How to filter issues on GitHub by issue id?]: https://stackoverflow.com/a/59782909/9935654
[How to use Checkbox inside Select Option]: https://stackoverflow.com/a/25414909/9935654
[Converting HTML string into DOM elements?]: https://stackoverflow.com/a/3104237/9935654
[Add icon tray on Windows using native Golang API]: https://stackoverflow.com/q/49126294/9935654
[No data sources are configured to run this SQL]: https://stackoverflow.com/a/66470666/9935654
[Convert array to slice in Go]: https://stackoverflow.com/a/28886764/9935654
[Go HTTP Post and use Cookies]: https://stackoverflow.com/q/12756782/9935654
[Open file dialog box in JavaScript]: https://stackoverflow.com/a/47094148/9935654
[Golang GET multipart form-data]: https://stackoverflow.com/a/35687623/9935654
[Postman Chrome: What is the difference between form-data, x-www-form-urlencoded and raw]: https://stackoverflow.com/a/55985011/9935654
[How to send multipart/form-data form content by ajax (no jquery)?]: https://stackoverflow.com/a/5935286/9935654
[Need a basename function in Javascript]: https://stackoverflow.com/a/62800151/9935654
[How can you encode a string to Base64 in JavaScript?]: https://stackoverflow.com/q/246801/9935654
[In Go, is there similar feature like “f-string” in Python?]: https://stackoverflow.com/a/59083271/9935654
[In-memory file for testing]: https://stackoverflow.com/a/56177725/9935654
[What’s the best way to reload / refresh an iframe?]: https://stackoverflow.com/q/86428/9935654
[javascript xhr load iframe in response]: https://stackoverflow.com/a/32363652/9935654
[Remove all child elements of a DOM node in JavaScript]: https://stackoverflow.com/a/40606838/9935654
[Selecting an element in iFrame jQuery]: https://stackoverflow.com/q/6316979/9935654
[Get element from within an iFrame]: https://stackoverflow.com/q/1088544/9935654
[Access a variable of iframe from parent]: https://stackoverflow.com/q/13757943/9935654
[JS map return object]: https://stackoverflow.com/a/52916721/9935654
["Uncaught SyntaxError: Cannot use import statement outside a module” when importing ECMAScript 6]: https://stackoverflow.com/a/58679392
[Set type for function parameters?]: https://stackoverflow.com/q/8407622/9935654
[Reading file contents on the client-side in javascript in various browsers]: https://stackoverflow.com/a/64113219/9935654
[Push to GitHub without a password using ssh-key]: https://stackoverflow.com/q/14762034/9935654
[How to read data From *.CSV file using javascript?]: https://stackoverflow.com/a/7431565/9935654
[Is it possible to add dynamically named properties to JavaScript object?]: https://stackoverflow.com/a/63235463/9935654
[Is it possible to dynamically load Go code?]: https://stackoverflow.com/q/18237863/9935654
[Load package dynamically (GO)]: https://stackoverflow.com/q/24641296/9935654
[How do you add Bootstrap buttons in Bootstrap Table]: https://stackoverflow.com/a/39793454/9935654
[Trim string's suffix or extension?]: https://stackoverflow.com/a/21538822/9935654
[How can I reference a commit in an issue comment on GitHub?]: https://stackoverflow.com/q/8910271/9935654
[How do I (succinctly) remove the first element from a slice in Go?]: https://stackoverflow.com/a/23532104/9935654
[error: template: “…” is an incomplete or empty template]: https://stackoverflow.com/q/49043292/9935654

{{< /table/bootstrap-table >}}


[golang使用webAssembly的方式]: https://zhuanlan.zhihu.com/p/64873683
[github.com/anymost/Go-WebAssembly]: https://github.com/anymost/Go-WebAssembly
[Bootstrap教學 - 利用HTML + CSS，完整編寫網站外觀示範]: https://www.youtube.com/watch?v=9X1graZtuPs
