@echo off
rc resd.rc
dmd -ofimprimir.dll -L/IMPLIB imprimir.d dllmain.d imprimir.def
dmd lerDll.d imprimir.lib resd.res
"C:\Program Files\Microsoft Visual Studio\VC98\Bin\link" /dump /exports imprimir.dll /out:imprimir.txt
path=%bcc32%
bcc32 -w-  lerimprimir
del *.obj  *.tds *.lib

