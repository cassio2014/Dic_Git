@echo off
rc funcoes.rc
dmd -d -O clasifica.d funcoes.lib funcoes.RES
del *.obj
