@echo off
setlocal EnableDelayedExpansion

:: CONFIG
title SILVER TS3 MANAGER - DEVELOPED BY MOHAMMAD ^& VIP3R
color 0B

:AdminCheck
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo [!] ERROR: IN SCRIPT NIAZ BE ADMIN DARAD.
    powershell.exe -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:Menu
cls
echo.
echo    ======================================================
echo          S I L V E R   T S 3   O P T I M I Z E R
echo    ======================================================
echo       BY: MOHAMMAD ^& VIP3R
echo       TELEGRAM: @SILVERCLAN01
echo    ======================================================
echo.
echo    [1] FULL OPTIMIZE (KILL / CACHE / UNBLOCK)
echo    [2] ONLY UNBLOCK (MODIFY HOSTS)
echo    [3] CLEAN CACHE ONLY
echo    [4] EXIT
echo.
set /p opt=" >> ENTEKHAB KONID: "

if "%opt%"=="1" goto FullClean
if "%opt%"=="2" goto HostsOnly
if "%opt%"=="3" goto CacheOnly
if "%opt%"=="4" exit
goto Menu

:FullClean
echo.
echo [+] BASTAN-E TEAMSPEAK...
taskkill /f /im "ts3client_win32.exe" > NUL 2>&1
taskkill /f /im "ts3client_win64.exe" > NUL 2>&1
echo [OK] TS3 KILLED.

:CacheOnly
echo.
echo [+] HAZF-E CACHE...
set "TS3_PATH=%APPDATA%\TS3Client"
for %%F in (resolved.dat cache.dat cache\webserverlist.dat cache\webserverlistcache.dat urls.db) do (
    if exist "%TS3_PATH%\%%~F" (
        del /f /q "%TS3_PATH%\%%~F" >nul 2>&1
        echo [OK] %%~nxF HAZF SHOD.
    )
)
if "%opt%"=="3" (pause & goto Menu)

:HostsOnly
echo.
echo [+] REFE-E MASDODIYAT (HOSTS)...
set "HOSTS_FILE=%SystemRoot%\System32\drivers\etc\hosts"
attrib -r "%HOSTS_FILE%" >nul 2>&1

:: Adding blacklist entries
findstr /C:"127.0.0.1 blacklist.teamspeak.com" "%HOSTS_FILE%" >nul || (echo 127.0.0.1 blacklist.teamspeak.com >> "%HOSTS_FILE%")
findstr /C:"127.0.0.1 blacklist2.teamspeak.com" "%HOSTS_FILE%" >nul || (echo 127.0.0.1 blacklist2.teamspeak.com >> "%HOSTS_FILE%")

attrib +r "%HOSTS_FILE%" >nul 2>&1
echo [OK] HOSTS UPDATED.

:Done
echo.
echo    ------------------------------------------------------
echo       AMALIYAT BA MOVAFAGHIYAT ANJAM SHOD.
echo       POWERED BY SILVER - DEV BY MOHAMMAD ^& VIP3R
echo    ------------------------------------------------------
echo.
echo [?] DOST DARID TS3 DOBARE BAZ SHAVAD? (Y/N)
set /p runts=" >> "
if /i "%runts%"=="Y" (
    if exist "C:\Program Files\TeamSpeak 3 Client\ts3client_win64.exe" (
        start "" "C:\Program Files\TeamSpeak 3 Client\ts3client_win64.exe"
    ) else if exist "C:\Program Files (x86)\TeamSpeak 3 Client\ts3client_win32.exe" (
        start "" "C:\Program Files (x86)\TeamSpeak 3 Client\ts3client_win32.exe"
    ) else (
        echo [!] ERROR: MASIR-E NASB-E TS3 YAFT NASHOD.
        pause
    )
)

echo KHOSH BEGZARE!
timeout /t 3 >nul
exit