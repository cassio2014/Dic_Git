@echo off
criadef quicksort.dll > quick.def
dmd clasificar.d quicksort.lib QuickSort.RES
del *.obj
clasifica
