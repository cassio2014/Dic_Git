@cls
@echo off
@rc funcoes.rc
@rc bcc.rc
@dmd -O -release test.d funcoes.res
@path=%bcc32%;%path%
@bcc32 -O -w- quickb.cpp 
@tccres -i tcc.rc -o tcc.o
@tcc -w -m32 quickc.c  tcc.o
pause
@del *.obj *.o *.tds
exit