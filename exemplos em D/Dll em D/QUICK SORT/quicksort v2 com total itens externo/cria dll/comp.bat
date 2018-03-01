@echo off
rc funcoes.rc
dmd -O -offuncoes.dll -L/IMPLIB funcoes.d dll.d 
dll2def funcoes.dll  
"C:\Program Files\Microsoft Visual Studio\VC98\bin\"link /dump /exports funcoes.dll /out:funcoes.txt
@copy *.dll  ..\
@copy *.dll ..\"ler a dll"
@copy *.lib ..\
@copy *.lib ..\"ler a dll"
@copy *.txt ..\
@copy *.def ..\
@copy *.txt ..\"ler a dll"
@copy *.def ..\"ler a dll"
del *.obj
call test.bat
exit


 







