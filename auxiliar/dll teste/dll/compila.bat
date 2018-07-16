@echo off
dmd -ofdici.dll -L/IMPLIB dll.d dici.d dicid.def
criadef dici.dll
move /y dici.dll ../
move /y dici.lib ../
move /y dici.def ../
del *.obj
cd ..


