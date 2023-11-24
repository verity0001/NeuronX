	::	▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄	::	
	::	█                                               █	::	
	::	█      Name - NeuronFREE / Version - 0.4.1      █	::	
	::	█            Coded by - FireImperator           █	::	
	::	█                                               █	::	
	::	▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀	::

@echo off
title loading...
mode 85,29
SETLOCAL EnableDelayedExpansion > nul 2>&1

CLS
chcp 65001 > nul 2>&1

:admin
CLS
Reg.exe query "HKU\S-1-5-19\Environment" > nul 2>&1
if not "%errorlevel%" EQU "0" goto noadmin
if not "%errorlevel%" EQU "1" goto programload



exit

:noadmin
mode 85,29
title                   NO ADMINISTRATOR PERMISSIONS
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo                      [91m        Please run as Administrator!
echo.
echo.
echo. 
echo.
echo.
echo                          [37m    -PRESS ANY BUTTON TO EXIT-
echo.
echo.
timeout 1 > nul

::Ask for ADMIN permissions inside batch (https://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file)
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

:programload
mode 85,35
Reg.exe add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f > nul 2>&1
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a" & set "COL=%%b")
Reg.exe add HKCU\CONSOLE /v VirtualTerminalLevel /t REG_DWORD /d 1 /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f > nul 2>&1
cls
:welcome
mode 85,29

cls
set tcol=[92m
set bcol=[42;32m
set ocol=A
set fcol=F

echo.
call :ColorText %fcol% "         a"
call :ColorText %fcol% "d"
call :ColorText %fcol% "m"
call :ColorText %fcol% "i"
call :ColorText %fcol% "n"
call :ColorText %fcol% " p"
call :ColorText %fcol% "e"
call :ColorText %fcol% "r"
call :ColorText %fcol% "m"
call :ColorText %fcol% "i"
call :ColorText %fcol% "s"
call :ColorText %fcol% "s"
call :ColorText %fcol% "i"
call :ColorText %fcol% "o"
call :ColorText %fcol% "n"
call :ColorText %fcol% "s"
call :ColorText %fcol% " d"
call :ColorText %fcol% "e"
call :ColorText %fcol% "t"
call :ColorText %fcol% "e"
call :ColorText %fcol% "c"
call :ColorText %fcol% "t"
call :ColorText %fcol% "e"
call :ColorText %fcol% "d!"
call :ColorText %fcol% " P"
call :ColorText %fcol% "l"
call :ColorText %fcol% "e"
call :ColorText %fcol% "a"
call :ColorText %fcol% "s"
call :ColorText %fcol% "e"
call :ColorText %fcol% " w"
call :ColorText %fcol% "a"
call :ColorText %fcol% "i"
call :ColorText %fcol% "t"
call :ColorText %fcol% " w"
call :ColorText %fcol% "h"
call :ColorText %fcol% "i"
call :ColorText %fcol% "l"
call :ColorText %fcol% "e"
call :ColorText %fcol% " t"
call :ColorText %fcol% "h"
call :ColorText %fcol% "e"
call :ColorText %fcol% " p"
call :ColorText %fcol% "r"
call :ColorText %fcol% "o"
call :ColorText %fcol% "g"
call :ColorText %fcol% "r"
call :ColorText %fcol% "a"
call :ColorText %fcol% "m"
call :ColorText %fcol% " i"
call :ColorText %fcol% "s"
call :ColorText %fcol% " l"
call :ColorText %fcol% "o"
call :ColorText %fcol% "a"
call :ColorText %fcol% "d"
call :ColorText %fcol% "i"
call :ColorText %fcol% "n"
call :ColorText %fcol% "g."
echo.

echo. [97m
call :ColorText %fcol% "         W"
ping -n 1 localhost > nul
call :ColorText %fcol% "E"
ping -n 1 localhost > nul
call :ColorText %fcol% "L"
ping -n 1 localhost > nul
call :ColorText %fcol% "C"
ping -n 1 localhost > nul
call :ColorText %fcol% "O"
ping -n 1 localhost > nul
call :ColorText %fcol% "M"
ping -n 1 localhost > nul
call :ColorText %fcol% "E"
ping -n 1 localhost > nul
call :ColorText %fcol% " U"
ping -n 1 localhost > nul
call :ColorText %fcol% "S"
ping -n 1 localhost > nul
call :ColorText %fcol% "E"
ping -n 1 localhost > nul
call :ColorText %fcol% "R - "
ping -n 2 localhost > nul
echo. %tcol%%username%
echo.
echo.
echo.
echo.
timeout 3 > nul
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
call :ColorText %fcol% "                             -"
call :ColorText %fcol% "P"
call :ColorText %fcol% "R"
call :ColorText %fcol% "E"
call :ColorText %fcol% "S"
call :ColorText %fcol% "S"
call :ColorText %fcol% " A"
call :ColorText %fcol% "N"
call :ColorText %fcol% "Y"
call :ColorText %fcol% " K"
call :ColorText %fcol% "E"
call :ColorText %fcol% "Y"
call :ColorText %fcol% " T"
call :ColorText %fcol% "O"
call :ColorText %fcol% " C"
call :ColorText %fcol% "O"
call :ColorText %fcol% "N"
call :ColorText %fcol% "T"
call :ColorText %fcol% "I"
call :ColorText %fcol% "N"
call :ColorText %fcol% "U"
call :ColorText %fcol% "E "
call :ColorText %fcol% "-"
start systempropertiesprotection
SET msgboxTitle=Hello :3
SET msgboxBody=Create system restore point!
SET tmpmsgbox=%temp%\~tmpmsgbox12.vbs
IF EXIST "%tmpmsgbox%" DEL /f /Q "%tmpmsgbox%"
echo msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"
pause > nul
cls
:DisclaimerCheck
reg query "HKCU\Software\Neuron" /v "Disclaimer" >nul 2>&1
if %errorlevel% equ 0 (
	goto menu 
) else (
	goto Disclaimer

)
:Disclaimer
cls
echo. %tcol%
echo.                        _   _                                 
echo.                       ^| \ ^| ^|  ___  _   _  _ __  ___   _ __  
echo.                       ^|  \^| ^| / _ \^| ^| ^| ^|^| '__^|/ _ \ ^| '_ \ 
echo.                       ^| ^|\  ^|^|  __/^| ^|_^| ^|^| ^|  ^| (_) ^|^| ^| ^| ^|
echo.                       ^|_^| \_^| \___^| \__,_^|^|_^|   \___/ ^|_^| ^|_^|
echo. [97m
echo. 
echo.
echo.    This product is provided 'AS IS' without any warranties or guarantees. 
echo.
echo.    By using this software, you acknowledge and accept that any risks associated 
echo.    with its use are solely your responsibility. We are not liable for 
echo.    any damages or losses resulting from the use of this product.
echo.
echo.
echo.
echo.                            type "[92mI understand[97m" to proceed
echo.
echo.
echo.
SET INPUT=
set /p "INPUT=[30m.                                         [92m>[97m: [97m"

if /i "%INPUT%" == "I understand" goto DisclaimerCheck
Reg.exe add "HKCU\Software\Neuron" /v "Disclaimer" /f >nul 2>&1


goto Disclaimer



:menu


mode 85,29
title                              NEURON FREE - Thank you for using - NEURON FREE
cls
call :menutop
echo.
echo.
echo.
echo.
echo.
call :ColorText %fcol% "                      S"
call :ColorText %fcol% "Y"
call :ColorText %fcol% "S"
call :ColorText %fcol% "T"
call :ColorText %fcol% "E"
call :ColorText %fcol% "M"
call :ColorText %fcol% " T"
call :ColorText %fcol% "W"
call :ColorText %fcol% "E"
call :ColorText %fcol% "A"
call :ColorText %fcol% "K"
call :ColorText %fcol% "S"
call :ColorText %fcol% " ["
call :ColorText %ocol% " 1"
call :ColorText %fcol% " ]"
call :ColorText %fcol% "     ["
call :ColorText %ocol% " 2"
call :ColorText %fcol% " ]"
call :ColorText %fcol% " N"
call :ColorText %fcol% "E"
call :ColorText %fcol% "T"
call :ColorText %fcol% "W"
call :ColorText %fcol% "O"
call :ColorText %fcol% "R"
call :ColorText %fcol% "K"
call :ColorText %fcol% " T"
call :ColorText %fcol% "W"
call :ColorText %fcol% "E"
call :ColorText %fcol% "A"
call :ColorText %fcol% "K"
call :ColorText %fcol% "S"
echo.
echo.
echo.
echo.
call :ColorText %fcol% "                        F"
call :ColorText %fcol% "o"
call :ColorText %fcol% "r"
call :ColorText %fcol% " m"
call :ColorText %fcol% "o"
call :ColorText %fcol% "r"
call :ColorText %fcol% "e"
call :ColorText %fcol% " o"
call :ColorText %fcol% "p"
call :ColorText %fcol% "t"
call :ColorText %fcol% "i"
call :ColorText %fcol% "m"
call :ColorText %fcol% "i"
call :ColorText %fcol% "z"
call :ColorText %fcol% "a"
call :ColorText %fcol% "t"
call :ColorText %fcol% "i"
call :ColorText %fcol% "o"
call :ColorText %fcol% "n"
call :ColorText %fcol% "s"
call :ColorText %fcol% " g"
call :ColorText %fcol% "o"
call :ColorText %fcol% " t"
call :ColorText %fcol% "o"
call :ColorText %fcol% " o"
call :ColorText %fcol% "u"
call :ColorText %fcol% "r"
call :ColorText %fcol% " d"
call :ColorText %fcol% "i"
call :ColorText %fcol% "s"
call :ColorText %fcol% "c"
call :ColorText %fcol% "o"
call :ColorText %fcol% "r"
call :ColorText %fcol% "d"
echo.
echo. [97m
SET INPUT=
set /p "INPUT=[30m.                                         [92m>[97m: [97m"

IF /I '%INPUT%'=='1' GOTO windowsmenu
IF /I '%INPUT%'=='2' GOTO networkmenu

goto menu

:nope
SET msgboxTitle=Nope
SET msgboxBody=This option has not been created yet :3
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /f /Q "%tmpmsgbox%"
echo msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"
goto menu


:windowsmenu
cls
call :menutop
echo.
echo.
call :ColorText %fcol% "                 O"
call :ColorText %fcol% "P"
call :ColorText %fcol% "T"
call :ColorText %fcol% "I"
call :ColorText %fcol% "M"
call :ColorText %fcol% "I"
call :ColorText %fcol% "Z"
call :ColorText %fcol% "E"
call :ColorText %ocol% " W"
call :ColorText %ocol% "I"
call :ColorText %ocol% "N"
call :ColorText %ocol% "D"
call :ColorText %ocol% "O"
call :ColorText %ocol% "W"
call :ColorText %ocol% "S"
call :ColorText %ocol% " N"
call :ColorText %ocol% "T"
call :ColorText %fcol% " ["
call :ColorText %ocol% " 1"
call :ColorText %fcol% " ]"
call :ColorText %fcol% "    ["
call :ColorText %ocol% " 2"
call :ColorText %fcol% " ]"
call :ColorText %fcol% " O"
call :ColorText %fcol% "P"
call :ColorText %fcol% "T"
call :ColorText %fcol% "I"
call :ColorText %fcol% "M"
call :ColorText %fcol% "I"
call :ColorText %fcol% "Z"
call :ColorText %fcol% "E"
call :ColorText %ocol% " V"
call :ColorText %ocol% "I"
call :ColorText %ocol% "S"
call :ColorText %ocol% "U"
call :ColorText %ocol% "A"
call :ColorText %ocol% "L"
call :ColorText %ocol% " S"
call :ColorText %ocol% "E"
call :ColorText %ocol% "T"
call :ColorText %ocol% "T"
call :ColorText %ocol% "I"
call :ColorText %ocol% "N"
call :ColorText %ocol% "G"
call :ColorText %ocol% "S"

echo.
echo.
echo.
call :ColorText %fcol% "                    O"
call :ColorText %fcol% "P"
call :ColorText %fcol% "T"
call :ColorText %fcol% "I"
call :ColorText %fcol% "M"
call :ColorText %fcol% "I"
call :ColorText %fcol% "Z"
call :ColorText %fcol% "E"
call :ColorText %ocol% " B"
call :ColorText %ocol% "C"
call :ColorText %ocol% "D"
call :ColorText %ocol% "E"
call :ColorText %ocol% "D"
call :ColorText %ocol% "I"
call :ColorText %ocol% "T"
call :ColorText %fcol% " ["
call :ColorText %ocol% " 3"
call :ColorText %fcol% " ]"
call :ColorText %fcol% "    ["
call :ColorText %ocol% " 4"
call :ColorText %fcol% " ]"
call :ColorText %fcol% " D"
call :ColorText %fcol% "I"
call :ColorText %fcol% "S"
call :ColorText %fcol% "A"
call :ColorText %fcol% "B"
call :ColorText %fcol% "L"
call :ColorText %fcol% "E"
call :ColorText %ocol% " W"
call :ColorText %ocol% "I"
call :ColorText %ocol% "N"
call :ColorText %ocol% "D"
call :ColorText %ocol% "O"
call :ColorText %ocol% "W"
call :ColorText %ocol% "S"
call :ColorText %ocol% " T"
call :ColorText %ocol% "E"
call :ColorText %ocol% "L"
call :ColorText %ocol% "E"
call :ColorText %ocol% "M"
call :ColorText %ocol% "E"
call :ColorText %ocol% "T"
call :ColorText %ocol% "R"
call :ColorText %ocol% "Y"
echo.
echo.
echo.
echo.
call :ColorText %fcol% "                                B"
call :ColorText %fcol% "A"
call :ColorText %fcol% "C"
call :ColorText %fcol% "K"
call :ColorText %fcol% " ["
call :ColorText %ocol% " B"
call :ColorText %fcol% " ]"
call :ColorText %fcol% "    ["
call :ColorText %ocol% " N"
call :ColorText %fcol% " ]"
call :ColorText %fcol% " N"
call :ColorText %fcol% "E"
call :ColorText %fcol% "X"
call :ColorText %fcol% "T"
echo. [97m
echo.
echo.
SET INPUT=
set /p "INPUT=[30m.                                         [92m>[97m: [97m"

IF /I '%INPUT%'=='1' GOTO WindowsNT
IF /I '%INPUT%'=='2' GOTO visualsettings
IF /I '%INPUT%'=='3' GOTO bcdedit
IF /I '%INPUT%'=='4' GOTO Telemetry
IF /I '%INPUT%'=='b' GOTO menu
IF /I '%INPUT%'=='n' GOTO windowsmenu2
goto windowsmenu

:windowsmenu2
cls
call :menutop
echo.
echo.
call :ColorText %fcol% "        D"
call :ColorText %fcol% "I"
call :ColorText %fcol% "S"
call :ColorText %fcol% "A"
call :ColorText %fcol% "B"
call :ColorText %fcol% "L"
call :ColorText %fcol% "E"
call :ColorText %ocol% " U"
call :ColorText %ocol% "N"
call :ColorText %ocol% "N"
call :ColorText %ocol% "E"
call :ColorText %ocol% "C"
call :ColorText %ocol% "E"
call :ColorText %ocol% "S"
call :ColorText %ocol% "S"
call :ColorText %ocol% "A"
call :ColorText %ocol% "R"
call :ColorText %ocol% "Y"
call :ColorText %ocol% " S"
call :ColorText %ocol% "E"
call :ColorText %ocol% "R"
call :ColorText %ocol% "V"
call :ColorText %ocol% "I"
call :ColorText %ocol% "C"
call :ColorText %ocol% "E"
call :ColorText %ocol% "S"
call :ColorText %fcol% " ["
call :ColorText %ocol% " 1"
call :ColorText %fcol% " ]"
call :ColorText %fcol% "    ["
call :ColorText %ocol% " 2"
call :ColorText %fcol% " ]"
call :ColorText %fcol% " O"
call :ColorText %fcol% "P"
call :ColorText %fcol% "T"
call :ColorText %fcol% "I"
call :ColorText %fcol% "M"
call :ColorText %fcol% "I"
call :ColorText %fcol% "Z"
call :ColorText %fcol% "E"
call :ColorText %ocol% " X"
call :ColorText %ocol% "B"
call :ColorText %ocol% "O"
call :ColorText %ocol% "X"
call :ColorText %ocol% " G"
call :ColorText %ocol% "A"
call :ColorText %ocol% "M"
call :ColorText %ocol% "E"
call :ColorText %ocol% "B"
call :ColorText %ocol% "A"
call :ColorText %ocol% "R"

echo.
echo.
echo.
call :ColorText %fcol% "                      O"
call :ColorText %fcol% "P"
call :ColorText %fcol% "T"
call :ColorText %fcol% "I"
call :ColorText %fcol% "M"
call :ColorText %fcol% "I"
call :ColorText %fcol% "Z"
call :ColorText %fcol% "E"
call :ColorText %ocol% " C"
call :ColorText %ocol% "S"
call :ColorText %ocol% "R"
call :ColorText %ocol% "S"
call :ColorText %ocol% "S"
call :ColorText %fcol% " ["
call :ColorText %ocol% " 3"
call :ColorText %fcol% " ]"
call :ColorText %fcol% "    ["
call :ColorText %ocol% " 4"
call :ColorText %fcol% " ]"
call :ColorText %fcol% " O"
call :ColorText %fcol% "V"
call :ColorText %fcol% "E"
call :ColorText %fcol% "R"
call :ColorText %fcol% "A"
call :ColorText %fcol% "L"
call :ColorText %fcol% "L"
call :ColorText %ocol% " T"
call :ColorText %ocol% "W"
call :ColorText %ocol% "E"
call :ColorText %ocol% "A"
call :ColorText %ocol% "K"
call :ColorText %ocol% "S"
echo.
echo.
echo.
echo.
call :ColorText %fcol% "                                B"
call :ColorText %fcol% "A"
call :ColorText %fcol% "C"
call :ColorText %fcol% "K"
call :ColorText %fcol% " ["
call :ColorText %ocol% " B"
call :ColorText %fcol% " ]"
call :ColorText %fcol% "    ["
call :ColorText %ocol% " N"
call :ColorText %fcol% " ]"
call :ColorText %fcol% " S"
call :ColorText %fcol% "O"
call :ColorText %fcol% "O"
call :ColorText %fcol% "N"
echo. [97m
echo.
echo.
SET INPUT=
set /p "INPUT=[30m.                                         [92m>[97m: [97m"

IF /I '%INPUT%'=='1' GOTO optimizeservices
IF /I '%INPUT%'=='2' GOTO gamedvroptimization
IF /I '%INPUT%'=='3' GOTO csrssoptimization
IF /I '%INPUT%'=='4' GOTO overalloptmizations
IF /I '%INPUT%'=='b' GOTO windowsmenu
IF /I '%INPUT%'=='n' GOTO windowsmenu2
goto windowsmenu2


:networkmenu
cls
call :menutop
echo.
echo.
call :ColorText %fcol% "                       N"
call :ColorText %fcol% "E"
call :ColorText %fcol% "T"
call :ColorText %fcol% "W"
call :ColorText %fcol% "O"
call :ColorText %fcol% "R"
call :ColorText %fcol% "K"
call :ColorText %ocol% " R"
call :ColorText %ocol% "E"
call :ColorText %ocol% "S"
call :ColorText %ocol% "E"
call :ColorText %ocol% "T"
call :ColorText %fcol% " ["
call :ColorText %ocol% " 1"
call :ColorText %fcol% " ]"

call :ColorText %fcol% "    ["
call :ColorText %ocol% " 2"
call :ColorText %fcol% " ]"
call :ColorText %fcol% " O"
call :ColorText %fcol% "P"
call :ColorText %fcol% "T"
call :ColorText %fcol% "I"
call :ColorText %fcol% "M"
call :ColorText %fcol% "I"
call :ColorText %fcol% "Z"
call :ColorText %fcol% "E"
call :ColorText %ocol% " T"
call :ColorText %ocol% "C"
call :ColorText %ocol% "P"
call :ColorText %ocol% "I"
call :ColorText %ocol% "P"
echo.
echo.
echo.
call :ColorText %fcol% "             O"
call :ColorText %fcol% "P"
call :ColorText %fcol% "T"
call :ColorText %fcol% "I"
call :ColorText %fcol% "M"
call :ColorText %fcol% "I"
call :ColorText %fcol% "Z"
call :ColorText %fcol% "E"
call :ColorText %ocol% " N"
call :ColorText %ocol% "E"
call :ColorText %ocol% "T"
call :ColorText %ocol% "S"
call :ColorText %ocol% "H"
call :ColorText %ocol% " S"
call :ColorText %ocol% "E"
call :ColorText %ocol% "T"
call :ColorText %ocol% "T"
call :ColorText %ocol% "I"
call :ColorText %ocol% "N"
call :ColorText %ocol% "G"
call :ColorText %ocol% "S"
call :ColorText %fcol% " ["
call :ColorText %ocol% " 3"
call :ColorText %fcol% " ]"
call :ColorText %fcol% "    ["
call :ColorText %ocol% " 4"
call :ColorText %fcol% " ]"
call :ColorText %fcol% " F"
call :ColorText %fcol% "I"
call :ColorText %fcol% "X"
call :ColorText %ocol% " H"
call :ColorText %ocol% "I"
call :ColorText %ocol% "T"
call :ColorText %ocol% "R"
call :ColorText %ocol% "E"
call :ColorText %ocol% "G"
call :ColorText 0 " ["
call :ColorText 2 "B"
call :ColorText 2 "E"
call :ColorText 2 "T"
call :ColorText 2 "A"
call :ColorText 0 "]"
echo.
echo.
echo.
echo.
call :ColorText %fcol% "                                B"
call :ColorText %fcol% "A"
call :ColorText %fcol% "C"
call :ColorText %fcol% "K"
call :ColorText %fcol% " ["
call :ColorText %ocol% " B"
call :ColorText %fcol% " ]"
call :ColorText %fcol% "    ["
call :ColorText %ocol% " N"
call :ColorText %fcol% " ]"
call :ColorText %fcol% " S"
call :ColorText %fcol% "O"
call :ColorText %fcol% "O"
call :ColorText %fcol% "N"
echo. [97m
echo.
echo.
SET INPUT=
set /p "INPUT=[30m.                                         [92m>[97m: [97m"

IF /I '%INPUT%'=='1' GOTO networkreset
IF /I '%INPUT%'=='2' GOTO tcpioptimization
IF /I '%INPUT%'=='3' GOTO netshoptimiaztion
IF /I '%INPUT%'=='4' GOTO hitregfix
IF /I '%INPUT%'=='b' GOTO menu
IF /I '%INPUT%'=='n' GOTO windowsmenu2

goto networkmenu


:applyingtweakscreen
cls
call :menutop
echo.
echo.
echo.
echo.
echo.
call :ColorText %fcol% "                      P"
call :ColorText %fcol% "l"
call :ColorText %fcol% "e"
call :ColorText %fcol% "a"
call :ColorText %fcol% "s"
call :ColorText %fcol% "e"
call :ColorText %fcol% " w"
call :ColorText %fcol% "a"
call :ColorText %fcol% "i"
call :ColorText %fcol% "t"
call :ColorText %fcol% " w"
call :ColorText %fcol% "h"
call :ColorText %fcol% "i"
call :ColorText %fcol% "l"
call :ColorText %fcol% "e"
call :ColorText %fcol% " w"
call :ColorText %fcol% "e"
call :ColorText %fcol% " a"
call :ColorText %fcol% "r"
call :ColorText %fcol% "e"
call :ColorText %fcol% " a"
call :ColorText %fcol% "p"
call :ColorText %fcol% "p"
call :ColorText %fcol% "l"
call :ColorText %fcol% "y"
call :ColorText %fcol% "i"
call :ColorText %fcol% "n"
call :ColorText %fcol% "g"
call :ColorText %fcol% " t"
call :ColorText %fcol% "h"
call :ColorText %fcol% "e"
call :ColorText %fcol% " t"
call :ColorText %fcol% "w"
call :ColorText %fcol% "e"
call :ColorText %fcol% "a"
call :ColorText %fcol% "k"
call :ColorText %fcol% "s"
echo.
echo.
echo.
goto :eof


:tweakappliedscreen
cls
call :menutop
echo.
echo.
echo.
echo.
echo.
call :ColorText %fcol% "                              T"
call :ColorText %fcol% "w"
call :ColorText %fcol% "e"
call :ColorText %fcol% "a"
call :ColorText %fcol% "k"
call :ColorText %fcol% " a"
call :ColorText %fcol% "p"
call :ColorText %fcol% "p"
call :ColorText %fcol% "l"
call :ColorText %fcol% "i"
call :ColorText %fcol% "e"
call :ColorText %fcol% "d"
call :ColorText %fcol% " s"
call :ColorText %fcol% "u"
call :ColorText %fcol% "c"
call :ColorText %fcol% "c"
call :ColorText %fcol% "e"
call :ColorText %fcol% "s"
call :ColorText %fcol% "f"
call :ColorText %fcol% "u"
call :ColorText %fcol% "l"
call :ColorText %fcol% "l"
call :ColorText %fcol% "y"
echo.
echo.
echo.
timeout 2 >nul
goto :eof




:xd
goto menu

goto menu
:WindowsNT
call :applyingtweakscreen
timeout 2 >nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Background Only" /t REG_SZ /d "True" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Priority" /t REG_DWORD /d "6" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Scheduling Category" /t REG_SZ /d "Medium" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Background Only" /t REG_SZ /d "True" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Priority" /t REG_DWORD /d "5" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Scheduling Category" /t REG_SZ /d "Medium" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Background Only" /t REG_SZ /d "True" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "BackgroundPriority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Scheduling Category" /t REG_SZ /d "High" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Background Only" /t REG_SZ /d "True" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Priority" /t REG_DWORD /d "4" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Scheduling Category" /t REG_SZ /d "Medium" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Background Only" /t REG_SZ /d "False" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "BackgroundPriority" /t REG_DWORD /d "4" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Priority" /t REG_DWORD /d "3" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Scheduling Category" /t REG_SZ /d "Medium" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Background Only" /t REG_SZ /d "False" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Priority" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Scheduling Category" /t REG_SZ /d "High" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Background Only" /t REG_SZ /d "True" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Priority" /t REG_DWORD /d "5" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Scheduling Category" /t REG_SZ /d "Medium" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Background Only" /t REG_SZ /d "False" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Priority" /t REG_DWORD /d "2" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Scheduling Category" /t REG_SZ /d "High" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "SFIO Priority" /t REG_SZ /d "High" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Latency Sensitive" /t REG_SZ /d "True" /f > nul 2>&1
goto done


:overalloptmizations
call :applyingtweakscreen
chcp 852 > nul 2>&1 

TASKKILL /T /F /IM  discord.exe >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Discord.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\FTH" /v "Enabled" /t Reg_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t Reg_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t Reg_DWORD /d "2" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t Reg_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePageCombining" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t Reg_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t Reg_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "HeapDeCommitFreeBlockThreshold" /t REG_DWORD /d "262144" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "DontVerifyRandomDrivers" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t Reg_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t Reg_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f > nul 2>&1

for /f "tokens=2 delims==" %%i in ('wmic os get TotalVisibleMemorySize /value') do set /a mem=%%i + 1024000
	Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d %mem% /f > nul 2>&1
) >nul 2>&1
for /f %%g in ('wmic path win32_VideoController get PNPDeviceID ^| findstr /L "VEN_"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f > nul 2>&1
for /f %%g in ('wmic path win32_VideoController get PNPDeviceID ^| findstr /L "VEN_"') do Reg.exe delete "HKLM\System\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f > nul 2>&1
for /f %%i in ('wmic path Win32_NetworkAdapter get PNPDeviceID ^| findstr /L "VEN_"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f > nul 2>&1
for /f %%i in ('wmic path Win32_NetworkAdapter get PNPDeviceID ^| findstr /L "VEN_"') do Reg.exe delete "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f > nul 2>&1
if exist "%SYSTEMROOT%\System32\fsutil.exe" (
	fsutil behavior set mftzone 2
	fsutil behavior set disablelastaccess 1
	fsutil behavior set disablecompression 1
	fsutil behavior set memoryusage 2
	fsutil behavior set disabledeletenotify 0
	fsutil behavior set encryptpagingfile 0
	fsutil behavior set disable8dot3 1
) > nul 2>&1
powershell -NoProfile -Command "Disable-MMAgent -PagingCombining -mc" > nul 2>&1
chcp 65001 > nul 2>&1 

call :applyingtweakscreen



:telemetry
call :applyingtweakscreen
chcp 852 > nul 2>&1 

netsh advfirewall firewall add rule name="Block Windows Telemetry" dir=in action=block remoteip=134.170.30.202,137.116.81.24,157.56.106.189,184.86.53.99,2.22.61.43,2.22.61.66,204.79.197.200,23.218.212.69,65.39.117.23,65.55.108.23,64.4.54.254 enable=yes > nul 2>&1
netsh advfirewall firewall add rule name="Block NVIDIA Telemetry" dir=in action=block remoteip=8.36.80.197,8.36.80.224,8.36.80.252,8.36.113.118,8.36.113.141,8.36.80.230,8.36.80.231,8.36.113.126,8.36.80.195,8.36.80.217,8.36.80.237,8.36.80.246,8.36.113.116,8.36.113.139,8.36.80.244,216.228.121.209 enable=yes > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /d "0" /t REG_DWORD /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314563Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowDeviceNameInTelemetry" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "DisableTaggedEnergyLogging" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxApplication" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxTagPerApplication" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowCortana" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "RestrictAnonymousSAM" /t REG_DWORD /d "1" /f > nul 2>&1
Reg add "HKLM\Software\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d "0" /f >nul
Reg add "HKLM\Software\Policies\Microsoft\Windows\Maps" /v "AllowUntriggeredNetworkTrafficOnSettingsPage" /t REG_DWORD /d "0" /f >nul
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul
sc config diagtrack start= disabled > nul 2>&1
sc config diagnosticshub.standardcollector.service start= disabled > nul 2>&1
sc config dmwappushservice start= disabled > nul 2>&1
sc config NvTelemetryContainer start= disabled > nul 2>&1
sc config WerSvc start=disabled >nul
sc config WecSvc start=disabled >nul
sc config DiagTrack start=disabled >nul
sc config DiagSvc start=disabled >nul
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" > nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" > nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" > nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" > nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" > nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" > nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" > nul 2>&1
schtasks /change /disable /tn "Microsoft\Windows\Device Information\Device" > nul 2>&1
setx POWERSHELL_TELEMETRY_OPTOUT 1 >nul
setx DOTNET_CLI_TELEMETRY_OPTOUT 1 >nul

takeown /f C:\Windows\System32\GameBarPresenceWriter.exe > nul 2>&1
icacls C:\Windows\System32\GameBarPresenceWriter.exe /deny *S-1-1-0:F /T > nul 2>&1
takeown /f %UserProfile%\AppData\Local\NVIDIA\NvBackend\ApplicationOntology\OAWrapper.exe > nul 2>&1
icacls %UserProfile%\AppData\Local\NVIDIA\NvBackend\ApplicationOntology\OAWrapper.exe /deny *S-1-1-0:F /T > nul 2>&1
timeout 1 >nul
chcp 65001 > nul 2>&1 

goto done1

:visualsettings
call :applyingtweakscreen

Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMSaveThumbnailEnabled" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListBoxSmoothScrolling" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewAlphaSelect" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ComboBoxAnimation" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ControlAnimations" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TooltipAnimation" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ThumbnailsOrIcon" /v "DefaultApplied" /t REG_SZ /d "1" /f > nul 2>&1 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DragFullWindows" /v "DefaultApplied" /t REG_SZ /d "1" /f > nul 2>&1 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewShadow" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMEnabled" /v "DefaultApplied" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\FontSmoothing" /v "DefaultApplied" /t REG_SZ /d "1" /f > nul 2>&1 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\SelectionFade" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\AnimateMinMax" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Desktop" /f /v "UserPreferencesMask" /t REG_BINARY /d "9012078012000000" >nul
Reg.exe add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "2" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "ListviewShadow" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d "0" /f > nul 2>&1
goto done

:csrssoptimization
call :applyingtweakscreen

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ntoskrnl.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ntoskrnl.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\audiodg.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "2" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ntoskrnl.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ntoskrnl.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\audiodg.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "2" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
goto done1

:optimizeservices
call :applyingtweakscreen
sc config FontCache start=auto > nul
sc config RemoteAccess start= disabled > nul
sc config RemoteRegistry start= disabled > nul
sc config AJRouter start= demand > nul
sc config ALG start= demand > nul
sc config AppIDSvc start= demand > nul
sc config AppMgmt start= demand > nul
sc config AppReadiness start= demand > nul
sc config AppVClient start= demand > nul
sc config AppXSvc start= demand > nul
sc config Appinfo start= demand > nul
sc config AssignedAccessManagerSvc start= demand > nul
sc config AxInstSV start= demand > nul
sc config BDESVC start= demand > nul
sc config BFE start= demand > nul
sc config BTAGService start= demand > nul
sc config CertPropSvc start= demand > nul
sc config FontCache3.0.0.0 start=demand > nul
sc config p2psvc start= demand > nul
sc config PhoneSvc start= demand > nul
sc config WaaSMedicSvc start=demand > nul
sc config WalletService start= demand > nul
sc config WSearch start= demand > nul
sc config SCPolicySvc start= demand > nul
sc config spectrum start=demand > nul
sc config wcncsvc start=demand > nul
sc config lmhosts start=demand > nul
sc config XboxGipSvc start=demand > nul
goto done1



:gamedvroptimization
call :applyingtweakscreen
Reg.exe add HKCU\System\GameConfigStore /v GameDVR_Enabled /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add HKCU\System\GameConfigStore /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f > nul 2>&1
Reg.exe add HKCU\System\GameConfigStore /v GameDVR_EFSEFeatureFlags /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add HKCU\System\GameConfigStore /v GameDVR_DXGIHonorFSEWindowsCompatible /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add HKCU\System\GameConfigStore /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f > nul 2>&1
Reg.exe add HKCU\Software\Microsoft\GameBar /v UseNexusForGameBarEnabled /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add HKCU\Software\Microsoft\GameBar /v GamepadDoublePressIntervalMs /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add HKCU\Software\Microsoft\GameBar /v ShowStartupPanel /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add HKCU\Software\Microsoft\GameBar /v GamePanelStartupTipIndex /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add HKCU\Software\Policies\Microsoft\Windows\GameDVR /v AllowGameDVR /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add HKLM\Software\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR /v value /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR /v AppCaptureEnabled /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR /v AudioCaptureEnabled /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR /v CursorCaptureEnabled /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR /v MicrophoneCaptureEnabled /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR /v HistoricalCaptureEnabled /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d "0" /f > nul 2>&1


goto done1




:networkreset
call :applyingtweakscreen
ipconfig /flushdns > nul 2>&1 
ipconfig /release > nul 2>&1 
ipconfig /renew > nul 2>&1 
netsh int ip reset > nul 2>&1 
netsh int ipv4 reset > nul 2>&1 
netsh int ipv6 reset > nul 2>&1 
netsh int tcp reset > nul 2>&1 
netsh winsock reset > nul 2>&1 
netsh branchcache reset > nul 2>&1 
netsh http flush logbuffer > nul 2>&1 
goto donenetwork


:tcpioptimization
call :applyingtweakscreen
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v DisableTaskOffload /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v DisableDynamicDiscovery /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v EnablePMTUBDetect /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v SackOpts /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpMaxConnectRetransmissions" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "30" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "EnableConnectionRateLimiting" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "EnableDCA" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "EnablePMTUBHDetect" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "EnableRSS" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "EnableWsd" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "65535" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d "10" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "10" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "MaxFreeTcbs" /t REG_DWORD /d "65536" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "EnableTCPA" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpCreateAndConnectTcbRateLimitDepth" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d "3" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpMaxSendFree" /t REG_DWORD /d "65535" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpNumConnections" /t REG_DWORD /d "16777214" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "MaxHashTableSize" /t REG_DWORD /d "65536" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "SynAttackProtect" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "DelayedAckFrequency" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "DelayedAckTicks" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "CongestionAlgorithm" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters" /v "MultihopSets" /t REG_DWORD /d "15" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters\Winsock" /v "UseDelayedAcceptance" /t REG_DWORD /d "0" /f > nul 2>&1 
goto donenetwork

:netshoptimiaztion
call :applyingtweakscreen
netsh winsock set autotuning on > nul 2>&1
netsh int ip set interface ethernet currenthoplimit=64 > nul 2>&1
netsh int ip set global neighborcachelimit=4096 > nul 2>&1
netsh int ip set global routecachelimit=4096 > nul 2>&1
netsh int ip set global sourceroutingbehavior=drop > nul 2>&1
netsh int ip set global taskoffload=disabled > nul 2>&1
netsh int tcp set global ecncapability=disabled > nul 2>&1
netsh int tcp set global congestionprovider=ctcp > nul 2>&1
netsh int tcp set global netdma=enabled > nul 2>&1
netsh int tcp set global dca=enabled > nul 2>&1
netsh int tcp set global rss=enabled > nul 2>&1
netsh int tcp set global chimney=disabled > nul 2>&1
netsh int tcp set global rsc=enabled > nul 2>&1
netsh int tcp set global nonsackrttresiliency=disabled > nul 2>&1
netsh int tcp set global maxsynretransmissions=2 > nul 2>&1
netsh int tcp set global fastopen=enabled > nul 2>&1
netsh int tcp set global ecncapability=disabled > nul 2>&1
netsh int tcp set global timestamps=disabled > nul 2>&1
netsh int tcp set global initialRto=2000 > nul 2>&1
netsh int tcp set global MinRto=300 > nul 2>&1
netsh int tcp set heuristics disabled > nul 2>&1
netsh int tcp set supplemental template=custom icw=10 > nul 2>&1
netsh int udp set global uro=enabled > nul 2>&1
netsh int ipv4 set global defaultcurhoplimit=64 > nul 2>&1
netsh int ipv6 set global defaultcurhoplimit=64 > nul 2>&1
goto donenetwork


:bcdedit
call :applyingtweakscreen

set "PROCESSOR_IDENTIFIER=%PROCESSOR_IDENTIFIER:~0,-2%"
set "BRAND="

echo %PROCESSOR_IDENTIFIER% | findstr /i "intel" > nul
if %errorlevel% == 0 set "BRAND=intel"

echo %PROCESSOR_IDENTIFIER% | findstr /i "amd" > nul
if %errorlevel% == 0 set "BRAND=AMD"

timeout 2 >nul
goto %BRAND%

:hitregfix
call :applyingtweakscreen
For /f %%k in ('Reg.exe Query hklm\SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces /f "NetbiosOptions" /v /s^|Findstr HKEY_') do (
	Reg.exe add %%k /v NetbiosOptions /t reg_dword /d 2 /f
	Reg.exe add %%k /v EnableNagling /t reg_dword /d 0 /f
) > nul 2>&1
netsh int tcp set global autotuninglevel=disabled 
for /f "tokens=3*" %%s in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards" /f "ServiceName" /s^|findstr /i /l "ServiceName"') do (
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%s" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%s" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%s" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Psched\Parameters\Adapters\%%s" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%s" /v "TcpInitialRTT" /t REG_DWORD /d "0" /f 
	Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%s" /v "DeadGWDetectDefault" /t REG_DWORD /d "1" /f
	) > nul 2>&1
goto donenetwork


:intel
bcdedit /set {globalsettings} custom:16000067 true > nul 2>&1
bcdedit /set {globalsettings} custom:16000069 true > nul 2>&1
bcdedit /set {globalsettings} custom:16000068 true > nul 2>&1
bcdedit /set hypervisorlaunchtype off > nul 2>&1
bcdedit /set tscsyncpolicy Enhanced > nul 2>&1
bcdedit /set bootmenupolicy Legacy > nul 2>&1
bcdedit /set bootux disabled > nul 2>&1
bcdedit /set quietboot yes > nul 2>&1
bcdedit /timeout 0 > nul 2>&1
timeout 1 > nul
GOTO done

:amd
bcdedit /set {globalsettings} custom:16000067 true > nul 2>&1
bcdedit /set {globalsettings} custom:16000069 true > nul 2>&1
bcdedit /set {globalsettings} custom:16000068 true > nul 2>&1
bcdedit /set tpmbootentropy ForceDisable > nul 2>&1
bcdedit /set hypervisorlaunchtype off > nul 2>&1
bcdedit /set tscsyncpolicy Enhanced > nul 2>&1
bcdedit /set bootmenupolicy Legacy > nul 2>&1
bcdedit /set bootux disabled > nul 2>&1
bcdedit /set quietboot yes > nul 2>&1
bcdedit /set nx optout > nul 2>&1
bcdedit /timeout 0 > nul 2>&1
timeout 1 > nul
goto done

:done
call :tweakappliedscreen
goto windowsmenu

:done1
call :tweakappliedscreen
goto windowsmenu2

:donenetwork
call :tweakappliedscreen
goto networkmenu








:logoloading
Call :TYPEFast "                                 ^_^_^_       ^_^_   ^_^_      "
echo.
Call :TYPEFast "                           ^|\ ^| ^|^_^_  ^|  ^| ^|^_^_) /  \ ^|\ ^|       "
echo.
Call :TYPEFast "                           ^| \^| ^|^_^_^_ \^_^_/ ^|  \ \^_^_/ ^| \^|       "
goto :eof

echo.                                 ^_^_^_       ^_^_   ^_^_
echo.                           ^|\ ^| ^|^_^_  ^|  ^| ^|^_^_) /  \ ^|\ ^|
echo.                           ^| \^| ^|^_^_^_ \^_^_/ ^|  \ \^_^_/ ^| \^|

:menutop
mode 85,29
cls 
echo. [97m
echo.                       Thank you for using our software: %tcol%%username% 
echo.
echo %bcol%=====================================================================================[0m
echo. %tcol%     
echo.                        _   _                                 
echo.                       ^| \ ^| ^|  ___  _   _  _ __  ___   _ __  
echo.                       ^|  \^| ^| / _ \^| ^| ^| ^|^| '__^|/ _ \ ^| '_ \ 
echo.                       ^| ^|\  ^|^|  __/^| ^|_^| ^|^| ^|  ^| (_) ^|^| ^| ^| ^|
echo.                       ^|_^| \_^| \___^| \__,_^|^|_^|   \___/ ^|_^| ^|_^|
echo.
echo.
echo.
echo %bcol%=====================================================================================[0m
goto :eof








:TypeWritting

:TYPE
SET "d[text]=%~1"
CALL :TYPELOOP
GOTO :EOF

:TYPELOOP
IF "%d[text]:~0,1%" == "#" (
    <NUL SET /P "=^!"
) else (
    <NUL SET /P "=d!BS!%d[text]:~0,1%"
)
SET "d[text]=%d[text]:~1%"
IF "%d[text]%" == "" (
    GOTO :EOF
) else (
    FOR /L %%J in (1, 100, 10000000) DO REM
    GOTO :TYPELOOP
)
exit

:TYPEFast
SET "d[text]=%~1"
CALL :TYPELOOPFast
GOTO :EOF

:TYPELOOPFast
IF "%d[text]:~0,1%" == "#" (
    <NUL SET /P "=^!"
) else (
    <NUL SET /P "=d!BS!%d[text]:~0,1%"
)
SET "d[text]=%d[text]:~1%"
IF "%d[text]%" == "" (
    GOTO :EOF
) else (
    FOR /L %%J in (1, 100, 1000000) DO REM
    GOTO :TYPELOOPFast
)
exit



:ColorText
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
GOTO :EOF
