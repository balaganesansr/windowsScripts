@echo off

if "%~3"=="" (
    echo Usage: creategit repo_name commit_msg access
    exit /b
)

set gitname=%1
set message=%2
set access=%3

git init -b Main
git add .
git commit -m "%message%"
git remote add origin "https://github.com/balaganesansr/%gitname%"
gh repo create %gitname% --%access%
git push