@echo off
rc Forca.rc
cls
cd dll
@call compila.bat
dmd forca.d forca.res
 
@del *.res
@del *.obj
pause
exit