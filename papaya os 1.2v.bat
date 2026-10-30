@echo off
title Papaya OS Terminal Simulator
color 0A
cls

echo Loading Papaya OS Modules... [DONE]
echo Mounting System Files...     [DONE]
echo.
echo Welcome to my frist Papaya OS project (v1.0)
echo Type "help" to display available commands.
echo.

:cmd0loop
set "cmd="

:: Grab current path and strip the long C:\Users\khant\ prefix
set "cleanpath=%cd%"
set "cleanpath=%cleanpath:C:\Users\khant\=%"

set /p "cmd=%cleanpath%@jackielaptop@<<< "

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

if /i "%cmd%"=="mkdir" goto domkdir
if /i "%cmd%"=="create" goto docreate
if /i "%cmd%"=="write" goto dowrite
if /i "%cmd%"=="access" goto doaccess
if /i "%cmd%"=="delete" goto dodelete
if /i "%cmd%"=="dir" goto dodir
if /i "%cmd%"=="cd.." goto docdback
if /i "%cmd%"=="movein" goto domovein
if /i "%cmd%"=="moveout" goto domoveout

echo Error: Command "%cmd%" not recognized.
echo.
goto cmd0loop

:dowrite
echo.
set "writefile="
set /p "writefile=Enter the file name to write into (e.g. note.txt): "
if "%writefile%"=="" (
    echo Error: File name cannot be empty.
    echo.
    goto cmd0loop
)
echo Type your text below. Press Enter to save it to the file.
set "filetext="
set /p "filetext==> "
echo %filetext% > "%writefile%"
echo Text saved successfully into "%writefile%".
echo.
goto cmd0loop

:doaccess
echo.
set "targetfile="
echo To open a file inside a folder, type: foldername\filename.txt
set /p "targetfile=Enter file path to open in Notepad: "
if "%targetfile%"=="" (
    echo Error: Path cannot be empty.
    echo.
    goto cmd0loop
)
if not exist "%targetfile%" (
    echo Error: The system cannot find the file specified: "%targetfile%"
    echo.
    goto cmd0loop
)
echo Opening "%targetfile%" inside Notepad...
start notepad.exe "%targetfile%"
echo.
goto cmd0loop

:domovein
echo.
set "myfile="
set /p "myfile=Enter the file name to move: "
set "myfolder="
set /p "myfolder=Enter the target folder name: "

if not exist "%myfile%" (
    echo Error: File "%myfile%" does not exist here.
    echo.
    goto cmd0loop
)
if not exist "%myfolder%\" (
    echo Error: Destination folder "%myfolder%" does not exist here.
    echo.
    goto cmd0loop
)

move "%myfile%" "%myfolder%\" >nul
echo Moved "%myfile%" into "%myfolder%" successfully.
echo.
goto cmd0loop

:domoveout
echo.
set "srcfolder="
set /p "srcfolder=Enter the folder name where the file is inside: "
set "myfile="
set /p "myfile=Enter the file name to take out: "

if not exist "%srcfolder%\%myfile%" (
    echo Error: Could not find "%myfile%" inside "%srcfolder%".
    echo.
    goto cmd0loop
)

move "%srcfolder%\%myfile%" . >nul
echo Pulled "%myfile%" out of "%srcfolder%" into your current folder.
echo.
goto cmd0loop

:domkdir
echo.
set "foldername="
set /p "foldername=Enter new folder name: "
if "%foldername%"=="" (
    echo Error: Folder name cannot be empty.
    echo.
    goto cmd0loop
)
mkdir "%foldername%"
echo Directory "%foldername%" created successfully.
echo Moving terminal path into "%foldername%"...
cd "%foldername%"
echo.
goto cmd0loop

:docreate
echo.
set "filename="
set /p "filename=Enter new file name (e.g. note.txt): "
if "%filename%"=="" (
    echo Error: File name cannot be empty.
    echo.
    goto cmd0loop
)
type nul > "%filename%"
echo File "%filename%" created successfully.
echo.
goto cmd0loop

:dodelete
echo.
set "trash="
set /p "trash=Enter file or folder name to delete: "
if "%trash%"=="" (
    echo Error: Target name cannot be empty.
    echo.
    goto cmd0loop
)
if exist "%trash%\" (
    rmdir /s /q "%trash%"
    echo Folder "%trash%" deleted successfully.
) else if exist "%trash%" (
    del /f /q "%trash%"
    echo File "%trash%" deleted successfully.
) else (
    echo Error: File or folder "%trash%" not found.
)
echo.
goto cmd0loop

:dodir
echo.
echo Directory list for: %cd%
dir /b
echo.
goto cmd0loop

:docdback
cd ..
echo Moved back to parent directory.
echo.
goto cmd0loop

:dohelp
echo.
echo Papaya OS Commands:
echo   help        - Display this menu
echo   clear       - Clear the terminal screen (or type 'cls')
echo   sysinfo     - Show system specs
echo   app         - Show apps on your laptop/desktop
echo   mkdir       - Create a folder and automatically move inside
echo   dir         - List all files and folders in your current path
echo   create      - Build a new empty document file
echo   write       - Type and save text to a file inside the terminal
echo   access      - Open any text file directly in Notepad
echo   delete      - Remove a specific file or folder completely
echo   movein      - Move a local file directly into a subfolder
echo   moveout     - Pull a file out of a subfolder back to here
echo   cd..        - Move back out to the previous parent folder
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
echo    ....
echo  ..::;;..
echo .::;;@@::.
echo .::;;@@::.
echo  ..::;;..
echo    ....
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
echo open use form :
echo  open (app)  , example {user:<<< open (google)}
echo.
goto cmd0loop

:doexit
echo.
echo Closing terminal session...
timeout /t 1 >nul
exit
