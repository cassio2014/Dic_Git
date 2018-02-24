@echo off
dmd -ofquicksort.dll -L/IMPLIB quicksort.d dll.d quicksort.def
dmd test.d quicksort.lib quick.res
del *.obj
test

 







