+++
title = "Golang Settings"
description="Keymap, Editor,..."
date = 2021-01-22T13:25:01+08:00
lastmod = 2021-03-02
featured_image = ""
draft = false
weight = 0
tags = ["go", "jetbrains"]
markmap = true
toc_markmap = true
toc_bootstrap = true
+++

## Visual studio Keymap

| name | hotkey |
| ---- | ---- |
| Open in terminal | {{< hotkey "Alt + C" >}}
| Show in Explorer | {{< hotkey "Alt + W" >}}
| Recent Files | {{< hotkey "Ctrl + E" >}}
| Go to Declaration or Usages | {{< hotkey "Shift + F12" >}}
| {{< auto-id "Reformat Code" >}} | {{< hotkey "Ctrl + Alt + Enter" >}}
| Split Right |  {{< hotkey "Ctrl+W, V" >}}
| Split Down  | {{< hotkey "Ctrl+W, S" >}}
| Split and Move Down  | {{< hotkey "Ctrl+W, Down" >}}
| Split and Move Right |  {{< hotkey "Ctrl+W, Right" >}}
| Close | {{< hotkey "Ctrl+W, C" >}}
| UnSplit | {{< hotkey "Ctrl+W, U" >}}
Goto Previous Splitter | {{< hotkey "Ctrl+W, H" >}}
Goto Next Splitter | {{< hotkey "Ctrl+W, L" >}}
Undo | {{< hotkey "Ctrl + U" >}}
Redo | {{< hotkey "Ctrl + R" >}}
Add to Watches | {{< hotkey "`" >}}
{{<raw_html>}}Move Caret Backward<br>a Paragraph{{</raw_html>}} | {{< hotkey F1 >}}
{{<raw_html>}}Move Caret Forward<br>a Paragraph{{</raw_html>}} | {{< hotkey F2 >}}
Add to Watches | {{< hotkey "`" >}}
Move Right | {{< hotkey "Alt+Right" >}} (default)
Move Left | {{< hotkey "Alt+Left" >}} (default)

{{< table/bootstrap-table >}}

| @@w=12em@@name | @@w=5em@@checked\n(☐☑) | Description |
| ---- | :----: | ---- |
Add leading space to comments | ☑ | 可以在打完註解``//``自動多一個空白
Insert Paired brackets\n(), [], {}, <> | ☐  | 我是不喜歡這種設定，很愚蠢，每次打完還要再用方向鍵不能連著打
Insert pair quote | ☐  | 同上
Change font size with\n``Ctrl+Mouse Wheel`` | ☑ | 可以用滾輪來改變font-size

{{< /table/bootstrap-table >}}

## 使用滑鼠滾輪來改變font-size

``Editor → General``:

  ☑ Change font size with ``Ctrl+Mouse Wheel``

## Editor

### Font

- Font: ``JetBrains Mono`` (或 ``Fira Code Retina``
- Size: 18

☑ Enable font ligatures: 這個選項勾起來之後，可以啟用連字，可以把``!=``做成像「``≠``」的效果！

## 關於go fmt

不需要特別用Plugins → Go → ``Go Fmt File``

可以運用預設的[Reformat Code]({{< ref "#reformat-code" >}})

比較快，而且兩個的結果是一樣的
