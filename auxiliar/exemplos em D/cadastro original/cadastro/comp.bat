@echo off
rc cadastro.rc
dmd -O -release cadastro.d cadastro.res
del *.obj *.res
exit



