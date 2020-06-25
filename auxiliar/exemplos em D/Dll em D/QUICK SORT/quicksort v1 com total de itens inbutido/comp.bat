@echo off
path=%path%;%bcc32%;c:\tcc
tcc  quickc.c  resource.o
bcc32 -w quick.cpp 
pause
del *.obj *.tds