@echo off
path=%path%;%bcc32%;c:\tcc
bcc32  quick.cpp 
tcc  quickc.c  resource.o -o quickc.exe
dmd  -O test.d funcoes.res
exit