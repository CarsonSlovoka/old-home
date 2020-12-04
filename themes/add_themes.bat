@echo off
cd ..
SET /p "theme_git_path=git_url:"
SET /p "theme_name=theme_name:"
echo git submodule add %theme_git_path% themes\%theme_name%
git submodule add %theme_git_path% themes\%theme_name%
start themes\
