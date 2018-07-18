@echo off
cls
"C:\Program Files\Microsoft Visual Studio\VC98\Bin\link" /dump /exports imprimir.dll  > imprimir.txt
dll2def  imprimir.dll > imprimir.def
rename  imprimir.lib libimprimir.lib
coffimplib libimprimir.lib imprimir.lib
dmd -O -release lerdll.d imprimir.res imprimir.lib
#pause
del  *.obj
exit





