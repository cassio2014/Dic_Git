@echo off
@rc funcoes.rc
@rc bcc.rc
rem ********************
@dmd teste.d funcoes.res
rem ********************
@path=%bcc32%;%path%
@bcc32  -w- quickb.cpp 
rem ********************
@tccres -O coff tcc.rc -o tcc.o
@tcc -w -m32 quickc.c  tcc.o
rem ********************
pause
del *.obj *.o *.tds
exit