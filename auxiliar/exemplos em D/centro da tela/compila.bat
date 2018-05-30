@echo off
dmd -O -release  janela.d janela.RES -L-Subsystem:Windows:4 -version=ANSI
#pause
del *.obj 
exit

