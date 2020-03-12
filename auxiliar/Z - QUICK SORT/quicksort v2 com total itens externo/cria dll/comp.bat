@echo off
rc funcoes.rc
rem **********************************************
rem dmd -O -shared  -offuncoes.dll funcoes.d dll.d 
rem dmd -O -lib -offuncoes.lib funcoes.d dll.d 
rem ***********************************************
dmd -O -release -m32 -offuncoes.dll -L/IMPLIB  funcoes.d dll.d Dfuncoes.def
criadef funcoes.dll 
rem pause
path=%vc%;%path%
link /dump /exports funcoes.dll /out:funcoes.txt
rem "C:\Program Files (x86)\Microsoft Visual Studio\VC98\bin\"link /dump /exports funcoes.dll /out:funcoes.txt
call test.bat
@echo off
copy /y *.dll  ..\
copy /y *.dll ..\"ler a dll"
copy /y *.lib ..\
copy /y *.lib ..\"ler a dll"
copy /y *.txt ..\
copy /y *.def ..\
copy /y *.txt ..\"ler a dll"
copy /y *.def ..\"ler a dll"
exit


 







