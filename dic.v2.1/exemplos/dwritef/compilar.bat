@echo off
rc dwritef.rc
dmd dwritef.d dwritef.res
dmd Testedwritef.d dwritef.res
pause
del *.res *.obj
exit
