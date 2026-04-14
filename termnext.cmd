@echo off
chcp 65001 >nul
echo WorldBIOS
timeout /t 3 >nul
dir
echo Found! folder: minux
timeout /t 3 >nul
cls
title Minux Lock Manager
echo Welcome to Minux NEXT!
echo(
goto login
:login
echo Kostya Aidin (c) 2026 All rights reserved > session.log
echo [ %date% %time% ] Login start >> session.log
set /p command="%COMPUTERNAME% login: "
if "%command%"=="user" goto usrpass
)   else   (
    echo User not found
    echo [ %date% %time% ] Login failed >> session.log
    goto login
)


:usrpass
echo [ %date% %time% ] password verification >> session.log
set /p pass="user login: "
if "%pass%"=="1234" goto minux
)   else   (
    echo [ %date% %time% ] password incorrect >> session.log
    echo Password incorrect!
    goto login
)

:minux
title Minux
echo [ %date% %time% ] Login successful >> session.log
echo Welcome To...


echo(
echo ███╗   ███╗██╗███╗   ██╗██╗   ██╗██╗  ██╗
echo ████╗ ████║██║████╗  ██║██║   ██║╚██╗██╔╝
echo ██╔████╔██║██║██╔██╗ ██║██║   ██║ ╚███╔╝
echo ██║╚██╔╝██║██║██║╚██╗██║██║   ██║ ██╔██╗
echo ██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝██╔╝ ██╗
echo ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝
echo(

echo Kostya Aidin (c) 2026 All rights reserved
set /p command="user@minux:~$ "

if "%command%"=="vget" goto vget
if "%command%"=="vget SendWebRequest " goto vgetwr
if "%command%"=="su nam update" goto updte
if "%command%"=="su nam -u" goto updte
if "%command%"=="date" goto date_cmd
if "%command%"=="minux" call boot.cmd
if "%command%"=="sysfetch" goto sysftch
if "%command%"=="su restart --force" call minux/restart.cmd
if "%command%"=="restart" echo Restarting... && timeout /t 3 && cls && call minux/restart.cmd
if "%command%"=="clear" cls
if "%command%"=="vook cmd" cmd
if "%command%"=="vook pwsh" powershell
if "%command%"=="vook restart" call minux/restart.cmd
if "%command%"=="vook run" call minux/vook/run.cmd
if "%command%"=="kill term.cmd" exit
if "%command%"=="mnxset sys=NX" goto mnxsetnxs
if "%command%"=="su mnxset sys=NX" goto mnxsetnx
if "%command%"=="mnxset sys=null" goto mnxsetnxs
if "%command%"=="su mnxset sys=null" goto mnxsetnll
if "%command%"=="logout" cls & goto login
if "%command%"=="tit" goto tit
if "%command%"=="su adduser" goto addusersu
if "%command%"=="users" goto users
if "%command%"=="gamehub" goto gamehub
if "%command%"=="exit" goto exit
if "%command%"=="license" goto lic
if "%command%"=="calc" goto calc
if "%command%"=="yt" goto yt
if "%command%"=="loop" goto loop
if "%command%"=="loop -s" goto loops
if "%command%"=="clock" goto clock
if "%command%"=="ee 1" goto sysee1
if "%command%"=="treb -c" goto sysee1
:date
echo date %date%
goto minux

:vget
cls
echo [ %date% %time% ] vget started! >> session.log
echo URL: %url%
echo Packages: %p%
set /p url="Enter URL: " 
cls
echo URL: %url%
echo Packages: %p%
set /p p="Enter packages : " 
cls
echo URL: %url%
echo Packages: %p%
ping %url% -n %p%
echo Sent packages: %p%
pause
cls
echo Site: %url% > vget.log
echo Packages: %p% >> vget.log
echo Log created to %date% %time% >> vget.log
echo Log created by vget >> vget.log
echo [ %date% %time% ] New log: service: vget >> session.log
echo URL: %url% >> session.log
echo Packages: %p% >> session.log
set url=
set p=
goto minux


:updte
echo Updates installing...
timeout /t 3
powershell Invoke-WebRequest -Uri "https://raw.githubusercontent.com/minux-os/nam/refs/heads/main/updates/updatenam.cmd" -OutFile "update.cmd"
update.cmd


:sysftch
chcp 65001 >nul
title MINUX Sysfetch

:: --- Логотип MINUX ---
echo   OOOOOOOOO
echo  OOO     OOO
echo  OOO  @@ OOO
echo  OOO @  @OOO
echo  OOO  @@ OOO
echo  OOO     OOO
echo   OOOOOOOOO
echo(

:: --- Системная информация ---
echo OS: MINUX

:: CPU
for /f "delims=" %%a in ('powershell -Command "Get-CimInstance Win32_Processor | Select-Object -ExpandProperty Name"') do set "CPU=%%a"
echo CPU: %CPU%

:: RAM
for /f "delims=" %%a in ('powershell -Command "[math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory/1GB,2)"') do set "RAMGB=%%a"
echo RAM: %RAMGB% GB

:: Определяем shell
if defined CMDCMDLINE (
    echo Shell: cmd.exe
) else (
    echo Shell: PowerShell
)


echo(
pause
goto minux


:mnxsetnxs
echo Access denied! Are you root?
goto minux


:mnxsetnx
echo root command:
goto mnxsetnxrootpass


:mnxsetnxrootpass
echo [ %date% %time% ] >> session.log
set /p pass="root login: "
if "%pass%"=="root" goto sysnx
)   else   (
    echo [ %date% %time% ] root: password incorrect >> session.log
    echo Password incorrect!
    goto mnxsetnxrootpass
)

:sysnx
echo accept to 3s
timeout /t 3 >nul
echo The value of the "sys" parameter has been changed to "NX"
timeout /t 3 >nul
cls
goto x

:x
timeout /t 1 >nul
goto x



:tit
set /p tit=%COMPUTERNAME%@tit:~$
title %tit%
echo To exit click enter
pause
cls
goto minux

:addusersu
echo Welcome!
set /p user="add: "
mkdir users
cd users
mkdir %user%
cd %user%
mkdir Documents
mkdir Music
mkdir Downloads
echo User %user% created!
goto minux

:users
cd users
dir


:gamehub
echo Welcome to Minux Game Hub!
echo Games:
echo 1. Hack me!
if "%choice%"=="1" goto hackme
set /p ans="Enter: "



:hackme
echo Creating...
mkdir hackme
cd hackme
mkdir emulator
cd ..

copy boot.cmd Minux\hackme\emulator
copy term.cmd Minux\hackme\emulator
copy minux Minux\hackme\emulator
echo hackme isolate container created! > Minux\hackme\emulator\log.txt
echo By HackMe > Minux\hackme\emulator\log.txt
cls
"hackme\emulator\term.cmd"


:notepad
cls


:exit
del session.log
del vget.log
pause
exit


:calc
set /p num1="Enter 1 number: "
set /p num2="Enter 2 number: "
set /a result=%num1%+%num2%
echo %num1% + %num2% = %result%
goto minux

:lic
echo 1. DO NOT EDIT THIS OS [/\] 
REM Защита
echo 2. EDIT YOUR DISTRO TO BASE MINUX [\/]
echo /\ - no
echo \/ - yes
goto minux







:yt
cls
set /p ytid="Enter ID: "
start https://www.youtube.com/watch?v=%ytid%
set ytid=
goto minux



:vgetwr
cls
set /p wru="Enter URL for method: WRU: "
powershell Invoke


:loop
echo /sys
echo /init
echo /system
set /p loop="Enter host:"
mkdir loop
cd loop
mkdir %loop%
echo testing...
ping %loop%
echo Hacking...
echo site: %loop% >> hack.log
echo Log created by loop on %date% %time% >> hack.log
set loophack=hack.log
ping %loop% >> %loophack%
goto minux





:loops
echo /sys
echo /init
echo /system
set /p loop="Enter host:"
mkdir loop
cd loop
mkdir %loop%
echo testing...
ping %loop%
echo Hacking...
echo site: %loop% >> hack.log
echo Log created by loop on %date% %time% >> hack.log
set loophack=hack.log
ping %loop% >> %loophack%
cd ..
copy term.cmd loop\term.cmd
goto minux


:clock
set serv=time.google.com
echo Reco:
echo set serv=time.google.com
echo set serv=time.android.com
echo set serv=time.google.com
echo set serv=time.apple.com
w32tm /stripchart /computer:%serv% /dataonly /samples:1
timeout /t 1 >nul
cls
goto clock



:mnxsetnll
echo root command:
goto mnxsetnllrootpass


:mnxsetnllrootpass
echo [ %date% %time% ] >> session.log
set /p pass="root login: "
if "%pass%"=="root" goto sysnll
)   else   (
    echo [ %date% %time% ] root: password incorrect >> session.log
    echo Password incorrect!
    goto mnxsetnllrootpass
)


:sysnll
echo accept to 3s
timeout /t 3 >nul
echo The value of the "sys" parameter has been changed to "null"
timeout /t 3 >nul
cls
goto x

:sysee1
echo accept to 3s
timeout /t 3 >nul
echo The value of the "ee" parameter has been changed to "1"
timeout /t 3 >nul
cls
echo Easter Egg 1 Unlocked!
pause
echo The value of the "ee" parameter has been changed to "0"
goto minux



:create
set /p cr="Enter name for your distro: "
echo Name: %cr%
echo Status: building...
mkdir treb
cd treb
mkdir %cr%
cd ..
copy term.cmd treb\%cr%
cd %cr%
echo Distro: %cr% > build.log
echo Log created to %date% %time% by treb >> build.log
cls
echo Name: %cr%
echo Status: builded!
echo Made with treb
goto minux
)   else   (
    echo This is not command!
    goto minux
)


v2.0
