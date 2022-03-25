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

| @@w=50%@@name | desc | Tags |
| ---- | ---- | ---- |
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
[Static Data Grid - 10K records with search, pagination, export options] |
[How to insert and update data in Bootstrap table?] |
[What is the difference between jQuery's mouseout() and mouseleave()?] |
[How to bind an event listener only once in pure JavaScript?] |
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
[fonttools convert ttf to woff2] | 使用套件 ``from fontTools.ttLib import TTFont`` 來完成，試過ttf轉woff或woff2都可以完成。 或者直接使用指令 ``python -c "from fontTools.ttLib import TTFont; f = TTFont('path/to/your/file.otf');f.flavor='woff2';f.save('path/to/your/file.woff2')"``
[how to load m4a file in python] | ``from pydub import AudioSegment`` ``audio = AudioSegment.from_file('file.m4a')``
[document.createElement('div') with a class] | ``myBtn.className = "btn"``
[Append multiple items in JavaScript] | ``foo.append(bar1, bar2, bar3)``
[Font Awesome icon in select option] |
[text-align: right on <select> or <option>] | select之中有一個dir停靠的位置可以設定，rtl可以靠右 ``<select dir="rtl">``
[Async/Await Class Constructor] | ``constructor() {return (async () => {this.value = await asyncFunction(); return this;})();}``
[Why TrimLeft doesn't work as expected?] | ``strings.TrimPrefix``
[Structs in Javascript] | ``function StaticInfo(url) { this.url = url}``
[Is there an onSelect event or equivalent for HTML <select>?] |
[Font-Face changing via JavaScript] | https://developer.mozilla.org/en-US/docs/Web/API/FontFace/FontFace#example , 記得最後一定要``document.fonts.add(font)``才可以，如果是iframe，則是 ``iframeNode.contentWindow.document.fonts.add(font)``
[Are dashes allowed in javascript property names?] | key名稱如果有奇怪的符號可以用雙引號包起來 ``{"font-family": "myfont"}``
[How to create an array containing 1…N] | ``let N=10, i=0, a=Array(N); while(i<N) a[i++]=i;``
[Downsizing an .OTF font by removing glyphs] |
[How to disable all div content] | ``<fieldset disabled><legend></legend><div></div></fieldset>``
[How to add an array of values to a Set] | ``new Set([1,2,3,4])`` ``[1,2,3,4].forEach(mySet.add, mySet)``
[Named capturing groups in JavaScript regex?] | ``const { groups: { token } } = /(?<token>[^ $]*)/.exec(auth)``
[Can I use a regular expression in querySelectorAll?] | ``(document.querySelectorAll('div')).filter(function(el){ return el.className.match(/^foo/i);}``  ``document.querySelectorAll('div[class^="foo" i]')``
[How to replace DOM element in place using Javascript?] | ``targetNode.replaceWith(newNode)``
[Replace element contents with document fragment javascript] | range.selectNodeContents(myNode), myNode.remove(), range.insertNode(frag)
[Uncaught DOMException: Failed to read the 'cssRules' property] | ``crossorigin="anonymous"``
[Why doesn't document.addEventListener('load', function) work in a greasemonkey script?] | ``window.addEventListener()``
[Checking if a key exists in a JavaScript object?] | ``undefined ?? "default value"`` ``options.person?.age ?? ""`` [Optional_chaining (?.)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining)
[Regex to match string containing two (or more) words in any order and case not sensitive] | ``(?i:os|path)`` (): 一個匿名group i: 不區分大小寫 |: 或的意思  也就是他不區分大小寫得找os或者為path都行
[Display image from http response with image content type] |
[Requesting blob images and transforming to base64 with fetch API] |
[Service worker registration failed. Chrome extension] | ``"minimum_chrome_version": 93,``
[chrome.tabs.executeScript: Cannot access a chrome:// URL] | 基於安全性的考量，chrome不允許您變更他的主題內容，你可以試試其他的頁面
[ReferenceError: “alert” is not defined] | alert並非javascript的一部分，它屬於window的Object
[google chrome extension :: console.log() from background page?] |
[JavaScript window.open returns null sometimes] | 因為安全性的關係，取消了直接window.open的動作，但你可以改在點擊某個按鈕後觸發，例如: ``button.onclick = () => {window.open('https://javascript.info')}``
[JsPDF - Not allowed to navigate top frame to data URL] |
[Tainted canvases may not be exported] | ``img.crossOrigin="anonymous"``
[Does JavaScript have the interface type (such as Java's 'interface')?] | [Object.defineProperty](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty)
[How to check if two arrays are equal with JavaScript?] | ``JSON.stringify(a1)==JSON.stringify(a2)`` 缺點是null的比較會出問題
[Skip arguments in a JavaScript function] | ``const {a = 10, b = 5} = {a: 3}`` [Destructuring assignment](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)
[HTML5 Canvas set z-index] | [globalcompositeoperation](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Compositing#globalcompositeoperation) [w3school: globalcompositeoperation](https://www.w3schools.com/tags/canvas_globalcompositeoperation.asp)
[setting background image to dynamic svg data?] | ``element.style.backgroundImage = "url(data:image/svg+xml;utf8," + svgCode + ")";``
[Drawing a grid on canvas] | 可以先moveTo和lineTo，全部弄完了之後再使用stroke即可
[Get width/height of SVG element] | [node.getBoundingClientRect()](https://developer.mozilla.org/en-US/docs/Web/API/Element/getBoundingClientRect)
[How to fill the whole canvas with specific color?] | ``ctx.fillRect(0, 0, canvas.width, canvas.height);``
[Download data URL file] | 可以創建a來達成，[參考](https://www.w3schools.com/howto/tryit.asp?filename=tryhow_html_download_link) 而如果有必要href還有src都可以使用dataURI
[How to create and export svg to png/jpeg in golang] |
[Capture HTML Canvas as gif/jpg/png/pdf?] |
[Drawing an SVG file on a HTML5 canvas] |
[What's the most elegant way to cap a number to a segment?] | [clamp](https://developer.mozilla.org/en-US/docs/Web/CSS/clamp())
[Simulation background-size: cover in canvas] | [drawImageProp.js](https://gist.github.com/CarsonSlovoka/80505cd107212bf7d74939b22a7ea07a)
[Unable to trigger chrome.browserAction.onClicked.addListener with google chrome extensions] | 在``manifest.json.action.default_popup``有新增的情況下 ``chrome.browserAction.onClicked.addListener`` 會不起作用，您直接把裏頭的內容寫在service_worker.js之中即可
[What's the best way to query an array in javascript to get just the items from it I want?] | 全部``myArray.filter``, 單個``myArray.find``
[Pop-Up Window, Center Screen] |  | Chrome-Extension
[Prevent HTML5 video from being downloaded (right-click saved)?] | 如果您的server是使用Apache那麼您可以用``.htaccess``的檔案來輔助您，來限制使用者的訪問權限，當然這種事golang也可以輕鬆做到。剩下的就是把[影片鑲嵌到canvas之中](https://www.w3schools.com/tags/tryit.asp?filename=tryhtml5_canvas_drawimage_video)
[Resize image with javascript canvas (smoothly)] | ``ctx.imageSmoothingQuality = "low", "medium", "high"`` [DOC](https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/imageSmoothingQuality) | js
[What is the JavaScript version of sleep()?] | sleep: 5 sec: ``await new Promise(resolve => setTimeout(resolve, 5000))`` | js
[ES6 import error handling] | ``import("/modules/my-module.js").then().catch()`` | js
[What is a blob URL and why it is used?] | | js
[How do we download a blob url video] | | ``js``, ``youtube-dl``
[How do you remove a method from a javascript type] | ``delete myObj.prototype.foo`` | js
[Display browser console in HTML page] | 從載 ``window.console`` 的方法即可 | js
[Display Git diff on client side in javascript as html] | | ``git``, ``js``
[Make AudioBufferSourceNode the audio source of an <audio> tag?] | | js
[Convert HTML5 Canvas Sequence to a Video File] | | js
[Switch current tab from notification in Google Chrome extension] | ``chrome.tabs.update(tabId, {highlighted: true})``  | google-chrome-extension
[How do I delete an extension in my Chrome developer dashboard?] | | google-chrome-extension
[JavaScript set object key by variable] | ``{ [yourKeyVariable]: someValueArray }``   | js
[Cannot create DocumentFragment storing td, tr or th?] | 就是很奇怪td,th這類的不能這樣用。乖乖的用document.createElement再慢慢的添加到指定的節點去 | js
[How to specify max-height css property to Screen size] | ``.scrollDiv {max-height: 100vh;overflow: auto;}`` | js
[How to execute an arithmetic operation inside a string in Javascript?] | ``eval`` | js
[How to sort strings in JavaScript] | ``item1.attr.localeCompare(item2.attr)`` | js
[How to get value of selected radio button?] | ``document.querySelector(`input[type="radio"][name="algorithm"]:checked`).value;`` | js
[Why am I getting “Failed to load extension. Invalid value for 'content_security_policy'”?] | ``"content_security_policy": {"extension_pages": "script-src 'self'; object-src 'self'"}`` | google-chrome-extension
[Equation (expression) parser with precedence?] | 不使用eval進行四則運算 | js
[access object property from object method in javascript] | this相關 | js
[Sorting object property by values] | ``Object.entries(obj).sort((a, b) => a[1] - b[1])`` | js
[What is the difference between String.slice and String.substring?] | 不要使用[substr](https://web.archive.org/web/20200704195437/https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/substr) | js
[checking for typeof error in JS] | 用 ``instanceof`` 來確認 | js
[How to close the current extension tab?] | ``chrome.tabs.remove(tab.id, function() { });`` | google-chrome-extension
[chrome.scripting.executeScript not working in my manifest v3 Chrome Extension] | google-chrome-extension
[Chrome extension: How to open a link in new tab?] | ``chrome.tabs.create({ url: newURL });`` | google-chrome-extension
[onclick or inline script isn't working in extension] | 因為CSP的關係onclick沒辦法直接在html中新增進去，但是你可以直接用JS新增onclick的動作進去 | google-chrome-extension
[Adding JavaScript type hints for VSCode/Monaco Intellisence] | ``/** @type {WebGLRenderingContext} */`` | js
[HTML dataset - how to put object? data-x={}] | 利用 ``JSON.parse(myString)`` | js
[Why is 4 not an instance of Number?] | 要注意 ``instanceof Number`` 會得到false | js
[Return positions of a regex match() in Javascript?] | ``[...str.matchAll(regexp)].forEach(match=>{})``  | js
[what is the key code for shift+tab?] | ``e.shiftKey && e.key === 'Tab'`` | js
[Scroll to bottom of div?] | ``objDiv.scrollTop = objDiv.scrollHeight`` | js
[How to execute somethnig finally in Javascript swich-case statement?] | | js
[Format JavaScript date as yyyy-mm-dd] | | js
[querySelectorAll with multiple conditions] | 找p或者span的節點: ``document.querySelector("p, span")`` 優先找前面的(p) | js
[Changing image size in Markdown] | ``![](./pic/pic1_50.png =100x20)``| markdown
[indexOf method in an object array?] | 如果您的array的元素是一個object，當您想要indexOf這個object，那麼必須取得當初餵進去的那個object。不能隨意在new一個出來，即便new出來的資料結構和數值相同，也是不行 | js
[Execute Script of Chrome extension only once] | | google-chrome-extension
[Change text from “Submit” on input tag] | ``<input type="submit" value="...">`` type等於submit的時候會自動用瀏覽器選擇的locale來放文字，如果不想要這樣，可以給定value來指定為某文字 | js
[Failed to execute 'createObjectURL' on 'URL':] | 使用 ``video.srcObject = mediaStream`` 不要用 ``video.src = URL.createObjectURL(mediaStream)`` 這種做法會被逐漸淘汰！ | js
[Why is the 'ended' event not firing for this MediaStreamTrack?] | | google-chrome-extension
[How to listen for “Stop sharing” click in Chrome DesktopCapture API] | ``stream.oninactive = () => {}`` or ``stream.getVideoTracks()[0].onended = () => {}`` | js
[ffmpeg -i input.webm -c copy output.mp4] | ``ffmpeg -i input.webm -c copy output.mp4`` | ffmpeg
[Is it possible to use the MediaRecorder API with html5 video?] | | js
[how to use ffmpeg to merge WebM audio (Opus) and MP4 video (H.264) into one MP4 file] | 如果沒有音頻要重新編碼要補上``-c:a aac`` 完整範例 ``ffmpeg -i result.webm -c copy -c:a aac output.mp4`` | ffmpeg
[How to do something before on submit?] | 在submit的時候回傳false可以取消submit的動作 ``form.onsubmit = e => {return false }`` | js
[How to escape HTML] | 轉譯，使其成為安全的字串，例如如果您的title為<input>...如果置換到innerHTML會得到一個按鈕，所以需要把特殊的符號轉譯。 轉譯的方法: ``new Option(str).innerHTML`` | js
[Chrome Extensions creating a .html page accessible by clicking browser action.] | ``chrome.tabs.create({ url: chrome.runtime.getURL("index.html")`` | google-chrome-extension
[Include another HTML file in a HTML file] | | js
[How to get the value from the GET parameters?] |  ``new URL(document.URL).searchParams.get("para")`` | js
[What's the difference between HTML 'hidden' and 'aria-hidden' attributes?] | hidden只是看不到而已，但不代表他對殘障者有效。aria-hidden會整個都有效
[Get the current URL with JavaScript?] | ``window.location.host`` ● ``window.location.host`` ● ``window.location.pathnam``  | js
[Redirecting to a relative URL in JavaScript] | ``window.location.href = '../'; //one level up`` , ``window.location.href = '/path'; //relative to domain`` | js
[Internationalization of HTML pages for my Google Chrome Extension] | | google-chrome-extension
[Get File Name and Parent Folder of URL] | ``myPath.split('/').slice(-2).join('/')`` | js
[How to dynamically change a web page's title?] | ``document.title = "This is the new page title."`` | js
[How do I convert a video to GIF using ffmpeg, with reasonable quality?] | ``ffmpeg -ss 30 -t 3 -i input.mp4 -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 output.gif``  ``ffmpeg -i input.mp4 -vf "fps=10,scale=320:-1:flags=lanczos" -c:v pam -f image2pipe -  convert -delay 10 - -loop 0 -layers optimize output.gif`` | ffmpeg
[Font-awesome, input type 'submit'] | 把``<input type="submit">``改成使用``<button type="submit"><i class="fa far-... fa-2x"> button-name </i>`` 即可 | js
[drag drop files into standard html file input] | | js
[How can I serialize an input File object to JSON?] | | js
[How to import a JSON file in ECMAScript 6?] | | js
[How to load data from a CSV file in D3 v5] | d3至從v5以後d3.csv回傳的是一個``promise`` | d3.js
[Parse Uploaded CSV file using D3.js] | | d3.js
[How to change the style of the title attribute inside an anchor tag?] | | js
[How to generate thumbnail images of HTML pages] | | js
[How to use Google Chrome Thumbnails preview service?] | | google-chrome-extension
[How to add image to canvas] | ``ctx.drawImage(new Image, 0, 0)`` | js
[How to crop canvas.toDataURL] | | js
[Using HTML5/Canvas/JavaScript to take in-browser screenshots] | | js
[Ways to see a list of all the tabs open in Chrome?] | | google-chrome-extension
[Displaying a custom animation at the click location on Windows 10 in response to an event] | | ahk
[Cutting the videos based on start and end time using ffmpeg] | ``ffmpeg -i input.mp4 -ss 01:19:27 -to 02:18:51 -c:v copy -c:a copy output.mp4`` | ffmpeg
[Add audio to video using FFmpeg] | | ffmpeg
[Python convert mp3 to wav with Pydub] | ``subprocess.call(['ffmpeg', '-i', '/input/file.mp3','/output/file.wav'])`` | ffmpeg, python
[Chrome Extension Message passing: response not sent] | | google-chrome-extension
["Cannot read property of undefined" when using chrome.tabs or other chrome API in content script] | | google-chrome-extension
[What does "http://*/*", "https://*/*" and "<all_urls>" mean in the context of Chrome extension's permissions] | "<all_urls>" : ``matches any URL that starts with a permitted scheme (http:, https:, file:, ftp:, or chrome-extension``  | google-chrome-extension
[How do I find out if connectNative failed or succeeded] | | google-chrome-extension
[How can I read from standard input in the console?] | | go
[How to print struct variables in console?] | ``fmt.Printf("%#v\n", myStruct)`` 輸出json格式 ``+v`` 會省略掉``"`` 可能更不好閱讀 | go
[Ways to see a list of all the tabs open in Chrome?] | ``Ctrl+Shift+A`` | superuser, chrome
[Start an external application from a Google Chrome Extension?] | [Native messaging host](https://developer.chrome.com/docs/apps/nativeMessaging/#native-messaging-host) | google-chrome-extension, chrome
[What does the w flag mean when passed in via the ldflags option to the go command?] |  ``-s disable symbol table`` ``-w disable DWARF generation`` | go
[robocopy transfer file and not folder] | ``robocopy c:\source_folder d:\dist_folder transfer_this.txt`` | robocopy, bat
[Replace parent element with its contents] | ``h2.replaceWith(h2.firstChild)`` ``h2.replaceWith(...h2.childNodes)`` | js
[How do I get all h1,h2,h3 etc elements in javascript?] | `document.querySelectorAll("h1, h2, h3, h4, h5, h6")` | js
[Is there a JavaScript solution to generating a "table of contents" for a page?] | | js,toc
[Can I use a SVG toolbar icon?] | No (2009年發問到現在仍然沒有解決) | google-chrome-extension
[Method to convert HTML5 canvas to SVG?] | | js
[Checking if browser is in fullscreen] | 這可以判斷是否視窗還可以再放大(不是指全螢幕模式) `if (!window.screenTop && !window.screenY) {alert('Browser is in fullscreen')}` ， 如果您再找全螢幕可以參考[Fullscreen_API](https://developer.mozilla.org/en-US/docs/Web/API/Fullscreen_API)  | js
[SVG Favicon Not Working] | favicon也可以用svg來代替 ``<link rel="icon" href="images/favicon.svg" sizes="any" type="image/svg+xml">`` | html
[How to view file diff in git before commit] | | git
[Where can I find the source code of gitk?] | | gitk
[RGB to hex and hex to RGB] | `parseInt("ff", 16) => 255` `(0x1000000 + rgb)` | js
[How do I check that a number is float or integer?] | `Number.isInteger(12.0)` true | js
[Convert character to ASCII code in JavaScript] | `"ABC".charCodeAt(0) // returns 65` `String.fromCharCode(65,66,67); // returns 'ABC'` | js
[How can I test if a letter in a string is uppercase or lowercase using JavaScript?] | | js
[How to get selected word when double-click on div, p, span?] | `window.getSelection().toString()` | js
[Get current clipboard content?] | `const text = await navigator.clipboard.readText()` | js
[Move mouse pointer in JavaScript] | `document.querySelector('button').focus()` | js
[How to JsDoc a "mixed" type?] | Any型別: `@param {*}` 可選項`@param {?string}` 表示此變數為可選項 | js
[Why is document.execCommand("paste") not working in Google Chrome?] | `document.execCommand("paste")` copy和cut都有支持，paste只有ie有支持 | js
[JavaScript get clipboard data on paste event (Cross browser)] | ` window.document.execCommand('insertText', false, "my copy data")` | js
[JavaScript: filter() for Objects] | `Object.keys(obj).filter().reduce()` | js
[How to add stroke/outline to transparent PNG image in JavaScript canvas] | ★使用js進行contour檢測 | js
[Display image through html image element object] | `document.createRange().createContextualFragment(img.outerHTML)` | js
[highlight all text in textarea] | `elem.focus()` `elem.select()` | js
[How to exit from setInterval] | `const interval = setInterval(() => {clearInterval(interval);}, 1000)` | js
[Can Read-Only Properties be Implemented in Pure JavaScript?] | [Object.defineProperty(obj, prop, descriptor)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty#description) | js
[How to combine WebM and Opus to generate MP4?] | `-c:v libx264` | ffmpeg
[Transposing a 2D-array in JavaScript] | `[matrix[i][j], matrix[j][i]] = [matrix[j][i], matrix[i][j]];` | js
[Display JSON data on a page as a expandable/collapsible list] | | js
[How can I check if an object is an array?] | `Object.prototype.toString.call(someVar) === '[object Array]')` | js
[How to use endsWith with multiple values?] | `x instanceof Array  or x instanceof Object` `["Object", "Array"].some(type=>Object.prototype.toString.call(value).endsWith(type + "]"))` | js
[Display JSON data on a page as a expandable/collapsible list] | | js,json
[Can I use ES6's arrow function syntax with generators? (arrow notation)] | 生成函數 `function*` | ECMA, js
[How to create an array containing 1...N] | 嘗試著用generator求解吧! | js
[How do I make JavaScript Object using a variable String to define the class name?] | `const MyClass = eval("MyClassName")` | js
[Check if variable holds File or Blob] | `myFile instanceof File` `myBlob instanceof Blob` | js
[Where can I find a pre-populated json file for testing?] | http://mysafeinfo.com/api/data?list=englishmonarchs&format=json | json
[Add text before or after an HTML element] | [insertAdjacentHTML](https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentText) `divElem.insertAdjacentHTML("afterbegin", "&nbsp;&nbsp;")` or `divElem.insertAdjacentText("afterbegin", "&nbsp;&nbsp;")` | js
[Call a function after leaving input field] | `addEventListener("blur", ()=>{})` 可以用來確定是否離開了input視窗 | js
[How do you clear the focus in javascript?] | `myElem.blur()` | js
[contenteditable change events] | | js
[How could I pass a dynamic set of arguments to Go's command exec.Command?] | [command-line-flags](https://gobyexample.com/command-line-flags) | go
[Is it possible to search for a particular filename on GitHub?] | 使用快捷鍵T之後再打上您的檔案 | github, searc
[JS how to cache a variable] | [window.localStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage) [window.sessionStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/sessionStorage) | js, cache
[What is "export default" in JavaScript?] | 簡單來說`export default`可以讓你直接import名稱就開始用了，不需要大括號括起來 | js
[Difference between DOMContentLoaded and load events] | `DOMContentLoaded` 不需要等待所有資源都加載完成 | js
[Limit how many times an event listener can trigger every second] | | js
[how to use scrollspy without using bootstrap] | | js
[Get the size of the screen, current web page and browser window] | `window.innerWidth` | js
[How to fade in a HTML5 dialog?] | [-webkit-animation](https://developer.mozilla.org/en-US/docs/Web/CSS/animation) [@keyframes](https://www.w3schools.com/cssref/css3_pr_animation-keyframes.asp) | js, animation, css
[SVG stroke-width not working] | `stroke="black" stroke-width="10"` 必須要先設定stroke，則stroke-width才會有作用 | svg
[Show file in Windows Explorer using Go?] | | go
[How to ask for administer privileges on Windows with Go] | | go, admin, UAC
[What does %~d0 mean in a Windows batch file?] | | bat
[Something like a function/method in batch files?] | | bat
[How to check if value is in range of cells?] | `=COUNTIF(A1:B7,"d")` d是否有在A1~B7之間  | google-spreadsheet
[How to clear history of text input] | `<form autocomplete="off">` 可以關閉紀錄的功能，但如果您只想要刪除某幾筆被記錄的資料，可以使用 delete或者試試shift+delete，即可刪除 | html
[Javascript to convert Markdown/Textile to HTML (and, ideally, back to Markdown/Textile)] | 推薦用[mmd](https://github.com/p01/mmd.js) | js,markdown
[Get the value of checked checkbox?] | `document.querySelector("#isDebugMode").checked`, `document.querySelector("#size:checked")?.value ?? defaultSize`  | js
[html input field using regex to get rid of invalid characters for filename] | input使用pattern來控制輸入項符合檔名的規則 `pattern="[^\\/:\x22*?<>]+"` | html
[Searching validityState for values] |  `input.validity.{valueMissing, typeMismatch, patternMismatch,...}` | js
[HTML5 form required attribute. Set custom validation message?] | `oninvalid="this.setCustomValidity('Enter User Name Here')" oninput="this.setCustomValidity('')"` | html
[Delay HTML5 :invalid pseudo-class until the first event 在表單有invalid的css屬性時，不要在使用者都還沒有輸入的時候就顯示驗證錯誤] | `input:not(:placeholder-shown)` | html
[How to have multiple colors in a Windows batch file?] | | bat
[Batch syntax highlighting] | `lang-sh` | bat
[Real mouse position in canvas] | | canvas
[.attr vs .classed in D3.js] | 第二個參數 true:表示增加該屬性, false為移除該屬性 `.classed("my-selector", true)`  | j3.js
[how to draw svg polygon on the points of mouse click position] | | svg
[SVG fill color transparency / alpha?] | 使用style `style="fill:rgba(255, 0, 0, .5)` 或者 `<circle  fill="#044B94" fill-opacity="0.4">` 注意fill直接放rgba是沒有用的，這種只能用style上才有作用 | svg
[Array.from vs Array.prototype.map] | | js
[Javascript library d3 call function] | | d3.js
[SVG: text inside rect] | | svg
[remove last characters string batch] | 移除最後一個字符: `%myString:~0,-1%` | bat
[Get protocol, domain, and port from URL] | `const full = location.protocol + '//' + location.host;` ``${location.protocol}//${location.host}`` | js
[How to display images inline] | `display: inline-block` 可以讓此元素不被換行，也就是可以和前一個元素黏在一列 `<img src="favicon.svg" width="55" height="55"><h1 style="display: inline-block">...</h1>` | css
[How do I get glyph outlines of a letter as bézier paths using JavaScript?] | [opentype.js](https://github.com/opentypejs/opentype.js) | opentype.js
[SVG icon in PWA manifest.json - how to set it for all sizes?] | | pwa
[apple touch icon svg support] | | svg, apple-touch-icon
[Whether all icon sizes can be used when using SVG in PWA manifest] | | svg, pwa
[Get the last item in an array] | 使用at方法 `array.at(-1)` 但目前safari沒有支持，[查看](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/at#browser_compatibility) | js
[DOMException on calling navigator.clipboard.readText()] | 執行`navigator.clipboard.writeText`得到Document is not focused.的錯誤，原因可能是因為你在devTool下中斷點的關係，導致focus沒有正常運行，不建議在此語句上下中斷點，確定一下文本沒有問題即可讓他自動執行 | clipboard, js
[How can I export GitHub issues to Excel?] | `curl -i https://api.github.com/repos/<repo-owner>/<repo-name>/issues --header "Authorization: token <token>"` | github.issue
[How to set "aggregate column a" with setOptions] | `.setOption('applyAggregateData', true)` | google.sheets
[How do I zip two arrays in JavaScript?] | `const zip = (a, b) => a.map((k, i) => [k, b[i]]);` [另一個版本](https://gist.github.com/renaudtertrais/25fc5a2e64fe5d0e86894094c6989e10) 解決更複雜的情況 | js
[How to solve TypeError: d3.time is undefined?] | 把`d3.time.format`改成`d3.timeFormat`, `d3.time.days`改成`d3.timeDay` | d3
[How to access new 'in-cell-image' from google apps script?] | | gas
[D3.js: Trying to build flat calendar] | |　d3.js
[vertical text in d3 (not rotated)] | 使用`rotate(-90)`+ | d3.js
[Custom Google Spreadsheet/Sheets toolbar] | | gas
[How to set Hours,minutes,seconds to Date which is in GMT] | ` date.setHours(0, 0, 0);   // Set hours, minutes and seconds` | js
[Find the element before and after a specific element with pure javascript] | 要用`elem.nextElementSibling`不要用`elem.nextSibling` | js
[Is it possible to alter a CSS stylesheet using JavaScript? (NOT the style of an object, but the stylesheet itself)] | `document.styleSheets[0].cssRules` | js
[How can I choose a legible color to draw text on a bar in a d3js chart?] | 這種算法簡單但是不完美，最好用流明來決定顏色`const foreColor = d3.hsl(d3.color("steelblue")).l > 0.5 ? "#000" : "#fff"` | d3.js
[Calculating contrasting colours in javascript] | | js
[Regular expression for floating point numbers] | `[+-]?([0-9]*[.])?[0-9]+` | js
[How to center a checkbox in a table cell?] | 改善checkbox在偏上的問題 `vertical-align: middle;` | css
[Placing border inside of div and not on its edge] | 一般的border `border: 2px solid red` 會佔空間，導致自動換行產生，這時候可以使用`outline: 2px solid red` 搭配 ` outline-offset: -2px;` 來幫忙 | css
[create fonts subset using opentype.js getting "OTS parsing error: cmap: Failed to parse table" error] |  | opentype.js
[SVG - click is not a function] | `mySVGElem.dispatchEvent(new Event('click'))` | svg
[HTML5 input type range show range value] | `<input type="range" value="24" min="1" max="100" oninput="this.nextElementSibling.value = this.value"><output>24</output>` | html
[How to get client's IP address using JavaScript?] | `fetch('https://ipinfo.io/json')` | js,ip
[Mongodb-go-driver interface conversion: interface {} is primitive.ObjectID, not primitive.ObjectID (types from different packages)] | 這是由斷言所觸發的錯誤，表示該型別為`primitive.ObjectID` 這個的原型是一個array`[12]byte` | mongodb
[golang: return a pointer or pass a reference] | | golang
[In mongodb-go-driver, how to marshal/unmarshal BSON in to a struct] | |
[How to extract the hostname portion of a URL in JavaScript] | 利用`new URL("...")` 在使用URL的方法去獲得相關的網址 |
[Calculate a percent with SCSS/SASS] | `$my_width: 4/12*1%;` | sass
[SVG path to create triangle with rounded corners] | 補上`stroke-linejoin:round`以及`stroke`即可讓三角形的稜角比較圓滑，範例:`<polygon style="stroke-linejoin:round" stroke="#f7c9c7" fill="#f7c9c7" points="80,50 30,25 30,75" />` | svg
[HTML5 Audio stop function] | `audio.pause(); audio.currentTime = 0;` | js
[Html 5 audio tag custom controls?] | [video::-webkit-media-controls-panel](https://gist.github.com/afabbro/3759334#video) | html
[javascript slowly decrease volume of audio element] | [setInterval()](https://developer.mozilla.org/en-US/docs/Web/API/setInterval) | js
[javascript -Dynamic pagination pure Js] | | js
[Convert a 1D array to 2D array] | `while(arr.length) newArr.push(arr.splice(0,3))` | js
[How to handle "Uncaught (in promise) DOMException: play() failed because the user didn't interact with the document first." on Desktop with Chrome 66?] | 因為網頁policy的關係，不允許影片自動撥放，所以解決方式先用靜音，在撥放影片(只能是靜音) | js
[Can a Windows batch file determine its own file name?] | | bat
[Can we use google analytics for Internal website?] | | google analytics
[Batch File; List files in directory, only filenames?] | `for /f tokens^=* %%i in ('where /r .\src\app\urls\static\js *.min.js') do echo %%i` | bat
[Golang https certificate error: remote error: tls: unknown certificate authority] | | tls, ssl
[what's the proper file extension or abbr. for golang's text/template?] | `.gohtml` | go
[ffmpeg - replace audio in video] | `ffmpeg -i v.mp4 -i a.wav -c:v copy -map 0:v:0 -map 1:a:0 new.mp4` | ffmpeg
[Extracting substrings in Go] | `myString[len(myString)-2:]` | go
[Showing custom 404 error page with standard http package] | 新增其他的handler，執行該handler即可 | go
[Set content of iframe] | `document.querySelector("iframe").src =  "data:text/html;charset=utf-8," + escape(htmlString)` | iframe
[iframe background image] | `<iframe class="bg-repeat-cover bg-bermuda-circle-orange"></iframe>` | iframe
[Run both HTTP and HTTPS in same program] | | go, tls, https
[Using named matches from Go regex] | | go, regex
[Convert string to integer type in Go?] | | go
[Defining Independent FlagSets in GoLang] | | go, flag
[Generating the SHA hash of a string using golang] | | go, sha
[Golang flag: Ignore missing flag and parse multiple duplicate flags] | | go, flag
[How to run a makefile in Windows?] | `choco install make` | makefile
[Command line to remove an environment variable from the OS level configuration] | `REG delete HKCU\Environment /F /V MyVar` | batch
[How to write loop in a Makefile?] | | makefile
[Docker cannot start on Windows] | | docker
[How do I uninstall a Chocolatey package and all its dependencies?] | | choco
[How can I clear the terminal screen in Go?] | | go
[How to delete border spacing in table] | `table { border-collapse: collapse; }` | css
[Why is contenteditable not a style?] | `read-write-plaintext-only` | css
[Get the ID of an element where the class contains a given string] | 使用`[attr~=value]`就能代表屬性中有此值就能套用 [MDN參考](https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors#syntax) | css
[colspan not working] | td.col**S**pan 是大寫 | js
[Get protocol, domain, and port from URL] | [new URL().{hostname, port, search, pathname, protocol}](https://developer.mozilla.org/en-US/docs/Web/API/URL) | js
[Adding options to select with javascript] | `selectElement.add(new Option(text, value, defaultSelected, selected))` | js
[fade in and out on simple css tooltip] | | css
[CSS Variables and String concatenation] | 很遺憾這樣用還是不行 `.myCls:after  {--title: attr(title); content: "🔔" + var(--title)}` | css
[Can I use HTML tags in the options for select elements?] | 目前不行，要自己用div搭配js來做。 | html
[http://timestamp.verisign.com/scripts/timstamp.dll not available] | `http://timestamp.digicert.com` | signtool
[How can I set the default value for an HTML <select> element?] | `<option value="" selected disabled hidden>` disabled不能再選，hidden看不到 | html
[Can I use a :before or :after pseudo-element on an input field?] | input沒辦法加上before或者after | html
[How can I see the size of a GitHub repository before cloning it?] | https://github.com/settings/repositories | github
[Encode URL in JavaScript?] | `escape()` will not encode: `@*/+`  `encodeURI()` will not encode: `~!@#$&*()=:/,;?+'` encodeURIComponent() will not encode: `~!*()'` | js
[How do I revert my changes to a git submodule?] | `git submodule update --init` 取消submodule的異動，還原到當時候的狀態 | git
[Setting HTTP headers] | `http.ResponseWriter.Header().Set("Content-Type", "text/html; charset=utf-8")` | go, http
[How to disable right-click context-menu in JavaScript] | `document.body.oncontextmenu = () => false` | js
[Mouse position inside autoscaled SVG] | 這種方法可以把滑鼠點擊的位子轉換到其svg相對的座標 `loc=svg.createSVGPoint(); loc.x, loc.y` | js
[Golang run on Windows without deal with the Firewall] | change `http.ListenAndServe(":3000", r)` to `http.ListenAndServe("127.0.0.1:3000", r)` | go, firewall
[Hide titlebar on window hover in electron?] | 隱藏標題欄位 `new BrowserWindow({frame: false})` | electron
[How can I find all public comments for a Github user?] | `involves:<username>` | github
[Installing font and making Windows aware] | `AddFontResourceW` `SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0)` | winapi

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
[fonttools convert ttf to woff2]: https://stackoverflow.com/a/60050616/9935654
[how to load m4a file in python]: https://stackoverflow.com/a/52593312/9935654
[document.createElement('div') with a class]: https://stackoverflow.com/a/55224626/9935654
[Append multiple items in JavaScript]: https://stackoverflow.com/q/36798005/9935654
[Font Awesome icon in select option]: https://stackoverflow.com/q/36743041/9935654
[text-align: right on <select> or <option>]: https://stackoverflow.com/a/7920784/9935654
[Async/Await Class Constructor]: https://stackoverflow.com/a/50885340/9935654
[Why TrimLeft doesn't work as expected?]: https://stackoverflow.com/a/29187186/9935654
[Structs in Javascript]: https://stackoverflow.com/q/502366/9935654
[Is there an onSelect event or equivalent for HTML <select>?]: https://stackoverflow.com/a/59113548/9935654
[Font-Face changing via JavaScript]: https://stackoverflow.com/a/55200528/9935654
[Are dashes allowed in javascript property names?]: https://stackoverflow.com/a/53726180/9935654
[How to create an array containing 1…N]: https://stackoverflow.com/a/65244270/9935654
[Downsizing an .OTF font by removing glyphs]: https://stackoverflow.com/a/68066743/9935654
[How to disable all div content]: https://stackoverflow.com/a/56388678/9935654
[How to add an array of values to a Set]: https://stackoverflow.com/a/58996448/9935654
[Named capturing groups in JavaScript regex?]: https://stackoverflow.com/a/5367407/9935654
[Can I use a regular expression in querySelectorAll?]: https://stackoverflow.com/a/16791596/9935654
[How to replace DOM element in place using Javascript?]: https://stackoverflow.com/a/40444300/9935654
[Replace element contents with document fragment javascript]: https://stackoverflow.com/a/45691867/9935654
[Uncaught DOMException: Failed to read the 'cssRules' property]: https://stackoverflow.com/a/66067441/9935654
[Why doesn't document.addEventListener('load', function) work in a greasemonkey script?]: https://stackoverflow.com/a/16406528/9935654
[Checking if a key exists in a JavaScript object?]: https://stackoverflow.com/a/67091321/9935654
[Regex to match string containing two (or more) words in any order and case not sensitive]: https://stackoverflow.com/a/53493160/9935654
[Display image from http response with image content type]: https://stackoverflow.com/q/20784145/9935654
[Requesting blob images and transforming to base64 with fetch API]: https://stackoverflow.com/a/50463054/9935654
[Service worker registration failed. Chrome extension]: https://stackoverflow.com/a/66115801/9935654
[chrome.tabs.executeScript: Cannot access a chrome:// URL]: https://stackoverflow.com/q/24600495/9935654
[ReferenceError: “alert” is not defined]: https://stackoverflow.com/a/11258916/9935654
[google chrome extension :: console.log() from background page?]: https://stackoverflow.com/q/3829150/9935654
[JavaScript window.open returns null sometimes]: https://stackoverflow.com/a/67785098/9935654
[JsPDF - Not allowed to navigate top frame to data URL]: https://stackoverflow.com/a/45789588/9935654
[Tainted canvases may not be exported]: https://stackoverflow.com/a/45129760/9935654
[Does JavaScript have the interface type (such as Java's 'interface')?]: https://stackoverflow.com/a/3710367/9935654
[Is it possible to copy a canvas image to the clipboard?]: https://stackoverflow.com/a/59462270/9935654
[How to check if two arrays are equal with JavaScript?]: https://stackoverflow.com/a/10316616/9935654
[Skip arguments in a JavaScript function]: https://stackoverflow.com/a/68381118/9935654
[HTML5 Canvas set z-index]: https://stackoverflow.com/a/26064753/9935654
[setting background image to dynamic svg data?]: https://stackoverflow.com/a/25357859/9935654
[Drawing a grid on canvas]: https://codereview.stackexchange.com/a/135207/210612
[Get width/height of SVG element]: https://stackoverflow.com/a/24649456/9935654
[How to fill the whole canvas with specific color?]: https://stackoverflow.com/a/27736313/9935654
[Download data URL file]: https://stackoverflow.com/a/15832662/9935654
[How to create and export svg to png/jpeg in golang]: https://stackoverflow.com/q/42993407/9935654
[Capture HTML Canvas as gif/jpg/png/pdf?]: https://stackoverflow.com/a/68398009/9935654
[Drawing an SVG file on a HTML5 canvas]: https://stackoverflow.com/a/3769883/9935654
[What's the most elegant way to cap a number to a segment?]: https://stackoverflow.com/q/11409895/9935654
[Simulation background-size: cover in canvas]: https://stackoverflow.com/a/68440381/9935654
[Unable to trigger chrome.browserAction.onClicked.addListener with google chrome extensions]: https://stackoverflow.com/a/18767589/9935654
[What's the best way to query an array in javascript to get just the items from it I want?]: https://stackoverflow.com/a/57867012/9935654
[Pop-Up Window, Center Screen]: https://stackoverflow.com/a/68456858/9935654
[Prevent HTML5 video from being downloaded (right-click saved)?]: https://stackoverflow.com/q/9756837/9935654
[Play video blob into Canvas]: https://stackoverflow.com/a/61074147/9935654
[Resize image with javascript canvas (smoothly)]: https://stackoverflow.com/q/19262141/9935654
[What is the JavaScript version of sleep()?]: https://stackoverflow.com/a/58935320/9935654
[ES6 import error handling]: https://stackoverflow.com/a/68472702/9935654
[What is a blob URL and why it is used?]: https://stackoverflow.com/a/30881444/9935654
[How do we download a blob url video]: https://stackoverflow.com/q/42901942/9935654
[How do you remove a method from a javascript type]: https://stackoverflow.com/a/6813819/9935654
[Display browser console in HTML page]: https://stackoverflow.com/a/68502319/9935654
[Display Git diff on client side in javascript as html]: https://stackoverflow.com/q/28130861/9935654
[Make AudioBufferSourceNode the audio source of an <audio> tag?]: https://stackoverflow.com/q/57302931/9935654
[Convert HTML5 Canvas Sequence to a Video File]: https://stackoverflow.com/a/68521648/9935654
[Switch current tab from notification in Google Chrome extension]: https://stackoverflow.com/a/7223911/9935654
[How do I delete an extension in my Chrome developer dashboard?]: https://stackoverflow.com/q/31233063/9935654
[JavaScript set object key by variable]: https://stackoverflow.com/q/11508463/9935654
[Cannot create DocumentFragment storing td, tr or th?]: https://stackoverflow.com/a/43112816/9935654
[How to specify max-height css property to Screen size]: https://stackoverflow.com/q/20488298/9935654
[How to execute an arithmetic operation inside a string in Javascript?]: https://stackoverflow.com/q/16635104/9935654
[How to sort strings in JavaScript]: https://stackoverflow.com/a/51169/9935654
[How to get value of selected radio button?]: https://stackoverflow.com/a/15839451/9935654
[Why am I getting “Failed to load extension. Invalid value for 'content_security_policy'”?]: https://stackoverflow.com/a/68395991/9935654
[Equation (expression) parser with precedence?]: https://stackoverflow.com/a/114961/9935654
[access object property from object method in javascript]: https://stackoverflow.com/a/68558690/9935654
[Sorting object property by values]: https://stackoverflow.com/a/37607084/9935654
[What is the difference between String.slice and String.substring?]: https://stackoverflow.com/q/2243824/9935654
[checking for typeof error in JS]: https://stackoverflow.com/a/8114531/9935654
[How to close the current extension tab?]: https://stackoverflow.com/a/8114531/9935654
[chrome.scripting.executeScript not working in my manifest v3 Chrome Extension]: https://stackoverflow.com/q/66772626/9935654
[Chrome extension: How to open a link in new tab?]: https://stackoverflow.com/a/16504563/9935654
[onclick or inline script isn't working in extension]: https://stackoverflow.com/q/13591983/9935654
[Adding JavaScript type hints for VSCode/Monaco Intellisence]: https://stackoverflow.com/a/39694501/9935654
[HTML dataset - how to put object? data-x={}]: https://stackoverflow.com/q/58786227/9935654
[Why is 4 not an instance of Number?]: https://stackoverflow.com/q/472418/9935654
[Return positions of a regex match() in Javascript?]: https://stackoverflow.com/a/62824256/9935654
[what is the key code for shift+tab?]: https://stackoverflow.com/a/49801584/9935654
[Scroll to bottom of div?]: https://stackoverflow.com/a/270628/9935654
[How to execute somethnig finally in Javascript swich-case statement?]: https://stackoverflow.com/a/23902149/9935654
[Format JavaScript date as yyyy-mm-dd]: https://stackoverflow.com/a/63490548/9935654
[querySelectorAll with multiple conditions]: https://stackoverflow.com/a/34001943/9935654
[Changing image size in Markdown]: https://stackoverflow.com/a/21242579/9935654
[indexOf method in an object array?]: https://stackoverflow.com/a/48701766/9935654
[Execute Script of Chrome extension only once]: https://stackoverflow.com/q/42988533/9935654
[Change text from “Submit” on input tag]: https://stackoverflow.com/a/14007619/9935654
[Failed to execute 'createObjectURL' on 'URL':]: https://stackoverflow.com/a/33759534/9935654
[Why is the 'ended' event not firing for this MediaStreamTrack?]: https://stackoverflow.com/q/55953038/9935654
[How to listen for “Stop sharing” click in Chrome DesktopCapture API]: https://stackoverflow.com/a/57628307/9935654
[ffmpeg -i input.webm -c copy output.mp4]: https://stackoverflow.com/a/60443156/9935654
[Is it possible to use the MediaRecorder API with html5 video?]: https://stackoverflow.com/q/52720894/9935654
[how to use ffmpeg to merge WebM audio (Opus) and MP4 video (H.264) into one MP4 file]: https://stackoverflow.com/q/61777314/9935654
[How to do something before on submit?]: https://stackoverflow.com/a/8053433/9935654
[How to escape HTML]: https://stackoverflow.com/a/22706073/9935654
[Chrome Extensions creating a .html page accessible by clicking browser action.]: https://stackoverflow.com/a/35837065/9935654
[Include another HTML file in a HTML file]: https://stackoverflow.com/q/8988855/9935654
[How to get the value from the GET parameters?]: https://stackoverflow.com/a/979995/9935654
[What's the difference between HTML 'hidden' and 'aria-hidden' attributes?]: https://stackoverflow.com/q/31107040/9935654
[Get the current URL with JavaScript?]: https://stackoverflow.com/q/1034621/9935654
[Redirecting to a relative URL in JavaScript]: https://stackoverflow.com/a/1655081/9935654
[Internationalization of HTML pages for my Google Chrome Extension]:https://stackoverflow.com/q/25467009/9935654
[Get File Name and Parent Folder of URL]: https://stackoverflow.com/a/29212194/9935654
[How to dynamically change a web page's title?]: https://stackoverflow.com/q/413439/9935654
[How do I convert a video to GIF using ffmpeg, with reasonable quality?]: https://superuser.com/a/556031/1093221
[Font-awesome, input type 'submit']: https://stackoverflow.com/q/11686007/9935654
[drag drop files into standard html file input]: https://stackoverflow.com/a/38968948/9935654
[How can I serialize an input File object to JSON?]: https://stackoverflow.com/a/29281243/9935654
[How to import a JSON file in ECMAScript 6?]: https://stackoverflow.com/a/68593192/9935654
[How to load data from a CSV file in D3 v5]: https://stackoverflow.com/a/49604124/9935654
[Parse Uploaded CSV file using D3.js]: https://stackoverflow.com/q/36079390/9935654
[How to change the style of the title attribute inside an anchor tag?]: https://stackoverflow.com/q/2011142/9935654
[How to generate thumbnail images of HTML pages]: https://stackoverflow.com/q/16325655/9935654
[How to use Google Chrome Thumbnails preview service?]: https://stackoverflow.com/q/8288753/9935654
[How to add image to canvas]: https://stackoverflow.com/a/69129828/9935654
[How to crop canvas.toDataURL]: https://stackoverflow.com/a/69129574/9935654
[Using HTML5/Canvas/JavaScript to take in-browser screenshots]: https://stackoverflow.com/q/4912092/9935654
[Ways to see a list of all the tabs open in Chrome?]: https://superuser.com/q/290758/1093221
[Displaying a custom animation at the click location on Windows 10 in response to an event]: https://superuser.com/a/1428517/1093221
[Cutting the videos based on start and end time using ffmpeg]: https://stackoverflow.com/a/58059148/9935654
[Add audio to video using FFmpeg]: https://superuser.com/a/590210/1093221
[Python convert mp3 to wav with Pydub]: https://stackoverflow.com/a/32073824/9935654
[Chrome Extension Message passing: response not sent]: https://stackoverflow.com/a/20077854/9935654
["Cannot read property of undefined" when using chrome.tabs or other chrome API in content script]: https://stackoverflow.com/q/15034859/9935654
[What does "http://*/*", "https://*/*" and "<all_urls>" mean in the context of Chrome extension's permissions]: https://stackoverflow.com/q/16096482/9935654
[How do I find out if connectNative failed or succeeded]: https://stackoverflow.com/a/43321860/9935654
[How can I read from standard input in the console?]: https://stackoverflow.com/q/20895552/9935654
[How to print struct variables in console?]: https://stackoverflow.com/a/64837458/9935654
[Ways to see a list of all the tabs open in Chrome?]: https://superuser.com/q/290758/1093221
[Start an external application from a Google Chrome Extension?]: https://stackoverflow.com/a/69188382/9935654
[What does the w flag mean when passed in via the ldflags option to the go command?]: https://stackoverflow.com/q/22267189/9935654
[robocopy transfer file and not folder]: https://serverfault.com/a/52986/834510
[Replace parent element with its contents]: https://stackoverflow.com/q/12003458/9935654
[How do I get all h1,h2,h3 etc elements in javascript?]: https://stackoverflow.com/a/7065574/9935654
[Is there a JavaScript solution to generating a "table of contents" for a page?]: https://stackoverflow.com/q/187619/9935654
[Can I use a SVG toolbar icon?]: https://stackoverflow.com/q/53645087/9935654
[Method to convert HTML5 canvas to SVG?]: https://stackoverflow.com/q/8571294/9935654
[Checking if browser is in fullscreen]: https://stackoverflow.com/q/2863351/9935654
[SVG Favicon Not Working]: https://stackoverflow.com/q/34446050/9935654
[How to view file diff in git before commit]: https://stackoverflow.com/q/10039747/9935654
[Where can I find the source code of gitk?]: https://stackoverflow.com/q/8738268/9935654
[RGB to hex and hex to RGB]: https://stackoverflow.com/a/69353003/9935654
[How do I check that a number is float or integer?]: https://stackoverflow.com/a/20779354/9935654
[Convert character to ASCII code in JavaScript]: https://stackoverflow.com/a/9539389/9935654
[How can I test if a letter in a string is uppercase or lowercase using JavaScript?]: https://stackoverflow.com/a/36193845/9935654
[How to get selected word when double-click on div, p, span?]: https://stackoverflow.com/q/2281426/9935654
[Get current clipboard content?]: https://stackoverflow.com/a/49886460/9935654
[Move mouse pointer in JavaScript]: https://stackoverflow.com/a/2322613/9935654
[How to JsDoc a "mixed" type?]: https://stackoverflow.com/a/6778666/9935654
[Why is document.execCommand("paste") not working in Google Chrome?]: https://stackoverflow.com/a/53448633/9935654
[JavaScript get clipboard data on paste event (Cross browser)]: https://stackoverflow.com/a/19269040/9935654
[JavaScript: filter() for Objects]: https://stackoverflow.com/a/62400741/9935654
[How to add stroke/outline to transparent PNG image in JavaScript canvas]: https://stackoverflow.com/a/24091727/9935654
[Display image through html image element object]: https://stackoverflow.com/a/69460908/9935654
[highlight all text in textarea]: https://stackoverflow.com/a/69474896/9935654
[How to exit from setInterval]: https://stackoverflow.com/a/55932398/9935654
[Can Read-Only Properties be Implemented in Pure JavaScript?]: https://stackoverflow.com/q/366047/9935654
[How to combine WebM and Opus to generate MP4?]: https://superuser.com/a/873488/1093221
[Transposing a 2D-array in JavaScript]: https://stackoverflow.com/a/46805290/9935654
[Display JSON data on a page as a expandable/collapsible list]: https://stackoverflow.com/q/32549518/9935654
[How can I check if an object is an array?]: https://stackoverflow.com/a/4775737/9935654
[How to use endsWith with multiple values?]: https://stackoverflow.com/a/63881247/9935654
[Display JSON data on a page as a expandable/collapsible list]: https://stackoverflow.com/a/61554263/9935654
[Can I use ES6's arrow function syntax with generators? (arrow notation)]: https://stackoverflow.com/q/27661306/9935654
[How to create an array containing 1...N]: https://stackoverflow.com/a/64565184/9935654
[How do I make JavaScript Object using a variable String to define the class name?]: https://stackoverflow.com/q/1366127/9935654
[Check if variable holds File or Blob]: https://stackoverflow.com/a/47542679/9935654
[Where can I find a pre-populated json file for testing?]: http://mysafeinfo.com/api/data?list=englishmonarchs&format=json
[Add text before or after an HTML element]: https://stackoverflow.com/a/51290817/9935654
[Call a function after leaving input field]: https://stackoverflow.com/a/68428116/9935654
[How do you clear the focus in javascript?]: https://stackoverflow.com/a/56899483/9935654
[contenteditable change events]: https://stackoverflow.com/a/69612383/9935654
[How could I pass a dynamic set of arguments to Go's command exec.Command?]: https://stackoverflow.com/q/22781788/9935654
[Is it possible to search for a particular filename on GitHub?]: https://stackoverflow.com/a/61471327/9935654
[JS how to cache a variable]: https://stackoverflow.com/a/14266748/9935654
[What is "export default" in JavaScript?]: https://stackoverflow.com/a/43951115/9935654
[Difference between DOMContentLoaded and load events]: https://stackoverflow.com/q/2414750/9935654
[Limit how many times an event listener can trigger every second]: https://stackoverflow.com/a/14667039/9935654
[how to use scrollspy without using bootstrap]: https://stackoverflow.com/a/69749621/9935654
[Get the size of the screen, current web page and browser window]: https://stackoverflow.com/a/66916515/9935654
[How to fade in a HTML5 dialog?]: https://stackoverflow.com/a/69794684/9935654
[SVG stroke-width not working]: https://stackoverflow.com/a/42518803/9935654
[Show file in Windows Explorer using Go?]: https://stackoverflow.com/q/32173871/9935654
[How to ask for administer privileges on Windows with Go]: https://stackoverflow.com/a/31561120/9935654
[What does %~d0 mean in a Windows batch file?]: https://stackoverflow.com/a/12484802/9935654
[Something like a function/method in batch files?]: https://stackoverflow.com/a/69850776/9935654
[How to check if value is in range of cells?]: https://webapps.stackexchange.com/a/57027/215029
[How to clear history of text input]: https://stackoverflow.com/a/69446864/9935654
[Javascript to convert Markdown/Textile to HTML (and, ideally, back to Markdown/Textile)]: https://stackoverflow.com/q/1319657/9935654
[Get the value of checked checkbox?]: https://stackoverflow.com/a/69907839/9935654
[html input field using regex to get rid of invalid characters for filename]: https://stackoverflow.com/a/34174664/9935654
[Searching validityState for values]: https://stackoverflow.com/a/40238616/9935654
[HTML5 form required attribute. Set custom validation message?]: https://stackoverflow.com/a/69912121/9935654
[Delay HTML5 :invalid pseudo-class until the first event]: https://stackoverflow.com/a/48144022/9935654
[How to have multiple colors in a Windows batch file?]: https://stackoverflow.com/a/69924820/9935654
[Batch syntax highlighting]: https://meta.stackoverflow.com/q/299831/9935654
[Real mouse position in canvas]: https://stackoverflow.com/a/33063222/9935654
[.attr vs .classed in D3.js]: https://stackoverflow.com/a/44224276/9935654
[how to draw svg polygon on the points of mouse click position]: https://stackoverflow.com/a/54176883/9935654
[SVG fill color transparency / alpha?]: https://stackoverflow.com/a/66107433/9935654
[Array.from vs Array.prototype.map]: https://stackoverflow.com/q/26052699/9935654
[Javascript library d3 call function]: https://stackoverflow.com/a/63468824/9935654
[SVG: text inside rect]: https://stackoverflow.com/a/57567670/9935654
[remove last characters string batch]: https://stackoverflow.com/a/29504225/9935654
[Get protocol, domain, and port from URL]: https://stackoverflow.com/a/6941653/9935654
[How to display images inline]: https://stackoverflow.com/q/12394866/9935654
[How do I get glyph outlines of a letter as bézier paths using JavaScript?]: https://stackoverflow.com/a/19057523/9935654
[SVG icon in PWA manifest.json - how to set it for all sizes?]: https://stackoverflow.com/q/62825490/9935654
[apple touch icon svg support]: https://stackoverflow.com/a/25079463/9935654
[Whether all icon sizes can be used when using SVG in PWA manifest]: https://stackoverflow.com/a/66957279/9935654
[Get the last item in an array]: https://stackoverflow.com/a/3216041/9935654
[DOMException on calling navigator.clipboard.readText()]: https://stackoverflow.com/a/61216014/9935654
[How can I export GitHub issues to Excel?]: https://stackoverflow.com/a/45953812/9935654
[How to set "aggregate column a" with setOptions]: https://stackoverflow.com/a/50745042/9935654
[How do I zip two arrays in JavaScript?]: https://stackoverflow.com/a/22015930/9935654
[How to solve TypeError: d3.time is undefined?]: https://stackoverflow.com/a/39370458/9935654
[How to access new 'in-cell-image' from google apps script?]: https://stackoverflow.com/a/68156030/9935654
[D3.js: Trying to build flat calendar]: https://stackoverflow.com/q/23417626/9935654
[vertical text in d3 (not rotated)]: https://stackoverflow.com/a/22085843/9935654
[Custom Google Spreadsheet/Sheets toolbar]: https://stackoverflow.com/q/22376101/9935654
[How to set Hours,minutes,seconds to Date which is in GMT]: https://stackoverflow.com/a/40378100/9935654
[Find the element before and after a specific element with pure javascript]: https://stackoverflow.com/a/11475290/9935654
[Is it possible to alter a CSS stylesheet using JavaScript? (NOT the style of an object, but the stylesheet itself)]: https://stackoverflow.com/a/38133146/9935654
[How can I choose a legible color to draw text on a bar in a d3js chart?]: https://stackoverflow.com/a/30781850/9935654
[Calculating contrasting colours in javascript]: https://stackoverflow.com/a/70360753/9935654
[Regular expression for floating point numbers]: https://stackoverflow.com/a/12643073/9935654
[How to center a checkbox in a table cell?]: https://stackoverflow.com/a/5048620/9935654
[Placing border inside of div and not on its edge]: https://stackoverflow.com/a/52319334/9935654
[create fonts subset using opentype.js getting "OTS parsing error: cmap: Failed to parse table" error]: https://stackoverflow.com/a/56901822/9935654
[SVG - click is not a function]: https://stackoverflow.com/a/59787804/9935654
[HTML5 input type range show range value]: https://stackoverflow.com/a/18936328/9935654
[How to get client's IP address using JavaScript?]: https://stackoverflow.com/a/35123097/9935654
[Mongodb-go-driver interface conversion: interface {} is primitive.ObjectID, not primitive.ObjectID (types from different packages)]: https://stackoverflow.com/a/55779348/9935654
[golang: return a pointer or pass a reference]: https://stackoverflow.com/a/44827311/9935654
[In mongodb-go-driver, how to marshal/unmarshal BSON in to a struct]: https://stackoverflow.com/q/51577388/9935654
[How to extract the hostname portion of a URL in JavaScript]: https://stackoverflow.com/a/44272047/9935654
[Calculate a percent with SCSS/SASS]: https://stackoverflow.com/a/61829411/9935654
[SVG path to create triangle with rounded corners]: https://stackoverflow.com/a/46711374/9935654
[HTML5 Audio stop function]: https://stackoverflow.com/a/14836099/9935654
[Html 5 audio tag custom controls?]: https://stackoverflow.com/a/64012853/9935654
[javascript slowly decrease volume of audio element]: https://stackoverflow.com/a/7942472/9935654
[javascript -Dynamic pagination pure Js]: https://stackoverflow.com/a/70705563/9935654
[Convert a 1D array to 2D array]: https://stackoverflow.com/a/22464838/9935654
[How to handle "Uncaught (in promise) DOMException: play() failed because the user didn't interact with the document first." on Desktop with Chrome 66?]: https://stackoverflow.com/a/68128950/9935654
[Can a Windows batch file determine its own file name?]: https://stackoverflow.com/a/33656038/9935654
[Can we use google analytics for Internal website?]: https://stackoverflow.com/q/25418879/9935654
[Batch File; List files in directory, only filenames?]: https://stackoverflow.com/a/59436956/9935654
[Golang https certificate error: remote error: tls: unknown certificate authority]: https://stackoverflow.com/q/49064937/9935654
[what's the proper file extension or abbr. for golang's text/template?]: https://stackoverflow.com/a/58416975/9935654
[ffmpeg - replace audio in video]: https://superuser.com/a/1137613/1093221
[Extracting substrings in Go]: https://stackoverflow.com/a/12313812/9935654
[Showing custom 404 error page with standard http package]: https://stackoverflow.com/a/10001309/9935654
[Set content of iframe]: https://stackoverflow.com/a/8322025/9935654
[iframe background image]: https://stackoverflow.com/a/1695619/9935654
[Run both HTTP and HTTPS in same program]: https://stackoverflow.com/q/26090301/9935654
[Using named matches from Go regex]: https://stackoverflow.com/a/20751656/9935654
[Convert string to integer type in Go?]: https://stackoverflow.com/a/47317150/9935654
[Defining Independent FlagSets in GoLang]: https://stackoverflow.com/a/24510031/9935654
[Generating the SHA hash of a string using golang]: https://stackoverflow.com/q/10701874/9935654
[Golang flag: Ignore missing flag and parse multiple duplicate flags]: https://stackoverflow.com/q/45487377/9935654
[How to run a makefile in Windows?]: https://stackoverflow.com/a/57042516/9935654
[Command line to remove an environment variable from the OS level configuration]: https://stackoverflow.com/a/13222794/9935654
[How to write loop in a Makefile?]: https://stackoverflow.com/a/71100371/9935654
[Docker cannot start on Windows]: https://stackoverflow.com/q/40459280/9935654
[How do I uninstall a Chocolatey package and all its dependencies?]: https://stackoverflow.com/q/39628638/9935654
[How can I clear the terminal screen in Go?]: https://stackoverflow.com/a/22896706/9935654
[How to delete border spacing in table]: https://stackoverflow.com/a/9947064/9935654
[Why is contenteditable not a style?]: https://stackoverflow.com/a/29227434/9935654
[Get the ID of an element where the class contains a given string]: https://stackoverflow.com/a/37191256/9935654
[colspan not working]: https://stackoverflow.com/q/4504253/9935654
[Get protocol, domain, and port from URL]: https://stackoverflow.com/a/26434126/9935654
[Adding options to select with javascript]: https://stackoverflow.com/a/55897321/9935654
[fade in and out on simple css tooltip]: https://stackoverflow.com/a/21138554/9935654
[CSS Variables and String concatenation]: https://stackoverflow.com/a/70575193/9935654
[Can I use HTML tags in the options for select elements?]: https://stackoverflow.com/q/11237807/9935654
[http://timestamp.verisign.com/scripts/timstamp.dll not available]: https://stackoverflow.com/a/9714864/9935654
[How can I set the default value for an HTML <select> element?]: https://stackoverflow.com/a/30525521/9935654
[Can I use a :before or :after pseudo-element on an input field?]: https://stackoverflow.com/a/4660434/9935654
[How can I see the size of a GitHub repository before cloning it?]: https://stackoverflow.com/a/66180640/9935654
[Encode URL in JavaScript?]: https://stackoverflow.com/a/332897/9935654
[How do I revert my changes to a git submodule?]: https://stackoverflow.com/a/59255586/9935654
[Setting HTTP headers]: https://stackoverflow.com/a/28754802/9935654
[How to disable right-click context-menu in JavaScript]: https://stackoverflow.com/a/16987577/9935654
[Mouse position inside autoscaled SVG]: https://stackoverflow.com/a/10298843/9935654
[Golang run on Windows without deal with the Firewall]: https://stackoverflow.com/a/66486551/9935654
[Hide titlebar on window hover in electron?]: https://stackoverflow.com/a/50584474/9935654
[How can I find all public comments for a Github user?]: https://stackoverflow.com/a/69700347/9935654
[Installing font and making Windows aware]: https://stackoverflow.com/a/59112398/9935654

{{< /table/bootstrap-table >}}


[golang使用webAssembly的方式]: https://zhuanlan.zhihu.com/p/64873683
[github.com/anymost/Go-WebAssembly]: https://github.com/anymost/Go-WebAssembly
[Bootstrap教學 - 利用HTML + CSS，完整編寫網站外觀示範]: https://www.youtube.com/watch?v=9X1graZtuPs
