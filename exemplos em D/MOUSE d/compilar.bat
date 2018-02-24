@echo off
rc mouse.rc
dmd -O -release moused.d mouse.res
del *.obj *.res
