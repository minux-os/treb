@echo off
title Minux boot
chcp 65001 >nul

echo Starting...
timeout /t 5
title Desktop
cls
color 1A

if "%number%"=="1" call term.cmd
if "%number%"=="0" exit
set /p command="desktop> "


:1
color
call term.cmd