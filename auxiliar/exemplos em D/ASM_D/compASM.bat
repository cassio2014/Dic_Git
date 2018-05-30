@echo off
rc asm.rc
dmd -O -release asm.d asm.res
del *.obj *.res
