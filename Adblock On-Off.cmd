@echo off
cd C:\Windows\System32\drivers\etc\
IF NOT EXIST "C:\Windows\System32\drivers\etc\adblock-enabled" (
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
