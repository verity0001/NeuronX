	::	▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄	::	
	::	█                                               █	::	
	::	█        Name - NeuronFREE / Version - 1.0      █	::	
	::	█            Coded by - FireImperator           █	::	
	::	█                                               █	::	
	::	▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀	::
	
@echo off

title loading... && mode 85,29 
chcp 65001 > nul 2>&1 && SETLOCAL EnableDelayedExpansion > nul 2>&1


Reg.exe add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f > nul 2>&1
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a" & set "COL=%%b")
Reg.exe add HKCU\CONSOLE /v VirtualTerminalLevel /t REG_DWORD /d 1 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f > nul 2>&1

set tcol=%COL%[92m
set bcol=%COL%[42;32m
set ocol=A
set fcol=F


:admin
CLS
Reg.exe query "HKU\S-1-5-19\Environment" > nul 2>&1
if not "%errorlevel%" EQU "0" goto noadmin
if not "%errorlevel%" EQU "1" goto DisclaimerCheck

:noadmin
mode 85,29
title                   NO ADMINISTRATOR PERMISSIONS
cls
call :menutop
echo.
echo.
echo.
echo                    %COL%[91mPlease wait. The program will ask you for admin privileges
echo.
echo.
echo. 
echo.
echo.
echo.
echo.
timeout 2 > nul
::Ask for ADMIN permissions inside batch (https://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file)
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
> nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
> nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
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


:DisclaimerCheck
reg query "HKCU\Software\Neuron" /v "Disclaimer" > nul 2>&1
if %errorlevel% equ 0 (
	goto welcome 
) else (
	goto Disclaimer

)

:welcome
mode 85,29

cls


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

echo. %COL%[97m
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
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
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
pause > nul
cls


rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d "0" /f > nul 2>&1
if %errorlevel% equ 0 if not exist "%SystemDrive%\Registrybackup.reg" (
:check_reg_backup
call :menutop
echo.
echo %COL%[97m                                 Creating Registry Backup [...]
echo.
Regedit /e "%SystemDrive%\Registrybackup.reg" > nul 2>&1
if !errorlevel! neq 0 cls & echo Failed to create a registry backup! & echo. & echo Press any key to continue anyway & pause >nul
)
if not exist "%SystemDrive%\BCDEdit_Backup.bcd" (
call :menutop
echo.
echo %COL%[97m                                 Creating BCD Edit Backup [...]
bcdedit /export "%SystemDrive%\BCDEdit_Backup.bcd" > nul 2>&1
)

:menu
SETLOCAL DisableDelayedExpansion > nul 2>&1
title                                              dsc.gg/neuronx - Thank you for using NeuronF(ree)
cls
call :menutop
echo.
echo.%COL%[97m
echo.
echo.                     [%COL%[92m 1 %COL%[97m] System %COL%[97mTweaks               Network Tweaks [%COL%[92m 2 %COL%[97m]
echo.
echo.
echo.
echo.                                             %COL%[97m[%COL%[92m R %COL%[97m]
echo.
echo.                                  %COL%[97mCREATE SYSTEM RESTORE POINT
echo.
echo.
echo. %COL%[97m
echo.                            For more optimizations go to our discord
echo. %COL%[97m
SET INPUT=
set /p "INPUT=%COL%[30m.                                             %COL%[92m>%COL%[97m: %COL%[97m"

IF /I '%INPUT%'=='1' goto windowsmenu
IF /I '%INPUT%'=='2' goto networkmenu
IF /I '%INPUT%'=='3' start https://buyneuron.live/buy.html && start https://dsc.gg/neuronx
IF /I '%INPUT%'=='r' goto restorepoint
goto menu

:restorepoint
Powershell -ExecutionPolicy Unrestricted -NoProfile Enable-ComputerRestore -Drive 'C:\', 'D:\', 'E:\', 'F:\', 'G:\'
Powershell -ExecutionPolicy Unrestricted -NoProfile Checkpoint-Computer -Description 'Before Neuron optimization'
wmic /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Before Neuron Optimization", 100, 12
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
echo.                    %COL%[97mOPTIMIZE %COL%[92mWINDOWS NT%COL%[97m [%COL%[92m 1 %COL%[97m]    [%COL%[92m 2 %COL%[97m] %COL%[97mOPTIMIZE %COL%[92mVISUALS
echo.
echo.
echo.
echo.                       %COL%[97mOPTIMIZE %COL%[92mBCDEDIT%COL%[97m [%COL%[92m 3 %COL%[97m]    [%COL%[92m 4 %COL%[97m] %COL%[97mDISABLE %COL%[92mTELEMETRY 
echo.
echo.
echo.
echo.
echo.                                   %COL%[97mBACK [ %COL%[92mB %COL%[97m]    [ %COL%[92mN %COL%[97m] NEXT
echo. %COL%[97m
echo.
echo.
SET INPUT=
set /p "INPUT=%COL%[30m.                                            %COL%[92m>%COL%[97m: %COL%[97m"

IF /I '%INPUT%'=='1' goto WindowsNT
IF /I '%INPUT%'=='2' goto visualsettingsmenu
IF /I '%INPUT%'=='3' goto bcdedit
IF /I '%INPUT%'=='4' goto Telemetry
IF /I '%INPUT%'=='b' goto menu
IF /I '%INPUT%'=='n' goto windowsmenu2
goto windowsmenu

:windowsmenu2
cls
call :menutop
echo.
echo.
echo.                       %COL%[97mDISABLE %COL%[92mSERVICES%COL%[97m [%COL%[92m 1 %COL%[97m]    [%COL%[92m 2 %COL%[97m] %COL%[97mOPTIMIZE %COL%[92mGAMEBAR
echo.
echo.
echo.
echo.                         %COL%[97mOPTIMIZE %COL%[92mCSRSS%COL%[97m [%COL%[92m 3 %COL%[97m]    [%COL%[92m 4 %COL%[97m] %COL%[97mMISC %COL%[92mTWEAKS
echo.
echo.
echo.
echo.
echo.                                   %COL%[97mBACK [ %COL%[92mB %COL%[97m]    [ %COL%[92mN %COL%[97m] NEXT
echo. %COL%[97m
echo.
echo.
SET INPUT=
set /p "INPUT=%COL%[30m.                                            %COL%[92m>%COL%[97m: %COL%[97m"

IF /I '%INPUT%'=='1' goto optimizeservices
IF /I '%INPUT%'=='2' goto gamedvroptimization
IF /I '%INPUT%'=='3' goto csrssoptimization
IF /I '%INPUT%'=='4' goto misctweaks
IF /I '%INPUT%'=='b' goto windowsmenu
IF /I '%INPUT%'=='n' goto windowsmenu3
goto windowsmenu2

:windowsmenu3
cls
call :menutop
echo.
echo.
echo.                    %COL%[97mOPTIMIZE %COL%[92mPOWER PLAN%COL%[97m [%COL%[92m 1 %COL%[97m]    [%COL%[92m 2 %COL%[97m] %COL%[97mDELETE %COL%[92mJUNK FILES
echo.
echo.
echo.
echo.                                   %COL%[90mSOON%COL%[97m [%COL%[92m 3 %COL%[97m]    [%COL%[92m 4 %COL%[97m]%COL%[90m SOON
echo.
echo.
echo.
echo.
echo.                                   %COL%[97mBACK [ %COL%[92mB %COL%[97m]    [ %COL%[92mN %COL%[97m] %COL%[90mSOON
echo. %COL%[97m
echo.
echo.
SET INPUT=
set /p "INPUT=%COL%[30m.                                            %COL%[92m>%COL%[97m: %COL%[97m"

IF /I '%INPUT%'=='1' goto powerplan
IF /I '%INPUT%'=='2' goto cleaner
IF /I '%INPUT%'=='b' goto windowsmenu2
IF /I '%INPUT%'=='n' goto windowsmenu3
goto windowsmenu3
:networkmenu
cls
call :menutop
echo.
echo.
echo.
echo.                                             %COL%[97m[%COL%[92m 1 %COL%[97m]
echo.
echo.                                   %COL%[97mFULL INTERNET OPTIMIZATION 
echo.                                         %COL%[97m[%COL%[96m120^+ Tweaks%COL%[97m]
echo.
echo.
echo.
echo.
echo.                                   %COL%[97mBACK [ %COL%[92mB %COL%[97m]    [ %COL%[92mN %COL%[97m] %COL%[90mSOON
echo. %COL%[97m
echo.
echo.
SET INPUT=
set /p "INPUT=%COL%[30m.                                            %COL%[92m>%COL%[97m: %COL%[97m"

IF /I '%INPUT%'=='1' goto networkoptimize
IF /I '%INPUT%'=='b' goto menu

goto networkmenu

:visualsettingsmenu
cls
call :menutop
echo.
echo.
echo.         
echo. 
echo.                               [%COL%[92m 1 %COL%[97m]                       [%COL%[92m 2 %COL%[97m] 
echo.
echo.                          %COL%[97mBALANCED VISUALS%COL%[97m          %COL%[97mMAXIMUM PERFORMANCE
echo.
echo. 
echo.
echo.                                             
echo.                                          %COL%[97m[%COL%[92m B %COL%[97m] %COL%[97mBACK 
echo.
echo.
SET INPUT=
set /p "INPUT=%COL%[30m.                                            %COL%[92m>%COL%[97m: %COL%[97m"

IF /I '%INPUT%'=='1' goto balancedvisuals
IF /I '%INPUT%'=='2' goto cleaner
IF /I '%INPUT%'=='b' goto windowsmenu
goto visualsettingsmenu






:applyingtweakscreen
cls
call :menutop
echo.
echo.
echo.
echo.
echo.
call :ColorText %fcol% "                          P"
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
call :ColorText %fcol% "                                   T"
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
timeout 2 > nul
goto :eof




:xd
goto menu

goto menu
:WindowsNT
call :applyingtweakscreen
timeout 2 > nul
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Background Only" /t REG_SZ /d "True" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Priority" /t REG_DWORD /d "6" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Scheduling Category" /t REG_SZ /d "Medium" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Background Only" /t REG_SZ /d "True" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Priority" /t REG_DWORD /d "5" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Scheduling Category" /t REG_SZ /d "Medium" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Background Only" /t REG_SZ /d "True" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "BackgroundPriority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Scheduling Category" /t REG_SZ /d "High" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Background Only" /t REG_SZ /d "True" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Priority" /t REG_DWORD /d "4" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Scheduling Category" /t REG_SZ /d "Medium" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Background Only" /t REG_SZ /d "False" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "BackgroundPriority" /t REG_DWORD /d "4" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Priority" /t REG_DWORD /d "3" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Scheduling Category" /t REG_SZ /d "Medium" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Background Only" /t REG_SZ /d "False" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Priority" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Scheduling Category" /t REG_SZ /d "High" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Background Only" /t REG_SZ /d "True" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Priority" /t REG_DWORD /d "5" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Scheduling Category" /t REG_SZ /d "Medium" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Affinity" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Background Only" /t REG_SZ /d "False" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Clock Rate" /t REG_DWORD /d "10000" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Priority" /t REG_DWORD /d "2" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Scheduling Category" /t REG_SZ /d "High" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "SFIO Priority" /t REG_SZ /d "High" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Latency Sensitive" /t REG_SZ /d "True" /f > nul 2>&1
goto done


:misctweaks
call :applyingtweakscreen
chcp 852 > nul 2>&1 
TASKKILL /T /F /IM  discord.exe > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Discord.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\FTH" /v "Enabled" /t Reg_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "1000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t Reg_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t Reg_DWORD /d "2" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t Reg_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePageCombining" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t Reg_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t Reg_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "HeapDeCommitFreeBlockThreshold" /t REG_DWORD /d "262144" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "DontVerifyRandomDrivers" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t Reg_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t Reg_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "DisableTsx" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "RestrictAnonymousSAM" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\NetBT\Parameters" /v "NodeType" /t REG_DWORD /d "2" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" /v "RestrictNullSessAccess" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" /v "DisableCompression" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe" /v "AuditLevel" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CredentialsDelegation" /v "AllowProtectedCreds" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "DisableRestrictedAdminOutboundCreds" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "DisableRestrictedAdmin" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "RunAsPPL" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\SecurityProviders\WDigest" /v "Negotiate" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\SecurityProviders\WDigest" /v "UseLogonCredential" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "NoLMHash" /t REG_DWORD /d 1 /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoDataExecutionPrevention" /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client" /v Enabled /t REG_DWORD /d 0x00000000 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client" /v DisabledByDefault /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server" /v Enabled /t REG_DWORD /d 0x00000000 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server" /v DisabledByDefault /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server" /v Enabled /t REG_DWORD /d 0x00000000 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server" /v DisabledByDefault /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client" /v Enabled /t REG_DWORD /d 0x00000000 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client" /v DisabledByDefault /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\.NETFramework\v2.0.50727" /v SchUseStrongCrypto /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\.NETFramework\v2.0.50727" /v SystemDefaultTlsVersions /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\.NETFramework\v3.0" /v SchUseStrongCrypto /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\.NETFramework\v3.0" /v SystemDefaultTlsVersions /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\.NETFramework\v4.0.30319" /v SchUseStrongCrypto /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\.NETFramework\v4.0.30319" /v SystemDefaultTlsVersions /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\.NETFramework\v2.0.50727" /v SchUseStrongCrypto /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\.NETFramework\v2.0.50727" /v SystemDefaultTlsVersions /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\.NETFramework\v3.0" /v SchUseStrongCrypto /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\.NETFramework\v3.0" /v SystemDefaultTlsVersions /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\.NETFramework\v4.0.30319" /v SchUseStrongCrypto /t REG_DWORD /d 0x00000001 /f > nul 2>&1
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\.NETFramework\v4.0.30319" /v SystemDefaultTlsVersions /t REG_DWORD /d 0x00000001 /f > nul 2>&1
DISM /online /Disable-Feature /featureName:"SMB1Protocol" /NoRestart > nul 2>&1
DISM /Online /Disable-Feature /featureName:"SMB1Protocol-Client" /NoRestart > nul 2>&1
DISM /Online /Disable-Feature /featureName:"SMB1Protocol-Server" /NoRestart > nul 2>&1
timeout 1 > nul
for /f "tokens=2 delims==" %%i in ('wmic os get TotalVisibleMemorySize /value') do set /a mem=%%i + 1024000
	Reg.exe add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d %mem% /f > nul 2>&1
) > nul 2>&1
for /f %%g in ('wmic path win32_VideoController get PNPDeviceID ^| findstr /L "VEN_"') do Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f > nul 2>&1
for /f %%g in ('wmic path win32_VideoController get PNPDeviceID ^| findstr /L "VEN_"') do Reg.exe delete "HKLM\System\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f > nul 2>&1
for /f %%i in ('wmic path Win32_NetworkAdapter get PNPDeviceID ^| findstr /L "VEN_"') do Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f > nul 2>&1
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
FOR /F "eol=E" %%a in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Services" /S /F "IoLatencyCap"^| FINDSTR /V "IoLatencyCap"') DO (
	Reg.exe add "%%a" /F /V "IoLatencyCap" /T REG_DWORD /d 0 

	FOR /F "tokens=*" %%z IN ("%%a") DO (
		SET STR=%%z
		SET STR=!STR:HKLM\SYSTEM\CurrentControlSet\services\=!
		SET STR=!STR:\Parameters=!
		ECHO Setting IoLatencyCap to 0 in !STR!
	) > nul 2>&1 
) > nul 2>&1 

chcp 65001 > nul 2>&1 
goto done1


:telemetry
call :applyingtweakscreen
chcp 852 > nul 2>&1 

netsh advfirewall firewall add rule name="Block Windows Telemetry" dir=in action=block remoteip=134.170.30.202,137.116.81.24,157.56.106.189,184.86.53.99,2.22.61.43,2.22.61.66,204.79.197.200,23.218.212.69,65.39.117.23,65.55.108.23,64.4.54.254 enable=yes > nul 2>&1
netsh advfirewall firewall add rule name="Block NVIDIA Telemetry" dir=in action=block remoteip=8.36.80.197,8.36.80.224,8.36.80.252,8.36.113.118,8.36.113.141,8.36.80.230,8.36.80.231,8.36.113.126,8.36.80.195,8.36.80.217,8.36.80.237,8.36.80.246,8.36.113.116,8.36.113.139,8.36.80.244,216.228.121.209 enable=yes > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /d "0" /t REG_DWORD /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314563Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowDeviceNameInTelemetry" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "DisableTaggedEnergyLogging" /t REG_DWORD /d "1" /f > nul
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxApplication" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxTagPerApplication" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowCortana" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "RestrictAnonymousSAM" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Maps" /v "AllowUntriggeredNetworkTrafficOnSettingsPage" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f > nul
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Maps" /v "AllowUntriggeredNetworkTrafficOnSettingsPage" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSync" /t REG_DWORD /d "2" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSyncUserOverride" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableSyncOnPaidNetwork" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\FindMyDevice" /v "AllowFindMyDevice" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Remote Assistance" /v "fAllowFullControl" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Remote Assistance" /v "fEnableChatControl" /t REG_DWORD /d "0" /f > nul 2>&1
sc config diagtrack start= disabled > nul 2>&1
sc config diagnosticshub.standardcollector.service start= disabled > nul 2>&1
sc config dmwappushservice start= disabled > nul 2>&1
sc config NvTelemetryContainer start= disabled > nul 2>&1
sc config WerSvc start=disabled > nul
sc config WecSvc start=disabled > nul
sc config DiagTrack start=disabled > nul
sc config DiagSvc start=disabled > nul
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" > nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" > nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" > nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" > nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" > nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" > nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" > nul 2>&1
schtasks /change /disable /tn "Microsoft\Windows\Device Information\Device" > nul 2>&1
setx POWERSHELL_TELEMETRY_OPTOUT 1 > nul
setx DOTNET_CLI_TELEMETRY_OPTOUT 1 > nul
takeown /f %UserProfile%\AppData\Local\NVIDIA\NvBackend\ApplicationOntology\OAWrapper.exe > nul 2>&1
icacls %UserProfile%\AppData\Local\NVIDIA\NvBackend\ApplicationOntology\OAWrapper.exe /deny *S-1-1-0:F /T > nul 2>&1
timeout 1 > nul
chcp 65001 > nul 2>&1 

goto done

:balancedvisuals
call :applyingtweakscreen
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMSaveThumbnailEnabled" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListBoxSmoothScrolling" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewAlphaSelect" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ComboBoxAnimation" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ControlAnimations" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TooltipAnimation" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ThumbnailsOrIcon" /v "DefaultApplied" /t REG_SZ /d "1" /f > nul 2>&1 
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DragFullWindows" /v "DefaultApplied" /t REG_SZ /d "1" /f > nul 2>&1 
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewShadow" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMEnabled" /v "DefaultApplied" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\FontSmoothing" /v "DefaultApplied" /t REG_SZ /d "1" /f > nul 2>&1 
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\SelectionFade" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\AnimateMinMax" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Desktop" /f /v "UserPreferencesMask" /t REG_BINARY /d "9012078012000000" > nul 2>&1
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
Reg.exe add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "100" /f > nul 2>&1
goto done

:maximumperformancevisuals
call :applyingtweakscreen
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\AnimateMinMax" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ComboBoxAnimation" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ControlAnimations" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DragFullWindows" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMAeroPeekEnabled" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMEnabled" /v "DefaultApplied" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMSaveThumbnailEnabled" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\FontSmoothing" /v "DefaultApplied" /t REG_SZ /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListBoxSmoothScrolling" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewAlphaSelect" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewShadow" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\SelectionFade" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ThumbnailsOrIcon" /v "DefaultApplied" /t REG_SZ /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TooltipAnimation" /v "DefaultApplied" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Desktop" /f /v "UserPreferencesMask" /t REG_BINARY /d "9012078012000000" > nul 2>&1
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
Reg.exe add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "100" /f > nul 2>&1
goto done




:csrssoptimization
call :applyingtweakscreen

Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ntoskrnl.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ntoskrnl.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\audiodg.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "2" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ntoskrnl.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ntoskrnl.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\audiodg.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "2" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f > nul 2>&1 
goto done1

:optimizeservices
call :applyingtweakscreen

sc config FontCache start=auto > nul
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
sc config XboxGipSvc start=demand > nul
sc config RemoteAccess start= disabled > nul
sc config RemoteRegistry start= disabled > nul
sc config lmhosts start=disabled > nul
sc config LanmanWorkstation start=disabled > nul
sc stop RemoteAccess > nul
sc stop RemoteRegistry > nul
sc stop lmhosts > nul
sc stop LanmanWorkstation > nul

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
takeown /f C:\Windows\System32\GameBarPresenceWriter.exe > nul 2>&1
icacls C:\Windows\System32\GameBarPresenceWriter.exe /deny *S-1-1-0:F /T > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d "0" /f > nul 2>&1



goto done1




:networkoptimize
call :applyingtweakscreen
Ipconfig /flushdns > nul 2>&1 
ipconfig /registerdns > nul 2>&1 
ipconfig /release > nul 2>&1 
ipconfig /renew > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v DisableTaskOffload /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v DisableDynamicDiscovery /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v EnablePMTUBDetect /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v SackOpts /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpMaxConnectRetransmissions" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "30" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "EnableConnectionRateLimiting" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "EnableDCA" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "EnablePMTUBHDetect" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "EnableRSS" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "EnableWsd" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "65535" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d "10" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "10" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "MaxFreeTcbs" /t REG_DWORD /d "65536" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "EnableTCPA" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpCreateAndConnectTcbRateLimitDepth" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d "3" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpMaxSendFree" /t REG_DWORD /d "65535" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpNumConnections" /t REG_DWORD /d "16777214" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "MaxHashTableSize" /t REG_DWORD /d "65536" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "SynAttackProtect" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "DelayedAckFrequency" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "DelayedAckTicks" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "CongestionAlgorithm" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "MultihopSets" /t REG_DWORD /d "15" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters\Winsock" /v "UseDelayedAcceptance" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\QoS" /v "Do not use NLA" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "32" /f  > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SizReqBuf" /t REG_DWORD /d "16384" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "MaxWorkItems" /t REG_DWORD /d "8192" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "MaxMpxCt" /t REG_DWORD /d "2048" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "MaxCmds" /t REG_DWORD /d "2048" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "DisableStrictNameChecking" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "EnableOplocks" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationDelay" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationRetries" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\IO\NoCap" /v "IOBandwidth" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\\DAL2_DATA__2_0\DisplayPath_4\EDID_D109_78E9\Option" /v "ProtectionControl" /t REG_BINARY /d "0100000001000000" /f 
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMHdcpKeyGlobZero" /t REG_DWORD /d "1" /f 

netsh winsock set autotuning on > nul 2>&1
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
netsh int tcp set global timestamps=disabled > nul 2>&1
netsh int tcp set global initialRto=2000 > nul 2>&1
netsh int tcp set global MinRto=300 > nul 2>&1
netsh int udp set global uro=enabled > nul 2>&1
netsh int ipv4 set global defaultcurhoplimit=64 > nul 2>&1
netsh int ipv6 set global defaultcurhoplimit=64 > nul 2>&1

netsh int tcp set heuristics disabled > nul 2>&1
netsh int tcp set supplemental template=custom icw=10 > nul 2>&1

for /f "tokens=1" %%i in ('netsh int ip show interfaces ^| findstr [0-9]') do set INTERFACE=%%i >nul 2>&1
netsh int ip set interface %INTERFACE% basereachable=3600000 dadtransmits=0 otherstateful=disabled routerdiscovery=disabled store=persistent >nul 2>&1
netsh int ip set interface ethernet currenthoplimit=64 > nul 2>&1

For /f %%k in ('Reg.exe Query hklm\System\CurrentControlSet\services\NetBT\Parameters\Interfaces /f "NetbiosOptions" /v /s^|Findstr HKEY_') do (
	Reg.exe add %%k /v NetbiosOptions /t reg_dword /d 2 /f
	Reg.exe add %%k /v EnableNagling /t reg_dword /d 0 /f
) > nul 2>&1

for /f %%n in ('wmic path win32_networkadapter get PNPDeviceID ^| findstr /L "VEN_"') do (
Reg.exe add "HKLM\SYSTEM\ControlSet001\Enum\PCI\VEN_8086&DEV_1533&SUBSYS_00018086&REV_03\4&108abd8a&0&00E4\Device Parameters\Interrupt Management\Affinity Policy" /v "AssignmentSetOverride" /t REG_BINARY /d "02" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\ControlSet001\Enum\PCI\VEN_8086&DEV_1533&SUBSYS_00018086&REV_03\4&108abd8a&0&00E4\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePolicy" /t REG_DWORD /d "4" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\ControlSet001\Enum\PCI\VEN_8086&DEV_1533&SUBSYS_00018086&REV_03\4&108abd8a&0&00E4\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MessageNumberLimit" /t REG_DWORD /d "256" /f > nul 2>&1
)

for /f %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /f "PCI\VEN_" /d /s^|Findstr HKEY_') do (
Reg.exe add %%a /v "TxIntDelay" /t REG_SZ /d "5" /f > nul 2>&1
Reg.exe add %%a /v "ulpmode" /t REG_SZ /d "0" /f > nul 2>&1
)

for /f "usebackq" %%c in (`reg query HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters\Interfaces`) do (
Reg.exe add %%c /v "UseZeroBroadcast" /d "0" /t REG_DWORD /f > nul 2>&1
Reg.exe add %%c /v "IPAutoconfigurationEnabled" /d "0" /t REG_DWORD /f > nul 2>&1
)

netsh int tcp set global autotuninglevel=disabled 
for /f "tokens=3*" %%s in ('reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkCards" /f "ServiceName" /s^|findstr /i /l "ServiceName"') do (
    Reg.exe add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%s" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%s" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%s" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f
    Reg.exe add "HKLM\System\CurrentControlSet\Services\Psched\Parameters\Adapters\%%s" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f
    Reg.exe add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%s" /v "TcpInitialRTT" /t REG_DWORD /d "0" /f 
	Reg.exe add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%s" /v "DeadGWDetectDefault" /t REG_DWORD /d "1" /f
) > nul 2>&1

goto donenetwork

:bcdedit
call :applyingtweakscreen

set "PROCESSOR_IDENTIFIER=%PROCESSOR_IDENTIFIER:~0,-2%"
set "BRAND="

echo %PROCESSOR_IDENTIFIER% | findstr /i "intel" > nul
if %errorlevel% == 0 set "BRAND=intel"

echo %PROCESSOR_IDENTIFIER% | findstr /i "amd" > nul
if %errorlevel% == 0 set "BRAND=AMD"

timeout 2 > nul
goto %BRAND%
goto done

:intel
bcdedit /set nx alwaysoff > nul 2>&1
timeout 1 > nul
goto bcdtweaks2

:amd
bcdedit /set tpmbootentropy ForceDisable > nul 2>&1
timeout 1 > nul
goto bcdtweaks2

:bcdtweaks2
bcdedit /set {globalsettings} custom:16000067 true > nul 2>&1
bcdedit /set {globalsettings} custom:16000069 true > nul 2>&1
bcdedit /set {globalsettings} custom:16000068 true > nul 2>&1
bcdedit /set allowedinmemorysettings 0x0 > nul 2>&1
bcdedit /set configaccesspolicy Default > nul 2>&1
bcdedit /set usephysicaldestination No > nul 2>&1
bcdedit /set usefirmwarepcisettings No > nul 2>&1
bcdedit /set hypervisorlaunchtype off > nul 2>&1
bcdedit /set increaseuserva 268435328 > nul 2>&1
bcdedit /set linearaddress57 OptOut > nul 2>&1
bcdedit /set tscsyncpolicy Enhanced > nul 2>&1
bcdedit /set disableelamdrivers Yes > nul 2>&1
bcdedit /set bootmenupolicy Legacy > nul 2>&1
bcdedit /set uselegacyapicmode No > nul 2>&1
bcdedit /set x2apicpolicy Enable > nul 2>&1
bcdedit /set isolatedcontext No > nul 2>&1
bcdedit /set vsmlaunchtype Off > nul 2>&1
bcdedit /set bootux disabled > nul 2>&1
bcdedit /set quietboot yes > nul 2>&1
bcdedit /set MSI Default > nul 2>&1
bcdedit /set vm No > nul 2>&1
bcdedit /timeout 0 > nul 2>&1
goto done

:cleaner
:: Setting variables
set ip=%COL%[31mIn progress
set cl=%COL%[32mCleared
set iq=%COL%[37mIn queue

set stat1=%COL%[33mStopping services
set stat2=%iq%
set stat3=%iq%
call :cleanermenu
timeout 2 > nul
net stop wuauserv > nul 2>&1
net stop usoSvc > nul 2>&1
net stop bits > nul 2>&1
net stop dosvc > nul 2>&1
set stat1=%ip%
timeout 1 > nul
call :cleanermenu
timeout 1 > nul
del /s /f /q %WinDir%\Temp\*.* > nul 2>&1
del /s /f /q %Temp%\*.* > nul 2>&1
del /s /f /q %AppData%\Temp\*.* > nul 2>&1
set tmpfilesproc=25%%
call :cleanermenu
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.* > nul 2>&1
del /s /f /q "%localappdata%\Temp\" > nul 2>&1
del /s /f /q "%SystemDrive%\$Recycle.Bin" > nul 2>&1
del /s /f /q "%SystemDrive%\$Windows.~WS\" > nul 2>&1
del /s /f /q "%SystemDrive%\$Windows.~BT\" > nul 2>&1
del /s /f /q "%SystemDrive%\Windows.old\" > nul 2>&1
set tmpfilesproc=55%%
call :cleanermenu
del /s /f /q "%ProgramData%\Microsoft\Search\Data\Temp" > nul 2>&1
del /s /f /q %WINDIR%\*.tmp > nul 2>&1
rmdir /S /Q "%ProgramData%\Microsoft\Search\Data\Temp" > nul 2>&1
rmdir /S /Q "%localappdata%\Temp\" > nul 2>&1
rd /s /q %WinDir%\Temp > nul 2>&1
rd /s /q %Temp% > nul 2>&1
rd /s /q %AppData%\Temp > nul 2>&1
rd /s /q %HomePath%\AppData\LocalLow\Temp > nul 2>&1
set tmpfilesproc=90%%
call :cleanermenu
md %WinDir%\Temp > nul 2>&1
md %Temp% > nul 2>&1
md %AppData%\Temp > nul 2>&1
md %HomePath%\AppData\LocalLow\Temp > nul 2>&1
set tmpfilesproc=100%%
call :cleanermenu
timeout 2 > nul
set tmpfilesproc=
set stat1=%cl%
set stat2=%ip%
timeout 1 > nul
del /s /f /q %WinDir%\Prefetch\*.* > nul 2>&1
set prefetchproc=20%%
call :cleanermenu
rd /s /q %WinDir%\Prefetch > nul 2>&1
set prefetchproc=70%%
call :cleanermenu
md %WinDir%\Prefetch > nul 2>&1
set prefetchproc=100%%
call :cleanermenu
timeout 2 > nul
set stat2=%cl%
set stat3=%ip%
set prefetchproc=
timeout 2 > nul
call :cleanermenu
set logsproc=0%%
call :cleanermenu
del *.log /a /s /q /f > nul 2>&1
del /s /f /q %SystemRoot%\comsetup.log > nul 2>&1
del /s /f /q %SystemRoot%\DtcInstall.log > nul 2>&1
set logsproc=10%%
call :cleanermenu
del /s /f /q %SystemRoot%\PFRO.log > nul 2>&1
del /s /f /q %SystemRoot%\setupact.log > nul 2>&1
del /s /f /q %SystemRoot%\setuperr.log > nul 2>&1
del /s /f /q %SystemRoot%\setupapi.log > nul 2>&1
set logsproc=30%%
call :cleanermenu
del /s /f /q %SystemRoot%\Panther\* > nul 2>&1
del /s /f /q %SystemRoot%\inf\setupapi.app.log > nul 2>&1
del /s /f /q %SystemRoot%\inf\setupapi.dev.log > nul 2>&1
set logsproc=40%%
call :cleanermenu
del /s /f /q %SystemRoot%\inf\setupapi.offline.log > nul 2>&1
del /s /f /q %SystemRoot%\Performance\WinSAT\winsat.log > nul 2>&1
del /s /f /q %SystemRoot%\debug\PASSWD.LOG > nul 2>&1
del /s /f /q %localappdata%\Microsoft\Windows\WebCache\*.* > nul 2>&1
del /s /f /q %SystemRoot%\ServiceProfiles\LocalService\AppData\Local\Temp\*.* > nul 2>&1
set logsproc=55%%
call :cleanermenu
del /s /f /q %SystemRoot%\Logs\CBS\CBS.log > nul 2>&1
del /s /f /q %SystemRoot%\Logs\DISM\DISM.log > nul 2>&1
del /s /f /q %WINDIR%\*.log > nul 2>&1
set logsproc=85%%
call :cleanermenu
for /f " tokens=*" %%G in ('wevtutil.exe el') DO (call :cleanerfunction "%%G") > nul 2>&1
set logsproc=100%%
call :cleanermenu
set stat3=%cl%
cls
call :cleanermenu
timeout 2 > nul
goto done2

:powerplan
call :applyingtweakscreen
powercfg -restoredefaultschemes
powercfg /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa > nul 2>&1
powercfg /setactive aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa > nul 2>&1
powercfg /h off > nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor PERFEPP 0 > nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor THROTTLING 0 > nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor PERFBOOSTMODE 1 > nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor PERFBOOSTPOL 100 > nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor IDLESCALING 1 > nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor IDLEPROMOTE 98 > nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor IDLEDEMOTE 98 > nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor IDLECHECK 20000 > nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor PERFAUTONOMOUS 1 > nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor PERFAUTONOMOUSWINDOW 20000 > nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor PERFCHECK 20 > nul 2>&1
powercfg -setacvalueindex scheme_current SUB_SLEEP AWAYMODE 0 > nul 2>&1
powercfg -setacvalueindex scheme_current SUB_SLEEP ALLOWSTANDBY 0 > nul 2>&1
powercfg -setacvalueindex scheme_current SUB_SLEEP HYBRIDSLEEP 0 > nul 2>&1
powercfg -setacvalueindex scheme_current SUB_DISK 0b2d69d7-a2a1-449c-9680-f91c70521c60 0 > nul 2>&1
powercfg -setacvalueindex scheme_current SUB_DISK dbc9e238-6de9-49e3-92cd-8c2b4946b472 1 > nul 2>&1
powercfg -setacvalueindex scheme_current SUB_DISK fc95af4d-40e7-4b6d-835a-56d131dbc80e 1 > nul 2>&1
powercfg /setacvalueindex scheme_current SUB_DISK d3d55efd-c1ff-424e-9dc3-441be7833010 0 >nul
powercfg /setacvalueindex scheme_current SUB_DISK d639518a-e56d-4345-8af2-b9f32fb26109 0 >nul
powercfg /setacvalueindex scheme_current SUB_DISK DISKNVMENOPPME 1 >nul
powercfg -setacvalueindex scheme_current sub_none DEVICEIDLE 0 > nul 2>&1
powercfg -setacvalueindex scheme_current SUB_PCIEXPRESS ASPM 0 > nul 2>&1
powercfg -setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 0 > nul 2>&1
powercfg -setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 > nul 2>&1
powercfg -setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 0853a681-27c8-4100-a2fd-82013e970683 0 >nul
echo %PROCESSOR_IDENTIFIER% | find "Intel" > nul && (
powercfg -setacvalueindex scheme_current SUB_INTSTEER MODE 6 > nul 2>&1
)
:: Changing power plan name
powercfg -changename scheme_current "NeuronV1" "For NeuronF tweaker - https://dsc.gg/neuronx - made by FireImperator " > nul 2>&1

goto done2


:done
call :tweakappliedscreen
goto windowsmenu

:done1
call :tweakappliedscreen
goto windowsmenu2

:donenetwork
call :tweakappliedscreen
goto networkmenu

:done2
call :tweakappliedscreen
goto windowsmenu3




:Disclaimer
mode 85,29 
cls
echo. %COL%[92m
echo.                            ^_^_                                  
echo.                         ^/^\ ^\ ^\  ^_^_^_  ^_   ^_  ^_ ^_^_   ^_^_^_   ^_ ^_^_  
echo.                        ^/  ^\^/ ^/ ^/ ^_ ^\^| ^| ^| ^|^| '^_^_^| ^/ ^_ ^\ ^| '^_ ^\ 
echo.                       ^/ ^/^\  ^/ ^|  ^_^_^/^| ^|^_^| ^|^| ^|   ^| (^_) ^|^| ^| ^| ^|
echo.                       ^\^_^\ ^\^/   ^\^_^_^_^| ^\^_^_,^_^|^|^_^|    ^\^_^_^_^/ ^|^_^| ^|^_^|
echo. %COL%[97m
echo. 
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
echo.
echo.                            type "%COL%[92mI understand%COL%[97m" to proceed
echo.
echo.
echo.
SET INPUT=
set /p "INPUT=%COL%[30m.                                   %COL%[92m>%COL%[97m: %COL%[97m"

if /i "%INPUT%" == "I understand" Reg.exe add "HKCU\Software\Neuron" /v "Disclaimer" /f > nul 2>&1 && goto DisclaimerCheck
goto DisclaimerCheck

:cleanermenu

if "%idkhowtonameit%"=="%idkhtni%" (
    set idkhowtonameit=%idkhtni1%
) else ( 
    set idkhowtonameit=%idkhtni%
)
cls
set s=                              
call :menutopcleaner
echo.
echo.
echo %s%          %COL%[92;4mTEMPORARY FILES%COL%[0m
echo %s% %COL%[97m     ----------------------
echo %s% %COL%[97m        STATUS: %stat1% %tmpfilesproc%
echo.
echo.
echo %s%             %COL%[92;4mPREFETCH%COL%[0m
echo %s% %COL%[97m     ----------------------
echo %s% %COL%[97m        STATUS: %stat2% %prefetchproc%
echo.
echo.
echo %s%               %COL%[92;4mLOGS%COL%[0m
echo %s% %COL%[97m     ----------------------
echo %s% %COL%[97m        STATUS: %stat3% %logsproc% %COL%[97m
echo.
echo.
echo %idkhowtonameit%
echo.
goto :eof

:menutop
set idkhowtonameit=                            Thank you for using our software: %tcol%%username%
set idkhtni=                            Thank you for using our software: %tcol%%username%
set idkhtni1=                            Check our discord server https^:^/^/dsc.gg^/NeuronX
mode 95,29
cls 
echo. %COL%[97m
echo.                            Thank you for using our software: %tcol%%username% 
echo. %tcol%     
echo.                                 ^_^_
echo.                              ^/^\ ^\ ^\  ^_^_^_  ^_   ^_  ^_ ^_^_   ^_^_^_   ^_ ^_^_  
echo.                             ^/  ^\^/ ^/ ^/ ^_ ^\^| ^| ^| ^|^| '^_^_^| ^/ ^_ ^\ ^| '^_ ^\ 
echo.                            ^/ ^/^\  ^/ ^|  ^_^_^/^| ^|^_^| ^|^| ^|   ^| (^_) ^|^| ^| ^| ^|
echo.                            ^\^_^\ ^\^/   ^\^_^_^_^| ^\^_^_,^_^|^|^_^|    ^\^_^_^_^/ ^|^_^| ^|^_^|
echo.
echo               %bcol%====================================================================%COL%[0m
goto :eof


:menutopcleaner
mode 95,29
cls 
echo. %tcol%     
echo.                                 ^_^_
echo.                              ^/^\ ^\ ^\  ^_^_^_  ^_   ^_  ^_ ^_^_   ^_^_^_   ^_ ^_^_  
echo.                             ^/  ^\^/ ^/ ^/ ^_ ^\^| ^| ^| ^|^| '^_^_^| ^/ ^_ ^\ ^| '^_ ^\ 
echo.                            ^/ ^/^\  ^/ ^|  ^_^_^/^| ^|^_^| ^|^| ^|   ^| (^_) ^|^| ^| ^| ^|
echo.                            ^\^_^\ ^\^/   ^\^_^_^_^| ^\^_^_,^_^|^|^_^|    ^\^_^_^_^/ ^|^_^| ^|^_^|
echo.
echo               %bcol%====================================================================%COL%[0m
goto :eof


:cleanerfunction
echo  %w%clearing[32m %1 > nul 2>&1
wevtutil.exe cl %1
goto :eof




:TypeWritting

:TYPE
SET "d[text]=%~1"
CALL :TYPELOOP
goto :EOF

:TYPELOOP
IF "%d[text]:~0,1%" == "#" (
    <NUL SET /P "=^!"
) else (
    <NUL SET /P "=d!BS!%d[text]:~0,1%"
)
SET "d[text]=%d[text]:~1%"
IF "%d[text]%" == "" (
    goto :EOF
) else (
    FOR /L %%J in (1, 100, 10000000) DO REM
    goto :TYPELOOP
)
exit

:TYPEFast
SET "d[text]=%~1"
CALL :TYPELOOPFast
goto :EOF

:TYPELOOPFast
IF "%d[text]:~0,1%" == "#" (
    <NUL SET /P "=^!"
) else (
    <NUL SET /P "=d!BS!%d[text]:~0,1%"
)
SET "d[text]=%d[text]:~1%"
IF "%d[text]%" == "" (
    goto :EOF
) else (
    FOR /L %%J in (1, 100, 1000000) DO REM
    goto :TYPELOOPFast
)
exit



:ColorText
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :EOF
