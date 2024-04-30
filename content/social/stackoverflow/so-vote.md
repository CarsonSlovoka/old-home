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
[Default value in Go's method] |
[How to create new file using go script] |
[How to get the directory of the currently running file?] |
[How to add new methods to an existing type in Go?] |
[Rendering template.HTML directly into templates] |
[Stop goroutine execution on timeout] |
[What is the idiomatic Go equivalent of C's ternary operator?] | `c := map[bool]int{true: 1, false: 0} [5 > 4]` | go, ternary-operator
★[Golang Gin-Gonic Split Routes into Multiple Files] | \n- ``%userprofile%\AppData\Local\Temp\___go_build_*.exe``\n- ``%userprofile%\AppData\Local\Temp\___TestDemo*.exe`` |
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
[Trim string's suffix or extension?] | 可讀性比較高，但速度稍慢 `strings.TrimSuffix(basename, filepath.Ext(basename))` | go
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
[Switch current tab from notification in Google Chrome extension] | ``chrome.tabs.update(tabId, {highlighted: true})`` | google-chrome-extension
[How do I delete an extension in my Chrome developer dashboard?] | | google-chrome-extension
[JavaScript set object key by variable] | ``{ [yourKeyVariable]: someValueArray }`` | js
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
[Return positions of a regex match() in Javascript?] | ``[...str.matchAll(regexp)].forEach(match=>{})`` | js
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
[Get the current URL with JavaScript?] | ``window.location.host`` ● ``window.location.host`` ● ``window.location.pathnam`` | js
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
[What does "http://*/*", "https://*/*" and "<all_urls>" mean in the context of Chrome extension's permissions] | "<all_urls>" : ``matches any URL that starts with a permitted scheme (http:, https:, file:, ftp:, or chrome-extension`` | google-chrome-extension
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
[Checking if browser is in fullscreen] | 這可以判斷是否視窗還可以再放大(不是指全螢幕模式) `if (!window.screenTop && !window.screenY) {alert('Browser is in fullscreen')}` ， 如果您再找全螢幕可以參考[Fullscreen_API](https://developer.mozilla.org/en-US/docs/Web/API/Fullscreen_API) | js
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
[How to check if value is in range of cells?] | `=COUNTIF(A1:B7,"d")` d是否有在A1~B7之間 | google-spreadsheet
[How to clear history of text input] | `<form autocomplete="off">` 可以關閉紀錄的功能，但如果您只想要刪除某幾筆被記錄的資料，可以使用 delete或者試試shift+delete，即可刪除 | html
[Javascript to convert Markdown/Textile to HTML (and, ideally, back to Markdown/Textile)] | 推薦用[mmd](https://github.com/p01/mmd.js) | js,markdown
[Get the value of checked checkbox?] | `document.querySelector("#isDebugMode").checked`, `document.querySelector("#size:checked")?.value ?? defaultSize` | js
[html input field using regex to get rid of invalid characters for filename] | input使用pattern來控制輸入項符合檔名的規則 `pattern="[^\\/:\x22*?<>]+"` | html
[Searching validityState for values] |  `input.validity.{valueMissing, typeMismatch, patternMismatch,...}` | js
[HTML5 form required attribute. Set custom validation message?] | `oninvalid="this.setCustomValidity('Enter User Name Here')" oninput="this.setCustomValidity('')"` | html
[Delay HTML5 :invalid pseudo-class until the first event 在表單有invalid的css屬性時，不要在使用者都還沒有輸入的時候就顯示驗證錯誤] | `input:not(:placeholder-shown)` | html
[How to have multiple colors in a Windows batch file?] | | bat
[Batch syntax highlighting] | `lang-sh` | bat
[Real mouse position in canvas] | | canvas
[.attr vs .classed in D3.js] | 第二個參數 true:表示增加該屬性, false為移除該屬性 `.classed("my-selector", true)` | j3.js
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
[What is the correct format specifier to print error object in Go: %s or %v?] | | go
[Why error messages shouldn't end with a punctuation mark in Go?] | | go
[Deleting content of file without deleting the file in Golang] | `os.Truncate("/path/to/your/file/crop.csv", 0)` | go
[How do I move a frameless window in Electron without using -webkit-app-region] | `-webkit-app-region: drag;`, `-webkit-app-region: no-drag;` | electron
[How to hide pin to taskbar for an electron app] | | electron
[Anyway in Electron to remove the windows taskbar preview from my app?] | | electron
[How to run test cases in a specified file?] | `go test xxx_test.go -run "^TestDemo" -v`, `go test packageName` | go
[Encode / decode URLs] | `url.Parse("http://www.example.com")` | go
[Golang print string as an array of bytes] | `%v` 可以把個別的byte字元印出來, `%x`印出16進位 | go
[MD5 is 128 bits but why is it 32 characters?] | 所謂32字元指的是32個nibble (4 bits, 00-FF), 換句話說MD5共有32*4=128 bits, 他會等於16bytes 因為每一個bytes有8bits | md5
[How to convert byte array to string in Go] | `myString := string(myBytes[:])` | go
[Convert array to slice in Go] | `arr[:]  // arr is an array; arr[:] is the slice of all elements` | go
[How to get a MD5 hash from a string in Golang?] | 使用`%x` 或者 `hex.EncodeToString()` | go
[Is there no XOR operator for booleans in golang?] | `X xor Y -> (X or Y) && !(X & Y)` , 如果是boolean可以直接用`boolA != boolB`, 在go中xor運算可以用`^`來表示 | go
[How to use crypto/rc4] | 不能用相同的cipher來解，又另外新增一個 | | go, rc4
[How to write a struct as binary data to a file in golang?] | `f, err := os.Create("my.bin")` `err = binary.Write(f, binary.LittleEndian, data)` | go
[How to assign string to bytes array] | `name [4]byte` `copy(name[:], []byte("_typ"))` | go
[How to test panics?] |
[How do I compare strings in GoLang?] | 字串比較可能會有陷阱，從stdIn來的可能會多出`\n` | go
[How to find the type of an object in Go?] | `reflect.TypeOf(myVar).String()` | go
[How do I truncate and completely rewrite a file without having leading zeros?] | 1.清除資料 `f.Truncate(0)` 2.把指標的位子指到開始去`f.Seek(0,0)` | go
[Check if a process exists in go way] | `tasklist /?` | go, process
[How to compare Go errors] | | go
[Go XML Marshalling and the Root Element] | 如何自定義xml的根結點名稱 | go, xml
[What is most idiomatic way to create an iterator in Go?] | | go, iterator
[Detect windows version in Go] | `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion` | go, regedit
[How can I efficiently download a large file using Go?] | | go, download
[Build excluding test modules] | 會自動所有`_test.go`的文件，此外go.mod只是用來管理相關性與實際編譯無關(也就是如果您的go.mod有很多包，該包只在測試文件中所使用，go build時，也不會包含這些包進去) | go-build
[How to ignore a .go file in a module?] | `// +build exclude` | go, build
[Why do I see an "Electron Security Warning" after updating my Electron project to the latest version?] | `process.env['ELECTRON_DISABLE_SECURITY_WARNINGS'] = 'true';` | go, electron
[How do you clear a slice in Go?] | set to `nil` | go, slice
[what is this bullet point <li> not showing up with circles?] | | css, html-lists
[Is there a method to generate a UUID with go language] | | go, uuid
[Go Golang to serve a specific html file] | `http.ServeFile(w, r, filePath)` | go, http
[What does go build build? (go build vs. go install)] | | go, build
[Cannot use type assertion on type parameter] | | go, generics
[If I fork someone else's private Github repo into my account, is it going to appear in my account as a public repo?] | | github, git
[How to get the current timestamp in other timezones in Golang?] | | go, time
[How to update hour, min, sec in golang time?] | `time.Now().UTC().Truncate(24*time.Hour)` | go, time
[Generating random numbers over a range in Go] | `rand.Seed(time.Now().UnixNano())` `rand.Intn(max - min) + min` | go, rand
[Subtracting time.Duration from time in Go] | 減一天 `now.AddDate(0, -1, 0)`  少10分鐘`now.Add(time.Duration(-10) * time.Minute)` | go, datetime
[How to use next available port in http.ListenAndServe] | `http.ListenAndServe(":0", nil)` | go, http, port
[How to search for an element in a golang slice] | | go, slice
[How to delete an element from a Slice in Golang] |
[Restricting to Single Instance of Executable with Golang] | 使用[kernel32.dll.CreateMutexW](https://docs.microsoft.com/en-us/windows/win32/api/synchapi/nf-synchapi-createmutexw) | go, windows, mutex
[Where does iTunes save iOS updates?] | itunes下載的更新檔會存放在此位置(win10) `%userprofile%\AppData\Local\Packages\AppleInc.iTunes_nzyj5cx40ttqa\LocalCache\Roaming\Apple Computer\iTunes\iPhone Software Updates` | iphone, itunes
[Win32Api - Window Name Property] | [GetWindowText](https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getwindowtextw) | winApi
[Function type cannot have type parameters] | `type Iterator[T any] interface {}` | go, generics
[Generic Structs with Go] | `type Model[T any] struct { Data []T }` `func (m *Model[T]) Push(item T) {}` | go, generics
[Call a Struct and its Method by name in Go?] | `reflect.ValueOf(any).MethodByName(name).Call(inputs)` | go, go-reflect
[Go failing - expected 'package', found 'EOF'] | 只要再存檔一次就可以了 (您也可以先做fmt之後再保存) | go, eof
[What's the difference between *uint and uintptr in Golang?] | | go, pointers
[is it possible to call overridden method from parent struct in Golang?] | | go, inheritance, oop, overriding
[Sizeof struct in Go] | | go, struct, size
[How to hide command prompt window when using Exec in Golang?] | | go, windows, command-line, system-cals
[Golang get system language] | go, internationalization
[How to delete self (executable file) in Windows?] | | go, exe
[get_video_info YouTube endpoint suddenly returning 404 not found] | | youtube, youtube-api
[How to handle i18n in Go?] | | go, i18n
[What does !default in a css property value mean?] | 這是sass特有的產物，當編譯到此變數時，如果該變數還是`null`或者沒有定義，就會使用當前`!default`的數值來設定它，否則就使用已經編譯的變數當成此數值 | sass
[Using uppercase, dashes or underscores when naming css selectors] |
[How can I define a struct field in my interface as a type constraint (type T has no field or method)?] | 為什麼沒辦法直接用泛型來存取成員內容 (日後可能會實現1.20之後了...) | go, generics, field
[calling functions + setTimeout instead of setInterval] | `(function myFunc(arg1, {}){ setTimeout(myFunc(), 100, arg1, {}})(arg1, {}))` | javascript, interval, timeout
[Regex not operator] | [^abc] not `a` or `b` or `c` | | regex, operators
[What do 'lazy' and 'greedy' mean in the context of regular expressions?] | 所謂lazy就是指在quantifier最後再補上一個`?`讓它只要一旦找到就停止
[Are HTTP cookies port specific?] | | cookies, http
[Control the mouse and keyboard Golang?] | [robotgo] | go, mouse
[How do I downgrade a Chocolatey package?] | `choco install virtualbox --version 4.3.26 --force` | chocolatey
[mingw-w64 threads: posix vs win32] | | windows, gcc, pthreads, mingw
[What is difference between sjlj vs dwarf vs seh?] | | c++, compiler-construction, mingw, cpu-architecture, mingw-w64
[Go template name] | `new(template.Template).Parse()` | go, go-templates
[Is there some elegant way to pause and resume any other goroutine?] | | go, channel, goroutine
[Different ways to pass channels as arguments in function] | 當參數不特別用箭號，代表此參數有可能是讀取或者寫入該channel，因此使用箭號是比較好的方式 | concurrency, go, channel
[Why isn't MessageBox TopMost?] | 如果預設是top most就會發生阻塞，使用者一定要回覆才可以繼續 | messagebox, topmost
[How to replicate do while in go?] | 使用`for{ if break}` 來代替do-while | for-loop, go, while-loop
[IP Address Mismatch on signing into Heroku CLI] |
[Is there a minimum sleep for free heroku dyno?] | | heroku
[What does bash -s do?] | -s 的使用時機通常是 `curl -L https://chef.io/chef/install.sh | bash -s -- -P abc` 代表直接讀取install.sh並且可以接受位置參數，其中的`--`表示後面的所有東西{`-P`, `abc`}都是參數，而不是指令的可選項，這個例子中傳入給install.sh中有兩個參數`$1: -P`, `$2: abc` | bash, ubuntu, terminal
[Delete all messages from a channel using Discord] | | go, discord
[How do I reverse a slice in go?] | | go, slice
[Cancelling a net.Listener via Context in Golang] | | go, tcp
[In Go, how do I capture stdout of a function into a string?] | | go, stdout
[Using a for-loop or sleeping to wait for short intervals of time] | | performance, for-loop
[How to set environment variables that last] | | go, environment-variables
[How to use SVG as PWA icon?] | | svg, progressive-web-apps
[PWA on Github pages] | | github-pages, progressive-web-apps
[What are Go example functions?] | https://go.dev/blog/examples | go, testing
[Golang tests in sub-directory] | `go test ./...` 會自動測所有東西 | go, unit-testing
[Running actions in another directory] | 在default統一設定工作路徑即可 | github, github-actions
[How use update function of mongo-go-driver using struct] | | go, mongodb, driver, crud
[Why am I getting ImportError: No module named pip ' right after installing pip?] | 要編輯pth檔案，補上`Lib\site-packages` | python, windows, pip
[easy way to unzip file with golang] | | go, zip, unzip
[Reading a file line by line in Go] | | go, file, parsing, line
[context - WithDeadline() vs WithTimeout()] | | go, channel, goroutine
[Select arrow style change] | `-webkit-appearance: none;` 可以取消掉預設的select右方的小三角形 | css, select
[7-Zip command to create and extract a password-protected ZIP file on Windows?] | | windows, 7zip, encryption
[default select option as blank] | ` <option disabled selected value> -- select an option -- </option>` | html
[Win32 resource file multiple translations] | `VALUE "Translation", 0x407, 1252, 0x409, 1252...` | resources
[How to suppress "error TS2533: Object is possibly 'null' or 'undefined'"?] | `document.querySelector("...")!.innerHTML` | typescript
[Human readable javascripts in chrome developer tools] | `在source的頁籤，點選大{}`
[Download a single folder or directory from a GitHub repo] | 使用 `.` 打開編輯器，之後再檔案總管右鍵可以選擇下載 | github
[Is the Heroku Git Repo Public?] | 是私有的，除非給于權限，否則只有作者有辦法取得到程式碼(git指令獲得), 但站點都是公開的，除了部屬到私有站例外 | heroku
[Can `tesseract-ocr` put the result to STDOUT?] | `tesseract input.jpg stdout` | tesseract
[Slice chunking in Go] | `for chunkSize < len(items) { items, chunks = items[chunkSize:], append(chunks, items[0:chunkSize:chunkSize])}` | go, chunking, slice
[Comments in .gitignore?] | `git help gitignore`。使用`#`可以註解 | git, comments, gitignore
[Go lang's equivalent of charCode() method of JavaScript] | [fmt.Println(strconv.FormatUint(uint64([]rune("𪷂")[0]), 16))](https://go.dev/play/p/SeFqptGCxGm) | go, unicode
[How to insert double and float values to sqlite?] | 使用`REAL` | sqlite
[How to remove a user from a MongoDB database] | `db.dropUser("guest")` | mongodb
[How to import DateTimeFormatOptions in] |
[How to add a link inside an svg circle] | `<a href="..." target="_blank"><circle></circle></a>` | svg, hyperlink
[How to declare Return Types for Functions in TypeScript] | `functionName() : ReturnType { ... }` | typescript
[Is there a "previous sibling" selector?] | `previous:has(+ next) {}` | css, css-selectors, siblings
[TypeScript 2.8.3 Type must have a Symbol.iterator method that returns an iterator] | tsconfig新增: `dom.iterable`
[Property 'files' does not exist on type 'EventTarget' error in typescript] | | typescript
[How to convert javascript unicode notation code to utf-8?] |
[Any better way to check endianness in Go] | | go, endianness
[Default value for typescript type alias] | | typescript, types, type-alias
[Define a list of optional keys for Typescript Record] | `const nameRecords: Partial<Record<"en" _ "ja", NameRecord>> = {}` 如此`{}`裡面的內容可以省略，不設定也行 | typescript, typescript-typings
[Declaring abstract method in TypeScript] | 使用abstract關鍵字 | typescript
[Is it possible to compile a single TypeScript file to an output path using the tsc command?] | `tsc --out final.js app.ts` | typescript, tsc
[Golang converting from rune to string] | https://go.dev/play/p/3Lzw91QbS_F | go, string, rune, unicode
[batch/bat to copy folder and content at once] | `robocopy [source] [destination] /E` | windows, copy, directory
[How can I use an ES6 import in Node.js?] | `require('http')` => `import * as Http from 'http'` | node.js, es6-modules
[Possible to merge or nest ES6 imports?] | 可以創建一個index.js，然後`export * from ""`把各個項目填入 | javascript, import, mergem, ecmascript-6
[How to make uglify and grunt index all imports and generate one single file] | `rollup --format es --input main.js -o bundle.js` | javascript, import, ecmascript-6
[Typescript - Cannot find module 'http' on Visual Studio Code] | `npm install @types/node` | typescript, node.js
[How to change node.js debug port?] | `node --inspect=7000 app.js` `node --inspect=127.0.0.1:7000 app.js` | node.js, debugging
[How to get GET (query string) variables in Express.js on Node.js?] | `const query = url.parse(request.url, true).query;` | node.js, query-string
[FindResource returns NULL when trying to load a font from resources] | 使用MFC添加字型資源: 1. 開始.rc2檔案，新增 IDF_XXX FONT "C:\\xxx\\my.ttf" 2. 於Resource.h新增該IDF_XXX的數值 3. 建置記得選得對的架構(x64) | winapi, embedded-resource
[LoadLibrary always return NULL] | 有可能您建置的應用程式的架構不相符，例如32要在64上跑就會出現問題，請確保它們的架構是一致的 | winapi, loadlibrary
[golang: winapi call with struct parameter] | | winapi, windows
[Any tool/software in windows for viewing ELF file format?] | | windows, assembly, elf
[Simple way to copy a file] | | winapi
[Is it possible to open a Windows Explorer window from PowerShell?] | `Invoke-Expression "explorer '/select,%userprofile%\.gitconfig'"` | powershell, explorer
[Save HBITMAP to *.bmp file using only Win32] | | winapi, hbitmap
[In Go, how can I convert a struct to a byte array?] | `(*(*[sz]byte)(unsafe.Pointer(&structValue)))[:]` | struct, go, byte, array
[How to append data on a file in win32] | | winapi, file
[golang: convert uint32 (or any built-in type) to byte (to be written in a file)] | `binary.LittleEndian.PutUint32(outputBytes, myUint32Val)` | arrays, go, byte, unsafe
[panic: SetUint using value obtained using unexported field] | 結構小寫的時候會導致: `SetUint using value obtained using unexported field` 不要用小寫名稱 | arrays, go
[Save HICON as a png] | | |
[Does anyone have a FileSystemWatcher-like class in C++/WinAPI?] | | |
[Load window icon dynamically] | | | winapi, icons
[C++ CreateWindowEx returns NULL] | | | winapi
[Why does len() returned a signed value?] | 先轉uintptr再轉過去，例如 `int16(uintptr(len(myObj)))` | go, array, variable-length
[Loading icons with transparency to tray menu of application] | | |
[Setting WH_KEYBOARD hook fails with error 1428] | 如果要安裝全局鉤子(HOOK)，請用含有`LL`的型態，例如`WH_KEYBOARD_LL`，否則會遇到`Cannot set nonlocal hook without a module handle.`的錯誤 | winapi
[Best way to suspend low level hook (winapi)] | 1. Unhook 2. 跳過, 不要呼叫CallNextHookEx | winapi, hook
[how to use DrawText() to write text in a given window whose handle is known?] | | winapi, drawtext
[SendInput wrong Parameter] | SendInput wrong Parameter: `The parameter is incorrect.` 可能是最後一個參數大小傳錯了，他不是指整個的大小，而是單一大小 | winapi, sendinput
[Passing a string into SendInput() (C++)] | | winapi, sendinput
[change volume win32 c++] | | winapi, volume
[addEventListener on custom object] | | addEventListener
[Use requestAnimationFrame in a class] | 使用arrow function來取代 |
[How do you set focus to the HTML5 canvas element?] | `document.querySelector("canvas").focus()` | canvas, focus, javascript
[How to fetch (using Fetch API) only headers in Javascript, not the whole content?] | `fetch(url, {method: 'HEAD'})` | html5-audio
[Check if image exists on server using JavaScript?] | `fetch(url, {method: 'HEAD'})` | javascript
[Intellij Idea warning - "Promise returned is ignored" with aysnc/await] | 回傳值如果是Promise要不是使用await去接收，不然就是用then(或catch)得到最後的結果。如果都不處理就會有警告跑出來 | typescript, es6-promise
[TypeScript, bind multiple params to same type] | `function add<T extends string>(x: T: y:T):T` | typescript, generics
[How can you find the height of text on an HTML canvas?] | `ctx.measureText(text).fontBoundingBoxAscent + Descent`, `actualBoundingBoxAscent` | javascript, canvas
[Calling anonymous function in HTML] | `<button onclick="(()=>{})()"></button>` | html, annotations, javascript
[How to get a list of the name of every open window?] | EnumWindows | winapi
[Screen Capture Specific Window] | 沒辦法直接用hdc去畫，但我們可以直接利用整個desktopWindow，在把我們有興趣的hwnd的rect抓出來，在投射出來即可 | winapi, gdi
[win32: check if window is minimized] | [IsIconic](https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-isiconic?redirectedfrom=MSDN) | winapi
[What does __declspec(uuid(" ComObjectGUID ")) expand to?] |
[What is __declspec and when do I need to use it?] |
[Call COM object method from Go without CGo] |
[How to compare if two structs, slices or maps are equal?] | | go, go-reflect
[How to kill processes by name? (Win32 API)] | CreateToolhelp32Snapshot, OpenProcess, TerminateProcess, CloseHandle | winapi
[What is the equivalent to WinAPI in Linux and macOS?] | Linux API, Cocoa API
[Unknown compiler options include & exclude] | include, exclude不是compilerOptions的子項目 | typescript
[exclude subdirectories in tsconfig.json] | | typescript
[Why does the WinAPI use an int (32 bits) for the BOOL type?] | 以前的C沒有bool的型別，所以屬於歷史包袱 | winapi
[how to implement macros in Go?] | 可以使用const，或者使用code generation。 如果macro誕生，go的代碼可能會變得更難讀(很多炫技會出現) | go, macros
[NOTIFY ICON Click Win32 Api in c++] | 不建議使用`NOTIFYICONDATA.GuidItem`會有很多問題，可能會導致NIM_ADD失敗(這種方式會直接去寫註冊檔，應用程式路徑似乎也會一併影響，因此對於debug的程式名稱會一直異動也不適合用這個 | winapi, notifyIcon
[How to unmarshal an escaped JSON string] | 對於那些會自動補上`\`可能會導致go使用`json.Unmarshal`發生問題，這時候要先用`strconv.Unquote`把反斜線刪除即可 | go, json
[How to catch and deal with "WebSocket is already in CLOSING or CLOSED state" in Node] | `new WebSocket().readyState === ws.OPEN` | javascript, websocket
[Refused to display in a frame because it set 'X-Frame-Options' to 'SAMEORIGIN'] | 可以試試看最後面補上`&output=embed`或者`'&embedded=true`| iframe
[Overcoming "Display forbidden by X-Frame-Options"] | | iframe
[How to set 'X-Frame-Options' on iframe?] | https://github.com/MicrosoftEdge/WebView2Feedback/issues/1243 | iframe
[What is the maximum length of a URL in different browsers?] | 建議用2000左右 | url
[ES6: import module from URL] | | javascript, ecmascript-6, es6-modules, es6-module-loader
[How to link files directly from Github (raw.github.com)] | 建立一個github page來導入，raw(blob)沒有辦法做到，他的回傳是`Content-Type: text/plain`，而非`text/javascript` | github, es6-modules
[How to test a local bot?] | ngrok | localhost
[Closed channel vs nil channel] | | go, channel
[Detecting a mobile browser] | navigator.userAgent | javascript, userAgent
[How to generate a stream of *unique* random numbers in Go using the standard library] | | go, random
[How to open the default web browser in Windows in C?] | `ShellExecute(NULL, "open", "http://url", NULL, NULL, SW_SHOWNORMAL)` | C, windows, winapi
[how to get return value of an exe called by ShellExecute] | 使用ShellExecuteEx, GetExitCodeProcess | winapi, shellExecute
[Pretty printing XML with javascript] | | javascript, xml, pretty-print
[How can I merge two maps in go?] | | go, dictionary, union
[function for converting a struct to map in Golang] | 利用json.Marshal把obj轉成[]byte再餵入json.Unmarshal輸出使用map[string]any即可達成 | go, dictionary
[POST data using the Content-Type multipart/form-data] | | curl, go, file-upload, multipart
[How to get last-accessed date and time of file in Go?] | | go, last-modified
[How to avoid very large files] | 一定要補上`http.MaxBytesReader(w, r.Body, MaxAllowedSize)`, 只有`r.ParseMultipartForm(MaxAllowedSize)`還是無效 | go
[From io.Reader to string in Go] | `io.ReadAll(reader)` | go
[Read Exif Metadata with Go] | |
[Go doing a GET request and building the Querystring] | `request.URL.Query().Set("key", val)`
[Validating Google sign in ID token in Go] | | go, google-app-engine
[Google sign in website Error : Permission denied to generate login hint for target domain] | 使用`http://localhost:xxxx`而不是`http:127.0.0.1:xxxx` | google-oauth, google-signin, authentication
[Google: Permission denied to generate login hint for target domain NOT on localhost] | | google-signin
[Google API authentication: Not valid origin for the client] | |
[The given origin is not allowed for the given client ID (GSI)] | 記得是使用`http://localhost:xxxx`來測試，同時`http://localhost`, `http://localhost:xxxx`這兩個都要是google cloud的設定補上
[How can I verify a Google authentication API access token?] | `https://oauth2.googleapis.com/tokeninfo?id_token=XYZ123`
[Use golang to get RSA key the same way openssl genrsa] |
[Win32: Is it possible to show the window but to hide it from taskbar?] |
[Unable to attach event to an element in contextual fragment] | 使用DOMParser，不要使用fragment來處理(fragment會自動觸發一些項目，例如像嘗試去GET某些項目) `new DOMParser().parseFromString("<div>hello world</div>" , 'text/html')` | javascript, dom
[Decoding JWT in Google Apps Script] | `Utilities.newBlob(Utilities.base64Decode(body)).getDataAsString()` | google-apps-script, jwt
[How to solve "error: Microsoft Visual C++ 14.0 or greater is required" when installing Python packages?] | 需要安裝[Microsoft C++ Build Tools](https://visualstudio.microsoft.com/zh-hant/visual-cpp-build-tools/) | afdko, python
[powershell unable to find type Windows.UI.Notification] | [Generating Windows 10 Notifications With PowerShell](https://den.dev/blog/powershell-windows-notification/) | powershell
[What are the numbers in Tesseract box file?] | | tesseract, box
[Custom syntax highlighting in JetBrains IDE's] | | jetbrains, ide, syntax-highlighting
[Retrieve (Default) Value in Registry key] | `-Name "(default)"` | powershell
[What is the idiomatic way to slice an array relative to both of its ends?] | | arrays, powershell, slice
[Setting Windows PowerShell environment variables] | `[Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine)` | powershell, env
[Powershell alias not being set from script] | 要補上`-Scope Global`才會使的Description可以被看見
[Why are scripted cmdlets listed as functions?] | cmdlet指令應該與powershell一般函數是差不多的，不需要太糾結於Get-Command的CommandType是Function還是Cmdlet | powershell, powershell-cmdlet
[Import-StartLayout doesn't change anything] | `Import-StartLayout` 只會影響默認的設定 | powershell
[[bool]$backup = $true # $True, $False, 1, 0] | | bool, powershell
[How remove \n from lines] | `strings.TrimRight("", "\r\n")` | go, line
[How to get the Parent's parent directory in Powershell?] | | powershell, scripting, path
[How to use Invoke-RestMethod to upload jpg] | | powershell, file-upload
[What is the boundary in multipart/form-data?] | | http, forms
[Configure Windows PowerShell to display only the current folder name in the shell prompt] | | powershell
[Using PowerShell to write a file in UTF-8 without the BOM] | | powershell
[Powershell unable to find type \[System.Windows.Forms.KeyEventHandler\]] | | powershell
[Where can I see deno downloaded packages?] | `deno info` | deno
[Node.js' __dirname & __filename equivalent in Deno] | `path.dirname(path.fromFileUrl(import.meta.url))` | deno, path
[How to add a simple text label to an image in Go?] | | image, go, fonts, draw
[Best way to call an asynchronous function within map?] | `Promise.all` | javascript, asynchronous
[Get actual Font name of TTF file from Command Line] | | powershell, fonts
[Looping through a hash, or using an array in PowerShell] | `$myHashtable.GetEnumerator()` | powershell, hashtable, dictionary
[PowerShell Syntax Highlighting] | `lang-default` | powershell
[How to convert decimal to hexadecimal variable?] | `"{0:X}" -f <number or variable>` | powershell
[How to display Unicode character names and their hexadecimal codes with PowerShell?] | `[System.BitConverter]::ToUint32($utf32bytes)` 但是BitConverter不支援5.1 | Powershell, emoji, unicode, surrogate-pairs
[deno relative path issue] | | typescript, deno
[How do I create an HTML table with a fixed/frozen left column and a scrollable body?] | | html-table, css
[how to provide the date as filename using javascript?] | `new Date().toJSON().slice(0,10)` | filename, javascript
[How to get current working directory using vba?] | | vba
[Convert object array to hash map, indexed by an attribute value of the Object] | `array.reduce((acc, curValue), {})` | javascript, arrays, hashmap
[How to view code coverage as html for Flutter in Windows?] | `perl.exe myGenhtml.perl MyInput.lcov -o myOutputDirPath` | lcov, code-coverage
[Javascript - Copy string to clipboard as text/html] | | clipboard, javascript
[Powershell 7 Byte encoding an image file] | `$b64 = [convert]::ToBase64String((Get-Content $image_path -AsByteStream -Raw))` | powershell, encoding
[powershell max/first/aggregate functions] |　`(2,1,3 ｜ Measure -Max).Maximum` | powershell, math, max, min
[[How to find a desktop window (by window name) in Windows 8.1 Update 2 OS, using the Win32 API FindWindow() in PowerShell environment?]] | findwindow | powershell
[Does Go have standard Err variables?] | `var ErrSomethingBad = errors.New("some string")` | go, error
[To use local font in HTML using font face] |
[Save Image from clipboard using PowerShell] | `(Get-Clipboard -format image).save("c:\temp\temp.jpg")` | powershell, clipboard
[Windows Clipboard History - How to view the history from PowerShell] | | powershell, clipboard
[How to capture global keystrokes with PowerShell?] | | powershell, hotkeys
[KeyDown event listener seems to not work when button items are added to WinForm] | `$form.Add_KeyDown` | powershell
[Unable to find type \[Windows.Markup.XamlReader\]] | `Add-Type -Assembly PresentationFramework` | powershell
[Formatting PowerShell Get-Date inside string] | `"{0:yyyy-MM-dd hh:mm:ss}" -f (get-date)` | powershell, formatting, datetime
[Add padding to HTML text input field] | `padding-left: 10px;` | html, css, input
[Waiting for image to load in JavaScript] | `Promise.all(imageUrls.map(loadImage)).then(images => {` | javascript, image, load, wait
[Reading Image in Go] | image.Decode如果發生unknown format，可能是缺少import相關內容: `_ "image/jpeg" _ "image/png"` | go, image
[How do I blur a particular area of an image in HTML?] | |
[Is it possible to have multiple masks with clip-path?] | [clipPath](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/clipPath) | svg, clip-path
[Add SVG to HTML and handle events] | |
[Where is docker image location in Windows 10?] | | docker, docker-for-windows
[Determine the OS version, Linux and Windows from Powershell] | `$IsLinux`, `$IsMacOS`, `$IsWindows` | powershell, linux, windows, operation-system
[Use ffmpeg to add text subtitles] | 請下載[VLC撥放器](https://www.videolan.org/vlc/download-windows.html) 之後開啟字幕的軌道即可
[Does HTML5 Video support srt textTrack?] | 如果SRT不是很複雜，只要在SRT內容前面補上`WEBVTT`即可正常呈現 | webvtt, srt, subtitle
[How to create a \<style\> tag with Javascript?] | `const style = document.createElement("style"); style.textContent = "h1 { background-color: red; }";document.head.appendChild(style)` | html, css, javascript
[How to add external JS scripts to VueJS Components?] | `document.head.append` | javascript, vue.js
[How to convert \[4\]uint8 into uint32 in Go?] | `binary.BigEndian.Uint32(u8)` or `binary.LittleEndian.Uint32(u8)` | go, type-conversion
[How to enter a multi-line command] | 使用[grave accent](https://en.wikipedia.org/wiki/Grave_accent)(\`) 就可以將很長的指令換行寫 | powershell
[Add double quotes to variable to escape space] | `'"{0}"' -f $FilePath` | powershell
[Read/Parse Binary files with Powershell] | | parsing, powershell, binary
[Write bytes to a file natively in PowerShell] | Get-Content可以透過-ReadCount一次讀取幾行或全部(設定成0)來改善, Set-Content不要使用管道的方式，用-Value把值給他就可以變快 | powrshell
[How to get the captured groups from Select-String?] | 當您使用完`-match` 有自動產生一個 `$Matches` 變數來記錄匹配的內容 | powershell, regex
[flip svg coordinate system] | |
[CSS Variables (custom properties) in Pseudo-element "content" Property] | 使用[CSS Counters](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_counter_styles/Using_CSS_counters) `counter-reset: myVar1 var(--value, 1) myVarN var(--xxx);  content: counter(myVar1)` | css, pseudo-element, css-variables
[How to use the mouse wheel to zoom on an SVG using the viewBox] | `svg.onwheel`之後調整`viewbox`，取得滑鼠座標可以用`new DOMPoint(event.clientX, event.clientY).matrixTransform(svg.getScreenCTM().inverse())` | javascript, svg, zooming, viewbox
[YES/NO - is there a way to improve mouse dragging with pure SVG tools?] | 在`onmousedown`之中註冊`mousemove`, `mouseup`的事件，在mouseup之中撤銷註冊的`mousemove`和`mouseup`事件 | svg, drag, mouse
[How to change CSS :root color variables in JavaScript] | `document.querySelector(':root')` | javascript, html, css
[Why don't :before and :after pseudo elements work with `img` elements?] | img屬於[replaced element](https://stackoverflow.com/a/6949190/9935654)而偽元素只能適用在`non-replaced elements` | css, pseudo-element, css-content
[Is there a CSS parent selector?] | 可以使用[has](https://developer.mozilla.org/docs/Web/CSS/:has)來幫忙，例如`span:has(img)::after` | css, css-selectors
[Error: discord.errors.NotFound: 404 Not Found (error code: 10062): Unknown interaction discord.py when sending a gif in embed] | 如果你在debug的模式，隔太久就會視為消息傳送失敗，就會出現此訊息 | discord
[PowerShell's Clear-History doesn't clear history] | `Remove-Item (Get-PSReadlineOption).HistorySavePath` | powershell, history
[Getting the previous month's first date from current date in JavaScript] | 直接用Month去-1會有問題，如果它的Date是Date(2023, 10, 0)那麼是2023/10/31將Month-1之後是2023/10/1，所以在做之前我們先要把Date都設定為1
[matchMedia().addListener marked as deprecated, addEventListener equivalent?] |  `window.matchMedia('(max-width: 768px)').addEventListener("change", e=>{if(e.match){}})` | javascript, addeventlistener, matchmedia
[What’s the point of using the HTML5 <time> tag?] | | html, time, datetime
[Do not have permission to use setFormula Google appScript] | | google-apps-script, google-sheets, google-sheets-formula, custom-function
[OpenCV converts HSL to RGB] | | opencv, rg, hsl
[Using ffmpeg to create looping apng] | `ffmpeg -ss 16:43 -i ./10.mkv -plays 10 -t 1 -vf "setpts=PTS-STARTPTS, crop=1200:800, hqdn3d=1.5:1.5:6:6, scale=600:400"  10-file-2.apng` | apng, ffmpeg
[Difference between Uint8Array and Uint8ClampedArray] | 大同小異，差別在於溢位的處理, 有Clamped的版本，下溢用的是該型別的最小值(無Clamped的版本用取mod的方法求得)，上溢用的是該型別的最大值(無Clamped的版本直接截斷多出來的高位部分) | javascript, arrays, memory-management, clamp
[Linear Regression in Javascript] | | javascript, statistics, linear-regression
[Getting HTML form values] | `new FormData(e.target).get("myName")` | javascript, html, form
[Can I compare variable types with .(type) in Golang?] | `fmt.Sprintf("%T", a) == fmt.Sprintf("%T", b)` 等同用 `reflect.TypeOf(a) == reflect.TypeOf(b)}` | go, types
[How to pad a number with zeros when printing?] | `fmt.Printf("\|%06d\|%6d\|\n", 12, 345)` | go
[Constant struct in Go] | 不支援
[What is checkSumAdjustment in TTF/OTF head table used for?] | 請參考[Calculating Checksums](https://learn.microsoft.com/en-us/typography/opentype/spec/otff#calculating-checksums) | truetype, specifications, opentype
[Could not load library cudnn_cnn_infer64_8.dll. Error code 126] | | cudnn, tensorflow, python
[Proper way for casting uint16 to int16 in Go] | 不能直接指派，要先宣告一個uint16的變數，再宣告另一個int16的變數，指派給它 | go, bit-manipulation, uint16
[Go, encoding/xml: How can I marshal self-closing elements?] | | go, xml
[Convert float64 to byte array] | `binary.Write(&buf, binary.BigEndian, f)` | go, type-conversion
[image.Decode() unknown format] | | go, image
[WebP encoder/decoder in go] | | go, image, webp
[What is a "stale" git branch?] | git沒有stale這種東西，這個是github上面自己有的內容，如果該分支[超過3個月都沒有動靜](https://github.com/labstack/echo/branches/stale)，那麼[就會自動變成stale](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-branches-in-your-repository/viewing-branches-in-your-repository) | git, github
[Most idiomatic way to select elements from an array in Golang?] | `slices.DeleteFunc` | go, slices, arrays
[color input with transparency] | 使用prompt,dataset即可辦到 | html, css, colors, alpha
[What are passive event listeners?] | 不需要用到事件中如果不需要用到e.preventDefault()就加上passive: true | javascript, dom-events, event-listener
[How to create an array containing 1...N] | `_.range(1,N+1)` | jsBench.me, javascript
[How to type pinyin text with tone marks in Windows?] | | windows, pinyin
[UTF-8 range table in Go] | [unicode.In](https://pkg.go.dev/unicode#In) | go, unicode, utf-8
[Return default value for generic type] | `var result T` | go, generics, null
[How to get all selected values of a multiple select box?] | `[...select.options].filter(option => option.selected).map(option => option.value)` | javascript, html, html-select
[How can I get a channel ID from YouTube?] | 造訪頻道>簡介, 移動到最底下有一個分享頻道，裡面就可以取得到channelID | youtube, youtube-api
[How to change page results with YouTube Data API v3] | 它的`nextPageToken`或者`prevPageToken`的數值是放在query中的`pageToken`，當pageToken指定為該數值時就可以訪問到該頁面 | api, youtube, youtube-api

[Default value in Go's method]: https://stackoverflow.com/a/23650312/9935654
[How to create new file using go script]: https://stackoverflow.com/a/46749116/9935654
[How to get the directory of the currently running file?]: https://stackoverflow.com/a/53913521/9935654
[How to convert interface{} to string?]: https://stackoverflow.com/a/27158543/9935654
[How to add new methods to an existing type in Go?]: https://stackoverflow.com/a/28800807/9935654
[Rendering template.HTML directly into templates]: https://stackoverflow.com/a/21435808/9935654
[Stop goroutine execution on timeout]: https://stackoverflow.com/a/50579561/9935654
[What is the idiomatic Go equivalent of C's ternary operator?]: https://stackoverflow.com/a/59375088/9935654
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
[What is the correct format specifier to print error object in Go: %s or %v?]: https://stackoverflow.com/q/43887776/9935654
[Why error messages shouldn't end with a punctuation mark in Go?]: https://stackoverflow.com/a/68793833/9935654
[Deleting content of file without deleting the file in Golang]: https://stackoverflow.com/a/67090003/9935654
[How do I move a frameless window in Electron without using -webkit-app-region]: https://stackoverflow.com/a/53322904/9935654
[How to hide pin to taskbar for an electron app]: https://stackoverflow.com/q/54296178/9935654
[Anyway in Electron to remove the windows taskbar preview from my app?]: https://stackoverflow.com/a/69068737/9935654
[How to run test cases in a specified file?]: https://stackoverflow.com/q/16935965/9935654
[Encode / decode URLs]: https://stackoverflow.com/a/13826910/9935654
[Golang print string as an array of bytes]: https://stackoverflow.com/q/55959990/9935654
[MD5 is 128 bits but why is it 32 characters?]: https://stackoverflow.com/a/57881578/9935654
[How to convert byte array to string in Go]: https://stackoverflow.com/a/40673073/9935654
[Convert array to slice in Go]: https://stackoverflow.com/a/41425823/9935654
[How to get a MD5 hash from a string in Golang?]: https://stackoverflow.com/a/27942646/9935654
[Is there no XOR operator for booleans in golang?]: https://stackoverflow.com/a/23025720/9935654
[How to use crypto/rc4]: https://stackoverflow.com/a/63578677/9935654
[Insert a value in a slice at a given index]: https://stackoverflow.com/q/46128016/9935654
[How to write a struct as binary data to a file in golang?]: https://stackoverflow.com/a/60541927/9935654
[How to assign string to bytes array]: https://stackoverflow.com/a/39294665/9935654
[How to test panics?]: https://stackoverflow.com/a/62028796/9935654
[How do I compare strings in GoLang?]: https://stackoverflow.com/a/34383753/9935654
[How to find the type of an object in Go?]: https://stackoverflow.com/a/20170564/9935654
[How do I truncate and completely rewrite a file without having leading zeros?]: https://stackoverflow.com/a/44416790/9935654
[Check if a process exists in go way]: https://stackoverflow.com/q/15204162/9935654
[How to compare Go errors]: https://stackoverflow.com/a/61097650/9935654
[Go XML Marshalling and the Root Element]: https://stackoverflow.com/q/12398925/9935654
[What is most idiomatic way to create an iterator in Go?]: https://stackoverflow.com/q/14000534/9935654
[Detect windows version in Go]: https://stackoverflow.com/a/44376544/9935654
[How can I efficiently download a large file using Go?]: https://stackoverflow.com/a/33853856/9935654
[Build excluding test modules]: https://stackoverflow.com/q/65844499/9935654
[How to ignore a .go file in a module?]: https://stackoverflow.com/a/67650835/9935654
[Why do I see an "Electron Security Warning" after updating my Electron project to the latest version?]: https://stackoverflow.com/a/65107317/9935654
[How do you clear a slice in Go?]: https://stackoverflow.com/a/16973160/9935654
[what is this bullet point <li> not showing up with circles?]: https://stackoverflow.com/a/5491287/9935654
[Is there a method to generate a UUID with go language]: https://stackoverflow.com/a/25736155/9935654
[Go Golang to serve a specific html file]: https://stackoverflow.com/a/25945832/9935654
[What does go build build? (go build vs. go install)]: https://stackoverflow.com/a/30612612/9935654
[Cannot use type assertion on type parameter]: https://stackoverflow.com/a/71588125/9935654
[If I fork someone else's private Github repo into my account, is it going to appear in my account as a public repo?]: https://stackoverflow.com/a/68246412/9935654
[How to get the current timestamp in other timezones in Golang?]: https://stackoverflow.com/a/42136791/9935654
[How to update hour, min, sec in golang time?]: https://stackoverflow.com/a/67743086/9935654
[Generating random numbers over a range in Go]: https://stackoverflow.com/a/23577092/9935654
[Subtracting time.Duration from time in Go]: https://stackoverflow.com/q/26285735/9935654
[How to use next available port in http.ListenAndServe]: https://stackoverflow.com/q/43424787/9935654
[How to search for an element in a golang slice]: https://stackoverflow.com/a/38654444/9935654
[How to delete an element from a Slice in Golang]: https://stackoverflow.com/q/37334119/9935654
[Restricting to Single Instance of Executable with Golang]: https://stackoverflow.com/a/39547857/9935654
[Where does iTunes save iOS updates?]: https://apple.stackexchange.com/a/49406/403361
[Win32Api - Window Name Property]: https://stackoverflow.com/a/1523830/9935654
[Function type cannot have type parameters]: https://stackoverflow.com/q/64189810/9935654
[Generic Structs with Go]: https://stackoverflow.com/a/68166643/9935654
[Call a Struct and its Method by name in Go?]: https://stackoverflow.com/a/19721562/9935654
[Go failing - expected 'package', found 'EOF']: https://stackoverflow.com/a/58057305/9935654
[What's the difference between *uint and uintptr in Golang?]: https://stackoverflow.com/a/59042719/9935654
[is it possible to call overridden method from parent struct in Golang?]: https://stackoverflow.com/a/44796464/9935654
[Sizeof struct in Go]: https://stackoverflow.com/q/2113751/9935654
[How to hide command prompt window when using Exec in Golang?]: https://stackoverflow.com/q/42500570/9935654
[Golang get system language]: https://stackoverflow.com/a/64560642/9935654
[How to delete self (executable file) in Windows?]: https://stackoverflow.com/a/49146931/9935654
[get_video_info YouTube endpoint suddenly returning 404 not found]: https://stackoverflow.com/q/67615278/9935654
[How to handle i18n in Go?]: https://stackoverflow.com/q/7585362/9935654
[What does !default in a css property value mean?]: https://stackoverflow.com/a/60601751/9935654
[Using uppercase, dashes or underscores when naming css selectors]: https://stackoverflow.com/q/2345264/9935654
[How can I define a struct field in my interface as a type constraint (type T has no field or method)?]: https://stackoverflow.com/q/70358216/9935654
[calling functions + setTimeout instead of setInterval]: https://gist.github.com/sagarsane/3688474
[Regex not operator]: https://stackoverflow.com/a/7317087/9935654
[What do 'lazy' and 'greedy' mean in the context of regular expressions?]: https://stackoverflow.com/a/34806154/9935654
[Are HTTP cookies port specific?]: https://stackoverflow.com/q/1612177/9935654
[Control the mouse and keyboard Golang?]: https://stackoverflow.com/a/39971132/9935654
[How do I downgrade a Chocolatey package?]: https://stackoverflow.com/a/31256031/9935654
[mingw-w64 threads: posix vs win32]: https://stackoverflow.com/q/17242516/9935654
[What is difference between sjlj vs dwarf vs seh?]: https://stackoverflow.com/q/15670169/9935654
[Go template name]: https://stackoverflow.com/q/41176355/9935654
[Is there some elegant way to pause and resume any other goroutine?]: https://stackoverflow.com/a/16102304/9935654
[Different ways to pass channels as arguments in function]: https://stackoverflow.com/a/35759603/9935654
[Why isn't MessageBox TopMost?]: https://stackoverflow.com/a/16105626/9935654
[How to replicate do while in go?]: https://stackoverflow.com/a/42085121/9935654
[IP Address Mismatch on signing into Heroku CLI]: https://stackoverflow.com/a/70632778/9935654
[Is there a minimum sleep for free heroku dyno?]: https://stackoverflow.com/a/38942674/9935654
[What does bash -s do?]: https://stackoverflow.com/a/51854728/9935654
[Delete all messages from a channel using Discord]: https://stackoverflow.com/a/66147861/9935654
[How do I reverse a slice in go?]: https://stackoverflow.com/a/71904070/9935654
[Cancelling a net.Listener via Context in Golang]: https://stackoverflow.com/a/66755998/9935654
[In Go, how do I capture stdout of a function into a string?]: https://stackoverflow.com/a/29339052/9935654
[Using a for-loop or sleeping to wait for short intervals of time]: https://codereview.stackexchange.com/a/42508/210612
[How to set environment variables that last]: https://stackoverflow.com/q/24938877/9935654
[How to use SVG as PWA icon?]: https://stackoverflow.com/a/64428233/9935654
[PWA on Github pages]: https://stackoverflow.com/q/46228604/9935654
[What are Go example functions?]: https://stackoverflow.com/a/29141725/9935654
[Golang tests in sub-directory]: https://stackoverflow.com/a/21725603/9935654
[Running actions in another directory]: https://stackoverflow.com/a/70290016/9935654
[How use update function of mongo-go-driver using struct]: https://stackoverflow.com/a/59424834/9935654
[Why am I getting ImportError: No module named pip ' right after installing pip?]: https://stackoverflow.com/a/60829519/9935654
[easy way to unzip file with golang]: https://stackoverflow.com/a/65618964/9935654
[Reading a file line by line in Go]: https://stackoverflow.com/a/16615559/9935654
[context - WithDeadline() vs WithTimeout()]: https://stackoverflow.com/a/64327057/9935654
[Select arrow style change]: https://stackoverflow.com/q/14218307/9935654
[7-Zip command to create and extract a password-protected ZIP file on Windows?]: https://stackoverflow.com/a/28160425/9935654
[default select option as blank]: https://stackoverflow.com/a/23638053/9935654
[Win32 resource file multiple translations]: https://stackoverflow.com/a/14223964/9935654
[How to suppress "error TS2533: Object is possibly 'null' or 'undefined'"?]: https://stackoverflow.com/a/40350534/9935654
[Human readable javascripts in chrome developer tools]: https://stackoverflow.com/a/6318092/9935654
[Download a single folder or directory from a GitHub repo]: https://stackoverflow.com/a/70729494/9935654
[Is the Heroku Git Repo Public?]: https://stackoverflow.com/a/35535704/9935654
[Can `tesseract-ocr` put the result to STDOUT?]: https://stackoverflow.com/a/39756374/9935654
[Slice chunking in Go]: https://stackoverflow.com/a/72408490/9935654
[Comments in .gitignore?]: https://stackoverflow.com/a/8865895/9935654
[Go lang's equivalent of charCode() method of JavaScript]: https://stackoverflow.com/a/31239411/9935654
[How to insert double and float values to sqlite?]: https://stackoverflow.com/a/32225351/9935654
[How to remove a user from a MongoDB database]: https://stackoverflow.com/a/35342421/9935654
[How to import DateTimeFormatOptions in]: https://stackoverflow.com/q/71757346/9935654
[How to add a link inside an svg circle]: https://stackoverflow.com/a/34968169/9935654
[How to declare Return Types for Functions in TypeScript]: https://stackoverflow.com/a/48051433/9935654
[Is there a "previous sibling" selector?]: https://stackoverflow.com/a/15503444/9935654
[TypeScript 2.8.3 Type must have a Symbol.iterator method that returns an iterator]: https://stackoverflow.com/q/50234481/9935654
[Property 'files' does not exist on type 'EventTarget' error in typescript]: https://stackoverflow.com/q/43176560/9935654
[How to convert javascript unicode notation code to utf-8?]: https://stackoverflow.com/q/10576905/9935654
[Any better way to check endianness in Go]: https://stackoverflow.com/a/53286786/9935654
[Default value for typescript type alias]: https://stackoverflow.com/a/61862414/9935654
[Define a list of optional keys for Typescript Record]: https://stackoverflow.com/a/65703747/9935654
[Declaring abstract method in TypeScript]: https://stackoverflow.com/a/13335645/9935654
[Is it possible to compile a single TypeScript file to an output path using the tsc command?]: https://stackoverflow.com/q/13507576/9935654
[Golang converting from rune to string]: https://stackoverflow.com/q/39245610/9935654
[batch/bat to copy folder and content at once]: https://stackoverflow.com/a/42070127/9935654
[How can I use an ES6 import in Node.js?]: https://stackoverflow.com/a/56350495/9935654
[Possible to merge or nest ES6 imports?]: https://stackoverflow.com/a/45483727/9935654
[How to make uglify and grunt index all imports and generate one single file]: https://stackoverflow.com/a/74015620/9935654
[Typescript - Cannot find module 'http' on Visual Studio Code]: https://stackoverflow.com/a/43461390/9935654
[How to change node.js debug port?]: https://stackoverflow.com/a/18911247/9935654
[How to get GET (query string) variables in Express.js on Node.js?]: https://stackoverflow.com/a/66628260/9935654
[LoadLibrary always return NULL]: https://stackoverflow.com/a/22684362/9935654
[FindResource returns NULL when trying to load a font from resources]: https://stackoverflow.com/q/46473835/9935654
[golang: winapi call with struct parameter]: https://stackoverflow.com/q/39961171/9935654
[Any tool/software in windows for viewing ELF file format?]: https://stackoverflow.com/q/2221806/9935654
[Simple way to copy a file]: https://stackoverflow.com/a/42364225/9935654
[Is it possible to open a Windows Explorer window from PowerShell?]: https://stackoverflow.com/a/12162855/9935654
[Save HBITMAP to *.bmp file using only Win32]: https://stackoverflow.com/q/24720451/9935654
[In Go, how can I convert a struct to a byte array?]: https://stackoverflow.com/a/56272984/9935654
[How to append data on a file in win32]: https://stackoverflow.com/q/43529314/9935654
[golang: convert uint32 (or any built-in type) to byte (to be written in a file)]: https://stackoverflow.com/a/29062148/9935654
[panic: SetUint using value obtained using unexported field]: https://stackoverflow.com/a/53295797/9935654
[Save HICON as a png]: https://stackoverflow.com/a/22885412/9935654
[Does anyone have a FileSystemWatcher-like class in C++/WinAPI?]: https://stackoverflow.com/q/2107275/9935654
[Load window icon dynamically]: https://stackoverflow.com/a/13187774/9935654
[C++ CreateWindowEx returns NULL]: https://stackoverflow.com/q/13661912/9935654
[Why does len() returned a signed value?]: https://stackoverflow.com/a/58308166/9935654
[Loading icons with transparency to tray menu of application]: https://stackoverflow.com/q/45117329/9935654
[Setting WH_KEYBOARD hook fails with error 1428]: https://stackoverflow.com/a/20903216/9935654
[Best way to suspend low level hook (winapi)]: https://stackoverflow.com/a/21362830/9935654
[how to use DrawText() to write text in a given window whose handle is known?]: https://stackoverflow.com/a/1974035/9935654
[SendInput wrong Parameter]: https://stackoverflow.com/a/50874976/9935654
[Passing a string into SendInput() (C++)]: https://stackoverflow.com/a/49503707/9935654
[change volume win32 c++]: https://stackoverflow.com/q/699603/9935654
[addEventListener on custom object]: https://stackoverflow.com/a/74611093/9935654
[Use requestAnimationFrame in a class]: https://stackoverflow.com/a/28909471/9935654
[How do you set focus to the HTML5 canvas element?]: https://stackoverflow.com/q/56771/9935654
[How to fetch (using Fetch API) only headers in Javascript, not the whole content?]: https://stackoverflow.com/a/47241400/9935654
[Check if image exists on server using JavaScript?]: https://stackoverflow.com/q/18837735/9935654
[Intellij Idea warning - "Promise returned is ignored" with aysnc/await]: https://stackoverflow.com/a/56796334/9935654
[TypeScript, bind multiple params to same type]: https://stackoverflow.com/a/40723883/9935654
[How can you find the height of text on an HTML canvas?]: https://stackoverflow.com/a/45789011/9935654
[Calling anonymous function in HTML]: https://stackoverflow.com/a/74687122/9935654
[How to get a list of the name of every open window?]: https://stackoverflow.com/a/55548074/9935654
[Screen Capture Specific Window]: https://stackoverflow.com/a/74740589/9935654
[win32: check if window is minimized]: https://stackoverflow.com/a/4309305/9935654
[What does __declspec(uuid(" ComObjectGUID ")) expand to?]: https://stackoverflow.com/q/6219941/9935654
[What is __declspec and when do I need to use it?]: https://stackoverflow.com/q/2284610/9935654
[Call COM object method from Go without CGo]: https://stackoverflow.com/q/39162054/9935654
[How to compare if two structs, slices or maps are equal?]: https://stackoverflow.com/q/24534072/9935654
[How to kill processes by name? (Win32 API)]: https://stackoverflow.com/a/7956651/9935654
[What is the equivalent to WinAPI in Linux and macOS?]: https://stackoverflow.com/a/57451665/9935654
[Unknown compiler options include & exclude]: https://stackoverflow.com/a/56966602/9935654
[exclude subdirectories in tsconfig.json]: https://stackoverflow.com/q/35647862/9935654
[Why does the WinAPI use an int (32 bits) for the BOOL type?]: https://stackoverflow.com/q/11129601/9935654
[how to implement macros in Go?]: https://stackoverflow.com/a/49530118/9935654
[NOTIFY ICON Click Win32 Api in c++]: https://stackoverflow.com/a/38808559/9935654
[How to unmarshal an escaped JSON string]: https://stackoverflow.com/a/16847249/9935654
[How to catch and deal with "WebSocket is already in CLOSING or CLOSED state" in Node]: https://stackoverflow.com/a/54061045/9935654
[Refused to display in a frame because it set 'X-Frame-Options' to 'SAMEORIGIN']: https://stackoverflow.com/a/20534612/9935654
[Overcoming "Display forbidden by X-Frame-Options"]: https://stackoverflow.com/q/6666423/9935654
[How to set 'X-Frame-Options' on iframe?]: https://stackoverflow.com/a/27359037/9935654
[What is the maximum length of a URL in different browsers?]: https://stackoverflow.com/q/417142/9935654
[ES6: import module from URL]: https://stackoverflow.com/q/34607252/9935654
[How to link files directly from Github (raw.github.com)]: https://stackoverflow.com/a/50598749/9935654
[How to test a local bot?]: https://stackoverflow.com/q/37573932/9935654
[Closed channel vs nil channel]: https://stackoverflow.com/a/43616486/9935654
[Detecting a mobile browser]: https://stackoverflow.com/a/13819253/9935654
[How to generate a stream of *unique* random numbers in Go using the standard library]: https://stackoverflow.com/a/59198083/9935654
[How to open the default web browser in Windows in C?]: https://stackoverflow.com/a/3037117/9935654
[how to get return value of an exe called by ShellExecute]: https://stackoverflow.com/a/10896836/9935654
[Pretty printing XML with javascript]: https://stackoverflow.com/a/47317538/9935654
[How can I merge two maps in go?]: https://stackoverflow.com/a/71652767/9935654
[function for converting a struct to map in Golang]: https://stackoverflow.com/a/42849112/9935654
[POST data using the Content-Type multipart/form-data]: https://stackoverflow.com/a/20397167/9935654
[How to get last-accessed date and time of file in Go?]: https://stackoverflow.com/a/55303743/9935654
[How to avoid very large files]: https://stackoverflow.com/q/73423917/9935654
[From io.Reader to string in Go]: https://stackoverflow.com/a/9650373/9935654
[Read Exif Metadata with Go]: https://stackoverflow.com/a/60500680/9935654
[Go doing a GET request and building the Querystring]: https://stackoverflow.com/a/49955992/9935654
[Validating Google sign in ID token in Go]: https://stackoverflow.com/q/36716117/9935654
[Google sign in website Error : Permission denied to generate login hint for target domain]: https://stackoverflow.com/a/32211878/9935654
[Google: Permission denied to generate login hint for target domain NOT on localhost]: https://stackoverflow.com/a/48456350/9935654
[Google API authentication: Not valid origin for the client]: https://stackoverflow.com/q/42566296/9935654
[The given origin is not allowed for the given client ID (GSI)]: https://stackoverflow.com/q/68438293/9935654
[How can I verify a Google authentication API access token?]: https://stackoverflow.com/q/359472/9935654
[Use golang to get RSA key the same way openssl genrsa]: https://stackoverflow.com/a/64105068/9935654
[Win32: Is it possible to show the window but to hide it from taskbar?]: https://stackoverflow.com/q/33538264/9935654
[Unable to attach event to an element in contextual fragment]: https://stackoverflow.com/a/49473948/9935654
[Decoding JWT in Google Apps Script]: https://stackoverflow.com/q/63975006/9935654
[How to solve "error: Microsoft Visual C++ 14.0 or greater is required" when installing Python packages?]: https://stackoverflow.com/a/64262038/9935654
[powershell unable to find type Windows.UI.Notification]: https://stackoverflow.com/q/65680941/9935654
[What are the numbers in Tesseract box file?]: https://stackoverflow.com/a/53384065/9935654
[Custom syntax highlighting in JetBrains IDE's]: https://stackoverflow.com/q/24840231/9935654
[Retrieve (Default) Value in Registry key]: https://stackoverflow.com/a/58068894/9935654
[What is the idiomatic way to slice an array relative to both of its ends?]: https://stackoverflow.com/q/28460208/9935654
[Setting Windows PowerShell environment variables]: https://stackoverflow.com/a/2571200/9935654
[Powershell alias not being set from script]: https://stackoverflow.com/a/42157836/9935654
[Why are scripted cmdlets listed as functions?]: https://stackoverflow.com/q/18469012/9935654
[Import-StartLayout doesn't change anything]: https://superuser.com/q/1117136/1093221
[\[bool\]$backup = $true # $True, $False, 1, 0]: https://stackoverflow.com/q/24649019/9935654
[How remove \n from lines]: https://stackoverflow.com/a/44449581/9935654
[How to get the Parent's parent directory in Powershell?]: https://stackoverflow.com/a/76285943/9935654
[How to use Invoke-RestMethod to upload jpg]: https://stackoverflow.com/q/42395638/9935654
[What is the boundary in multipart/form-data?]: https://stackoverflow.com/a/20321259/9935654
[Configure Windows PowerShell to display only the current folder name in the shell prompt]: https://superuser.com/a/1785486/1093221
[Using PowerShell to write a file in UTF-8 without the BOM]: https://stackoverflow.com/a/55077592/9935654
[Powershell unable to find type \[System.Windows.Forms.KeyEventHandler\]]: https://stackoverflow.com/a/27792262/9935654
[Where can I see deno downloaded packages?]: https://stackoverflow.com/q/61799309/9935654
[Node.js' __dirname & __filename equivalent in Deno]: https://stackoverflow.com/a/61829368/9935654
[How to add a simple text label to an image in Go?]: https://stackoverflow.com/q/38299930/9935654
[Best way to call an asynchronous function within map?]: https://stackoverflow.com/a/48273841/9935654
[Get actual Font name of TTF file from Command Line]: https://superuser.com/a/1787977/1093221
[Looping through a hash, or using an array in PowerShell]: https://stackoverflow.com/a/16175967/9935654
[PowerShell Syntax Highlighting]: https://meta.stackoverflow.com/q/408345/9935654
[How to convert decimal to hexadecimal variable?]: https://stackoverflow.com/a/57999927/9935654
[How to display Unicode character names and their hexadecimal codes with PowerShell?]: https://stackoverflow.com/a/65752442/9935654
[deno relative path issue]: https://stackoverflow.com/a/71073700/9935654
[How do I create an HTML table with a fixed/frozen left column and a scrollable body?]: https://stackoverflow.com/a/73257929/9935654
[how to provide the date as filename using javascript?]: https://stackoverflow.com/a/55509019/9935654
[How to get current working directory using vba?]: https://stackoverflow.com/a/19824472/9935654
[Convert object array to hash map, indexed by an attribute value of the Object]: https://stackoverflow.com/a/26265095/9935654
[How to view code coverage as html for Flutter in Windows?]: https://stackoverflow.com/a/76495431/9935654
[Javascript - Copy string to clipboard as text/html]: https://stackoverflow.com/a/74216984/9935654
[Powershell 7 Byte encoding an image file]: https://stackoverflow.com/a/63782608/9935654
[powershell max/first/aggregate functions]: https://stackoverflow.com/a/19170783/9935654
[How to find a desktop window (by window name) in Windows 8.1 Update 2 OS, using the Win32 API FindWindow() in PowerShell environment?]: https://stackoverflow.com/a/76628227/9935654
[Does Go have standard Err variables?]: https://stackoverflow.com/a/30178766/9935654
[To use local font in HTML using font face]: https://stackoverflow.com/a/38086507/9935654
[Save Image from clipboard using PowerShell]: https://stackoverflow.com/a/55226209/9935654
[Windows Clipboard History - How to view the history from PowerShell]: https://stackoverflow.com/q/72095565/9935654
[KeyDown event listener seems to not work when button items are added to WinForm]: https://stackoverflow.com/q/39458086/9935654
[How to capture global keystrokes with PowerShell?]: https://stackoverflow.com/a/54237188/9935654
[Unable to find type \[Windows.Markup.XamlReader\]]: https://stackoverflow.com/a/70370986/9935654
[Formatting PowerShell Get-Date inside string]: https://stackoverflow.com/a/10026285/9935654
[Add padding to HTML text input field]: https://stackoverflow.com/a/6586429/9935654
[Waiting for image to load in JavaScript]: https://stackoverflow.com/a/66180709/9935654
[Reading Image in Go]: https://stackoverflow.com/q/49594259/9935654
[How do I blur a particular area of an image in HTML?]: https://stackoverflow.com/a/50541483/9935654
[Is it possible to have multiple masks with clip-path?]: https://stackoverflow.com/a/45624565/9935654
[Add SVG to HTML and handle events]: https://stackoverflow.com/a/39013460/9935654
[Where is docker image location in Windows 10?]: https://stackoverflow.com/q/42250222/9935654
[Determine the OS version, Linux and Windows from Powershell]: https://stackoverflow.com/a/54645671/9935654
[Use ffmpeg to add text subtitles]: https://stackoverflow.com/q/8672809/9935654
[Does HTML5 Video support srt textTrack?]: https://stackoverflow.com/a/76911371/9935654
[How to create a \<style\> tag with Javascript?]: https://stackoverflow.com/a/69515103/9935654
[How to add external JS scripts to VueJS Components?]: https://stackoverflow.com/a/70470491/9935654
[How to convert \[4\]uint8 into uint32 in Go?]: https://stackoverflow.com/a/7380354/9935654
[How to enter a multi-line command]: https://stackoverflow.com/a/3235993/9935654
[Add double quotes to variable to escape space]: https://stackoverflow.com/a/35309729/9935654
[Read/Parse Binary files with Powershell]: https://stackoverflow.com/q/10672092/9935654
[Write bytes to a file natively in PowerShell]: https://stackoverflow.com/a/77095342/9935654
[How to get the captured groups from Select-String?]: https://stackoverflow.com/a/59900840/9935654
[flip svg coordinate system]: https://stackoverflow.com/a/77139308/9935654
[CSS Variables (custom properties) in Pseudo-element "content" Property]: https://stackoverflow.com/a/40179718/9935654
[How to use the mouse wheel to zoom on an SVG using the viewBox]: https://stackoverflow.com/a/76150885/9935654
[YES/NO - is there a way to improve mouse dragging with pure SVG tools?]: https://stackoverflow.com/a/41518545/9935654
[How to change CSS :root color variables in JavaScript]: https://stackoverflow.com/a/72209411/9935654
[Why don't :before and :after pseudo elements work with `img` elements?]: https://stackoverflow.com/a/7396482/9935654
[Is there a CSS parent selector?]: https://stackoverflow.com/a/1014958/9935654
[Error: discord.errors.NotFound: 404 Not Found (error code: 10062): Unknown interaction discord.py when sending a gif in embed]: https://stackoverflow.com/a/73366762/9935654
[PowerShell's Clear-History doesn't clear history]: https://stackoverflow.com/a/77177676/9935654
[Getting the previous month's first date from current date in JavaScript]: https://stackoverflow.com/a/59407143/9935654
[matchMedia().addListener marked as deprecated, addEventListener equivalent?]: https://stackoverflow.com/a/56466334/9935654
[What’s the point of using the HTML5 <time> tag?]: https://stackoverflow.com/a/6852884/9935654
[Do not have permission to use setFormula Google appScript]: https://stackoverflow.com/a/56861752/9935654
[OpenCV converts HSL to RGB]: https://stackoverflow.com/a/66921048/9935654
[Using ffmpeg to create looping apng]: https://stackoverflow.com/a/43797017/9935654
[Difference between Uint8Array and Uint8ClampedArray]: https://stackoverflow.com/a/21820040/9935654
[Linear Regression in Javascript]: https://stackoverflow.com/a/31566791/9935654
[Getting HTML form values]: https://stackoverflow.com/a/61954584/9935654
[Can I compare variable types with .(type) in Golang?]: https://stackoverflow.com/a/65422200/9935654
[How to pad a number with zeros when printing?]: https://stackoverflow.com/a/25637441/9935654
[Constant struct in Go]: https://stackoverflow.com/q/43368604/9935654
[What is checkSumAdjustment in TTF/OTF head table used for?]: https://stackoverflow.com/a/76918913/9935654
[Could not load library cudnn_cnn_infer64_8.dll. Error code 126]: https://stackoverflow.com/a/70476089/9935654
[Proper way for casting uint16 to int16 in Go]: https://stackoverflow.com/a/48023533/9935654
[Go, encoding/xml: How can I marshal self-closing elements?]: https://stackoverflow.com/q/38118100/9935654
[Convert float64 to byte array]: https://stackoverflow.com/a/43693916/9935654
[image.Decode() unknown format]: https://stackoverflow.com/a/62846368/9935654
[WebP encoder/decoder in go]: https://stackoverflow.com/q/8340751/9935654
[What is a "stale" git branch?]: https://stackoverflow.com/a/29112561/9935654
[Most idiomatic way to select elements from an array in Golang?]: https://stackoverflow.com/a/78185810/9935654
[color input with transparency]: https://stackoverflow.com/a/78229662/9935654
[What are passive event listeners?]: https://stackoverflow.com/a/78265405/9935654
[How to create an array containing 1...N]: https://stackoverflow.com/a/65244361/9935654
[How to type pinyin text with tone marks in Windows?]: https://superuser.com/q/27743/1093221
[UTF-8 range table in Go]: https://stackoverflow.com/a/68263839/9935654
[Return default value for generic type]: https://stackoverflow.com/a/70586169/9935654
[How to get all selected values of a multiple select box?]: https://stackoverflow.com/a/39363742/9935654
[How can I get a channel ID from YouTube?]: https://stackoverflow.com/a/76285153/9935654
[how to parse image to ICO format in javascript client side]: https://stackoverflow.com/a/65678517/9935654
[How to change page results with YouTube Data API v3]: https://stackoverflow.com/a/55240055/9935654

{{< /table/bootstrap-table >}}


[golang使用webAssembly的方式]: https://zhuanlan.zhihu.com/p/64873683
[github.com/anymost/Go-WebAssembly]: https://github.com/anymost/Go-WebAssembly
[Bootstrap教學 - 利用HTML + CSS，完整編寫網站外觀示範]: https://www.youtube.com/watch?v=9X1graZtuPs
