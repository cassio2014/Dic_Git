@echo off
rc dic.rc
dmd -O -D -release placar.d dic.res
cls
placar
del *.obj *.res

