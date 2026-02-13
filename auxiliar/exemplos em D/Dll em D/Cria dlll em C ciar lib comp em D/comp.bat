@echo off
cls
rc imprimir.rc
path=%bcc32%
bcc32 -w- -tWD imprimir.cpp
dll2def imprimir.dll > imprimir.def

lib /def:imprimir.def /out:libimprimir.lib /machine:x86

pause
coffimplib libimprimir.lib imprimir.lib
pause

dmd -O -release lerdll.d imprimir.res imprimir.lib
del *.obj
exit




