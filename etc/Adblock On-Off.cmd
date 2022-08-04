@echo off
cd C:\Windows\System32\drivers\etc\
IF NOT EXIST "C:\Windows\System32\drivers\etc\adblock-enabled" (
ren "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Adblock OFF.lnk" "Adblock ON.lnk"
ren "C:\Windows\System32\drivers\etc\hosts" hosts-default
ren "C:\Windows\System32\drivers\etc\hosts-adblock" hosts
type nul > adblock-enabled
ipconfig /flushdns
cls
color 0A
echo Adblock Enabled
choice /T 3 /C X /D X /N
exit
) ELSE (
ren "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Adblock ON.lnk" "Adblock OFF.lnk"
ren "C:\Windows\System32\drivers\etc\hosts" hosts-adblock
ren "C:\Windows\System32\drivers\etc\hosts-default" hosts
del "C:\Windows\System32\drivers\etc\adblock-enabled"
ipconfig /flushdns
cls
color 0C
echo Adblock Disabled
choice /T 3 /C X /D X /N
exit
)
