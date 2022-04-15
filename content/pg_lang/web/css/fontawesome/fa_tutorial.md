+++
title = "font-awesome基礎教學"
date = 2021-01-14T10:39:00+08:00
lastmod = 2021-02-27
featured_image = ""
description = "一些常用的項目"
tags = ["fontawesome"]
bootstrap = true
markmap = true
toc_markmap = true
toc_bootstrap = true

[next_and_previous.link]
    next_section="/pg_lang/web/css/bootstrap/bs_tutorial"
+++

## Icons

fontawesome主要就是用來取得一些漂亮的圖標的，

以下這些是常用的前端圖標庫:

1. [fontawesome]
2. [fontello]
3. [livicons]
4. [ionicons]
5. [material]
6. [iconfont] (阿里巴巴)
7. ★★★ [thenounproject](https://thenounproject.com/) : 大推這個，可以下載svg圖形
8. ★ [SVG背景圖片下載: svgbackgrounds.com](https://www.svgbackgrounds.com/)

每一種都有提供CSS, JS等等幫助您快速應用，而本篇只講fontawesome

## cdnjs, jsdelivr, unpkg

取得線上的CSS, JS

- {{<raw_html>}}<a href="https://cdnjs.com/libraries/">cdnjs.com/libraries<i class='fas fa-code fa-2x' style='color: #ff6934'"></i></i></a>{{</raw_html>}}
- {{<raw_html>}}<a href="https://www.jsdelivr.com/package/npm/">tableexport.jquery.plugin<i class='fas fa-code fa-2x' style='color: #ff6934'"></i></i></a>{{</raw_html>}}
    - 點進去下方有一個*搜尋*，輸入之後可以搜尋到npm有的項目
- https://unpkg.com/
    - 例如: [jspdf.umd.min.js](https://unpkg.com/jspdf@latest/dist/jspdf.umd.min.js)

搜尋自己要的套件，有名的套件應該都可以找的到

## SRI Hash

Generate Subresource Integrity (SRI) attributes

通常我們會在CSS或者JS中新增:``integrity=sha...``來防止文件被串改的可能性發生

> https://www.srihash.org/ 可以幫助您產生，把資源的連結貼上去即可


## [免費版本常用的icon](https://fontawesome.com/icons/)

- 下載: {{<raw_html>}}<a href=""><i class="fas fa-download fa-2x"></i></a>{{</raw_html>}}

  ```html
  <a href=""><i class="fas fa-download fa-2x"></i></a>
  ```

- {{<raw_html>}}<i class='fas fa-h-square' style='color: #e844a8'></i>{{</raw_html>}} (可當作hugo, autohotkey等等)
{{<raw_html>}} {{</raw_html>}}

  ```html
  <i class='fas fa-h-square' style='color: #e844a8'></i>
  ```

- 動物-龍: {{<raw_html>}}<i class='fas fa-dragon' style='color: #FF0000'></i>{{</raw_html>}}
{{<raw_html>}} {{</raw_html>}}

  ```html
  <i class='fas fa-dragon' style='color: #FF0000'></i>
  ```

- book: {{<raw_html>}}<i class="fas fa-book-open fa-2x" style="color:#fd7e14;"></i>{{</raw_html>}}

  ```html
  <i class="fas fa-book-open fa-2x" style="color:#fd7e14;"></i>
  ```

- link: {{<raw_html>}}<a href=""><i class="fas fa-link fa-2x" style="color:#1a73e8;"></i><br>my_link</a>{{</raw_html>}}

  ```html
  <a href="#"><i class="fas fa-link fa-2x" style="color:#fd7e14;"></i><br>my_link</a>
  ```

### 搭配bootstrap

#### [Glyphicons](https://www.w3schools.com/bootstrap/bootstrap_ref_comp_glyphs.asp)

它的圖形主要是靠css的影響所繪出

但一個缺點是它的css和一般的bootstrap.css有點不同，它的是

```html
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!--
比較常用的css應該是下面這個
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
-->
```

bootstrap有提供一些glyphs可以用，您可以至連結參考到更多的用法以及可以用的圖標有哪些，這邊我舉一個例子如下

```html
<button type="button" class="btn btn-default btn-sm">
  <span class="glyphicon glyphicon-trash"></span> Trash
</button>
```

{{<raw_html>}}<button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-trash"></span> Trash</button>{{</raw_html>}}



#### button

- link: {{<raw_html>}}<button class="btn btn-primary" onclick="location.href='https://www.google.com/'" type="button"><i class="fas fa-link fa-2x"></i><br>Google</button>{{</raw_html>}}

  ```go-html-template
  <button class="btn btn-primary" type="button"
    onclick="location.href='https://www.google.com/'"  {{/* 按鍵也可以變成連結，不建議用a來取代按鈕，有些樣式會跑掉 */}}
  ><i fas fa-link fa-2x></i>  {{/* fontawesome的圖標放這邊 */}}
  <br>Google  {{/* 利用br來換行，模擬文字在按鍵下方 */}}
  </button>
  ```

- btn+fontawesome+tachyons: {{<raw_html>}}<button class="btn btn-secondary"><i class="fas fa-undo hover-yellow"></i></button>{{</raw_html>}}

  ```go-html-template
  <button class="btn btn-secondary"> {{/* bootstrap */}}
  <i class="fas fa-undo  {{/* fontawesome */}}
  hover-yellow"></i> {{/* tachyons */}}
  </button>
  ```


## [Emoji of Unicode](https://apps.timwhitlock.info/unicode/inspect?s=%F0%9F%93%9D)

[getemoji.com](https://getemoji.com/)

> 其實Unicode您也可以在這個 [網站](https://emojipedia.org/1st-place-medal/) 上就可以看見了，在比較下面的地方有一個Codepoints，可以看見UNICODE碼位

{{< table/bootstrap-table table-info >}}

| @@w=10%@@name | @@w=40%@@Icon Desc | @@w=10%@@Code | @@w=30%@@Comment |　|
| :----: | :---- | :----: | ---- | ---- |
⌨ | KEYBOARD | 2328
☑ | | U+2611
☐ | | U+2610
⚠  | Warning sign | 26A0
⚡  | High Voltage | 26A1
✍ | WRITING HAND、總結 | 270D
✍️| Writing Hand | 270D
✨ | SPARKLES\nFeatures | 2728
❌ |  Cross Mark | 274C
❓ | QUESTION MARK\nCommunity Support | 2753
❗  | exclamation | 2757
❤️ | red heart | 2764
⭐ | WHITE MEDIUM STAR | 2B50
⭕ | hollow_red_circle | 2B55
🌎 | World Emoji Day | 1F30E
🌱 | Earth Day | 1F331
🐬 | Dolphin | 1F42C
🐳 | Spouting Whale | 1F433
📁 | FILE FOLDER | 1F4C1
📂 | Open File Folder | 1F4C2
📅 | Calendar | 1F4C5
📙 | Orange book | 1F4D9
📓 | Notebook | 1F4D3
📖 | Open Book, docs | 1F4D6
📚 | Books | 1F4DA
📜 | Scroll, history, release note | 1F4DC
📝 | Memo | 1F4DD
🔖 | Bookmark | 1F516
🕮 | Book | 1F56E
🖿 | Black Folder | 1F5BF
🗂️ | Card Index Dividers | 1F5C2
🧾 | Receipt | 1F9FE
🔔 | BELL\n叮嚀 | 1F514
🕷️ | Spider | 1F577
🐛  | Bug | 1F41B
󠁴🀄 | 中文 | 1F004
🌈 | RAINBOW\nOnline Examples | 1F308
💪 | enhancement | 1F4AA
📰 | NEWSPAPER、歷史文章、資料來源 | 1F4F0
👩‍💻 | ● 👩:Woman\n●💻: Personal computer | ●1F469\n●1F4BB | 這比較特別，他是兩個碼位組合而成的圖案
👨‍💻 | ● 👨:Man\n●💻: Personal computer | ●1F468\n●1F4BB | 組合圖案
👷 | 工人\nConstruction Worker | 1F477
🎮 | Video game | 1F3A3
📦 | PACKAGE\nInstallation Guide | 1F4E6
💿 | OPTICAL DISC | 1F4BF
🎨 | ARTIST PALETTE\nDesign Specification | 1F3A8
🖥 | DESKTOP COMPUTER | 1F5A5
🕒 | Time | 1F552
🔗 | LINK SYMBOL\nLinks | 1F517
🗺 | WORLD MAP\nRoadmap | 1F5FA
🤝 | Contributing | 1F91D
💕 | TWO HEARTS\nDonation | 1F495
👍 | Thumbs Up, Yes, Like, 讚 | 1F44D
👆 | Pointing Up | 1F446
👇 | Pointing Down | 1F447
👈 | Pointing Left | 1F448
👉 | Pointing Right | 1F449
😂 | Laughing | 1F602
😅 | Grinning Face with Sweat | 1F605
😡 | Enraged Face | 1F621
😵 | DIZZY FACE | 1F635
😎 | SMILING FACE WITH SUNGLASSES | 1F60E
😁 | GRINNING FACE WITH SMILING EYES | 1F60E
😆 | SMILING FACE WITH OPEN MOUTH AND TIGHTLY-CLOSED EYES | 1F606
🙂 | Slightly Smiling Face | 1F642
🤩 | Star-Struck | 1F929
🥳 | Partying Face | 1F973
🥴 | Drunk Face\nWoozy Face\nFace with Uneven Eyes and Wavy Mouth | 1F974
🤔 | Thinking Face Emoji
🤣 | Rolling on the Floor Laughing,
🗑 | deprecated
🚮 | deprecated
🏆 | Trophy | 1F3C6
🥇 | 1st Place Medal | 1F947
🥈 | 2nd Place Medal | 1F948
🥉 | 3rd Place Medal | 1F949
💯 | Hundred points symbol| 1F4AF
🎵 | Muscial Note | 1F3B5
📥 | Inbox Tray, download | 1F4E5
🗛 | Decrease Font Size Symbol | 1F5DB
🔢 | Input Numbers | 1F522
🔨 | Hammer | 1F528
⚙ | Gear | 2699
⏩ | fast right | 23E9
▸ | 條列式符號 | U+25B8
▾ | | U+25BE
✂️ | Scissors | 2702
⬇️ | Down Arrow, Download | 2B07
🌶️ | Hot Pepper | 1F336
🍣 | Sushi | 1F363
👑 | Crown |  1F451
📈 | Chart Increasing | 1F4C8
📉 | Chart Decreasing | 1F4C9
📊 | Bar Chart | 1F4CA
📢 | Loudspeaker, Announcement 廣播 | 1F4E2
📹 | Video Camera | 1F4F9
📺 | Television | 1F4FA
🔑 | Key | 1F511
🔒 | Locked 安全性 | 1F512
🔥 | Fire | 1F525
🕹️ | Joystick | 1F579
🚚 | Delivery Truck | 1F69A
🧄 | Garlic | 1F9C4


[Default value in Go's method]: https://stackoverflow.com/a/23650312/9935654

{{< /table/bootstrap-table >}}

### 相關連結

- [emojipedia]
- [How can I create a text box for a note in markdown?](https://stackoverflow.com/a/65930459/9935654)

## 在.github文件夾中可能有用的圖標


| Unicode字元 | Desc | 建議bg顏色  |
| ---- | ---- | ---- |
{{<raw_html>}}<span style="color:white;background-color:#d73a4a;">🐛bug</span>{{</raw_html>}} | Something isn't working | #d73a4a {{< show-color "#d73a4a" >}}
{{<raw_html>}}<span style="color:white;background-color:#0075ca;">📰documentation</span>{{</raw_html>}} |  Improvements or additions to documentation | #0075ca {{< show-color "#0075ca" >}}
{{<raw_html>}}<span style="color:white;background-color:#ff99e6;">💬discussion</span>{{</raw_html>}} | discussion some topics |  #ff99e6 {{< show-color "#ff99e6" >}}
{{<raw_html>}}<span style="color:white;background-color:#7057FF;">👍good first issue</span>{{</raw_html>}} | Good for newcomers | #7057FF {{< show-color "#7057FF" >}}
{{<raw_html>}}<span style="color:black;background-color:#faf47d;">💪enhancement</span>{{</raw_html>}} | New feature or request | #faf47d {{< show-color "#faf47d" >}}
{{<raw_html>}}<span style="color:black;background-color:#0088672;">🙏help wanted</span>{{</raw_html>}} | Extra attention is needed | #0088672 {{< show-color "#0088672" >}}
{{<raw_html>}}<span style="">🔧fix</span>{{</raw_html>}} | fix the problem
{{<raw_html>}}<span style="color:white;background-color:#000000;">❓question</span>{{</raw_html>}} | Further information is requested | #000000 {{< show-color "#000000" >}}
{{<raw_html>}}<span style="color:black;background-color:#44fcf9;">📝todo</span>{{</raw_html>}} | 代辦事項 | #44fcf9 {{< show-color "#44fcf9" >}}
{{<raw_html>}}<span style="color:white;background-color:#0052cc;">💡proposal</span>{{</raw_html>}} | 提案 | #0052cc {{< show-color "#0052cc" >}}
{{<raw_html>}}<span style="color:black;background-color:#cfcfcf;">🚧pending</span>{{</raw_html>}} | 待辦 | #cfcfcf {{< show-color "#cfcfcf" >}}
{{<raw_html>}}<span style="color:red;background-color:black;">🚮deprecated</span>{{</raw_html>}} | deprecated (將來會廢棄的項目) | #000000 {{< show-color "#000000" >}}
{{<raw_html>}}<span style="color:black;background-color:#e8e8e3;">🀄zh</span>{{</raw_html>}} | lang: 中文 | #e8e8e3 {{< show-color "#e8e8e3" >}}
{{<raw_html>}}<span style="color:black;background-color:#e8e8e3;">en</span>{{</raw_html>}} | english | #e8e8e3 {{< show-color "#e8e8e3" >}}
-- |
{{<raw_html>}}<span style="color:black;background-color:#e8e8e3;">⏩shortcode</span>{{</raw_html>}} | Shortcode | #e8e8e3 {{< show-color "#e8e8e3" >}}
{{<raw_html>}}<span style="color:black;background-color:#e8e8e3;">🔎search</span>{{</raw_html>}} | about search | #e8e8e3 {{< show-color "#e8e8e3" >}}
{{<raw_html>}}<span style="color:black;background-color:#e8e8e3;">🧙tutorial</span>{{</raw_html>}} | tutorial | #e8e8e3 {{< show-color "#e8e8e3" >}}

## github中README可能可以用到的圖標

- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 📫 How to reach me: ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...

## [Shields.io]

蒐集一些我認為比較有用到的圖例

{{< table/bootstrap >}}

| @@w=15%@@成品 | 說明 | 代碼 |
| ---- | ---- | ---- |
[![Go Playground](https://img.shields.io/badge/Go-Playground-5593c7.svg?labelColor=41c3f3&style=for-the-badge)](https://play.golang.org/p/eqjvu-vO8sr) | 可以用圖片+連結的方式來呈現\n | ``[![Go Playground](https://img.shields.io/badge/Go-Playground-5593c7.svg?labelColor=41c3f3&style=for-the-badge)](https://play.golang.org/p/eqjvu-vO8sr)``

{{< /table/bootstrap >}}


[fontawesome]: https://fontawesome.com/
[fontello]: https://fontello.com/
[livicons]: https://livicons.com/
[ionicons]: https://ionicons.com/
[material]: https://material.io/resources/icons
[iconfont]: https://www.iconfont.cn/

[emojipedia]: https://emojipedia.org/
[Shields.io]: https://shields.io/category/social

