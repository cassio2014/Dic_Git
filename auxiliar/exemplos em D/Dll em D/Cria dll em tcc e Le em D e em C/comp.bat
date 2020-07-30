@echo off
path=c:\tcc;%path%
tcc -shared imprimir.c
"C:\Program Files (x86)\Microsoft Visual Studio\VC98\bin\link" /dump /exports   imprimir.dll /out:imprimir.txt
tcc lerc.c  imprimir.def 
"C:\Program Files (x86)\Microsoft Visual Studio\VC98\bin\lib" /def:imprimir.def /out:libimprimir.lib /MACHINE:X86
coffimplib libimprimir.lib  imprimir.lib
dmd lerdll.d resource.RES imprimir.lib
del *.exp *.obj




