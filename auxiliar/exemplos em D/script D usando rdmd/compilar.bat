@echo off
rcc resource.rc
dmd -d -O -release main.d printe.d resource.res
del *.obj
cls
main

