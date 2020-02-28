@echo off
rem **********************************************
rem dmd -O -shared  -offuncoes.dll funcoes.d dll.d e
rem dmd -O -lib -offuncoes.lib funcoes.d dll.d 
rem ***********************************************
dmd -O -release -m32 -offuncoes.dll -L/IMPLIB  funcoes.d dll.d defuncoes.def
criadef funcoes.dll
dmd -O -release -m32 test.d funcoes.res
path=%vb%;%path% 
vb6 Clasifica.vbp /Make
del *.obj
exit


 







