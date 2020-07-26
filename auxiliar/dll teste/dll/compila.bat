@echo off
dmd -ofdici.dll -L/IMPLIB dll.d dici.d dici.def

move /y dici.dll ../
move /y dici.lib ../
del *.obj
cd ..


