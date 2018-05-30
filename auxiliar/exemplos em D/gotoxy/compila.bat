@echo off
rc gotoxy.rc
dmd -O -release gotoxy.d gotoxy.res
del *.obj *.res