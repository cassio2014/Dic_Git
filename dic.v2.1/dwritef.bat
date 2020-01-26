@echo off
rc dic.rc
dmd -O -release dwritef.d dic.res ./lib32/dic.lib
cls
dwritef
del *.obj


