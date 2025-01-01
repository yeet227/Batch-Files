@echo off

set /p time_unit=Enter the time unit (1 for hours, 2 for minutes, 3 for seconds): 
set /p time_amount=Enter the amount of time: 

if %time_unit% equ 1 (
    set /a shutdown_time=%time_amount%*3600
    set unit_name=hours
) else if %time_unit% equ 2 (
    set /a shutdown_time=%time_amount%*60
    set unit_name=minutes
) else if %time_unit% equ 3 (
    set /a shutdown_time=%time_amount%
    set unit_name=seconds
) else (
    echo Invalid time unit selected. Exiting.
    exit /b 1
)

echo Shutting down in %time_amount% %unit_name%...
timeout /nobreak /t %shutdown_time%
shutdown /s /f /t 1

rem Additional actions before the pause...
echo Additional actions before the pause...
rem Add your additional actions here

echo Press any key to continue...
pause >nul
