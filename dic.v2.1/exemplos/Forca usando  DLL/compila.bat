@echo off
rc Forca.rc
cls
cd dll
@call compila.bat
dmd forca.d forca.res
#pause
@del *.res
@del *.obj
exit