@echo off
rc dic.rc
dmd -O -D -release placar.d dic.res
del *.obj *.res
cls
placar


