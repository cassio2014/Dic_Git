@echo off
copy release\imprimir.dll
dll2def imprimir.dll > imprimir.def
"C:\Program Files\Microsoft Visual Studio 14.0\VC\bin\link" /dump /exports imprimir.dll /out:imprimir.txt
coffimplib release\imprimir.lib  imprimir.lib
dmd -O -release lerdll.d lerdll.res imprimir.lib 
dmd -O -d -release clasifica.d lerdll.res imprimir.lib
#pause





