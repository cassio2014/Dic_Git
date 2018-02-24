@echo off
rc dic.rc
dmd -O -release EX_dwrite.d dic.res .\lib32\dic.lib
cls
EX_dwrite
del *.obj





