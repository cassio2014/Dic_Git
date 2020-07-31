@echo off
path=%tc%;%path%
tcc -m32 quicktcc.c tccres.o
pause


