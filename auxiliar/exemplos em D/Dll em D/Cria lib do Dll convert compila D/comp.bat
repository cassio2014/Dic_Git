@echo off
criadef  imprimir.dll
rc resource.rc
set vc="C:\Program Files (x86)\Microsoft Visual Studio\VC98\Bin\"
%vc%lib /def:imprimir.def   /OUT:imp.lib /MACHINE:x86
coffimplib imp.lib  imprimir.lib
dmd -O lerdll.d resource.RES imprimir.lib
del *.exp *.obj
@cls
@lerdll


