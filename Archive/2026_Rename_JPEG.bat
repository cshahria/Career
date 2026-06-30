@echo off
setlocal enabledelayedexpansion

:: Get a locale‑independent timestamp
for /f "skip=1 tokens=1 delims=." %%t in ('wmic os get LocalDateTime') do (
    set ts=%%t
    goto :break
)
:break

:: Extract components
set YYYY=%ts:~0,4%
set MM=%ts:~4,2%
set DD=%ts:~6,2%
set HH=%ts:~8,2%
set MIN=%ts:~10,2%
set SS=%ts:~12,2%

set count=1

for %%f in (*.jpg) do (
    ren "%%f" "%YYYY%_%MM%%DD%%SS%_!count!.jpg"
    set /a count+=1
)

echo Done.
pause
