@echo off
rc Basic-in.rc
path=%bcc32%;%path%
bcc32 -w- BAS-INT.C
del *.obj *.tds *.res
cls
BAS-INT teste.bas
exit
