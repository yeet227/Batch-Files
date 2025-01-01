@echo off
:: Check for Administrator privileges
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires Administrator privileges.
    echo Please right-click the batch file and select "Run as administrator".
    pause
    exit /b
)

echo ================================
echo Network Troubleshooting Script
echo ================================
echo.

echo Flushing DNS cache...
ipconfig /flushdns
if %errorlevel% neq 0 (
    echo Failed to flush DNS cache.
) else (
    echo DNS cache flushed successfully.
)
echo.

echo Releasing IP address...
ipconfig /release
if %errorlevel% neq 0 (
    echo Failed to release IP address.
) else (
    echo IP address released.
)
echo.

echo Renewing IP address...
ipconfig /renew
if %errorlevel% neq 0 (
    echo Failed to renew IP address.
) else (
    echo IP address renewed successfully.
)
echo.

echo Resetting TCP/IP stack...
netsh int ip reset
if %errorlevel% neq 0 (
    echo Failed to reset TCP/IP stack.
) else (
    echo TCP/IP stack reset successfully.
)
echo.

echo Resetting Windows networking...
netsh winsock reset
if %errorlevel% neq 0 (
    echo Failed to reset Winsock.
) else (
    echo Winsock reset successfully.
)
echo.

echo Restarting network adapter...
REM Replace "Ethernet" with the exact name of your network adapter if different
netsh interface set interface "Ethernet" admin=disable
netsh interface set interface "Ethernet" admin=enable
if %errorlevel% neq 0 (
    echo Failed to restart network adapter.
) else (
    echo Network adapter restarted successfully.
)
echo.

echo ================================
echo Network Troubleshooting Completed
echo ================================
echo.

pause
