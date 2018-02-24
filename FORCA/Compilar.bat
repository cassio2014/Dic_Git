@echo off
rc forca.rc
dmd -O -release forca.d forca.res
del *.obj
exit
