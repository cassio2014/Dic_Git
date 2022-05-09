@echo off
rc dic.rc
dmd -m32 -O -release EX_dicconv.d dic.res .\lib32\dic.lib
rem pause
cls
EX_dicconv
del *.obj


