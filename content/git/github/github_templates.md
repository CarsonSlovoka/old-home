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
    - SUPPORT.md  # Security中會看到的東西
    - dependabot.yml
    - 📂 workflows  (裡面放的就是自己建立的yml，看你有多少workflows就建立多少個，高興就好！)
        - stale.yml  # 這是一個人家寫好的bot，可以自動地把一些issues做歸類，而不靠人工處理
        - ...
        - *.yml
    - 📂 ISSUE_TEMPLATE
        - config.yml  # Issues中可以有其他連結，可以透過點擊Open即可打開某些連結，都可以在這個檔案設定
        - bug_report.md  # 自定義的issue樣板
        - feature_request.md  # 自定義的issue樣板

```

#### SECURITY.md

{{< table/code-by-example "demo" "SECURITY.md" >}}

您可以在``根目錄``中新增SECURITY.md的檔案，並放上您要的內容，就會呈現出Security的內容。

例如右邊的範例:如果有問題可以寄信，然後48小時之內會回覆...

> 📙 這個檔案也會出現在Issues之中(H3會是看到中的標題文字)，其中按鈕的說明會是:「``View policy``」。

@@NEW-COL@@

```
## Security Policy

### Reporting a Vulnerability

Please report (suspected) security vulnerabilities to **[bjorn.erik.pedersen@gmail.com](mailto:bjorn.erik.pedersen@gmail.com)**. You will receive a response from us within 48 hours. If we can confirm the issue, we will release a patch as soon as possible depending on the complexity of the issue but historically within days.

