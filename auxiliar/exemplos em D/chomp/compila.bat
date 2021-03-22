@echo off
rc chomp.rc
dmd -O -release chomp.d chomp.res
del *.obj *.res
