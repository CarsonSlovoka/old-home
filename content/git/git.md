+++
title = "Git教學"
description = "一些git好用的東西"
date = 2020-12-14T18:13:00+08:00
lastmod = 2021-04-14
featured_image = ""
tags = ["git"]
draft = false
markmap = true
toc_markmap = true
toc_bootstrap = true
+++

## [gitconfig]((https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config#:~:text=The%20system%20level%20configuration%20file,on%20Windows%20Vista%20and%20newer.))

設定一共有3個:

{{< table/bootstrap-table >}}

| 設定檔 | 位置  | 說明 |
| ---- | ---- | ---- |
| -\-system  | windows:``%programdata%/Git/config``\nUnix:``$(prefix)/etc/gitconfig``
| -\-global | windows:``%userprofile%/.gitconfig``\nUnix:``~ /.gitconfig``
| -\-local | ``.git/config`` (這個只的就是您git init出來的那個.git資料夾，一般不會在這邊設定)

{{< /table/bootstrap-table >}}

如果您懶得找文件位置，想要直接開起來編輯，可以用``--edit``

> git config -\-global -\-edit

通常編輯器會告訴您檔案的位置，您就知道在哪裡了

如果您需要更詳細的資訊可以參考[atlassian.com git config](https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config#:~:text=The%20system%20level%20configuration%20file,on%20Windows%20Vista%20and%20newer.)

以下這個是我的設定(使用者設定檔: ``--global``):

```yaml
[user]
	name =
[user]
	email =
[gui]
[alias]
# https://stackoverflow.com/questions/7534184/git-alias-multiple-commands-and-parameters
# https://stackoverflow.com/questions/7066325/list-git-aliases
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux/28938235#28938235
# https://stackoverflow.com/questions/10998792/how-to-color-the-git-console
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
# https://stackoverflow.com/questions/715321/git-status-is-there-a-way-to-show-changes-only-in-a-specific-directory
    list-alias = --list-cmds=alias  # git --list-cmds=alias
    list-alias2 = "!f() { \
        name=${1:-alias}; \
        git var -l | grep -e "^$name" ;\
    }; f"
    alias-list = !git config --get-regexp ^alias\\. | sed -e s/^alias.// -e s/\\ /\\ $(printf \"\\043\")--\\>\\ / | column -t -s $(printf \"\\043\") | sort -k 1
    # git var -l | findstr ^$1.* ;
    # git var -l | grep -e "^${name}" ;\
    # git var -l | grep -e "^${1:20}" ;\
    # let a=b==5?5:10;  \
    # b=$([ "$1" == "abc" ] && echo "5" || echo "not 5" ); \ # = is operator tests for string equality, if you want numeric comparision, use -eq instead.
    # name=${1:-empty}; \
    # [ $1 == "" ] && name="alias" || name="$1" ;\
    # echo -e '\\033[38;2;255;0;0m$name\\033[m' ; \  # 38 is fore 48 is back
    show-cmd = "!f() { \
        sep="㊣" ;\
        name=${1:-alias};\
        echo -n -e '\\033[48;2;255;255;01m' ;\
        echo -n -e '\\033[38;2;255;0;01m' ;\
        echo "$name"; \
        echo -n -e '\\033[m' ;\
        git config --get-regexp ^$name\\..*$2+ | \
        cut -c 1-40 | \
        sed -e s/^$name.// \
        -e s/\\ /\\ $(printf $sep)--\\>\\ / | \
        column -t -s $(printf $sep) | \
        sort -k 1 ;\
    }; f"
	# !git status | grep 'new file' | cut -c 14-
	# git status --short = git status -s
	st = status -s

    # sed 's/要被取代的字串/新的字串/'
    st-color = "!f() { \
        echo -n -e '\\033[38;2;255;0;01m\\033[4m' ;\
        git status -s | grep ' D' | \
        sed -e 's/^ ./DELETE:/' ; \
        echo -n -e '\\033[m' ;\
        \
        echo -n -e '\\033[48;2;128;128;128m' ;\
        echo -n -e '\\033[38;2;0;255;01m' ;\
        git status -s | grep ' [AM]' | \
        sed -e 's/^ ./NEW OR MODIFY:/' ; \
        echo -n -e '\\033[m' ;\
        \
        echo -n -e '\\033[38;2;255;0;255m' ;\
        echo Rename ;\
        git status -s | grep 'R ' | \
        sed -e 's/^..//' ; \
        echo -n -e '\\033[m' ;\
    }; f"

	# you can't use the underline for example delete_and_push
	dap = "!f() { \
	    git push $1 --delete $2; \
	    git push $1 $2; \
	}; f"

	delete-and-push-delete = "!f() { \
	    remote=${2:-Online}; \
	    git branch -D $1 ;\
        echo -n -e '\\033[38;2;255;0;255m' ;\
        echo $remote ;\
        echo -n -e '\\033[m' ;\
	    git push $remote --delete $1 ; \
	}; f"

	stk = "!f() { \
	    git st $1; \
	    gitk --all; \
	}; f"

    ch-and-db = "!f() { \
	    git checkout $1; \
	    git branch -D $2; \
	}; f"

    cb = "!f() { \
            git checkout -b $1; \
        }; f"

    bD = "!f() { \
            git branch -D $1; \
        }; f"

    chb-and-db = "!f() { \
	    git checkout -b $1; \
	    git branch -D $2; \
	}; f"

    ch-and-back = "!f() { \
	    git checkout $1; \
	    git checkout $2; \
	}; f"

    chb-and-back = "!f() { \
	    git checkout -b $1; \
	    git checkout $2; \
	}; f"

    k = "!f() { \
		gitk --all; \
	}; f"

[core]
	quotepath = false  # 中文可能會在status中看到亂碼，設置成false就不會了
    editor = 'C:\\Program Files (x86)\\Notepad++\\notepad++.exe' -multiInst -notabbar -nosession -noPlugin  # 使用notapd++
    # editor = 'C:/tools/neovim/Neovim/bin/nvim-qt.exe'  # 使用neovim當作編輯器
	# autocrlf = true  # true, input, false  三選一
[gui]
	encoding = utf-8
[i18n "commit"]
	encoding = utf-8
[i18n]
	logoutputencoding = utf-8
[winUpdater]
	recentlySeenVersion = 2.24.0.windows.2
```

👆``.gitconfig``檔案，您可以直接打開編輯它，或者在終端機使用

> ``git config --global <attr> <value>``

----

- 設定:core.autocrlf為true的指令:
  > ``git config --global core.autocrlf true``

- 查看:core.autocrlf的設定值:
  > ``git config --global core.autocrlf``

當然也可以套用在系統設定檔(``--system``)

> ``git config --system core.autocrlf``

也可以不用指定類別，他會抓當前您適用的項目

> ``git config core.autocrlf``

### local

很少會用到這個，但是像您remote的項目就會在這邊，一般您看到的東西應該會類似這個

```yaml
git config --local --edit # 編輯 .git/config 檔案
```

> 如果您已經在含有`.git`的資料夾內，可以省略掉`--local`

```yaml
[core]
	repositoryformatversion = 0
	filemode = false
	bare = false
	logallrefupdates = true
	symlinks = false
	ignorecase = true
	worktree = ../../my-proj
[remote "Github"]  # <-- 您可以在這邊直接更改
	url = https://github.com/username/repository-name.git
	fetch = +refs/heads/*:refs/remotes/Github/*
[remote "Online"]
	url = https://username@bitbucket.org/proj-name/repository.git
	fetch = +refs/heads/*:refs/remotes/Online/*
```

## autocrlf

您在安裝git的時候可能會看到這張圖片:

{{< insert-figure "images/git/autocrlf.png" "" "50%" "50%" >}}

他詢問您要如何設定autocrlf，有三種可以選擇

1. Checkout Windows-style(``CRLF``),  commit Unix-style line endings: `autocrlf = true`: 推薦windows系統用，因為checkout時會把代碼都變成crlf;提交的時候一律用lf，如此能讓儲存空間少一點紀錄
2. Checkout as-is, commit Unix-style line endings(``LF``): `autocrlf = input`: 推薦Unix系統用, checkout的時候，依據原本的內容是什麼就是什麼，而提交的時候一律都改成lf
3. Checkout as-is, commit as-is: `autocrlf = false`: 不做任何調整，是什麼就是什麼

選1或2都會在commit的時候自動把換行符號轉為LF，這是有好處的畢竟LF比CRLF少一個字。

如果需要轉換可能就會看到以下警告:

    warning: LF will be replaced by CRLF in
    The file will have its original line endings in your working directory

您可能會覺得很煩，出現這些警告想要關閉，我是覺得還好😆

最快的方式就是用選項3: ``core.autocrlf=false`` 然後搭配[.editconfig](https://EditorConfig.org)

直接指定: ``end_of_line = lf``

其實crlf我個人認為落伍，畢竟mac也從原本的cr轉向變為和unix一樣的lf，

目前，三大系統中唯獨windows異類...

撇開這些不談，編輯器其實都很聰明不會因為您在windows系統看lf的文件就變成一行(當然如果你要拿那種陽春的記事本就另當別論)

舉例來說notepad++右下角都會有告訴您當前文件用的是什麼編碼，然後換行符號用的系統到底是windows(CRLF)或Unix(LF)

{{< insert-figure "images/git/notepad_info.png" "" "50%" "50%" >}}

所以我才會說即便您在windows，直接把editconfig的設定改成``end_of_line = lf``比較乾脆，反正commit用LF本來就是趨勢。


```
╔═══════════════╦══════════════╦══════════════╦══════════════╗
║ core.autocrlf ║     false    ║     input    ║     true     ║
╠═══════════════╬══════════════╬══════════════╬══════════════╣
║               ║ LF   => LF   ║ LF   => LF   ║ LF   => CRLF ║
║ git checkout  ║ CR   => CR   ║ CR   => CR   ║ CR   => CR   ║
║               ║ CRLF => CRLF ║ CRLF => CRLF ║ CRLF => CRLF ║
╠═══════════════╬══════════════╬══════════════╬══════════════╣
║               ║ LF   => LF   ║ LF   => LF   ║ LF   => LF   ║
║ git commit    ║ CR   => CR   ║ CR   => CR   ║ CR   => CR   ║
║               ║ CRLF => CRLF ║ CRLF => LF   ║ CRLF => LF   ║
╚═══════════════╩══════════════╩══════════════╩══════════════╝
```

### safecrlf

```
# 拒絕提交混合換行符的文件
git config --global core.safecrlf true

# 允許提交混合換行符的文件
git config --global core.safecrlf false

# 包含混合換行符時，出現警告
git config --global core.safecrlf warn
```

## 如何取得某一個版本的文件

    git checkout [sha-1-id] -- html/temp/xxx.html


## git submodule

- ``git submodule add https://github.com/username/repo.git  path/subpath/myrepo-dir``

  他會新增 .gitmodules

  ```
  [submodule "path/subpath/myrepo-dir"]
	path = path/subpath/myrepo-dir
	url = https://github.com/username/repo.git
  ```

  以及 .git/config 新增

  ```
  [submodule "path/subpath/myrepo-dir"]
	url = https://github.com/username/repo.git
	active = true
  ```

- ``git add path/subpath/myrepo-dir``
    他就會記錄當前你這個submodule當時對應該submodule的sha1是多少

- ``git commit -m "[submodule] ..."``

遞迴更新
> git submodule update -\-init -\-recursive <path>

`recursive`指令是指如果您的submodule中又有submodule的時候也會一併處理

`path`是放資料夾的路徑名稱(不是別名)，和`.gitmodules`中的path一樣

此指令其實會去clone專案回來，所以會把專案整包抓下來，當前的節點會是submodule當初新增時的節點

`path`可以不打，就會對所有submodule都處理，而如果您只要某些專案而已就還是打上


> `git submodule update --init` : 指的是回到當時候提交這個submodule時的節點
>
> 例如您提交了一個submodule是在十年前sha1-id假設是`0123456...`，並且之後無再提交任何東西，現在這個分支已經又改了很多，
>
> 那麼您使用這個命令就是回到十年前的`0123456...`這個節點


## git merge

- ``git merge --squash``:

  會把分支所有的commite的東西都抓起來，然後您會看到一個未完成的提交，您需要commit它來完成。(也就是把分支的所有提交，整合到一個commit之中)

- ``git merge --abort``:

  如果您後悔了，可以用此指令取消merge


### Fast-forward (--no-ff)

如果您切換到先前的分支再merge回當前的位置

> git merge sha1xxx -m "..."

應該會得到類似的東西

    Updating 67c0988..e296daa
    Fast-forward (no commit created; -m option ignored)

在分支圖(``gitk --all``)並不會看到有任何新的commit出現，位置也只是再往前移動到您merge的位置罷了

如果說您希望長出「``耳朵``」這時候就要借助指令``--no-ff``

也就是禁用快速往前的這種合併，就能夠順利長出耳朵了。

您可能會問，長耳朵有什麼用？

我的習慣是如果有一個時期的更改，可能都和某些事項有關，那麼我會希望最後併起來的時候，會有一個總結，也就是耳朵；耳朵內的東西就是和該事物都有關的commit

當然如果您善用github issues之類的東西，這可能就不是那麼的必要，畢竟issues很強大，可以搜尋又可以整合以往的commit紀錄，超讚👍

## gitk

| command | desc |
| ---- | ---- |
gitk sha1..sha2 | 查看sha1~sha2(是比較後面的结點)的结點
gitk master..dev | 查看master到dev的结點
git gui | 如果你出現``Local changes checked in to index but not committed``又想要查看當前的版本修改了那些就可以使用這個指令


----

- [gitk --simplify-by-decoration --all](https://stackoverflow.com/q/69049642/9935654)

    所謂的simplify-by-decoration是指，假設您有很多分支，其中每個分支又個別做了好幾個修改，

    例如: 您有10個分支，每個分支又個別做了10次修改，所以gitk --all看到的會至少有10*10=100個節點

    而simplify-by-decoration只會顯示每個分支的最後一個修改，所以您只會看到10個節點而已


- `gitk --all --ancestry-path sha1..`

  例如 `gitk --all --ancestry-path 123456..` 表示開始的節點(祖先)為123456這個節點(你也可以用branch名稱)

## git rebase

rebase我常用在整個搬移，當然rebase很強大也可以修改過去的commit紀錄，但不建議！

rebase比較常用在搬移，當您不想要

> ``git cherry-pick [sha1-xxx]``

一個一個pick，就用rebase，

它的用法:

假設我要把dev的內容全部搬到master去

    git checkout dev
    git rebase master

之後master之後就會長出所有dev的東西(這邊我假設您沒有任何的conflict)

## [git pull](https://git-scm.com/docs/git-pull/2.31.0)

官方語法:

> ``git pull [<options>] [<repository> [<refspec>…]]``

所謂的repository指的是遠端(remote)分支的名稱

refspec就是您的分支名稱(當然您要給sha1的數值也可以)

官方部分說明如下

``git pull`` is shorthand for ``git fetch`` followed by ``git merge FETCH_HEAD``.

例如:

> git pull remoteName develop

等同執行

> git fetch remoteName develop
>
> * branch            develop    -> FETCH_HEAD  (意思是說現在FETCH_HEAD的位子就是在此)

接下來

> git merge FETCH_HEAD


FETCH_HEAD ?

> 當我們使用fetch的時候會把遠端分支的內容拉回到本機端，這時候該分支並沒有任何名稱(他只會紀錄remote的名稱)，
>
> 那我們怎麼知道此分支的節點名稱到底是什麼？
>
> 其實看sha1就知道了。簡單來說FETCH_HEAD就是fetch回來分支的節點(最末節點)的sha1值
>

所以實際上您也可以

> git checkout FETCH_HEAD

就可以知道目前FETCH_HEAD的位子在哪裡了

## git diff

| Commands | Desc |
| ---- | ---- |
`git diff` | 只會顯示**修改**的部分
`git diff --cached` | 顯示**新增**(例如新增檔案)的部分
`git diff HEAD` | 顯示本次所做的所有**異動**(包含新增與修改)


### 更多查看變動的技巧

1. `git add -p` : 這個是add的時候順便查看修改的情況，查看完之後可以讓您選擇是否真的要add
2. `git commit -v` 或者 `git commit --verbose` : 這個會在commit的同時，也顯示出修改讓您知道。



## .gitignore

    public/
    !tool/FileServer/public

排除public資料夾，

但是不包含``!tool/FileServer/public``

## [git tag](https://git-scm.com/docs/git-tag)

```
git tag <tag_name> <commit_sha1>
```

| Options | Desc. | Example |
| ---- | ---- | ---- |
-f -\-force | Replace an existing tag with the given name (instead of failing) |
-l -\-list  | List tags | ``git tag -l 'v1.4.2.*'``
-d -\-delete | Delete existing tags with the given names. | ``git tag -d "v1.4.2"``

### remote tag

- 新增
    > git push origin -\-tags

- 刪除
    > git push -\-delete origin tagname


### remote prune

> git remote prune REMOTE_NAME

### remote rename

> git remote rename <old> <new>

## git gc 垃圾清理

- 文件系統檢查。它驗證數據庫中對象的連接性和有效性

  > git [fsck](https://git-scm.com/docs/git-fsck) -\-unreachable

```
git reflog expire --expire-unreachable=now --all
git gc --prune=now

或者
git reflog expire --expire=now --expire-unreachable=now --all && git gc --prune=all --aggressive

# 蓋掉遠端的東西
git push Github --force --all
```

> git -\-prune

## [git-sparse-checkout](https://stackoverflow.com/a/68794769/9935654)

當您的git文件很大的時候，如果我們只對某幾個資料夾或者檔案有興趣的時候，就可以這麼做

```
git init
git sparse-checkout init
git sparse-checkout set "YOUR_DIR_PATH"
git remote add <REMOTE_NAME> https://github.com/AUTH/REPO.git
git pull --depth 1 Github <SHA1_or_BRANCH_NAME>
```

- depth 可以管控你抓的節點
- ``sparse-checkout``: 可以指定要那些文件就好

### Example

```
git init
git sparse-checkout init
// git sparse-checkout set "chrome/common/extensions/api/"
start .git\info\sparse-checkout   👈 open the "sparse-checkut" file

/* .git\info\sparse-checkout  for example you can input the contents as below 👇
chrome/common/extensions/api/
!chrome/common/extensions/api/commands/     👈 ! unwanted : https://www.git-scm.com/docs/git-sparse-checkout#_full_pattern_set
!chrome/common/extensions/api/devtools/
chrome/common/extensions/permissions/
*/

git remote add Github https://github.com/chromium/chromium.git
start .git\config

/* .git\config
[core]
    repositoryformatversion = 1
    filemode = false
    bare = false
    logallrefupdates = true
    symlinks = false
    ignorecase = true
[extensions]
    worktreeConfig = true
[remote "Github"]
    url = https://github.com/chromium/chromium.git
    fetch = +refs/heads/*:refs/remotes/Github/*
    partialclonefilter = blob:none  // 👈 Add this line, This is important. Otherwise, your ".git" folder is still large (about 1GB)
*/
git pull --depth 1 Github 2d4a97f1ed2dd875557849b4281c599a7ffaba03
// or
// git pull --depth 1 Github master
```

## 👍不錯的文章推薦

- [twtrubiks/Git-Tutorials](https://github.com/twtrubiks/Git-Tutorials)
- [關於git提示“warning: LF will be replaced by CRLF”終極解答](https://www.itread01.com/content/1554530531.html)
- [Listing and deleting Git commits that are under no branch (dangling?)](https://stackoverflow.com/q/3765234/9935654)
