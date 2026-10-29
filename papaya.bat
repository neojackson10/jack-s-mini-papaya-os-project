@echo off
title Papaya OS Terminal Simulator
color 0A
cls

:: =======================================
:: INITIALIZATION
:: =======================================
echo Loading Papaya OS Modules... [DONE]
echo Mounting System Files...     [DONE]
echo.
echo Welcome to my frist Papaya OS project (v1.0)
echo Type "help" to display available commands.
echo.

:: =======================================
:: THE MAIN COMMAND LOOP
:: =======================================
:cmd0loop
set "cmd="

set /p "cmd=jackie@jackie-laptop@<<< "

if "%cmd%"=="" goto cmd0loop
if /i "%cmd%"=="help" goto dohelp
if /i "%cmd%"=="cls" goto doclear
if /i "%cmd%"=="clear" goto doclear
if /i "%cmd%"=="sysinfo" goto dosysinfo
if /i "%cmd%"=="exit" goto doexit
if /i "%cmd%"=="opengoogle" goto opengoogle
if /i "%cmd%"=="openyoutube" goto openyoutube
if /i "%cmd%"=="opendiscord" goto opendiscord
if /i "%cmd%"=="app" goto realapp
if /i "%cmd%"=="open" goto openshow
:: Fallback if command isn't recognized
echo Error: Command "%cmd%" not recognized.
echo.
goto cmd0loop

:: =======================================
:: TERMINAL FUNCTIONS
:: =======================================

:dohelp
echo.
echo Papaya OS Commands:
echo   help        - Display this menu
echo   clear       - Clear the terminal screen (or type 'cls')
echo   sysinfo     - Show system specs
echo   app         - Show apps on your laptop/desktop
echo   exit        - Close the session
echo.
goto cmd0loop

:doclear
cls
goto cmd0loop

:dosysinfo
echo.
echo --- PAPAYA OS SPECIFICATIONS ---
echo OS Name:       Papaya Operating System
echo Version:       1.5-Stable
echo RAM Allocated: 64 MB Virtual Core
echo.
goto cmd0loop

:opengoogle
echo Opening Google in your browser...
start "" "https://google.com"
echo.
goto cmd0loop

:openyoutube
echo Opening YouTube...
start "" "https://youtube.com"
echo.
goto cmd0loop

:opendiscord
echo Launching Discord App...
start "" "discord:"
echo.
goto cmd0loop

:: #this is make by my slef lol

:realapp
echo.
echo Available Apps:
echo   app[discord]
echo   app[google]
echo   app[youtube]
echo.
goto cmd0loop
:openshow
echo.
open use form :
echo  open (app)  , example {user:<<< open (google)}

goto cmd0loop

:doexit
echo.
echo Closing terminal session...
timeout /t 1 >nul
exit
