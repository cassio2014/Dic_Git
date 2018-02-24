@echo off
rc menu.rc
dmd -O -release -of"menu teste.exe" menu.d menu.res
"menu teste"
del *.obj *.res





