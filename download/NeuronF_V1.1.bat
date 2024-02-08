	::	▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄	::	
	::	█                                                █	::	
	::	█       Name - NeuronFREE / Version - 1.1        █	::	
	::	█              Written by - FireAXT              █	::	
	::	█                                                █	::	
	::	▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀	::

mode 95,29
@echo off > nul 2>&1
title loading...
chcp 65001 > nul 2>&1 && SETLOCAL EnableDelayedExpansion > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f > nul 2>&1
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a" & set "COL=%%b")
Reg.exe add HKCU\CONSOLE /v VirtualTerminalLevel /t REG_DWORD /d 1 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f > nul 2>&1
set tcol=%COL%[92m> nul 2>&1
set bcol=%COL%[42;32m> nul 2>&1
set ocol=A> nul 2>&1
set fcol=F> nul 2>&1
:admin
CLS
Reg.exe query "HKU\S-1-5-19\Environment" > nul 2>&1
if not "%errorlevel%" EQU "0" goto noadmin
if not "%errorlevel%" EQU "1" goto DisclaimerCheck
:noadmin
title NO ADMINISTRATOR PERMISSIONS
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
:: Ask for admin
dism>nul||if exist "%~dp0MinSudo.exe" (MinSudo -NoLogo -TrustedInstaller -Privileged "%~f0" && exit) else ^
cd "%tmp%"&&echo CreateObject^("Shell.Application"^).ShellExecute"%~nx0",,"%~dp0","runas">tmp.vbs&&tmp&&del tmp.vbs&&exit
:DisclaimerCheck
Reg.exe query "HKCU\Software\Neuron" /v "Disclaimer" > nul 2>&1
if %errorlevel% equ 0 (
goto start 
) else (
goto Disclaimer

)

:start
set state1=%COL%[91m
set state2=%COL%[91m
set state3=%COL%[91m
set state4=%COL%[91m
set state5=%COL%[91m
set state6=%COL%[91m
set state7=%COL%[91m
set state8=%COL%[91m
set state9=%COL%[91m
set state10=%COL%[91m
set state11=%COL%[91m
set state12=%COL%[91m
rmdir %SystemDrive%\Windows\system32\adminrightstest > nul 2>&1
mkdir %SystemDrive%\Windows\system32\adminrightstest > nul 2>&1
set THREADS=%NUMBER_OF_PROCESSORS%
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d "0" /f > nul 2>&1
if %errorlevel% equ 0 if not exist "%SystemDrive%\Registrybackup.reg" (
:check_reg_backup
call :menutop
echo.
echo %COL%[97m                                 Creating Registry Backup [...]
echo.
Regedit /e "%SystemDrive%\Registrybackup.reg" > nul 2>&1
if !errorlevel! neq 0 cls & echo Failed to create a registry backup! & echo. & echo Press any key to continue anyway & pause > nul 2>&1 
)
if not exist "%SystemDrive%\BCDEdit_Backup.bcd" (
call :menutop
echo.
echo %COL%[97m                                 Creating BCD Edit Backup [...]
bcdedit /export "%SystemDrive%\BCDEdit_Backup.bcd" > nul 2>&1
)

:menu
SETLOCAL DisableDelayedExpansion > nul 2>&1
title dsc.gg/neuronx - Thank you for using NeuronF(ree)
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
chcp 852 > nul 2>&1
powershell -ExecutionPolicy Unrestricted -NoProfile Enable-ComputerRestore -Drive 'C:\', 'D:\', 'E:\', 'F:\', 'G:\' > nul 2>&1
powershell -ExecutionPolicy Unrestricted -NoProfile Checkpoint-Computer -Description 'Before Neuron optimization'
wmic /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Before Neuron Optimization", 100, 12
chcp 65001 > nul 2>&1
goto menu

:windowsmenu
cls
call :menutop
echo.
echo.                                                                                 %COL%[92mpage 1/3
echo.                         %COL%[97mOPTIMIZE %state1%MMCSS%COL%[97m [%COL%[92m 1 %COL%[97m]    [%COL%[92m 2 %COL%[97m] %COL%[97mOPTIMIZE %state2%VISUALS%COL%[90m
echo.                   This tweak reduces latency    Lowers windows graphics quality
echo.                   and may give you fps boost    for the sake of performance
echo.
echo.                           %COL%[97mOPTIMIZE %state3%CPU%COL%[97m [%COL%[92m 3 %COL%[97m]    [%COL%[92m 4 %COL%[97m] %COL%[97mDISABLE %state4%TELEMETRY %COL%[90m
echo.                    This tweak makes your CPU    This tweak disables windows 
echo.                    work more efficently         tracking and increases performance
echo.
echo.
echo.                                   %COL%[97mBACK [ %COL%[92mB %COL%[97m]    [ %COL%[92mN %COL%[97m] NEXT
echo. %COL%[97m
echo.
echo.
SET INPUT=
set /p "INPUT=%COL%[30m.                                            %COL%[92m>%COL%[97m: %COL%[97m"

IF /I '%INPUT%'=='1' set state1=%COL%[92m&& goto MMCSS
IF /I '%INPUT%'=='2' set state2=%COL%[92m&& goto optimizeviusals
IF /I '%INPUT%'=='3' set state3=%COL%[92m&& goto cputweaks
IF /I '%INPUT%'=='4' set state4=%COL%[92m&& goto Telemetry
IF /I '%INPUT%'=='b' goto menu
IF /I '%INPUT%'=='n' goto windowsmenu2
IF /I '%INPUT%'=='sex' start https://www.youtube.com/@FireAXT

goto windowsmenu

:windowsmenu2
cls
call :menutop
echo.
echo.                                                                                 %COL%[92mpage 2/3
echo.           %COL%[97mDISABLE %state5%UNNECESSARY SERVICES%COL%[97m [%COL%[92m 1 %COL%[97m]    [%COL%[92m 2 %COL%[97m] %COL%[97mOPTIMIZE %state6%GAMEBAR%COL%[90m
echo.           This tweak disables unnecessary       This tweak disables xbox gamebar.
echo.           services that overwhelm your PC       Fixes stuttering
echo.
echo.                         %COL%[97mOPTIMIZE %state7%CSRSS%COL%[97m [%COL%[92m 3 %COL%[97m]    [%COL%[92m 4 %COL%[97m] %COL%[97mGENERAL %state8%TWEAKS%COL%[90m
echo.                         This tweak reduces      This tweaks improves FPS.
echo.                         input delay             Improves your QoL.
echo.
echo.
echo.                                   %COL%[97mBACK [ %COL%[92mB %COL%[97m]    [ %COL%[92mN %COL%[97m] NEXT
echo. %COL%[97m
echo.
echo.
SET INPUT=
set /p "INPUT=%COL%[30m.                                            %COL%[92m>%COL%[97m: %COL%[97m"

IF /I '%INPUT%'=='1' set state5=%COL%[92m&& goto optimizeservices
IF /I '%INPUT%'=='2' set state6=%COL%[92m&& goto gamedvroptimization
IF /I '%INPUT%'=='3' set state7=%COL%[92m&& goto csrssoptimization
IF /I '%INPUT%'=='4' set state8=%COL%[92m&& goto generaltweaks
IF /I '%INPUT%'=='b' goto windowsmenu
IF /I '%INPUT%'=='n' goto windowsmenu3
IF /I '%INPUT%'=='sex' start https://www.youtube.com/@FireAXT

goto windowsmenu2

:windowsmenu3
cls
call :menutop
echo.
echo.                                                                                 %COL%[92mpage 3/3
echo.              %COL%[97mOPTIMIZE %state9%POWER THROTTLING%COL%[97m [%COL%[92m 1 %COL%[97m]    [%COL%[92m 2 %COL%[97m] %COL%[97mDELETE %state10%JUNK FILES%COL%[90m
echo.              increases performance              This tweak deletes 
echo.              at the cost of higher temps        useless ^& temporary files
echo.
echo.              %COL%[97mOPTIMIZE %state11%MOUSE ^& KEYBOARD%COL%[97m [%COL%[92m 3 %COL%[97m]    [%COL%[92m 4 %COL%[97m] %COL%[90mSOON %COL%[90m
echo.              optimizes mouse ^& keyboard    
echo.              settings. Can improve aim            
echo.
echo.
echo.                                   %COL%[97mBACK [ %COL%[92mB %COL%[97m]    [ %COL%[92mN %COL%[97m] %COL%[90mSOON
echo. %COL%[97m
echo.
echo.
SET INPUT=
set /p "INPUT=%COL%[30m.                                            %COL%[92m>%COL%[97m: %COL%[97m"

IF /I '%INPUT%'=='1' set state9=%COL%[92m&& goto powerthrottling 
IF /I '%INPUT%'=='2' set state10=%COL%[92m&& goto cleaner
IF /I '%INPUT%'=='3' set state11=%COL%[92m&& goto kbmousetweaks
IF /I '%INPUT%'=='4' goto windowsmenu3
IF /I '%INPUT%'=='b' goto windowsmenu2
IF /I '%INPUT%'=='n' goto windowsmenu3
IF /I '%INPUT%'=='sex' start https://www.youtube.com/@FireAXT

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
echo.                                         %COL%[97m[%COL%[96m160^+ Tweaks%COL%[97m]
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

:MMCSS
call :applyingtweakscreen
timeout 2 > nul
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysOn" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Latency Sensitive" /t REG_SZ /d "True" /f > nul 2>&1
goto done


:generaltweaks
call :applyingtweakscreen
chcp 852 > nul 2>&1 
for /f "tokens=2 delims==" %%i in ('wmic os get TotalVisibleMemorySize /value') do set /a mem=%%i + 1024000
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Discord.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\FTH" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d %mem% /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "IOPageLockLimit" /t REG_DWORD /d "%mem%" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "HeapDeCommitFreeBlockThreshold" /t REG_DWORD /d "262144" /f > nul 2>&1 
powercfg /h off > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisabled" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "SleepReliabilityDetailedDiagnostics" /t REG_DWORD /d "0" /f > nul 2>&1
for /f %%g in ('wmic path win32_videocontroller get PNPDeviceID ^| findstr /L "VEN_"') do (
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "0" /f > nul 2>&1
)
if exist "%SYSTEMROOT%\System32\fsutil.exe" (
	fsutil behavior set mftzone 2
	fsutil behavior set disablelastaccess 1
	fsutil behavior set disablecompression 1
	fsutil behavior set memoryusage 2
	fsutil behavior set disabledeletenotify 0
	fsutil behavior set encryptpagingfile 0
	fsutil behavior set disable8dot3 1
) > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v "EnthusiastMode" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t REG_DWORD /d 2962489444 /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AutoCheckSelect" /t REG_DWORD /d 1 /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "HubMode" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "FullPath" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f > nul 2>&1
powershell -NoProfile -Command "Disable-MMAgent -PagingCombining -mc" > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" /t REG_DWORD /d 1 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "RestrictAnonymousSAM" /t REG_DWORD /d 1 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" /v "RestrictNullSessAccess" /t REG_DWORD /d 1 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "RestrictRemoteSAM" /t REG_SZ /d "O:BAG:BAD:(A;;RC;;;BA)" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "EveryoneIncludesAnonymous" /t REG_DWORD /d 0 /f > nul 2>&1
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
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa" /v "NoLMHash" /t REG_DWORD /d 1 /f > nul 2>&1
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
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowDeviceNameInTelemetry" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /V AITEnable /T REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "SettingsVersion" /t REG_DWORD /d "3" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AccessibilityTemp" /v "narrator" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Narrator\NoRoam" /v "RunningState" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableAutocorrection" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableSpellchecking" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableTextPrediction" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnablePredictionSpaceInsertion" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableDoubleTapSpace" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableInkingWithTouch" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /V "AllowTelemetry" /T REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\TraceManager" /v "MiniTraceSlotEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\AITEventLog" /V Start /T REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Autologger-Diagtrack-Listener" /V Start /T REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /V Start /T REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /V BufferSize /T REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /V FileMax /T REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /V FileName /T REG_SZ /d "C:\\Windows\\System32\\LogFiles\\SQM\\SQMLogger.etl" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /V GUID /T REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /V LogFileMode /T REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /V MaxFileSize /T REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /V MinimumBuffers /T REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /V MaximumBuffers /T REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /V Status /T REG_DWORD /d 0 /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f > nul 2>&1
sc config "dmwappushservice" start=disabled > nul 2>&1
sc config "diagnosticshub.standardcollector.service" start=disabled > nul 2>&1
sc config "diagtrack" start=disabled > nul 2>&1
sc config "WMPNetworkSvc" start=disabled > nul 2>&1
sc config "RemoteRegistry" start=disabled > nul 2>&1
sc config "IEEtwCollectorService" start=disabled > nul 2>&1
sc config "wercplsupport" start=disabled > nul 2>&1
sc config "NvTelemetryContainer" start=disabled > nul 2>&1
net stop "dmwappushservice" > nul 2>&1
net stop "diagnosticshub.standardcollector.service" > nul 2>&1
net stop "diagtrack" > nul 2>&1
net stop "WMPNetworkSvc" > nul 2>&1
net stop "RemoteRegistry" > nul 2>&1
net stop "IEEtwCollectorService" > nul 2>&1
net stop "wercplsupport" > nul 2>&1
net stop "NvTelemetryContainer" > nul 2>&1
schtaskts /end /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" > nul 2>&1
schtaskts /delete /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /f > nul 2>&1
schtaskts /end /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" > nul 2>&1
schtaskts /delete /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /f > nul 2>&1
schtaskts /end /tn "\Microsoft\Windows\Autochk\Proxy" > nul 2>&1
schtaskts /delete /tn "\Microsoft\Windows\Autochk\Proxy" /f > nul 2>&1
schtaskts /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" > nul 2>&1
schtaskts /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /f > nul 2>&1
schtaskts /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" > nul 2>&1
schtaskts /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /f > nul 2>&1
schtaskts /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" > nul 2>&1
schtaskts /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /f > nul 2>&1
schtaskts /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" > nul 2>&1
schtaskts /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /f > nul 2>&1
schtaskts /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" > nul 2>&1
schtaskts /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /f > nul 2>&1
schtaskts /end /tn "\Microsoft\Windows\Customer Experience Improvement Program" > nul 2>&1
schtaskts /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program" /f > nul 2>&1
schtaskts /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" > nul 2>&1
schtaskts /delete /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /f > nul 2>&1
schtaskts /end /tn "\Microsoft\Windows\PI\Sqm-Tasks"  > nul 2>&1
schtaskts /delete /tn "\Microsoft\Windows\PI\Sqm-Tasks" /f > nul 2>&1
schtaskts /end /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" > nul 2>&1
schtaskts /delete /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /f > nul 2>&1
schtaskts /end /tn "\Intel\Intel Telemetry 2" > nul 2>&1
schtaskts /delete /tn "\Intel\Intel Telemetry 2" /f > nul 2>&1
schtaskts /end /tn "\NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" > nul 2>&1
schtaskts /delete /tn "\NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" /f > nul 2>&1
schtaskts /end /tn "\NvTmRep_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" > nul 2>&1
schtaskts /delete /tn "\NvTmRep_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" /f > nul 2>&1
schtaskts /end /tn "\NvTmRepOnLogon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" > nul 2>&1
schtaskts /delete /tn "\NvTmRepOnLogon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" /f > nul 2>&1
schtaskts /end /tn "\Microsoft\Windows\SMB\UninstallSMB1ClientTask" > nul 2>&1
schtaskts /delete /tn "\Microsoft\Windows\SMB\UninstallSMB1ClientTask" /f > nul 2>&1
schtaskts /end /tn "\Microsoft\Windows\SMB\UninstallSMB1ServerTask" > nul 2>&1
schtaskts /delete /tn "\Microsoft\Windows\SMB\UninstallSMB1ServerTask" /f > nul 2>&1
setx powershell_TELEMETRY_OPTOUT 1 > nul 2>&1
setx DOTNET_CLI_TELEMETRY_OPTOUT 1 > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\AppModel" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Cellcore" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Circular Kernel Context Logger" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\CloudExperienceHostOobe" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DataMarket" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\HolographicDevice" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\iCLSClient" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\iCLSProxy" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\LwtNetLog" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Mellanox-Kernel" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-AssignedAccess-Trace" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-Setup" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\NBSMBLOGGER" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\PEAuthLog" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\RdrLog" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\ReadyBoot" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SetupPlatform" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SetupPlatformTel" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SocketHeciServer" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SpoolerLogger" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\TCPIPLOGGER" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\TileStore" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Tpm" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\TPMProvisioningService" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\UBPM" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WdiContextLog" /v "Start" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WFP-IPsec Trace" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSession" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSessionRepro" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WinPhoneCritical" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogEnable" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogLevel" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Lsa\Credssp" /v "DebugLogLevel" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f > nul 2>&1
takeown /f %UserProfile%\AppData\Local\NVIDIA\NvBackend\ApplicationOntology\OAWrapper.exe > nul 2>&1
icacls %UserProfile%\AppData\Local\NVIDIA\NvBackend\ApplicationOntology\OAWrapper.exe /deny *S-1-1-0:F /T > nul 2>&1
takeown /f %windir%\System32\CompatTelRunner.exe > nul 2>&1
icacls %windir%\System32\CompatTelRunner.exe /deny *S-1-1-0:F /T > nul 2>&1
timeout 1 > nul
chcp 65001 > nul 2>&1 

goto done

:optimizeviusals
call :applyingtweakscreen
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f > nul 2>&1 
Reg.exe add "HKCU\Control Panel\Desktop" /f /v "UserPreferencesMask" /t REG_BINARY /d "9012078012000000" > nul 2>&1 
Reg.exe add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "1" /f > nul 2>&1 
Reg.exe add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "2" /f > nul 2>&1 
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f > nul 2>&1 
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "ListviewShadow" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f > nul 2>&1 
goto done



:csrssoptimization
call :applyingtweakscreen
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f > nul 2>&1
goto done1

:optimizeservices
call :applyingtweakscreen
rem disable background tasks
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t REG_DWORD /d "2" /f > nul 2>&1 
rem Get the list of services to disable
set services_disable="AxInstSV RemoteRegistry lmhosts tzautoupdate WSearch LanmanWorkstation bthserv dmwappushservice MapsBroker lfsvc SharedAccess lltdsvc AppVClient NetTcpPortSharing CscService PhoneSvc Spooler PrintNotify QWAVE RmSvc RemoteAccess SensorDataService SensrSvc SensorService ShellHWDetection SCardSvr ScDeviceEnum SSDPSRV WiaRpc TabletInputService upnphost UevAgentService WalletService FrameServer stisvc wisvc icssvc WSearch XblAuthManager"
set services_demand="AJRouter ALG AppIDSvc AppMgmt AppReadiness SCPolicySvc AppVClient XboxGipSvc AppXSvc Appinfo AssignedAccessManagerSvc wcncsvc BDESVC BFE BTAGService CertPropSvc FontCache3.0.0.0 p2psvc WaaSMedicSvc"
rem Loop to set disable / demand services
for %%a in (%services_disable%) do (
  sc config %%a start= disabled
)
for %%a in (%services_demand%) do (
  sc config %%a start= demand
)
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
chcp 852 > nul 2>&1 
ipconfig /flushdns > nul 2>&1
ipconfig /release > nul 2>&1
ipconfig /renew > nul 2>&1
netsh http flush logbuffer > nul 2>&1
netsh int httpstunnel reset all > nul 2>&1
netsh int ip reset all > nul 2>&1
netsh int tcp reset all > nul 2>&1
netsh interface IP delete arpcache > nul 2>&1
netsh winhttp reset proxy > nul 2>&1
netsh winsock reset > nul 2>&1
netsh wlan stop hostednetwork > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "10" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "LocalAccountTokenFilterPolicy" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "DisableSmartNameResolution" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "EnableMulticast" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\Dnscache\Parameters" /v "DisableParallelAandAAAA" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableAutoDoh" /t REG_DWORD /d "2" /f >nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\NDIS\Parameters" /v "TrackNblOwner" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\NetBT\Parameters" /v "EnableLMHOSTS" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\QoS" /v "Do not use NLA" /t REG_SZ /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "IGMPLevel" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "30" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "UseDomainNameDevolution" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "EnableWsd" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "TCPCongestionControl" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f >nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters" /v " DisableDHCPMediaSense" /t REG_DWORD /d 1 /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "32" /f  > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "SizReqBuf" /t REG_DWORD /d "16384" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "MaxWorkItems" /t REG_DWORD /d "8192" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "MaxMpxCt" /t REG_DWORD /d "2048" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "MaxCmds" /t REG_DWORD /d "2048" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "DisableStrictNameChecking" /t REG_DWORD /d "1" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "EnableOplocks" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "SharingViolationDelay" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "SharingViolationRetries" /t REG_DWORD /d "0" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /t REG_DWORD /d "16" /f > nul 2>&1 
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d "16" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "0200" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000ff000000000000000000000000000000000000000000ff000000000000000000000000000000" /f > nul 2>&1 
Reg.exe add "HKLM\System\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "1700" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000ff000000000000000000000000000000000000000000ff000000000000000000000000000000" /f > nul 2>&1 
netsh winsock set autotuning on > nul 2>&1
netsh int ip set global neighborcachelimit=4096 > nul 2>&1
netsh int ip set global routecachelimit=4096 > nul 2>&1
netsh int ip set global sourceroutingbehavior=drop > nul 2>&1
netsh int ip set global taskoffload=disabled > nul 2>&1
netsh int ip set interface ethernet currenthoplimit=64 > nul 2>&1
netsh int tcp set global ecncapability=disabled > nul 2>&1
netsh int tcp set global congestionprovider=ctcp > nul 2>&1
netsh int tcp set global netdma=enabled > nul 2>&1
netsh int tcp set global dca=enabled > nul 2>&1
netsh int tcp set global rss=enabled > nul 2>&1
netsh int tcp set global rsc=disabled > nul 2>&1
netsh int tcp set global nonsackrttresiliency=disabled > nul 2>&1
netsh int tcp set global maxsynretransmissions=2 > nul 2>&1
netsh int tcp set global fastopen=enabled > nul 2>&1
netsh int tcp set global timestamps=disabled > nul 2>&1
netsh int tcp set global initialRto=3000 > nul 2>&1
netsh int tcp set global MinRto=300 > nul 2>&1
netsh int udp set global uro=enabled > nul 2>&1
netsh int ipv4 set global defaultcurhoplimit=64 > nul 2>&1
netsh int isatap set state disable > nul 2>&1
netsh int tcp set security mpp=enabled > nul 2>&1
netsh int tcp set security profiles=disabled > nul 2>&1
netsh int tcp set global autotuninglevel=normal > nul 2>&1
netsh int tcp set heuristics disabled > nul 2>&1
netsh int tcp set supplemental template=custom icw=10 > nul 2>&1
netsh int teredo set state disabled > nul 2>&1
powershell Set-NetOffloadGlobalSetting -Chimney disabled > nul 2>&1
powershell -ExecutionPolicy Unrestricted Set-NetOffloadGlobalSetting -PacketCoalescingFilter enabled > nul 2>&1
powershell -ExecutionPolicy Unrestricted "Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6, ms_msclient, ms_server, ms_lldp, ms_lltdio, ms_rspndr" > nul 2>&1
powershell -NoProfile "$net=get-netconnectionprofile; Set-NetConnectionProfile -Name $net.Name -NetworkCategory Private" > nul 2>&1
for /f "tokens=1" %%i in ('netsh int ip show interfaces ^| findstr [0-9]') do set INTERFACE=%%i > nul
netsh int ip set interface %INTERFACE% basereachable=3600000 dadtransmits=0 otherstateful=disabled routerdiscovery=disabled store=persistent > nul 2>&1

For /f %%k in ('Reg.exe Query HKLM\System\CurrentControlSet\Services\NetBT\Parameters\Interfaces /f "NetbiosOptions" /v /s^|Findstr HKEY_') do (
	Reg.exe add %%k /v NetbiosOptions /t REG_DWORD /d 2 /f
	Reg.exe add %%k /v EnableNagling /t REG_DWORD /d 0 /f
) > nul 2>&1
for /f %%a in ('Reg.exe query "HKLM\System\ControlSet001\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /f "PCI\VEN_" /d /s^|Findstr HKEY_') do (
	Reg.exe add %%a /v "TxIntDelay" /t REG_SZ /d "5" /f
	Reg.exe add %%a /v "ulpmode" /t REG_SZ /d "0" /f
) > nul 2>&1
for /f "usebackq" %%c in (`Reg.exe query HKLM\System\CurrentControlSet\Services\TCPIP\Parameters\Interfaces`) do (
	Reg.exe add %%c /v "UseZeroBroadcast" /d "0" /t REG_DWORD /f
	Reg.exe add %%c /v "IPAutoconfigurationEnabled" /d "0" /t REG_DWORD /f
) > nul 2>&1
for /f "tokens=3*" %%s in ('Reg.exe query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkCards" /f "ServiceName" /s^|findstr /i /l "ServiceName"') do (
    Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters\Interfaces\%%s" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters\Interfaces\%%s" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters\Interfaces\%%s" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f
    Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters\Interfaces\%%s" /v "TcpInitialRTT" /t REG_DWORD /d "0" /f 
	Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP\Parameters\Interfaces\%%s" /v "DeadGWDetectDefault" /t REG_DWORD /d "1" /f
	Reg.exe add "HKLM\System\CurrentControlSet\Services\Psched\Parameters\Adapters\%%s" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f
) > nul 2>&1
for /f "tokens=3*" %%a in ('Reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkCards" /k /v /f "Description" /s /e ^| findstr /ri "REG_SZ"') do (
for /f %%g in ('Reg query "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /s /f "%%b" /d ^| findstr /C:"HKEY"') do (
rem NIC
Reg.exe add "%%g" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "*WakeOnPattern" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "*FlowControl" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "*EEE" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "EnablePME" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "WakeOnLink" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "EEELinkAdvertisement" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "ReduceSpeedOnPowerDown" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "PowerSavingMode" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "EnableGreenEthernet" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "S5WakeOnLan" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "ULPMode" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "GigaLite" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "EnableSavePowerNow" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "EnablePowerManagement" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "EnableDynamicPowerGating" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "EnableConnectedPowerGating" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "AutoPowerSaveModeEnabled" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "AutoDisableGigabit" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "AdvancedEEE" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "PowerDownPll" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "S5NicKeepOverrideMacAddrV2" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "JumboPacket" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "ITR" /t REG_SZ /d "125" /f
Reg.exe add "%%g" /v "ReceiveBuffers" /t REG_SZ /d "266" /f
Reg.exe add "%%g" /v "TransmitBuffers" /t REG_SZ /d "266" /f
Reg.exe add "%%g" /v "WolShutdownLinkSpeed" /t REG_SZ /d "2" /f
Reg.exe add "%%g" /v "LsoV2IPv4" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "LsoV2IPv6" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "PnPCapabilities" /t REG_DWORD /d "24" /f
Reg.exe add "%%g" /v "UDPChecksumOffloadIPv6" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "IPChecksumOffloadIPv4" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "UDPChecksumOffloadIPv4" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "PMARPOffload" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "PMNSOffload" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "TCPChecksumOffloadIPv4" /t REG_SZ /d "0" /f
Reg.exe add "%%g" /v "TCPChecksumOffloadIPv6" /t REG_SZ /d "0" /f
) >nul 2>&1
)



chcp 65001 > nul 2>&1 
goto donenetwork

:cputweaks
call :applyingtweakscreen
bcdedit /set {globalsettings} custom:16000067 true > nul 2>&1
bcdedit /set {globalsettings} custom:16000068 true > nul 2>&1
bcdedit /set {globalsettings} custom:16000069 true > nul 2>&1
bcdedit /set allowedinmemorysettings 0x0 > nul 2>&1
bcdedit /set firstmegabytepolicy UseAll > nul 2>&1
bcdedit /set configaccesspolicy Default > nul 2>&1
bcdedit /set usephysicaldestination No > nul 2>&1
bcdedit /set usefirmwarepcisettings No > nul 2>&1
bcdedit /set hypervisorlaunchtype off > nul 2>&1
bcdedit /set increaseuserva 268435328 > nul 2>&1
bcdedit /set avoidlowmemory 0x8000000 > nul 2>&1
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
bcdedit /set nolowmem Yes > nul 2>&1
bcdedit /set MSI Default > nul 2>&1
bcdedit /set vm No > nul 2>&1
bcdedit /timeout 0 > nul 2>&1
bcdedit /set {current} numproc %THREADS% > nul 2>&1
echo %PROCESSOR_IDENTIFIER% ^| find "Intel" >nul && bcdedit /set nx optout >nul || bcdedit /set nx alwaysoff >nul
:registrycpu
Reg.exe add "HKLM\System\CurrentControlSet\Services\IntelPPM" /v Start /t REG_DWORD /d 3 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\AmdPPM" /v Start /t REG_DWORD /d 3 /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "DistributeTimers" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability" /v "TimeStampInterval" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability" /v "IoPriority" /t REG_DWORD /d "3" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f > nul 2>&1
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
goto done

:cleaner
call :applyingtweakscreen
net stop wuauserv > nul 2>&1
net stop usoSvc > nul 2>&1
net stop bit > nul 2>&1
net stop dosvc > nul 2>&1
cls
rem Delete temporary files
for %%f in (%Temp%\* %AppData%\Temp\* %localappdata%\Microsoft\Windows\WebCache\* "%ProgramData%\Microsoft\Search\Data\Temp\*") do (
    del /s /q "%%f"
)

rem Delete log files
for %%f in (%SystemRoot%\Panther\* %SystemRoot%\inf\setupapi.app.log %SystemRoot%\inf\setupapi.dev.log %SystemRoot%\inf\setupapi.offline.log %SystemRoot%\Performance\WinSAT\winsat.log %SystemRoot%\Logs\CBS\CBS.log %SystemRoot%\Logs\DISM\DISM.log %WinDir%\*.tmp) do (
    del /s /q "%%f"
)


for /f " tokens=*" %%G in ('wevtutil.exe el') DO (call :cleanerfunction "%%G") 

rem Delete Recycle Bin contents
rd /s /q "%SystemDrive%\$Recycle.Bin"

rem Cleanup temporary directories
rmdir /s /q "%ProgramData%\Microsoft\Search\Data\Temp"
rmdir /s /q "%localappdata%\Temp\"
rd /s /q %WinDir%\Temp
rd /s /q %Temp%
rd /s /q %AppData%\Temp
rd /s /q %HomePath%\AppData\LocalLow\Temp
rd /s /q %WinDir%\Prefetch

rem Create missing directories
md %SystemRoot%\SoftwareDistribution
md %WinDir%\Prefetch
md %WinDir%\Temp
md %Temp%
md %AppData%\Temp
md %HomePath%\AppData\LocalLow\Temp

SET msgboxTitle=Done!
SET msgboxBody=Junk file removal completed successfully!
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",vbInformation +vbSystemModal +vbOKOnly,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"
goto done2

:kbmousetweaks
call :applyingtweakscreen
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Desktop" /v "MouseWheelRouting" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Cursors" /v "ContactVisualization" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Cursors" /v "GestureVisualization" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseTrails" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t REG_BINARY /d "0000000000000000156e000000000000004001000000000029dc0300000000000000280000000000" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /t REG_BINARY /d "0000000000000000fd11010000000000002404000000000000fc12000000000000c0bb0100000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "21" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "58" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Accessibility\HighContrast" /v "Flags" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_DWORD /d "0" /f > nul 2>&1
goto done2

:powerthrottling
call :applyingtweakscreen
powercfg -restoredefaultschemes
powercfg /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa > nul 2>&1
powercfg /setactive aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa > nul 2>&1
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
powercfg /setacvalueindex scheme_current SUB_DISK d3d55efd-c1ff-424e-9dc3-441be7833010 0 > nul 2>&1 
powercfg /setacvalueindex scheme_current SUB_DISK d639518a-e56d-4345-8af2-b9f32fb26109 0 > nul 2>&1 
powercfg /setacvalueindex scheme_current SUB_DISK DISKNVMENOPPME 1 > nul 2>&1 
powercfg -setacvalueindex scheme_current sub_none DEVICEIDLE 0 > nul 2>&1
powercfg -setacvalueindex scheme_current SUB_PCIEXPRESS ASPM 0 > nul 2>&1
powercfg -setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 0 > nul 2>&1
powercfg -setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 > nul 2>&1
powercfg -setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 0853a681-27c8-4100-a2fd-82013e970683 0 > nul 2>&1 
echo %PROCESSOR_IDENTIFIER% | find "Intel" > nul && (
powercfg -setacvalueindex scheme_current SUB_INTSTEER MODE 6 > nul 2>&1
)
:: Changing power plan name
powercfg -changename scheme_current "NeuronV1" "For NeuronF tweaker - https://dsc.gg/neuronx - made by NeuronX " > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f > nul 2>&1
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
mode 95,29 
cls
echo. %COL%[92m
echo.                                 ^_^_
echo.                              ^/^\ ^\ ^\  ^_^_^_  ^_   ^_  ^_ ^_^_   ^_^_^_   ^_ ^_^_  
echo.                             ^/  ^\^/ ^/ ^/ ^_ ^\^| ^| ^| ^|^| '^_^_^| ^/ ^_ ^\ ^| '^_ ^\ 
echo.                            ^/ ^/^\  ^/ ^|  ^_^_^/^| ^|^_^| ^|^| ^|   ^| (^_) ^|^| ^| ^| ^|
echo.                            ^\^_^\ ^\^/   ^\^_^_^_^| ^\^_^_,^_^|^|^_^|    ^\^_^_^_^/ ^|^_^| ^|^_^|
echo. 
echo. 
echo.
echo.
echo.         %COL%[97;4mThis product is provided 'AS IS' without any warranties or guarantees.%COL%[0;97m
echo.
echo.         By using this software, you acknowledge and accept that any risks associated 
echo.         with its use are solely your responsibility. We are not liable for 
echo.         any damages or losses resulting from the use of this product.
echo.
echo.
echo.
echo.
echo.                                 type "%COL%[92mI understand%COL%[97m" to proceed
echo.
echo.
echo.
SET INPUT=
set /p "INPUT=%COL%[30m.                                        %COL%[92m>%COL%[97m: %COL%[97m"

if /i "%INPUT%" == "I understand" Reg.exe add "HKCU\Software\Neuron" /v "Disclaimer" /f > nul 2>&1 && goto DisclaimerCheck
goto DisclaimerCheck




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


:menutop
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

:cleanerfunction
echo %COL%[97mClearing %COL%[92m%1
wevtutil.exe cl %1
goto :eof

:ColorText
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :EOF
