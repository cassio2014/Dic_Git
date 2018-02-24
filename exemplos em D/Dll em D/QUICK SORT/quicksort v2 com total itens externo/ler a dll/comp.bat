@echo off
dmd -d -O -release clasifica.d funcoes.lib funcoes.RES
del *.obj
clasifica
exit
