@echo off
title Papaya OS Terminal Simulator
color 0A
cls

:: =======================================
:: INITIALIZATION
:: =======================================
echo Loading Papaya OS Modules... [DONE]
echo Mounting System Files...     [DONE]
echo Network Drivers Loaded...    [DONE]
echo.
echo Welcome to Papaya OS v1.6
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
if /i "%cmd%"=="calculator" goto docalc
if /i "%cmd%"=="app" goto realapp
if /i "%cmd%"=="game" goto minigame

:: Friend's Network Tools Turned into Commands
if /i "%cmd%"=="ipconfig" goto net_ip
if /i "%cmd%"=="ping" goto net_ping
if /i "%cmd%"=="dnsflush" goto net_flush
if /i "%cmd%"=="iprelease" goto net_release
if /i "%cmd%"=="iprenew" goto net_renew
if /i "%cmd%"=="netreset" goto net_reset
if /i "%cmd%"=="netcon" goto net_con
if /i "%cmd%"=="wifiset" goto net_wifi
if /i "%cmd%"=="devman" goto net_dev
if /i "%cmd%"=="trouble" goto net_trouble
if /i "%cmd%"=="speedtest" goto net_speed
if /i "%cmd%"=="restartexp" goto net_exp

:: Fallback if command isn't recognized
echo Error: Command "%cmd%" not recognized.
echo.
goto cmd0loop

:: =======================================
:: TERMINAL FUNCTIONS
:: =======================================

:dohelp
echo.
echo --- Papaya OS Standard Commands ---
echo   help        - Display this menu
echo   clear / cls - Clear the terminal screen
echo   sysinfo     - Show system specs
echo   calculator  - Launch native calculator app
echo   app         - Show apps on your laptop/desktop
echo   game        - Play the built-in mini-game
echo   exit        - Close the session
echo.
echo --- Integrated Network Toolkit Commands ---
echo   ipconfig    - Show Full IP Configuration
echo   ping        - Ping Google Server
echo   dnsflush    - Flush DNS Cache
echo   iprelease   - Release Current IP Address
echo   iprenew     - Renew IP Address
echo   netreset    - Reset Winsock and TCP/IP Stack
echo   netcon      - Open Windows Network Connections panel
echo   wifiset     - Open Native WiFi Settings panel
echo   devman      - Open Windows Device Manager
echo   trouble     - Launch Network Troubleshooter wizard
echo   speedtest   - Continuous live ping stability test (Ctrl+C to stop)
echo   restartexp  - Force kill and restart Windows Explorer interface
echo.
goto cmd0loop

:doclear
cls
goto cmd0loop

:dosysinfo
echo.
echo --- PAPAYA OS SPECIFICATIONS ---
echo OS Name:       Papaya Operating System
echo Version:       1.6-Stable (Network Edition)
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

:docalc
echo Launching Calculator...
start calc.exe
echo.
goto cmd0loop

:realapp
echo.
echo Available Apps:
echo   app[discord]
echo   app[google]
echo   app[youtube]
echo.
goto cmd0loop

:: =======================================
:: NETWORK TOOLKIT FUNCTION IMPLEMENTATIONS
:: =======================================

:net_ip
echo Running IP Configuration Readout...
ipconfig /all
echo.
goto cmd0loop

:net_ping
echo Pinging Google.com...
ping google.com
echo.
goto cmd0loop

:net_flush
echo Flushing the DNS Resolver Cache...
ipconfig /flushdns
echo.
goto cmd0loop

:net_release
echo Releasing active network configuration IP addresses...
ipconfig /release
echo.
goto cmd0loop

:net_renew
echo Requesting DHCP IP address renewal allocation...
ipconfig /renew
echo.
goto cmd0loop

:net_reset
echo Initializing absolute network card reset protocols...
netsh winsock reset
netsh int ip reset
echo [!] System restart may be required for full modifications.
echo.
goto cmd0loop

:net_con
echo Launching Network Connections configurations dashboard...
start ncpa.cpl
echo.
goto cmd0loop

:net_wifi
echo Opening default operating system Wi-Fi control center panel...
start ms-settings:network-wifi
echo.
goto cmd0loop

:net_dev
echo Opening Device Manager administrative console...
devmgmt.msc
echo.
goto cmd0loop

:net_trouble
echo Launching automated Network Diagnostics Troubleshooter environment...
msdt.exe /id NetworkDiagnosticsNetworkAdapter
echo.
goto cmd0loop

:net_speed
echo Running continuous link latency speed stability check...
echo Press CTRL+C to break out and terminate test loop.
ping 8.8.8.8 -t
echo.
goto cmd0loop

:net_exp
echo Executing explorer shell forced process cycle...
taskkill /f /im explorer.exe
start explorer.exe
echo Shell execution successfully restarted.
echo.
goto cmd0loop

:: =======================================
:: MINI GAME INTERACTION
:: =======================================
:minigame
echo.
echo =======================================
echo        PAPAYA NUMBER GUESSER
echo =======================================
echo I am thinking of a number between 1 and 100.
echo (Type 'q' to quit back to terminal)
echo ---------------------------------------
set /a target=%random% %% 100 + 1
set /a attempts=0

:game_loop
set "guess="
set /p "guess=Enter your guess: "

if /i "%guess%"=="q" (
    echo Exiting game...
    echo.
    goto cmd0loop
)

if "%guess%"=="" goto game_loop

set /a attempts+=1

if %guess% equ %target% goto game_win
if %guess% lss %target% (
    echo Too LOW! Try again.
    goto game_loop
)
if %guess% gtr %target% (
    echo Too HIGH! Try again.
    goto game_loop
)

:game_win
echo.
echo [!] CONGRATULATIONS! You found it!
echo The number was %target%.
echo It took you %attempts% attempts.
echo =======================================
echo.
goto cmd0loop

:doexit
echo.
echo Closing terminal session...
timeout /t 1 >nul
exit
