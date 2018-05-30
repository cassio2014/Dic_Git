@echo off
rc array.rc

rc arraydic.rc


dmd -O -release array1.d arraydic.res

dmd -O -release array2.d array.res
dmd -O -release array3.d array.res
dmd -O -release array4.d array.res
dmd -O -release array5.d array.res
del *.obj *.res
exit
