@echo off
copy release\imprimir.dll
coffimplib release\imprimir.lib  imprimir.lib

dmd -O lerdll.d lerdll.res imprimir.lib 
dmd -O clasifica.d lerdll.res imprimir.lib

pause