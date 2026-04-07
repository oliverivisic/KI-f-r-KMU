@echo off
cd /d "%~dp0"
title WerkstattPuls – Alpine AutoHaus
echo.
echo  ================================
echo   WerkstattPuls – Alpine AutoHaus
echo  ================================
echo.
echo  Starte lokalen Server auf Port 8000...
echo  Oeffne: http://localhost:8000/dashboard.html
echo.
echo  Zum Beenden: Ctrl+C druecken
echo.

start "" /b cmd /c "timeout /t 1 /nobreak >nul && start http://localhost:8000/dashboard.html"

python -m http.server 8000 2>nul
if %errorlevel% equ 9009 (
    echo.
    echo  python nicht gefunden, versuche python3...
    python3 -m http.server 8000
    if %errorlevel% equ 9009 (
        echo.
        echo  FEHLER: Python nicht gefunden.
        echo  Download: https://www.python.org/downloads/
        echo.
        pause
    )
)
