@echo off
cls
dmd -ofimprimir.dll -L/IMPLIB imprimir.d dllmain.d imprimir.def
dmd lerDll.d imprimir.lib resd.res
"C:\Program Files\Microsoft Visual Studio 14.0\VC\bin\link" /dump /exports imprimir.dll /out:imprimir.txt
path=%bcc32%
bcc32 -w-  lerimprimir
pause
del *.obj  *.tds *.lib
cls
lerDll 
cls
lerimprimir




