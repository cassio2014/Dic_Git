@echo off
dmd -O -release ScreenBuffer.d ScreenBuffer.RES
del *.obj
