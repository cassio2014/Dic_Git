@echo off
rc basic-in.rc
path=C:\Borland\BCC55\Bin;%path%
bcc32 -w- bas-int.c
del *.tds *.obj
cls
bas-int teste.bas
