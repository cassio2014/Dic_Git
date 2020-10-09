@echo off
rc dic.rc
dmd -m64 -O -release EX_dicconv.d dic.res .\lib64\dic.lib
pause
cls
EX_dicconv
del *.obj


