+++
title = "sass基礎教學"
date = 2020-01-10T12:45:00+08:00
description = "帶您快速進入SASS的世界"
tags = ["sass"]
bootstrap = true
markmap = true
toc_markmap = true
toc_bootstrap = true
+++


## [官方文件](https://sass-lang.com/documentation)

沒什麼好講的，官方文件寫得很棒，也有sass轉成css的對照，所以照著官方的文檔看就好了，可以點旁邊的``Contents``在分類中找到您有興趣的主題

## [Sass的種類](https://sass-lang.com/documentation/values/functions)

- ``Dart Sass``\:我會只建議用這個版本，其他兩個Sass很多東西都有棄用的東西跑出來，LibSass甚至有很多問題。
- ~~LibSass~~
- ~~Ruby Sass~~

## 註解

- ``/**/``: 多行註解，它會被render出來

  他還是要注意，並不是開頭用``/*``結尾用``*/``中間的內容就可以亂寫

  建議使用:

  ```
  /* desc 1
   * desc ...
   * desc end */
  ```

  ``*/``要放在最後，不能放新的一列，同樣的開頭也不建議單獨留下``/*``有時候也會有問題，至於內容的``*``其實可以縮進然後省略，如下:

  ```
  /* desc 1
     desc ...
     desc end */
  ```

- ``//``: 單行註解，不會被render

## [At-Rules]

關於一些開頭為``@``保留字的用法都可以在這邊找到

個人覺得很有用的像是

- [@use]

    > :exclamation: 不要再使用[@import]它已經棄用，不再支持了！

- ``@mixin`` and ``@incluce``: mixin本身有點像宣告的意思，而被mixin的東西都可以被include，所以這兩者相互搭配
- [@function]\: 和一般我們熟悉的function差不多

  - 預設值:
    - ``@function($size: null)``
    - ```
      $-my_size: 12px
      @function($size: $-my_size)
      ```
      [私有變數](https://sass-lang.com/documentation/at-rules/use#private-members) 可以用``_``或者``-``來開頭，官方的文檔都是用``-``
  - 區域變數:
    在 @if或者@function所宣告的變數都是``區域變數``

- [@debug]\: 很常用到像，如同Python的print一樣可以把結果顯示出來，例如:
  ```sass
  @debug 4px * 6px
  ```

  > ``your.sass:10 Debug: 24px*px``
  它會跟你說，在哪一個``檔案``中的哪一``行``，的``數值``結果

  ```sass
  @debug "divider offset: #{$divider-offset}"
  ```
  ``#{}``的意思可以把引號"給移除，例如: ``h#{$i}`` 我們就需要h1, h2...而不是h"1"這種東西


## 物件的類型 (Values)

常用的

- ``Numbers``:
    - 1
    - 0.1
    - 5.2e3 (5200)
- ``Strings``
- ``Colors``: rgb, rgba, hsl, hsla
- ``Lists``\: list
- ``Maps``\: 如同dict
- ``true``\: and ``false``
- ``null``
- ``Function``\: 名稱中可以使用``-``
    ```sass
    @function() my-demo($name)
      @debug "#{$name}"
      @return true

    my-demo("hello world")
    ```

更多可以參考: [Overview](https://sass-lang.com/documentation/values)



## 參考資料

- [Sass / SCSS 預處理器 - Variables 變數宣告與 !global、!default 標誌定義](https://awdr74100.github.io/2020-05-25-scss-variables/)


[@import]: https://sass-lang.com/documentation/at-rules/import
[@use]: https://sass-lang.com/documentation/at-rules/use
[@function]: https://sass-lang.com/documentation/at-rules/function
[@debug]: https://sass-lang.com/documentation/at-rules/debug
[At-Rules]: https://sass-lang.com/documentation/at-rules
