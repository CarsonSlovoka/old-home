+++
title = "Hosting on Github"
date = 2020-12-30T11:21:00+08:00
description = "如何將Hugo發佈到Github上"
tags = ["hugo", "github"]
draft = false
toc = true
bootstrap = true
[article_image]
    src = "images/hugo/gohugoio-card.jpg"
+++

## Types of Github Pages

Github pages分為兩種，

1. User/Organization Pages

    ``(https://<USERNAME|ORGANIZATION>.github.io/)``

    也就是您自己github上的根結點網站

2. Project Pages

    ``https://<USERNAME|ORGANIZATION>.github.io/<PROJECT>/)``

    您也可以為您每一個專案建立一個專屬於該網頁的專案

## 發布的方式

有一些常規的發布方法

- 使用網站本身的根結點當作網頁
- 使用``docs``當作網頁
- 建立一個``gh-pages``分支

以下我們會對這幾種方法加以說明

### 使用網站本身的根結點當作網頁

也就是您發布的東西的網頁會抓取您整個root的頁面，不建議使用這種方法，因為有很多東西是不必丟到網頁上去的內容

例如.gitignore還是一些其他的設定等等的

### 使用docs當作網頁

在Github早期，沒有得可以選取專案要使用哪一個資料夾當作github page預設就是使用docs

但現行的版本已經可以設定，您可以把網頁的所有東西丟到docs這個資料夾，

github page顯示的東西就只有docs這個資料夾而已

### gh-pages

這是我比較推薦的做法，

也就是新增一個額外的分支(獨立分支)

    # 前置動作先在.gitignore忽略掉public資料夾
    git checkout --orphan gh-pages  # 切換到一個獨立分支，分支名稱為gh-pages
    git reset --hard  # 通常我們在建立此分支之後，因為以前提交過的東西，都還會存在，所以--hard可以消除那些東西
    git commit --allow-empty -m "Initializing gh-pages branch"  # 預設commit一定要有異動才可以提交，但是我們只是要記錄這個新的分支，所以使用--allow-empty來幫助我們
    git push upstream gh-pages  # 其實就是push到gh-pages，upstream只是方便您這定而已，個人不建議加上upstream
    git checkout main  # 最後在切換回您的主分支就好了，不一定是main反正就看你的主分支是什麼

    # 對於將來的異動，你更新完public之後在切換到gh-pages做提交再上傳即可

補述:

- ``git checkout --orphan gh-pages``:

  注意您剛建立一個orphan如果沒有提交任何東西，這時候您再用gitk是看不到您之前的分支，

  > :pushpin: 如果您當前的HEAD追蹤不到，就沒辦法用``gitk``來查看，他會顯示: ``Error parsing revisionis: unknown revision HEAD``

  但別擔心其實他們都還在，您用git branch還是可以發現您所有的分支

- ``git reset --hard``:

  如果我們真的希望建立完全空的的資料夾，也說不過去，所以在做這動作之前應該先編輯您的``.gitignore``然後把要發布出去的資料夾名稱填上去

  ~~也就是``public``資料夾 (``gh-pages``預設是使用public資料夾的內容當作站點，有點像我們之前說過的[使用docs當作網頁](#使用docs當作網頁)~~

  現在github的gh-pages也像一般的branch一樣可以選擇是要root還是docs，

  建議和俗成一樣使用``docs``就好了。

- ``git push upstream gh-pages``

  這是一個懶人的設定，完成之後您就可以只使用

  > git push

  他就會依造您之前的upstream，得知你要push的分支其實是gh-pages

  我個人是會偏向打上完整的資訊，例如:

  ``git push [remote-name] [branch-name]``

## 參考資料
- [hosting-on-github](https://gohugo.io/hosting-and-deployment/hosting-on-github/)
