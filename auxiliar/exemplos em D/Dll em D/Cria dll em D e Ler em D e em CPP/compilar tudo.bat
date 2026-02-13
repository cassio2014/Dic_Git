@echo off
cls
dmd -ofimprimir.dll -L/IMPLIB imprimir.d dllmain.d imprimir.def
dmd lerDll.d imprimir.lib resd.res
path=%bcc32%
bcc32 -w-  lerimprimir
del *.obj  *.tds *.lib
cls
lerDll 
cls
lerimprimir




