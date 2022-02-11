+++
title = "Bat教學"
description=""
date = 2021-03-23T16:58:25+08:00
lastmod = 2021-03-23
featured_image = ""
draft = false
weight = 0
tags = ["bat"]
markmap = true
toc_markmap = true
toc_bootstrap = true
+++

## 如何折行

使用 ``^``

```bat
REM 1到^前面有一個空白
echo 1 ^
22 ^
  333
REM 22到^一個空白再到333之間兩個空白
```

輸出
```bat
1 22   333
```

1空白和3空白

## %~ 與 % 有何差異？

``%~`` 可以去除掉 ``"``

{{< table/code-by-example "test.bat" "cmd">}}

```bat
REM "12345"
echo %1

REM 12345
echo %~1
```

@@NEW-COL@@

```
test.bat "12345"
```

{{< /table/code-by-example >}}


## start 和 call 有何不同？

- start會建立一個新的視窗，不會共享變量
- call還是在原視窗，且共享變量

## set與setX有何差別 (環境變數 env)

- `setx 變數名 "變數值"` 會存在使用者變數之中)
- `set 變數名=變數值`    終端機關閉就結束了

```reg
:: 暫時清空，只是變成空字串而已
set MyVar=

:: 把機碼刪除，可以清空HKCU，也就是使用者變數的資料
REG delete HKCU\Environment /F /V MyVar

:: 清除指定的系統變數
REG delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V MyVar
```

## 參考資料

- [Command line to remove an environment variable from the OS level configuration](https://stackoverflow.com/a/13222794/9935654)
