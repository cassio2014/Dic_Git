@echo off
rc ScreenBuffer.rc
dmd ScreenBuffer.d ScreenBuffer.res
del *.obj