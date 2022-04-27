@echo off
rc Basic-in.rc
path=C:\Borland\BCC55\Bin;%path%
bcc32 -w- BAS-INT.C
del *.obj *.tds *.res
cls
BAS-INT teste.bas
exit
