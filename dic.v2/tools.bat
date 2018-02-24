@echo off
rc dic2.rc
dmd -O -release caracter.d dic2.res
dmd -O -release alt_numero.d dic2.res
dmd -O -release utf_asc.d dic2.res
del *.obj *.res


