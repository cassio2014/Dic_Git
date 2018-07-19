@echo off
criadef  imprimir.dll
rc resource.rc
path=%vc%;path
link /dump /exports imprimir.dll /out:imprimir.txt
lib /def:imprimir.def   /OUT:imp.lib /MACHINE:x86
path=%dc%;path
coffimplib imp.lib  imprimir.lib
dmd -O -release lerdll.d resource.RES imprimir.lib
#pause
del *.exp *.obj
@cls
@lerdll


