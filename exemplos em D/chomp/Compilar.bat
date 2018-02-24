@echo off
rc chomp.rc
dmd -O -release chomp.d chomp.RES
del *.obj
