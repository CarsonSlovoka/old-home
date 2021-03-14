+++
title = "註冊檔基礎"
description=""
date = 2021-03-13T22:38:32+08:00
lastmod = 2021-03-13
featured_image = ""
draft = false
weight = 0
tags = ["reg"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = ""
  next_page = ""
  previous_section = ""
  next_section = ""
+++

## 建立滑鼠右鍵的選單

當您對檔案、目錄點右鍵會出來的menu清單，其實有辦法去對他進行客製化！

以下我示範用NSIS以及REG檔案的寫法範例，範例中的執行檔和路徑只是參考，您在自己做一些簡單的更改就能完成。

### 用NSIS寫入到註冊檔中

```
!define POPMENU_DISPLAY_NAME "CreateLinkToRecent"
!define POPMENU_ICON "shell32.dll,-16762"  # GetIcon.ahk可以得知數字表示的圖標示什麼
!define POPMENU_LOCATION "top"
!define POPMENU_COMMAND  "${DefaultInstallDirPath}\Recent.exe %1"
!define PRODUCT_ROOT_KEY HKCR  #CLASS ROOT #"HKCU"  #HKLM


; 檔案
WriteRegStr ${PRODUCT_ROOT_KEY} "${PRODUCT_POPUP_MENU_FILE_KEY}" "MUIVerb"        "${POPMENU_DISPLAY_NAME}"
WriteRegStr ${PRODUCT_ROOT_KEY} "${PRODUCT_POPUP_MENU_FILE_KEY}" "Icon"           "${POPMENU_ICON}"
WriteRegStr ${PRODUCT_ROOT_KEY} "${PRODUCT_POPUP_MENU_FILE_KEY}" "Position"       "${POPMENU_LOCATION}"
WriteRegStr ${PRODUCT_ROOT_KEY} "${PRODUCT_POPUP_MENU_FILE_KEY}\command" ""       "${POPMENU_COMMAND}"

; 資料夾
WriteRegStr ${PRODUCT_ROOT_KEY} "${PRODUCT_POPUP_MENU_DIRECTORY_KEY}" "MUIVerb"   "${POPMENU_DISPLAY_NAME}"
WriteRegStr ${PRODUCT_ROOT_KEY} "${PRODUCT_POPUP_MENU_DIRECTORY_KEY}" "Icon"      "${POPMENU_ICON}"
WriteRegStr ${PRODUCT_ROOT_KEY} "${PRODUCT_POPUP_MENU_DIRECTORY_KEY}" "Position"  "${POPMENU_LOCATION}"
WriteRegStr ${PRODUCT_ROOT_KEY} "${PRODUCT_POPUP_MENU_DIRECTORY_KEY}\command" ""  "${POPMENU_COMMAND}"
```

### reg寫法

```reg

Windows Registry Editor Version 5.00

;因為reg檔案似乎沒有辦法使用變數的方式(%ProgramData%)所以要交由NSIS來完成！
;檔案右鍵
[HKEY_CLASSES_ROOT\*\shell\RecentDetector]
"MUIVerb"="CreateLinkToRecent"
"Icon"="shell32.dll,-16762"
"Position"="top"
[HKEY_CLASSES_ROOT\*\shell\RecentDetector\command]
;@="C:\\ProgramData\\CarsonSlovoka\\RecentDetector\\aaa.bat  %1"  <---錯誤, 可能要用vbs
;★reg的權利不能動system32和programFiles但是batch檔就會沒有影響！
;@="%windir%\\system32\\wscript.exe %ProgramFiles(x86)%\\Carson\\Shortcut.vbs %1"          ;會沒有權限！
;@="%ProgramFiles(x86)%\\Carson\\Recent.exe %ProgramFiles(x86)%\\Carson\\Shortcut.vbs %1"  ;也是會沒有權限！
@="C:\\ProgramData\\CarsonSlovoka\\RecentDetector\\Recent.exe C:\\ProgramData\\CarsonSlovoka\\RecentDetector\\Shortcut.vbs %1"


;資料夾右鍵
;[HKEY_CLASSES_ROOT\Folder\shell\RecentDetector]  ;放在這邊有可能導致執行的變數受到影響而無法使用
[HKEY_CLASSES_ROOT\Directory\shell\RecentDetector]
"MUIVerb"="CreateLinkToRecent"
"Icon"="shell32.dll,-16762"
"Position"="top"
[HKEY_CLASSES_ROOT\Directory\shell\RecentDetector\command]
@="C:\\ProgramData\\CarsonSlovoka\\RecentDetector\\Recent.exe C:\\ProgramData\\CarsonSlovoka\\RecentDetector\\Shortcut.vbs %1"
```

#### 進階教學

這部份算綜合演練，您可能會希望有子清單，多層子清單等等，可以直接跳至 [全部範例]({{< ref "#全部範例" >}}) 來查看代碼，我把所有的範例都丟在裡面了(包含註解)

##### 建立單一項目的
##### 子清單
##### 多層子清單的
##### 全部範例

```reg
Windows Registry Editor Version 5.00

;建立單一項目的範例
    ;最一般寫法。 名稱用機碼名
        [HKEY_CLASSES_ROOT\*\shell\MyProg]
        ;icon不要也可以，看心情...
        "Icon"="shell32.dll,-16765"
        [HKEY_CLASSES_ROOT\*\shell\MyProg\command]
        ;★★★意，如果路徑有\要用兩個  用/一個就「不行」！
        @="C:\\Windows\\system32\\notepad.exe %1"
    ;>>結果：對任何附檔名(因為是用*)的檔案點選右鍵，可以看到選單內有MyProg的字樣，且點擊後執行的程式為notepad，參數(%1)為右鍵點擊的該檔案。

    ;名稱自定：
        [HKEY_CLASSES_ROOT\*\shell\MyProg2]
        "MUIVerb"="MY_NAME"
        "Icon"="shell32.dll,-16765"
        [HKEY_CLASSES_ROOT\*\shell\MyProg2\command]
        ;路徑非完整路徑，會抓系統路徑
        @="notepad.exe %1"
    ;>>結果：對任何附檔名(因為是用*)的檔案點選右鍵，可以看到選單內有""MY_NAME""的字樣，且點擊後執行的程式為notepad，參數(%1)為右鍵點擊的該檔案。

;子清單範例：
    [HKEY_CLASSES_ROOT\*\shell\MyProg3]
    ;"MUIVerb"="display Name" <--不一定要有，如果沒有它會抓機碼的值(即MyProg3)
    ;"Position"="" <--不一定要有
    ;★分頁可以執行的動作，透過SubCommands所以這行指令一定要有才跑的動...
    "SubCommands"=""
    "Icon"="shell32.dll,-16765"
    [HKEY_CLASSES_ROOT\*\shell\MyProg3\shell]
    [HKEY_CLASSES_ROOT\*\shell\MyProg3\shell\Notepad]
    ;↓★★★注意，下面的這行不能省，否則名稱會顯示不了   (記法 command前面的名稱不能省)
    "MUIVerb"="run Notepad..."
        [HKEY_CLASSES_ROOT\*\shell\MyProg3\shell\Notepad\command]
        @="C:\\Windows\\system32\\notepad.exe %1"
    ;>>結果：對任何附檔名(因為是用*)的檔案點選右鍵，可以看到選單內有"MyProg3"的字樣，且點擊後「又會有一個新的清單，內有項目『run Notepad...』且點擊後執行的程式為notepad，參數(%1)為右鍵點擊的該檔案。」

;多層子清單的範例
    ;最外層1
    [HKEY_CLASSES_ROOT\*\shell\!!!MyMenu!!!!!]
    "MUIVerb"="My menu name"
    "Position"="top"
    "SubCommands"=""
    ;加上icon，圖為剪刀
    "Icon"="shell32.dll,-16762"
        ;層2
        [HKEY_CLASSES_ROOT\*\shell\!!!MyMenu!!!!!\shell]
            [HKEY_CLASSES_ROOT\*\shell\!!!MyMenu!!!!!\shell\Item1]
            "MUIVerb"="Say Hello"
                ;將指令寫在command @表示預設值
                [HKEY_CLASSES_ROOT\*\shell\!!!MyMenu!!!!!\shell\Item1\command]
                @="rundll32.exe user32.dll,MessageBox Title_Hello，這個呼叫方法貌似沒有辦法設字文字_只能有title"

            [HKEY_CLASSES_ROOT\*\shell\!!!MyMenu!!!!!\shell\Item2]
            "MUIVerb"="Hello2"
                [HKEY_CLASSES_ROOT\*\shell\!!!MyMenu!!!!!\shell\Item2\command]
                @="rundll32.exe user32.dll,MessageBox Hello2"

            [HKEY_CLASSES_ROOT\*\shell\!!!MyMenu!!!!!\shell\Item3]
            "MUIVerb"="NextShell->layer3"
            "SubCommands"=""
            "Icon"="shell32.dll,-16758"
                ;層3
                [HKEY_CLASSES_ROOT\*\shell\!!!MyMenu!!!!!\shell\Item3\shell]
                "SubCommands"=""
                    [HKEY_CLASSES_ROOT\*\shell\!!!MyMenu!!!!!\shell\Item3\shell\myItem1]
                    "MUIVerb"="layer3.1"
                    [HKEY_CLASSES_ROOT\*\shell\!!!MyMenu!!!!!\shell\Item3\shell\myItem1\command]
                    @="rundll32.exe user32.dll,MessageBox layer3.1"

                    [HKEY_CLASSES_ROOT\*\shell\!!!MyMenu!!!!!\shell\Item3\shell\myItem2]
                    "MUIVerb"="layer3.2"
                    [HKEY_CLASSES_ROOT\*\shell\!!!MyMenu!!!!!\shell\Item3\shell\myItem2\command]
                    @="rundll32.exe user32.dll,MessageBox layer3.2"
```

#### 總結

- 整體架構：

    - {{< set-id "建單一項目" "建單一項目">}}:

        1. 選擇您喜歡的項目名稱
        2. 建立command機碼名稱
        3. 在command的機碼內「給定預設值」

    - {{< set-id "建單層子清單" "建單層子清單">}} (兩個popup menu):

        1. 為「最外層」的名稱取名 並加上``"SubCommands"=""``
        2. 建立shell機碼
        3. 在shell機碼下再仿 [建單一項目]({{<ref "#建單一項目" >}}) 的方法即可完成

            1. 取「子項目」的名稱
            2. 建command機碼
            3. 在command的機碼給定預設值

    - 建多層子清單：

        1. 為「最外層」的名稱取名 並加上``"SubCommands"=""``
        2. 仿 [建單層子清單]({{<ref "#建單層子清單" >}}) 即可


> 📙 一個識別有幾層的方法，看有幾個shell就有幾層

> 📙 如果你寫在HKEY_CLASSES_ROOT那包含了CUR USER 和LOCAL MACHINE


## 環境變數

### windows常看到的環境變數

- ``%windir%``: windows
  - %windir%/system32: 這邊放了很多小工具！
- ``%ProgramFiles%``: C:\Program Files
- ``%ProgramFiles(x86)%``: C:\Program Files (x86)
- ``%ProgramData%``: C:\ProgramData


### 使用批次檔來設定環境變數

- 創建：

    ```bat
    REM 新增TESSDATA_PREFIX變數
    SETX /M TESSDATA_PREFIX "C:\Program Files\jTessBoxEditor-2.2.0\jTessBoxEditor\tesseract-ocr"

    REM 放置變數到PATH之後
    SETX /M PATH "%PATH%;C:\Program Files\jTessBoxEditor-2.2.0\jTessBoxEditor\tesseract-ocr"
    REM (如果太長會被截段，建議還是手動加)
    ```

- 刪除：

    - 刪除使用者變數

    ```bat
    REM 刪除FOO
    REG DELETE "HKCU\Environment" /v FOO /f
    REM v = ValueName, f = force
    ```

    - 刪除本機的變數
    ```bat
    REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V FOO
    ```

⚠ **注意，改註冊檔可能要重新開機，才會生效，如果不重開建議手動開啟環境變數的視窗去改**



### RECOMMENDED SETTINGS

#### USER

- SET_ENV: ``C:\Windows\System32\SystemPropertiesProtection.exe``


#### SYSTEM

- TESSDATA_PREFIX:
    ``C:\Program Files (x86)\Tesseract-OCR\tessdata``

- MY_CUDA_10_PATH:
    - ``C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.0\``
    - ``C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.0\lib\``
    - ``C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.0\include\``
    - ``C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.0\bin\``
    - ``C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.0\libnvvp``

- PATH:
    - ``%TESSDATA_PREFIX%``
    - ``%MY_CUDA_10_PATH%``

### 開機自動執行

開機自動執行的東西也可以直接在註冊檔發現，儲放的位置。


- ``HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run``
- ``HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run``
- ``HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run``

當然有的東西會利用，[🕒工作排成器] 去弄，那麼就沒辦法在這些機碼中找到了。

----


### ShellNotifyIcon

- windows 7 8 10的儲放位置

  ```reg
  [HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify]
  ```

- windows XP:

  ```reg
  [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\TrayNotify]
  ```

當中的值:

- IconStreams
- PastIconsStream

就是所紀錄的內容了

❗ 這邊所有的icon的相關數值都統一寫在，所以如果要刪就會大家都一起刪除，沒得選😆


## 參考資料

- [如何刪除系統右下角的shellnotifyicon](https://support.microsoft.com/en-us/help/945011/system-icons-do-not-appear-in-the-notification-area-in-windows-vista-o)
- [Where are the System Tray Customizations stored?](https://social.technet.microsoft.com/Forums/windows/en-US/677c0753-92ef-46ba-b239-437c3c6a38aa/where-are-the-system-tray-customizations-stored?forum=w7itproinstall)



[🕒工作排成器]: https://en.wikipedia.org/wiki/Windows_Task_Scheduler


