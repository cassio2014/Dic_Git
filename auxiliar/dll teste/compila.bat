@echo off
rc conversao.rc
cd dll
@call compila.bat
dmd conversao.d conversao.res
del *.obj *.res
exit

