@echo off
rem **********************************************
rem dmd -O -shared  -offuncoes.dll funcoes.d dll.d 
rem dmd -O -lib -offuncoes.lib funcoes.d dll.d 
rem ***********************************************
dmd -O  -offuncoes.dll -L/IMPLIB  funcoes.d dll.d funcoes.def
rem pause
criadef funcoes.dll > Minha_funcoes.def  
path=%vb%;%path%
vb6 Clasifica.vbp /Make
del *.obj
call test.bat
exit


 







