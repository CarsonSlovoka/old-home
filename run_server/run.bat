@echo off
call init.bat
REM echo %__version__%
REM start hugo server --buildDrafts --buildExpired --buildFuture --theme hugo-theme-cleanwhite
start hugo server --buildDrafts --buildExpired --buildFuture
start http://localhost:1313/