Also see [Hugo's Security Model](https://gohugo.io/about/security-model/).
```

{{< /table/code-by-example >}}

{{< insert-figure "images/git/github/security_position.png" >}}

#### [dependabot.yml](https://dependabot.com/docs/config-file/)

👉 [github Docs文件](https://docs.github.com/cn/github/administering-a-repository/keeping-your-dependencies-updated-automatically)

Dependabot 可以自动维护您的仓库的依赖项。

{{< table/code-by-example "　"  "dependabot.yml" >}}

先了解:

> [package-ecosystem](https://docs.github.com/en/github/administering-a-repository/configuration-options-for-dependency-updates#package-ecosystem)

所以像是``pip``, ``npm``, ``gomod``這些都有支援，

也就是當這些套件有更新的時候它可以做到自動幫您的相依套件也更新

@@NEW-COL@@

```yml
version: 2
updates:
- package-ecosystem: "gomod"
  directory: "/"
  schedule:
  interval: "daily"
```
{{< /table/code-by-example >}}


#### 📂 workflows

什麼是[workflows]? 他有點像是[circleCI](https://circleci.com/)

總之您可以用它來達到CI/CD的效果。

而workflows可以在actions中建立，如下圖:

{{< insert-figure "images/git/github/actions.png" "" "50%" "50%" >}}

> 📙 了解更多關於[Github Actions](https://docs.github.com/cn/actions)

您可以在這邊挑選一些人家寫好的樣板，幾乎每一種語言都有人寫該樣板，用來測試發佈出去時可以正常運作

所以你可以挑你要的之後再做更改。

我這邊介紹一些我覺得目前對我比較有用，以及一些特別的workflow

- [hugo.workflows.test.yml]
- [stale.yml](https://github.com/probot/stale)

當然如果您願意可以一次建立很多workflow，反正每一個workflow都是獨立的，而且每一個都有各自的觸發程序。

##### [hugo.workflows.test.yml]

```yml
on: [push, pull_request]  # 觸發條件，當push或者pull_request時都會觸發  // 也能用created, edited
name: Test  # workflow的名稱
branches:  # 要作用到那些分支
  - main
  - release
jobs:  # 可以一次放很多job
  test:  # job名稱
    env:  # 環境變數設定
      GOPROXY: https://proxy.golang.org
      GO111MODULE: on
    strategy:  # 讓您設置變數，用$來存取
      matrix:  # ${{matrix. }}
        go-version: [1.16.x]  # ${{ matrix.go-version }}
        os: [ubuntu-latest, macos-latest, windows-latest]  # ${{ matrix.os }}
    runs-on: ${{ matrix.os }}  # 要在哪些作業系統運行，他會依次的傳遞每個項目給steps，也就是能在steps中，使用matrix.os得到目前是位於哪一個平台
    steps:
      - name: Install Go
        uses: actions/setup-go@37335c7bb261b353407cff977110895fa0b4f7d8
        with:
          go-version: ${{ matrix.go-version }}
      - name: Install Ruby
        uses: actions/setup-ruby@5f29a1cd8dfebf420691c4c9a0e832e2fae5a526
        with:
          ruby-version: '2.7'
      - name: Install Python
        uses: actions/setup-python@3105fb18c05ddd93efea5f9e0bef7a03a6e9e7df
        with:
          python-version: '3.x'
      - name: Install Mage
        run: go get github.com/magefile/mage@07afc7d24f4d6d6442305d49552f04fbda5ccb3e
      - name: Install asciidoctor
        uses: reitzig/actions-asciidoctor@7570212ae20b63653481675fb1ff62d1073632b0
      - name: Checkout code
        uses: actions/checkout@5a4ac9002d0be2fb38bd78e4b4dbde5606d7042f
      - name: Install docutils
        run: |
          pip install docutils
          rst2html.py --version
      - if: matrix.os == 'ubuntu-latest'
        name: Install pandoc on Linux
        run: |
          sudo apt-get update -y
          sudo apt-get install -y pandoc
      - if: matrix.os == 'macos-latest'
        run: |
          brew install pandoc
      - if: matrix.os == 'windows-latest'
        run: |
          choco install pandoc
      - run: pandoc -v
      - if: matrix.os == 'ubuntu-latest'
        name: Install dart-sass-embedded Linux
        run: |
          curl -LJO https://github.com/sass/dart-sass-embedded/releases/download/1.0.0-beta.6/sass_embedded-1.0.0-beta.6-linux-x64.tar.gz;
          echo "04fc1e5e28d29a4585a701941b6dace56771d94bfbe7f9e4db28d24417ceeec3  sass_embedded-1.0.0-beta.6-linux-x64.tar.gz" | sha256sum -c;
          tar -xvf sass_embedded-1.0.0-beta.6-linux-x64.tar.gz;
          echo "$GITHUB_WORKSPACE/sass_embedded/" >> $GITHUB_PATH
      - if: matrix.os == 'macos-latest'
        name: Install dart-sass-embedded MacOS
        run: |
          curl -LJO https://github.com/sass/dart-sass-embedded/releases/download/1.0.0-beta.6/sass_embedded-1.0.0-beta.6-macos-x64.tar.gz;
          echo "b3b984675a9b04aa22f6f2302dda4191b507ac2ca124467db2dfe7e58e72fbad  sass_embedded-1.0.0-beta.6-macos-x64.tar.gz" | shasum -a 256 -c;
          tar -xvf sass_embedded-1.0.0-beta.6-macos-x64.tar.gz;
          echo "$GITHUB_WORKSPACE/sass_embedded/" >> $GITHUB_PATH
      - if: matrix.os == 'windows-latest'
        name: Install dart-sass-embedded Windows
        run: |
          curl -LJO https://github.com/sass/dart-sass-embedded/releases/download/1.0.0-beta.6/sass_embedded-1.0.0-beta.6-windows-x64.zip;
          echo "6ae442129dbb3334bc21ef851261da6c0c1b560da790ca2e1350871d00ab816d  sass_embedded-1.0.0-beta.6-windows-x64.zip" | sha256sum -c;
          unzip sass_embedded-1.0.0-beta.6-windows-x64.zip;
          echo  "$env:GITHUB_WORKSPACE/sass_embedded/" | Out-File -FilePath $Env:GITHUB_PATH -Encoding utf-8 -Append
      - name: Test
        run: |
          mage -v test
          mage -v check;
      - name: Build Docs
        env:
          HUGO_BUILD_TAGS: extended
          HUGO_TIMEOUT: 31000
          HUGO_IGNOREERRORS: error-remote-getjson
        run: |
          mage -v hugo
          ./hugo -s docs/
          ./hugo --renderToMemory -s docs/
```

#### 📂 ISSUE_TEMPLATE

##### bug_report.md

{{< table/code-by-example "Desc" "bug_report.md" >}}

- ``name``: 使用者在UI上面看到的標題名稱
- ``about``: 標題名稱下方的description
- ``title``: 使用者回答問題上的標題，標題的預先填入內容
- ``labels``: 有多個標籤的時候用「``,``」分開，支持[emoji] (主要是md他用的是goldmark，這個就有支持)，但我個人建議盡量用[unicode emoji]

    > ❗ 標籤要生效則必須這些標籤要已存在，當然您也可以先建立，之後再去補標籤。總之如果這些標籤沒有存在，最後使用該issue的時候就不會自動加上這些標籤

- ``assignees``: 打上使用者的名稱即可

註記方式使用yml，可以讓他知道標籤的分類等等

而因為使用者看到的是row-data，所以有些東西如果您只是要提醒，可以像第8列那樣寫註解即可

最後github的markdown是有支援HTML的，所以可以直接像12-14列一樣寫上HTML的語法

[emoji]: https://www.webfx.com/tools/emoji-cheat-sheet/
[unicode emoji]: https://emojipedia.org/

@@NEW-COL@@

```txt {linenos=inline hl_lines=[8,"12-14"]}
---
name: 'Bug report'
title: ''
labels: 'bug, unsolved :raising_hand:'
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

範本2
```txt
---
name: Bug 回報
about: 提交bug幫助我們修復
title: "[BUG]"
labels: "🐛bug, 🀄zh"
assignees: "Carson"

---

### bug 描述 <!--详细地描述 bug，让大家都能理解-->

### 复现步骤 <!--清晰描述复现步骤，让别人也能看到问题-->

### 期望结果 <!--描述你原本期望看到的结果-->

### 复现代码 <!--提供可复现的代码，仓库，或线上示例-->

### 版本信息:

- version: <!--e.g. 1.0.0-->
- OS <!--e.g. mac OS-->

### 其他信息 <!--如截图等其他信息可以贴在这里-->
```


{{< /table/code-by-example >}}


##### config.yml

{{< table/code-by-example "　"  "config.yml" >}}

這個檔案會出現在Issues的Open之中

- name: 為標題名稱
- about: 為description
- url: 有提供了話，Open就可以連結過去

@@NEW-COL@@

```yml

blank_issues_enabled: false  # 如果設定為false，就表示使用者不能隨意的新增自定義的issue  # option allows you to show or hide the Create a blank issue choice when users select New issue
contact_links:
    - name: Support
      url: https://discourse.gohugo.io/
      about: Please do not use Github for support requests. Visit https://discourse.gohugo.io for support!
```

{{< /table/code-by-example >}}

{{< insert-figure "images/git/github/config.yml.png" "" "100%" "25%">}}


#### 🔗 參考

- [configuring-the-template-chooser]
- [configuration-options-for-dependabotyml]
- [gitlab-description-templates]
- [beego .github]
- ★[一些ISSUE_TEMPLATE的參考](https://github.com/compiler-s20/discussion)

## labels

請參考:

- [About default labels](https://docs.github.com/en/github/managing-your-work-on-github/managing-labels#about-default-labels)
- [搜尋標籤](https://docs.github.com/cn/github/managing-your-work-on-github/using-search-to-filter-issues-and-pull-requests)

### [Search by the title, body, or comments](https://docs.github.com/en/github/searching-for-information-on-github/searching-issues-and-pull-requests#search-by-the-title-body-or-comments)

| Qualifier | Example |
| ---- | ---- |
``in:title`` | ``warning in:title`` matches issues with "warning" in their title.
``in:body`` | ``error in:title,body`` matches issues with "error" in their title or body.
``in:comments`` | ``shipit in:comments`` matches issues mentioning "shipit" in their comments.


## [Github主頁上的README.md](https://docs.github.com/en/github/setting-up-and-managing-your-github-profile/managing-your-profile-readme)


Github也像[shields.io]有提供一些圖片讓使用者顯示一些統計資料，以下是我覺得比較酷的資訊

```html
<a href="https://github.com/CarsonSlovoka">
  <img height="180em" src="https://github-readme-stats.vercel.app/api?username=CarsonSlovoka&show_icons=true&theme=merko&count_private=true" alt="CarsonSlovoka's github stats" />
  <img height="180em" src="https://github-readme-stats.vercel.app/api/top-langs/?username=CarsonSlovoka&theme=merko&layout=compact" alt="CarsonSlovoka's github top languages" />
</a>
```

複製下來接著把CarsonSlovoka改成您自己的名稱即可呈現出您的Github資訊，類似下圖

{{<raw_html>}}
<a href="https://github.com/CarsonSlovoka">
  <div class="row">
    <div class="col-md-6"><img height="180em" src="https://github-readme-stats.vercel.app/api?username=CarsonSlovoka&show_icons=true&theme=merko&count_private=true" alt="CarsonSlovoka's github stats" /></div>
    <div class="col-md-6"><img height="180em" src="https://github-readme-stats.vercel.app/api/top-langs/?username=CarsonSlovoka&theme=merko&layout=compact" alt="CarsonSlovoka's github top languages" /></div>
  </div>
</a>
{{</raw_html>}}

----

以下是另一種風格:

{{< table/code-by-example "Output" "代碼" >}}

[![CarsonSlovoka's github stats](https://github-readme-stats.vercel.app/api?username=CarsonSlovoka)](https://github.com/CarsonSlovoka/vue-admin-beautiful)

@@NEW-COL@@

```markdown
[![CarsonSlovoka's github stats](https://github-readme-stats.vercel.app/api?username=CarsonSlovoka)](https://github.com/CarsonSlovoka/vue-admin-beautiful)
```

{{< /table/code-by-example >}}


[configuring-the-template-chooser]: https://docs.github.com/en/github/building-a-strong-community/configuring-issue-templates-for-your-repository#configuring-the-template-chooser
[configuration-options-for-dependabotyml]: https://docs.github.com/en/github/administering-a-repository/configuration-options-for-dependency-updates#configuration-options-for-dependabotyml
[gitlab-description-templates]: https://docs.gitlab.com/ee/user/project/description_templates.html
[beego .github]: https://github.com/beego/beego/tree/develop/.github
[workflows]: https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions
[hugo.workflows.test.yml]: https://github.com/gohugoio/hugo/blob/master/.github/workflows/test.yml
[shields.io]: https://shields.io/category/social
