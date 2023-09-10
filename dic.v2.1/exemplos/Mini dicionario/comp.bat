@echo off
rc rc.rc
rc DIC.rc
dmd -O -release Dicionario1.d rc.res
dmd -O -release Dicionario2.d dic.res
pause
del *.obj *.res

