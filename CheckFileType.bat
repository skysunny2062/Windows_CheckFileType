@echo Off&COLOR 0B&setlocal enabledelayedexpansion
set ProgramName=CheckFileType By Zack Ver240315
title !ProgramName!
OPENFILES>NUL 2>&1
IF "!ERRORLEVEL!"=="1" goto GetAdmin
::====================================================================================
IF not exist "%~dp0File" md "%~dp0File"
echo 請把檔案放入%~dp0File
echo.
pause
For %%F In (%~dp0File\*.*) do (
    %~dp0Program\trid.exe "%%F"
    echo.
    echo.
)
pause
exit

::====================================================================================
:GetAdmin

echo Set UAC = CreateObject^("Shell.Application"^) >!temp!\getadmin.vbs
echo UAC.ShellExecute "%~fs0", "", "", "runas", 1 >>!temp!\getadmin.vbs
!temp!\getadmin.vbs
del /f /q !temp!\getadmin.vbs
exit /b

::====================================================================================