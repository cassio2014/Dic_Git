@echo off
tccres tccres.rc tccres.o
tcc -m32 quicktcc.c tccres.o



