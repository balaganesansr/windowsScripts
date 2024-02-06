@echo off
setlocal
set COMMIT_MESSAGE=%1
if not defined COMMIT_MESSAGE (
    echo Please provide a commit message.
    exit /b 1
)
git add .
git commit -m "%COMMIT_MESSAGE%"
git push
endlocal
