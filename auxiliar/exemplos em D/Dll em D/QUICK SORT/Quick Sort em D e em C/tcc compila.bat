@echo off

rem ********************
@tccres -O coff tcc.rc -o tcc.o
@tcc -w -m32 quicktcc.c  tcc.o
rem ********************




