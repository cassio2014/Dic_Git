@echo off
dmd -ofauxiliares.dll -L/IMPLIB dll.d auxiliares.d auxiliares.def
del *.obj
move /y auxiliares.dll ../
move /y auxiliares.lib ../
cd ..

