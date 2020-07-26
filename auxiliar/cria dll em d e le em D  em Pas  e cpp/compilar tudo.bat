@echo off
rc resd.rc
dmd -ofimprimir.dll -L/IMPLIB imprimir.d dllmain.d imprimir.def
copy imprimir.dll ".\lendo a dll en D"
copy imprimir.lib ".\lendo a dll en D"
copy resd.res ".\lendo a dll en D"
dmd DlerDll.d  resd.res
path=%vb%
link /dump /exports imprimir.dll /out:imprimir.txt
path=%bcc32%
bcc32 -w-  lerimprimir
del *.obj
del *.tds
exit





