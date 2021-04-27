+++
title = "URL Protocol"
date = 2020-12-21T16:42:00+08:00
description = "教您如何使用URL Protocol"
tags = ["protocol"]
draft = false
toc = true
bootstrap = true
+++

## 於windows新增protocol的方法

您可以參考:[Registering an Application to a URI Scheme](https://docs.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa767914(v=vs.85)?redirectedfrom=MSDN)

    Windows Registry Editor Version 5.00

    [HKEY_CLASSES_ROOT\alert]
    @="URL:Alert Protocol"
    "URL Protocol"=""

    [HKEY_CLASSES_ROOT\alert\DefaultIcon]

    [HKEY_CLASSES_ROOT\alert\shell]

    [HKEY_CLASSES_ROOT\alert\shell\open]

    [HKEY_CLASSES_ROOT\alert\shell\open\command]
    @="\"C:\\\\Windows\\explorer.exe\" \"\\\\192.168.255.27\\sub\\someone\""

完成之後，就能在chrome的url中，輸入:``alert:`` 即可執行需的程式

也可以使用批次檔:

    @echo off
    SET /p "protocol_name=input protocl name:"
    REG ADD "HKCR\%protocol_name%" /V "URL Protocol" /t REG_SZ
    REG ADD "HKCR\%protocol_name%\shell\open\command" /t REG_SZ /F /D "\"%SystemRoot%\explorer.exe\" \"%%1\""
    echo down & PAUSE > nul

command中的執令記得換成自己的


## 如何阻止安全性警告的出現?

在開始前，請先快速看過此篇[文章](https://support.netdocuments.com/hc/en-us/articles/360037132312-ndOneClick-users-being-prompted-to-Open-ndOneClick-repeatedly-with-a-recent-Chrome-update-)

這篇教你可以更改: ``%localappdata%\Google\Chrome\User Data\Default\``中的``Preferences``檔案

搜尋``protocol_handler``一定可以找的到東西

而我們先補上

    "protocol_handler":{"excluded_schemes":{"someothersoftware":false,"nd":false}}

以上的例子是排除someothersoftware, nd兩項內容

不過這個例子我沒有成功，貌似不適用現行的chrome版本


## [chrome-policy]
URLAllowlist 政策的優先順序高於 URLBlocklist。最多只能為這項政策輸入1000 個項目。

    Software\Policies\Google\Chrome\URLAllowlist\1 = example.com

你可以使用batch檔來新增

    @REG ADD "HKLM\SOFTWARE\Policies\Google\Chrome\URLAllowlist" /V "1" /t REG_SZ /f /D "alert:*"

- /v 是新增value (最多不能超過1000[^max1000])
- /t 指type
- /f 是強制覆寫
- /d 指data，後面寫的是內容


或者您要用reg的檔案新增也可以


    Windows Registry Editor Version 5.00

    [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\URLAllowlist]
    "1"="alert:*"



## REFERENCE

- BATCH:
    - [SET](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/set_1)
- [URLWhitelist型別](https://admx.help/?Category=Chrome&Policy=Google.Policies.Chrome%3A%3AURLWhitelist&Language=ca)
- [How to run local program (exe) via Chrome via HTML/javascript](https://stackoverflow.com/a/37416124/9935654)
- [How to fix Chrome protocol handler “Always open these types of links” pop up when opening RV through rvlink](https://community.shotgunsoftware.com/t/how-to-fix-chrome-protocol-handler-always-open-these-types-of-links-pop-up-when-opening-rv-through-rvlink/4306)


[chrome-policy]: https://cloud.google.com/docs/chrome-enterprise/policies/?policy=URLAllowlist


[^max1000]: URLAllowlist 政策的優先順序高於 URLBlocklist。最多只能為這項政策輸入1000 個項目。
