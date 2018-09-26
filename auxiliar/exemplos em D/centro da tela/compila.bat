@echo off
ResourceHacker -open janela.rc -save janela.res -action compile -log NUL
dmd -O -release  janela.d janela.RES -L-Subsystem:Windows:4 -version=ANSI
#pause
del *.obj 
exit

