@echo off
copy "C:\Windows\System32\drivers\etc\hosts" "C:\Windows\System32\drivers\etc\hosts-adblock"
SET CurrentDir=%~dp0
type "%CurrentDir%etc\hosts-adblock.example" >> "C:\Windows\System32\drivers\etc\hosts-adblock"
copy "%CurrentDir%etc\Adblock On-Off.cmd" "C:\Windows\System32\drivers\etc\Adblock On-Off.cmd"
copy "%CurrentDir%etc\Adblock On-Off.lnk" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Adblock On-Off.lnk" 
cls
IF NOT EXIST "C:\Windows\System32\drivers\etc\hosts-adblock" (
color 0C
echo Setup Failed
pause
) ELSE (
color 0A
echo Setup Completed
pause
)


