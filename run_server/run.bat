@echo off
call init.bat
REM echo %__version__%
REM start hugo server --buildDrafts --buildExpired --buildFuture --theme hugo-theme-cleanwhite
start hugo server --buildDrafts --buildExpired --buildFuture --minify
start http://localhost:1313/

REM 在切換回來，避免從CMD中已經CD到此腳本位置時呼叫完此BAT檔案時，路徑被換走(因為我們在init.bat時已經有做了cd ..的動作)
cd %~dp0
