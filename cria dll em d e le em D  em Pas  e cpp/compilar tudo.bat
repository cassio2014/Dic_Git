@echo off
rc resd.rc
dmd -ofimprimir.dll -L/IMPLIB imprimir.d dllmain.d imprimir.def
copy imprimir.dll ".\lendo a dll en D"
copy imprimir.lib ".\lendo a dll en D"
dmd DlerDll.d  resd.res
"C:\Program Files\Microsoft Visual Studio\VC98\Bin\link" /dump /exports imprimir.dll /out:imprimir.txt
path=%bcc32%
bcc32 -w-  lerimprimir
C:\lazarus\lazbuild.exe lerdll.lpi
del *.obj
rd .\lib /s /q
rd .\backup /s /q
exit





