@echo off
rc dic.rc
dmd -O -release caracter.d dic.res
dmd -O -release alt_numero.d dic.res
dmd -O -release utf_asc.d dic.res
del *.obj *.res


