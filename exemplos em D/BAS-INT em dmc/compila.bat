@echo off
dmd -d -O lerbas.d resouce.res
path=%bcc32%;%path%
bcc32 -w- bas-int.c
del *.obj *.map
cls
lerbas teste.bas
bas-int teste.bas




 
