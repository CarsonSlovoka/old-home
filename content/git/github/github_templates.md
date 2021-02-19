+++
title = "Templates"
description="教您如何在github上刻製化樣板"
date = 2021-02-19T16:38:10+08:00
lastmod = 2021-02-19
featured_image = ""
draft = false
weight = 0
tags = ["github"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = ""
  next_page = ""
  previous_section = ""
  next_section = ""
+++


## 前言

您在github上可能會用到

- Issues
- Projects

而當您看別人的專案時，有其是Issues，你會發現，當要新增時可能會有一些選項讓您填選

[例如](https://github.com/gohugoio/hugo/issues/new/choose):

- Bug report
- Support
- ...

而這些東西又是怎麼建立出來的呢？


## Issues

要建立這些東西有兩個途徑可以選擇

1. UI
2. 設定檔

### UI

```
Settings → (往下滑) → Features
                       →  ☑ Issues
                            → 點擊 Set up templates
```

{{< insert-figure "images/git/github/issues_position.png" >}}


點擊上方圖片的位置，接著當引導就能順利完成了！

### 設定檔

*我個人是推薦這個方法*

不管你是用UI還是這個方法，最後都會生成檔案在您的``.github``目錄下

[結構](https://github.com/gohugoio/hugo/tree/master/.github)，如下

```
SECURITY.md
.github 📂
    - SUPPORT.md  (可選)
    - dependabot.yml
    - Receiptstale.yml
    - 📂 workflows  (裡面放的就是自己建立的yml，看你有多少workflows就建立多少個，高興就好！)
        - stale.yml
        - ...
        - *.yml
    - 📂 ISSUE_TEMPLATE
        - config.yml
        - bug-report.md
        - feature_request.md

```

#### SECURITY.md

{{< table/code-by-example "demo" "SECURITY.md" >}}

您可以在``根目錄``中新增SECURITY.md的檔案，並放上您要的內容，就會呈現出Security的內容。

例如右邊的範例:如果有問題可以寄信，然後48小時之內會回覆...

@@NEW-COL@@

```
## Security Policy

### Reporting a Vulnerability

Please report (suspected) security vulnerabilities to **[bjorn.erik.pedersen@gmail.com](mailto:bjorn.erik.pedersen@gmail.com)**. You will receive a response from us within 48 hours. If we can confirm the issue, we will release a patch as soon as possible depending on the complexity of the issue but historically within days.

Also see [Hugo's Security Model](https://gohugo.io/about/security-model/).
```

{{< /table/code-by-example >}}

{{< insert-figure "images/git/github/security_position.png" >}}

#### 📂 ISSUE_TEMPLATE

{{< table/code-by-example "Desc" "bug-report.md" >}}

- ``name``: 使用者在UI上面看到的標題名稱
- ``about``: 標題名稱下方的description
- ``labels``: 有多個標籤的時候用「``,``」分開，支持[emoji] (主要是md他用的是goldmark，這個就有支持)，但我個人建議盡量用[unicode emoji]

   新增完成標籤分類就會自動多出這幾項

註記方式使用yml，可以讓他知道標籤的分類等等

而因為使用者看到的是row-data，所以有些東西如果您只是要提醒，可以像第8列那樣寫註解即可

最後github的markdown是有支援HTML的，所以可以直接像12-14列一樣寫上HTML的語法

[emoji]: https://www.webfx.com/tools/emoji-cheat-sheet/
[unicode emoji]: https://emojipedia.org/

@@NEW-COL@@

```txt {linenos=inline hl_lines=[8,"12-14"]}
---
name: 'Bug report'
labels: 'bug, 'unsolved :raising_hand:''
assignees: ''
about: Create a report to help us improve
---

<!-- Please answer these questions before submitting your issue. Thanks! -->

### What version of Hugo are you using (`hugo version`)?

<pre>
$ hugo version
</pre>

### Does this issue reproduce with the latest release?
```

{{< /table/code-by-example >}}


#### 📂 workflows

- [stale.yml](https://github.com/probot/stale)

#### 🔗 參考

- [configuring-the-template-chooser]
- [configuration-options-for-dependabotyml]
- [gitlab-description-templates]
- [beego .github]
- ★[一些ISSUE_TEMPLATE的參考](https://github.com/compiler-s20/discussion)

[configuring-the-template-chooser]: https://docs.github.com/en/github/building-a-strong-community/configuring-issue-templates-for-your-repository#configuring-the-template-chooser
[configuration-options-for-dependabotyml]: https://docs.github.com/en/github/administering-a-repository/configuration-options-for-dependency-updates#configuration-options-for-dependabotyml
[gitlab-description-templates]: https://docs.gitlab.com/ee/user/project/description_templates.html
[beego .github]: https://github.com/beego/beego/tree/develop/.github
