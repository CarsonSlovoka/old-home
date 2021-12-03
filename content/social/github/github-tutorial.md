+++
title = "Github Tutorial"
description="Github基礎教學"
date = 2021-05-12T10:06:44+08:00
lastmod = 2021-05-12
featured_image = ""
draft = false
weight = 0
tags = ["github"]
markmap = true
toc_markmap = true
toc_bootstrap = true
+++


## SSH Token

[About SSH](https://docs.github.com/en/github/authenticating-to-github/about-ssh)

> Using the SSH protocol, you can connect and authenticate to remote servers and services. With SSH keys, you can connect to GitHub without supplying your username and personal access token at each visit.

簡單來說這個東西可以取代您的帳號密碼，當成另類的身分驗證。

### [Checking for existing SSH keys](https://docs.github.com/en/github/authenticating-to-github/checking-for-existing-ssh-keys)

如果您確定您沒有生成過，那這小節可以直接跳過(實際上這小節也只是檢查有沒有生成過而已)

1. Open Git Bash. (您安裝好git之後就會有這一個應用程式(搜尋找一下就可以發現git bash這個終端機)
2. ``ls -al ~/.ssh``

    如果您的ssh已經存在，造裡說這段指令打完之後會list出一些東西出來

    - ``-al`` 表示 all
    - ``~`` 表示 HOME 可想成 ``根目錄``
    - ``.ssh`` 指的是資料夾 (如果您曾經建立過，應該會有這個資料夾)

3. 檢查有沒有以下的文件存在(任一種都可)

    - id_rsa.pub
    - id_ecdsa.pub
    - id_ed25519.pub
    - ...
    - xxx.pub

    其實id後面的那個東西指的是一種演算法

    生成ssh金鑰可以選擇演算法

### [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

``ssh-keygen``:ssh key的生成器(generator)

他有哪些命令可以使用

> ssh-keygen --help

他會列出以下的訊息 (其實並沒有help這個指令，只是您隨便亂打，他就會出現unknown option之後就會自動告訴您有哪些東西可以輸入)

{{< details "ssh-keygen --help" >}}

```
usage: ssh-keygen [-q] [-a rounds] [-b bits] [-C comment] [-f output_keyfile]
                  [-m format] [-N new_passphrase] [-O option]
                  [-t dsa | ecdsa | ecdsa-sk | ed25519 | ed25519-sk | rsa]
                  [-w provider] [-Z cipher]
       ssh-keygen -p [-a rounds] [-f keyfile] [-m format] [-N new_passphrase]
                   [-P old_passphrase] [-Z cipher]
       ssh-keygen -i [-f input_keyfile] [-m key_format]
       ssh-keygen -e [-f input_keyfile] [-m key_format]
       ssh-keygen -y [-f input_keyfile]
       ssh-keygen -c [-a rounds] [-C comment] [-f keyfile] [-P passphrase]
       ssh-keygen -l [-v] [-E fingerprint_hash] [-f input_keyfile]
       ssh-keygen -B [-f input_keyfile]
       ssh-keygen -D pkcs11
       ssh-keygen -F hostname [-lv] [-f known_hosts_file]
       ssh-keygen -H [-f known_hosts_file]
       ssh-keygen -K [-a rounds] [-w provider]
       ssh-keygen -R hostname [-f known_hosts_file]
       ssh-keygen -r hostname [-g] [-f input_keyfile]
       ssh-keygen -M generate [-O option] output_file
       ssh-keygen -M screen [-f input_file] [-O option] output_file
       ssh-keygen -I certificate_identity -s ca_key [-hU] [-D pkcs11_provider]
                  [-n principals] [-O option] [-V validity_interval]
                  [-z serial_number] file ...
       ssh-keygen -L [-f input_keyfile]
       ssh-keygen -A [-a rounds] [-f prefix_path]
       ssh-keygen -k -f krl_file [-u] [-s ca_public] [-z version_number]
                  file ...
       ssh-keygen -Q [-l] -f krl_file [file ...]
       ssh-keygen -Y find-principals -s signature_file -f allowed_signers_file
       ssh-keygen -Y check-novalidate -n namespace -s signature_file
       ssh-keygen -Y sign -f key_file -n namespace file ...
       ssh-keygen -Y verify -f allowed_signers_file -I signer_identity
                  -n namespace -s signature_file [-r revocation_file]
```

{{< /details >}}

1. ``ssh-keygen -t ed25519 -C "your_email@example.com"``

    - ``-t`` 總共有這些東西可以用 ``[-t dsa | ecdsa | ecdsa-sk | ed25519 | ed25519-sk | rsa]``

        看您想用哪一種算法去生成而已
    - ``-C`` Comment 註解而已

    成功之後會出現以下訊息

    > Generating public/private ed25519 key pair.

    告訴您生成了一組公鑰和私鑰採用xxx算法

2. ``Enter file in which to save the key (/c/Users/xxx/.ssh/id_ed25519)``: 輸入您想存放的路徑

    預設是在 ``~/.ssh`` 這個資料夾中建立，建議不需要特別修改，直接採用預設即可(直接按enter就表示接受預設的處理)

    成功之後出現

    > Created directory '/c/Users/xxx/.ssh'.

3. ``Enter passphrase (empty for no passphrase)``:

    就是密碼，如果有人拿到了SSH，如果您沒有密碼，他持有您的SSH那麼他就真的可以通過驗證不會受到任何阻擋，

    所以您可以在設定這個密碼，就是要在輸入正確之後才可以通過驗證。

    我建議要輸入，這樣別人即便用您的電腦在進行操作的時候還是需要密碼才能通過認證

4. ``Enter same passphrase again``:

5. 複製您的public KEY資訊: ``clip < ~/.ssh/id_ed25519.pub``

    前面動作完成之後，會出現以下訊息

    ```
    Your identification has been saved in /c/Users/xxx/.ssh/id_ed25519
    Your public key has been saved in /c/Users/xxx/.ssh/id_ed25519.pub
    The key fingerprint is:
    SHA256:1234+562137482992383u48u47881340918u34FADFS yourEmail@gmail.com

    The key's randomart image is:
    +--[ED25519 256]--+
    |                 |
    |                 |
    |                 |
    |                 |
    |                 |
    |                 |
    |                 |
    |                 |
    |                 |
    +----[SHA256]-----+
    ```

    *SHA256我是亂打的，關於ED25519裡面的東西我也省略掉了*

    您可以用 ``start`` 指令打開您的資料夾，例如

    > start ~/.ssh

    就會看到您所生成的文件了，因為我是用ed25519，所以我打開之後會出現兩個項目

    - id_ed25519  (private)

        內容大概是以下這樣

        ```
        -----BEGIN OPENSSH PRIVATE KEY-----
        AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAMwAAAAtzc2gtZW
        BSDASDFASFDSAFDSAFASFDASFDSFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFASDFSADFDA3qE
        o/kEqjuCSQDDDDDDDDDDDDDDDDDDDDDFASDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
        DFdfadfiajdifjaojqewio+adsfjisajfoijsfjisjfalkdfklaldkfjlkajfkskfmkamm
        12341i4jidjafabcekjiejieorj123j58jads0emjs8afj8sfnsauf8djaijfmcX
        -----END OPENSSH PRIVATE KEY-----
        ```

    - id_ed25519.pub   (public)
        內容
        > SHA256:1234+562137482992383u48u47881340918u34FADFS yourEmail@gmail.com

    您可以透過 clip 指令來幫您複製到剪貼簿

    > clip < ~/.ssh/id_ed25519.pub

    clip只能複製文件的內容，以上的意思是 將``~/.ssh/id_ed25519.pub``檔案的內容複製到剪貼簿中

6. 將您的public key資訊貼到雲端管理系統中

    以下以github為範例

    > 點擊頭像-> Settings -> 在左側尋找 SSH and GPG keys

    選擇

    > New SSH key

    接著需要輸入兩項東西:

    - Title: 隨便您想打什麼 (我建議打上跟您使用電腦有關的資訊，這樣以後您要移除，您才知道這個SSH是與哪個裝置有關，才不會移除錯誤
    - Key: 貼上public的資訊

    完成之後可以看到

    ```
    [title]
    SHA256: [...]
    Added on 12 May 2021
    Never used — Read/write
    ```

    如果您需要圖片，請至 [官方文檔](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account) 看，這裡有圖片告訴您該怎麼點！

### [關於passphrase](https://docs.github.com/en/github/authenticating-to-github/working-with-ssh-key-passphrases)

如何添加或者修改passphrase

```
$ ssh-keygen -p -f ~/.ssh/id_ed25519
> Enter old passphrase: [Type old passphrase] 我了話是使用使用者名稱😂
> Key has comment 'your_email@example.com'
> Enter new passphrase (empty for no passphrase): [Type new passphrase]
> Enter same passphrase again: [Repeat the new passphrase]
> Your identification has been saved with the new passphrase.
```

> $ ssh-keygen -p -f ~/.ssh/id_ed25519

- -p 表示 passphrase 代表我們要做的異動是passphrase
- -f 表示 file

完成之後會更改這一個文件

> ~/.ssh/id_ed25519

如果您原本沒有設定，到現在有設定，會發現裡面的內容變得比以前更長

```
-----BEGIN OPENSSH PRIVATE KEY-----
1111111111111111111111111111111111111111111111112222222222222222222222
1111111111111111111111111111111111111111111111112222222222222222222222
1111111111111111111111111111111111111111111111112222222222222222222222
1111111111111111111111111111111111111111111111112222222222222222222222
1111111111111111111111111111111111111111111111112222222222222222222222
33333333333333333333333333333333W5Szk=
-----END OPENSSH PRIVATE KEY-----
```

> 📙 這個``passphrase``與server無關，此密碼純粹只會對私鑰的檔案進行異動，但不管這個檔案怎麼異動，都不會影響他接受到隨機訊息之後解碼的行為
>
> 純粹就是您的密碼打對，這個私鑰就可以正常工作了

由於每次都要打上密碼可能會很麻煩，這時候可以依靠

``ssh-agent``來幫助您

### ssh-agent

我不喜歡ssh-agent，不輸入密碼就肯定存在瑕疵，完成之後可以不輸入密碼就表示此密碼一定經過某種形式(可能有編碼過)保存到某一個文件之中(不管它是不是暫存檔)

好，如果是存在記憶體那勉強ok，因為ssh-agent會有一個PID所以應該是有啟動某個程式。

但不管怎樣它不能避免掉別人使用您電腦的風險，我意思是，如果您有事離開了座位一下子，這時候有心人士就可以直接動作，但如果您沒有設定agent這時候別人用您的電腦他不知道``passphrase``一樣失敗

所以我不鼓勵設定ssh-agent我寧願麻煩一點。

----

正文:

代理，也就是您可以設定代理，讓他來幫助您做快速驗證，當然如果不滿意您也可以刪除他

以下是管理ssh-agent可能會用到的命令

- ``ssh-add -l`` : list出所有已經新增的``私``鑰
- ``ssh-add -L`` : list出所有已經新增的``公``鑰

- ``ssh-add -d`` : 刪除指定的私鑰檔案

    > ssh-add -d  ~/.ssh/id_ed25519

- ``ssh-add -D`` : 刪除所有私鑰

#### Adding your SSH key to the ssh-agent

1. 啟動ssh-agent ``eval `ssh-agent -s` ``

    ```bash
    # start the ssh-agent in the background
    $ eval `ssh-agent -s`
    # Agent pid 59566
    ```

    如果您單獨運行``ssh-agent -s``

    會出現以下訊息

    ```
    SSH_AUTH_SOCK=/tmp/ssh-aTms1KZ12345/agent.477; export SSH_AUTH_SOCK;
    SSH_AGENT_PID=478; export SSH_AGENT_PID;
    echo Agent pid 478;
    ```

    您可以用

    > start /tmp/ssh-aTms1KZ12345/

    來開啟資料夾，會發現真的有agent.477這個檔案

    每次生成的檔案都是隨機生成，PID也不固定，資料夾也會換，但資料夾前面都是``ssh-a``開始

    當然前面的指令

    > ``eval `ssh-agent -s` ``

    也會生成類似的資料夾

    總之此指令完畢之後您會得到一個``PID``



2. 將您的私鑰檔案告訴給ssh-agent: ``ssh-add ~/.ssh/id_ed25519``

    ```
    Enter passphrase for /c/Users/xxx/.ssh/id_ed25519:  輸入您之前打過的密碼
    Identity added: /c/Users/xxx/.ssh/id_ed25519 (Your@gmail.com)   # 告訴您已經成功
    ```

    完畢之後您可以

    查看所有公鑰(``ssh-add -L``)私鑰(``ssh-add -l``):

    ```
    $ ssh-add -L
    # ssh-ed25519 xxx... Your@gmail.com

    $ ssh-add -l
    256 SHA256:xxx... Your@gmail.com (ED25519)
    ```

    您也可以刪除
    ```
    $ ssh-add -d ~/.ssh/id_ed25519
    Identity removed: /c/Users/xxx/.ssh/id_ed25519 ED25519 (Your@gmail.com)
    ```

### 開始使用SSH來驗證

#### [About remote repositories](https://docs.github.com/en/github/getting-started-with-github/about-remote-repositories)

Github提供兩種遠端認證模式

1. HTTPS : ``https://github.com/user/repo.git``
2. SSH : ``git@github.com:user/repo.git``

第一種HTTPS: 要打帳號密碼，通常如果您打過一次之後，該帳號密碼會保存在``認證管理員之中``，以後不再需要打

第二種SSH: 就是我們以上說的方法，利用SSH去登入

以下只討論第二種

當remote建立完畢之後，當您fetch,pull諸如此類會與server有關都要經過認證，就會出現類似下面的訊息

```
The authenticity of host 'github.com (IP ADDRESS)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)?
```

選擇yes

> 📙 以上訊息只會出現在第一次(即``known_hosts``檔案不存在時就會出現)

之後他會建立一個文件在

> ~/.ssh/known_hosts

紀錄的內容:

```
github.com ssh-rsa xxx...basssddse64==
```

簡單來說因為您已經在github上面做了 [設定](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account) ，把公鑰提供出去

這時候他就會運用這個資訊把它存在``known_hosts``這個檔案之中

並且會夾帶一個隨機訊息，會需要用您的私鑰去解鎖server傳送過來的隨機訊息，再把這個訊息回傳給server，如果server判別正確，就會認同您的操作

如果您有設定``passphrase``此時就會教您要輸入之前所設定的密碼

> Enter passphrase for key '/c/Users/xxx/.ssh/id_ed25519'


### [Testing your SSH connection](https://docs.github.com/en/github/authenticating-to-github/testing-your-ssh-connection)

在官方文件您可能還會看到這一個小節

Attempts to ssh to GitHub

```
$ ssh -T git@github.com
```

那這到底幹啥？！

這個步驟其實您可以不要管，它就**只是測試**，您可以remote直接用SSH，如果最後失敗也是跟這邊的訊息是一樣的

當然官方這樣做也沒錯，如果您這邊就失敗，那後面肯定也沒搞頭。

我們分別看一下這個指令成功和失敗的版本

```
The authenticity of host 'github.com (IP ADDRESS)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)?

# 👇成功的版本出現以下訊息
Hi username! You've successfully authenticated, but GitHub does not
provide shell access.

# 👇失敗的版本出現以下訊息
Warning: Permanently added 'github.com' (RSA) to the list of known hosts.
git@github.com: Permission denied (publickey).
```

所以他會需要用到您的公鑰，那要是您前面沒有把SSH公私鑰生成就會出現以上的錯誤

官方文件提到，您在此步驟時，應該已經完成了這三件事情

1. [Checked for existing SSH keys](https://docs.github.com/en/github/authenticating-to-github/checking-for-existing-ssh-keys)
2. [Generated a new SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
3. [Added a new SSH key to your GitHub account](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

其實就我看來1和2是差不多的事情，就是要有SSH不然怎麼玩，是吧！

至於第三點則是後面如果您真的要remote也會需要用到

> ``git remote add MyRemoteName git@github.com:user/repo.git``

所以他乾脆也把這點納入

## 使用SSH的好處

1. 管理方便

    您可以在介面管控當前有哪些SSH，不想要就可以移除，其他的電腦登入不需要真的知道您Github的帳號密碼，他們頂多就是READ/WRITE您相關的專案

2. 雙重認證

    SSH因為有passphrase可以提供更安全(上廁所也不怕😆)，不過就是麻煩了一點。

3. 能掌握存取時間

    以Github而言，您可以看到此SSH Keys的最後存取時間，可能對管理也有些幫助


## Authorized OAuth Apps

授權App可以使用Github的權限，可以在這邊進行管理

> https://github.com/settings/applications

例如您裝了Github iOS，就會出現在這個列表中。

代表手機可以讀、寫、管理您的專案，如果不想要就要移除授權。

此外常用的 [Git Credential Manager](https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage) 也會需要授權

> Authorize Git Credential Manager 如果移除之後就要重新授權(可以透過網頁登入git來當認證)您的代碼才可以透過git傳送上去


## [Personal access tokens](https://github.com/settings/tokens)

這個方法是使用令牌來訪問您的專案。

建立完token之後，把token加在api的參數之中即可。

完成之後可以做像是取得某公私有專案的中的圖片之類的事情。

可以參考此[範例ref-get-github-file.html](https://github.com/CarsonSlovoka/go-src/blob/master/tutorial/web/js/github/ref-get-github-file.html)

## 參考資料

- [Push to GitHub without a password using ssh-key](https://stackoverflow.com/a/53915051/9935654)
- [Bash是如何处理波浪線的](https://www.polarxiong.com/archives/Bash%E6%98%AF%E5%A6%82%E4%BD%95%E5%A4%84%E7%90%86%E6%B3%A2%E6%B5%AA%E7%BA%BF%E7%9A%84.html)
- [製作 Git SSH 公開金鑰 For Windows](https://trunk-studio.com/blog/ssh-for-windows/)
- [使用 SSH 金鑰與 GitHub 連線](https://andy6804tw.github.io/2018/03/22/github-ssh/)
- [ssh-agent代理的簡單用法](https://www.itread01.com/content/1568271845.html)
- [ssh轉發代理：ssh-agent用法詳解](https://kknews.cc/zh-tw/code/zby8o8l.html)
