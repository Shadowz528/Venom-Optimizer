@echo off
color 03
title Venom Optimizer
::Run as Admin
Reg.exe add HKLM /F >nul 2>&1
if %errorlevel% neq 0 start "" /wait /I /min powershell -NoProfile -Command start -verb runas "'%~s0'" && exit /b
Powershell.exe -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description """Venom Restore Point""" -RestorePointType "MODIFY_SETTINGS""
::Make Directories
mkdir C:\Venom >nul 2>&1
mkdir C:\Venom\Drivers >nul 2>&1
mkdir C:\Venom\Resources >nul 2>&1
mkdir C:\Venom\VenomRevert >nul 2>&1
cd C:\Venom
:Backup
powershell Enable-ComputerRestore -Drive 'C:\', 'D:\', 'E:\', 'F:\', 'G:\' >nul 2>&1
powershell Checkpoint-Computer -Description 'Venom Restore Point' >nul 2>&1
for /F "tokens=2" %%i in ('date /t') do set date=%%i
set date1=%date:/=.%
md C:\Venom\VenomRevert\%date1%
reg export HKCU C:\Venom\VenomRevert\%date1%\HKLM.reg /y & reg export HKCU C:\Venom\VenomRevert\%date1%\HKCU.reg /y >nul 2>&1
cls
echo Venom Optimizer has an inbuilt auto restore point creator, but please manually make a restore point just in case.
echo (Windows search, Restore Point(open it), create(C Drive), Name: "Venom Restore Point")
echo -- PRESS ANY KEY TO CONTINUE
pause >nul
cls
echo -- VENOM OPTIMIZER --
echo -- MADE BY SHADOWZ --
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t Reg_DWORD /d "8" /f
echo GPU Priority Set
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t Reg_DWORD /d "6" /f
echo Games Priority Set
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t Reg_SZ /d "High" /f
echo Scheduling Category Set
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t Reg_SZ /d "High" /f
echo SFIO Priority Set
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "10" /f
echo NonBestEffortLimit Set
for /f %%a in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class" /v "VgaCompatible" /s ^| findstr "HKEY"') do Reg add "%%a" /v "KMD_EnableGDIAcceleration" /t Reg_DWORD /d "1" /f
echo Registry Path Found
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDr" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t Reg_DWORD /d "0" /f
echo GPU Energy Drivers Disabled
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t Reg_DWORD /d "0x0000001e" /f
echo KeyboardDataQueueSize Changed To 30 From 100
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t Reg_DWORD /d "0x0000001e" /f
echo MouseDataQueueSize Changed To 30 From 100
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t Reg_DWORD /d "00000000" /f
echo Disable Windows Tracking and Telemetry 1/5
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLua" /t Reg_DWORD /d "00000000" /f
echo Disable Windows Tracking and Telemetry 2/5
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t Reg_DWORD /d "00000000" /f
echo Disable Windows Tracking and Telemetry 3/5
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowSharedUserAppData" /v "value" /t Reg_DWORD /d "00000000" /f
echo Disable Windows Tracking and Telemetry 4/5
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowStore" /v "value" /t Reg_DWORD /d "00000000" /f
echo Disable Windows Tracking and Telemetry Completed
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t Reg_DWORD /d "ffffffff" /f
echo NetworkThrottlingIndex Optimized
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t Reg_DWORD /d "00000000" /f
echo SystemResponsiveness Optimized
echo Your System Has Been Optimized Venom Optimizer (An automatic restore point has been made,
echo revert to it if you are facing issues after running this)
echo -- RESTART PC FOR CHANGES TO TAKE EFFECT
echo -- PRESS ANY KEY TO EXIT VENOM OPTIMIZER
pause >nul