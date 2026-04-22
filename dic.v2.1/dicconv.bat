@echo off
rc dic.rc
dmd -O -release EX_dicconv.d dic.res .\lib32\dic.lib
pause
cls
EX_dicconv
del *.obj

