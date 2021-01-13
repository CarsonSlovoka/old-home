@echo off
REM start hugo server --buildDrafts --buildExpired --buildFuture
cd ../docs
start python -m http.server
start http://localhost:8000/
