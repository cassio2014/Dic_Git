@echo off
rc conversao.rc
cd dll
@call compila.bat
dmd conversao.d conversao.res 
' pause
del *.obj
exit

