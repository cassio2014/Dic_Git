@echo off
rc funcoes.rc
rc bcc.rc
dmd -O test.d funcoes.res
path=%bcc32%;c:\tcc
bcc32 -O -w- quickb.cpp 
pause
rem call c:\TDM-GCC-64\vai.bat
path=%cobol%;%path%
windres -O coff tcc.rc -o tcc.o	
c:\tcc\tcc -w  quickc.c  tcc.o
pause
del *.obj *.o *.tds
exit