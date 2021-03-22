@echo off
rc Barraprog.rc
dmd -O progress.d teste.d Barraprog.res -ofBarraprog.exe
del *.obj
exit

 



