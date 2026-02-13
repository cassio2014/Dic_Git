@echo on
tcc -m32 -shared imprimir.c
tcc -m32 lerc.c  imprimir.def 
dmd "C:\Program Files (x86)\Microsoft Visual Studio\VC98\Bin\lib" /def:imprimir.def /out:libimprimir.lib /machine:x86

coffimplib libimprimir.lib imprimir.lib

dmd lerDll.d imprimir.lib

pause





