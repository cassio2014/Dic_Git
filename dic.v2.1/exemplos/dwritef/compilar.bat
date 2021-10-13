@echo off
rc dwritef.rc
dmd -m64 dwritef.d dwritef.res 
dmd -m64 Testedwritef.d dwritef.res 

del *.res *.obj

