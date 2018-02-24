@echo off
rc clsD.rc
dmd -O -release clsD.d clsD.res
del *.obj *.res