@echo off
set /p filename=Enter the name of the Python program (without extension): 

rem Check if the filename is provided
if "%filename%"=="" (
    echo Error: Filename not provided.
    pause
    exit /b 1
)

rem Create the Python program file
echo # Python program - %filename%.py > %filename%.py
echo. >> %filename%.py
echo # Add your Python code here... >> %filename%.py

rem Open the Python program file in Notepad
start notepad %filename%.py
