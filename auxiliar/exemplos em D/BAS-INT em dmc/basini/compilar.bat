@echo off
rc basic-in.rc
path=%bcc32%;%path%
bcc32 -w- bas-int.c
del *.tds *.obj
cls
bas-int teste.bas
