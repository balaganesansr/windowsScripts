
REM --add the following to the top of your bat file--


@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------


@echo off
cd C:\Windows\Temp
del * /f /Q >> C:\Users\balag\OneDrive\Desktop\Programs\Automaticadbconnect\clrlogs.txt
cd /D %temp%
for /d %%D in (*) do rd /s /q "%%D" >> C:\Users\balag\OneDrive\Desktop\Programs\Automaticadbconnect\clrlogs.txt
del /f /q * >> C:\Users\balag\OneDrive\Desktop\Programs\Automaticadbconnect\clrlogs.txt
cd C:\Windows\prefetch
del * /f /Q >> C:\Users\balag\OneDrive\Desktop\Programs\Automaticadbconnect\clrlogs.txt
echo -------------------------------------
echo Temp is cleared
echo Appdata/Temp is cleared
echo prefetch is cleared
echo -------------------------------------

set /p DUMMY=Press Enter key to close...