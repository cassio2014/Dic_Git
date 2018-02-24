@echo off
dmd -O -release -offuncoes.dll -L/IMPLIB funcoes.d dll.d funcoes.def
criadef funcoes.dll > func.def  
"C:\Program Files\Microsoft Visual Studio\VC98\bin\"link /dump /exports funcoes.dll /out:funcoes.txt

@copy *.dll  ..\
@copy *.dll ..\"ler a dll"
@copy *.lib ..\
@copy *.lib ..\"ler a dll"
@copy *.txt ..\
@copy *.def ..\
@copy *.txt ..\"ler a dll"
@copy *.def ..\"ler a dll"
#pause
del *.obj
exit


 







