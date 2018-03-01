@echo off
rc funcoes.rc
path=%path%;%bcc32%;c:\tcc
bcc32 -w- quick.cpp 
tcc -w quickc.c  resource.o -o quickc.exe
dmd  -O test.d funcoes.res
exit