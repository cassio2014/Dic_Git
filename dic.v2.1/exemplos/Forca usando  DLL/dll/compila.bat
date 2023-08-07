@echo off
dmd -shared -ofauxiliares.dll -L=/implib: dll.d auxiliares.d

pause

move /y auxiliares.dll ../
move /y auxiliares.lib ../
cd ..

