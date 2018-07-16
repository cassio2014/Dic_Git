@echo off
tcc -shared imprimir.c
"C:\Program Files\Microsoft Visual Studio\VC98\bin\link" /dump /exports   imprimir.dll /out:imprimir.txt
call vai
windres -O coff lerc.rc -o lerc.o	
tcc lerc.c  imprimir.def lerc.o
"C:\Program Files\Microsoft Visual Studio\VC98\bin\lib" /def:imprimir.def /out:libimprimir.lib /MACHINE:X86
coffimplib libimprimir.lib  imprimir.lib
dmd lerdll.d resource.RES imprimir.lib
del *.exp *.obj




