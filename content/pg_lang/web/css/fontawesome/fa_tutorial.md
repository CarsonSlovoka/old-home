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

每一種都有提供CSS, JS等等幫助您快速應用，而本篇只講fontawesome

## 取得線上的CSS, JS

{{<raw_html>}}<a href="https://cdnjs.com/libraries/">cdnjs.com/libraries<i class='fas fa-code fa-2x' style='color: #ff6934'"></i></i></a>{{</raw_html>}}

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

#### button

- link: {{<raw_html>}}<button class="btn btn-primary" onclick="location.href='https://www.google.com/'" type="button"><i class="fas fa-link fa-2x"></i><br>Google</button>{{</raw_html>}}

  ```go-html-template
  <button class="btn btn-primary" type="button"
    onclick="location.href='https://www.google.com/'"  {{/* 按鍵也可以變成連結，不建議用a來取代按鈕，有些樣式會跑掉 */}}
  ><i fas fa-link fa-2x></i>  {{/* fontawesome的圖標放這邊 */}}
  <br>Google  {{/* 利用br來換行，模擬文字在按鍵下方 */}}
  </button>
  ```

## [Emoji of Unicode](https://apps.timwhitlock.info/unicode/inspect?s=%F0%9F%93%9D)

{{< table/bootstrap-table table-info >}}

| @@w=10%@@name | @@w=40%@@Icon Desc | @@w=10%@@Code | @@w=30%@@Comment |　|
| :----: | :---- | :----: | ---- | ---- |
| 📝 | Memo | 1F4DD
| 🧾 | Receipt | 1F9FE
📂 | Open File Folder
📁 | FILE FOLDER | 1F4C1
🗂️ | Card Index Dividers
🖿 | Black Folder
| 🐬 | Dolphin | 1F42C
| 📙 | Orange book | 1F4D9
| 📓 | Notebook
🔖 | Bookmark
🕮 | Book
📚 | Books
❗  | exclamation | 2757
⚠  | Warning sign | 26A0
🔔 | BELL\n叮嚀 | 1F514
🌱 | Earth Day
🌎 | World Emoji Day
📅 | Calendar | 1F4C5
🕷️ | Spider
🐛  | Bug
󠁴🀄 | 中文
💪 | enhancement
✍ | WRITING HAND、總結 | 270D
📰 | NEWSPAPER、歷史文章 | 1F4F0
👩‍💻 | ● 👩:Woman\n●💻: Personal computer | ●1F469\n●1F4BB | 這比較特別，他是兩個碼位組合而成的圖案
👨‍💻 | ● 👨:Man\n●💻: Personal computer | ●1F468\n●1F4BB | 組合圖案
🎮 | Video game | 1F3A3
🥴 | Drunk Face\nWoozy Face\nFace with Uneven Eyes and Wavy Mouth | 1F974
😵 | DIZZY FACE | 1F635
✨ | SPARKLES\nFeatures | 2728
⭐ | WHITE MEDIUM STAR | 2B50
📦 | PACKAGE\nInstallation Guide | 1F4E6
🌈 | RAINBOW\nOnline Examples | 1F308
💿 | OPTICAL DISC | 1F4BF
🎨 | ARTIST PALETTE\nDesign Specification | 1F3A8
🖥 | DESKTOP COMPUTER | 1F5A5
⌨ | KEYBOARD | 2328
🔗 | LINK SYMBOL\nLinks | 1F517
🗺 | WORLD MAP\nRoadmap | 1F5FA
🤝 | Contributing | 1F91D
💕 | TWO HEARTS\nDonation | 1F495
❓ | QUESTION MARK\nCommunity Support | 2753
👍 | 讚
👉 | Pointing Right | 1F449
👆 | Pointing Up | 1F446
👇 | Pointing Down | 1F447
😂 | Laughing |
😅 | Grinning Face with Sweat | 1F605
🤣 | Rolling on the Floor Laughing,
🗑 | deprecated
🚮 | deprecated

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

