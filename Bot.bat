@echo off
title File Management Bot

:main_menu
cls
echo Welcome to the File Management Bot!
echo.
echo 1. Create File
echo 2. Rename File
echo 3. Delete File
echo 4. Create Directory
echo 5. Delete Directory
echo 6. List Directories and Contents
echo 7. Exit
echo.

set /p choice=Enter your choice (1-7): 

if "%choice%"=="1" (
    call :create_file
) else if "%choice%"=="2" (
    call :rename_file
) else if "%choice%"=="3" (
    call :delete_file
) else if "%choice%"=="4" (
    call :create_directory
) else if "%choice%"=="5" (
    call :delete_directory
) else if "%choice%"=="6" (
    call :list_directories_contents
) else if "%choice%"=="7" (
    exit
) else (
    echo Invalid choice. Please try again.
    timeout /t 2 /nobreak >nul
    goto main_menu
)

:create_file
cls
set /p filename=Enter filename (with extension): 
if not exist "%filename%" (
    echo. > "%filename%"
    echo File "%filename%" created successfully.
) else (
    echo File "%filename%" already exists.
)
timeout /t 2 /nobreak >nul
goto main_menu

:rename_file
cls
set /p oldname=Enter current filename (with extension): 
set /p newname=Enter new filename (with extension): 
if exist "%oldname%" (
    ren "%oldname%" "%newname%"
    echo File renamed successfully.
) else (
    echo File "%oldname%" not found.
)
timeout /t 2 /nobreak >nul
goto main_menu

:delete_file
cls
set /p filename=Enter filename to delete (with extension): 
if exist "%filename%" (
    del "%filename%"
    echo File "%filename%" deleted successfully.
) else (
    echo File "%filename%" not found.
)
timeout /t 2 /nobreak >nul
goto main_menu

:create_directory
cls
set /p dirname=Enter directory name: 
if not exist "%dirname%" (
    mkdir "%dirname%"
    echo Directory "%dirname%" created successfully.
) else (
    echo Directory "%dirname%" already exists.
)
timeout /t 2 /nobreak >nul
goto main_menu

:delete_directory
cls
set /p dirname=Enter directory name to delete: 
if exist "%dirname%" (
    rmdir /s /q "%dirname%"
    echo Directory "%dirname%" deleted successfully.
) else (
    echo Directory "%dirname%" not found.
)
timeout /t 2 /nobreak >nul
goto main_menu

:list_directories_contents
cls
dir /s /b /a:-d /o:n
timeout /t 5 /nobreak >nul
goto main_menu
