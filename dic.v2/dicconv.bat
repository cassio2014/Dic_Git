@echo off
@rc dic.rc
dmd -O -release EX_dicconv.d dic.res .\lib32\dic.lib
del *.obj
exit


