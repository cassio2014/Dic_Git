@echo off
rc resource.rc
"C:\Program Files\Microsoft Visual Studio\VC98\bin\link" /dump /exports imprimir.dll /out:imprimir.txt
dll2def  imprimir.dll > imprimir.def
"C:\Program Files\Microsoft Visual Studio\VC98\bin\lib" /def:imprimir.def   /OUT:imp.lib /MACHINE:x86
coffimplib imp.lib  imprimir.lib
dmd -O -release lerdll.d resource.RES imprimir.lib
del imp.lib *.exp *.obj
@cls
@lerdll


