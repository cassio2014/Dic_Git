@echo off
rc funcoes.rc
dmd  -O clasifica.d funcoes.lib funcoes.RES
del *.obj
