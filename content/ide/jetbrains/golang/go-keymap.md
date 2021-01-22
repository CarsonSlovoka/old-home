+++
title = "Go-Keymap"
description=""
date = 2021-01-22T13:25:01+08:00
lastmod = 2021-01-22
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
| Go to Declaration or Usages | {{< hotkey "Shift + F12" >}}
| {{< auto-id "Reformat Code" >}} | {{< hotkey "Ctrl + Alt + Enter" >}}
| Split Right |  {{< hotkey "Ctrl+W, V" >}}
| Split Down  | {{< hotkey "Ctrl+W, S" >}}
| Split and Move Down  | {{< hotkey "Ctrl+W, Down" >}}
| Split and Move Right |  {{< hotkey "Ctrl+W, Right" >}}



## 使用滑鼠滾輪來改變font-size

``Editor → General``:

  ☑ Change font size with ``Ctrl+Mouse Wheel``


## 關於go fmt

不需要特別用Plugins → Go → ``Go Fmt File``

可以運用預設的[Reformat Code]({{< ref "#reformat-code" >}})

比較快，而且兩個的結果是一樣的
