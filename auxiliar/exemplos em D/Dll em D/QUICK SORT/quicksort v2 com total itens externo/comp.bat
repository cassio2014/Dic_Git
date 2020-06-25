@echo off
rc funcoes.rc
rc bcc.rc
dmd -O -release test.d funcoes.res
path=%bcc32%;c:\tcc
bcc32 -O -w- quickb.cpp 
pause
rem call c:\TDM-GCC-64\vai.bat
path=%cobol%;%path%
windres -O coff tcc.rc -o tcc.o	
tcc -w  quickc.c  tcc.o
del *.obj *.o *.tds
exit