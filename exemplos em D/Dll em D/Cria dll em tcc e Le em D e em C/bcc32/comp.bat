@echo off
path=%bcc32%;%path%
bcc32 lerc.c imprimir.lib
del *.obj *.tds




