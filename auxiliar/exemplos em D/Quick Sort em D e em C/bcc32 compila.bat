@echo off
path=%path%;%bcc32%
bcc32 -w- quickc.c
bcc32 -w- quickc1.c
del *.obj *.tds


