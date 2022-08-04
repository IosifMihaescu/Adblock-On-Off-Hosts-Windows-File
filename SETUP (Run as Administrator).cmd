@echo off

SET CurrentDir=%~dp0
copy /y "%CurrentDir%etc\Adblock On-Off.cmd" "C:\Windows\System32\drivers\etc\Adblock On-Off.cmd"
IF EXIST "C:\Windows\System32\drivers\etc\adblock-enabled" (
ren "C:\Windows\System32\drivers\etc\hosts" hosts-adblock
del "C:\Windows\System32\drivers\etc\hosts-adblock"
ren "C:\Windows\System32\drivers\etc\hosts-default" hosts
del "C:\Windows\System32\drivers\etc\adblock-enabled"
) ELSE (
cls
)
copy /y "C:\Windows\System32\drivers\etc\hosts" "C:\Windows\System32\drivers\etc\hosts-adblock"
SET CurrentDir=%~dp0
type "%CurrentDir%etc\hosts-adblock.example" >> "C:\Windows\System32\drivers\etc\hosts-adblock"
IF EXIST "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Adblock ON.lnk" (
del "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Adblock ON.lnk"
) ELSE (
cls
)
IF EXIST "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Adblock OFF.lnk" (
del "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Adblock OFF.lnk"
) ELSE (
cls
)
IF EXIST "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Adblock On-Off.lnk" (
del "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Adblock On-Off.lnk"
copy /y "%CurrentDir%etc\Adblock OFF.lnk" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Adblock OFF.lnk" 
) ELSE (
copy /y "%CurrentDir%etc\Adblock OFF.lnk" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Adblock OFF.lnk" 
)
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


