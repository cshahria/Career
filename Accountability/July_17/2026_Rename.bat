@echo off
setlocal enabledelayedexpansion

:: Get current date/time components
for /f "tokens=1-6 delims=/: " %%a in ("%date% %time%") do (
    set YYYY=%%c
    set MM=%%a
    set DD=%%b
    set HH=%%d
    set MIN=%%e
    set SS=%%f
)

:: Remove milliseconds if present (Windows 11 often includes them)
for /f "tokens=1 delims=." %%s in ("!SS!") do set SS=%%s

set count=1

for %%f in (*.jpeg) do (
    ren "%%f" "!YYYY!_!MM!!DD!!SS!_!count!.jpeg"
    set /a count+=1
)

echo Done.
pause
