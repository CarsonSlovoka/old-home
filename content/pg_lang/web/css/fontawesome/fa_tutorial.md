+++
title = "font-awesome基礎教學"
date = 2021-01-14T10:39:00+08:00
description = "一些常用的項目"
tags = ["fontawesome"]
bootstrap = true
markmap = true
toc_markmap = true
toc_bootstrap = true

[next_and_previous.link]
    next_section="/pg_lang/web/css/bootstrap/bs_tutorial"
+++

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

| @@w=10%@@name | @@w=30%@@Icon Desc | @@w=10%@@Code | @@w=30%@@Comment |　|
| :----: | :---- | :----: | ---- | ---- |
| 📝 | Memo | 1F4DD
| 🧾 | Receipt | 1F9FE
| 🐬 | Dolphin | 1F42C
| 📙 | Orange book | 1F4D9
| 📓 | Notebook
🔖 | Bookmark
🕮 | Book
📚 | Books
🌱 | Earth Day
🌎 | World Emoji Day
📅 | Calendar | 1F4C5
🕷️ | Spider
✍ | WRITING HAND、總結 | 270D
📰 | NEWSPAPER、歷史文章 | 1F4F0
👩‍💻 | ● 👩:Woman\n●💻: Personal computer | ●1F469\n●1F4BB | 這比較特別，他是兩個碼位組合而成的圖案
👨‍💻 | ● 👨:Man\n●💻: Personal computer | ●1F468\n●1F4BB | 組合圖案
🎮 | Video game | 1F3A3

[Default value in Go's method]: https://stackoverflow.com/a/23650312/9935654

{{< /table/bootstrap-table >}}

### 相關連結

- [emojipedia]
- [How can I create a text box for a note in markdown?](https://stackoverflow.com/a/65930459/9935654)

[emojipedia]: https://emojipedia.org/
