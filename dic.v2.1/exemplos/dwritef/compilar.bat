@echo off
rc dwritef.rc
dmd  dwritef.d dwritef.res 
dmd  Testedwritef.d dwritef.res 

del *.res *.obj

