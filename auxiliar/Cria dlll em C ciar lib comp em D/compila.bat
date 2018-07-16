@echo off
rc imprimir.rc
path=%path%;%bcc32%
cls
bcc32 -w- -tWD imprimir.cpp
"C:\Program Files\Microsoft Visual Studio\VC98\Bin\link" /dump /exports imprimir.dll  > imprimir.txt
dll2def  imprimir.dll > imprimir.def
"C:\Program Files\Microsoft Visual Studio\VC98\Bin\lib" /def:imprimir.def /out:libimprimir.lib /machine:Ix86
coffimplib libimprimir.lib imprimir.lib
dmd -O -release lerdll.d imprimir.res imprimir.lib
#pause
del  *.obj
exit





