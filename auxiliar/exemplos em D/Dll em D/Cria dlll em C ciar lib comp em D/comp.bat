@echo off
cls
rc imprimir.rc
path=%bcc32%;%path%
bcc32 -w- -tWD imprimir.cpp
"C:\Program Files\Microsoft Visual Studio\VC98\Bin\link" /dump /exports imprimir.dll /out:imprimir.txt
dll2def imprimir.dll > imprimir.def
"C:\Program Files\Microsoft Visual Studio\VC98\Bin\lib" /def:imprimir.def /out:libimprimir.lib /machine:x86
coffimplib libimprimir.lib imprimir.lib
dmd -O -release lerdll.d imprimir.res imprimir.lib
del *.obj
exit




