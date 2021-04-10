@echo off
rc funcoes.rc
criadef funcoes.dll
dmd  -O clasifica.d funcoes.lib funcoes.RES
del *.obj
