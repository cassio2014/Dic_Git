@echo off
cls
"C:\Program Files\Microsoft Visual Studio\VB98\vb6.exe" /m Cmult.vbp
dmd -ofcmult.dll -L/IMPLIB cmult.d dll.d cmult.def
"C:\Program Files\Microsoft Visual Studio\VC98\Bin\link" /dump /exports cmult.dll /out:cmult.txt
dmd  -O -release lercmult.d cmult.lib cmult.RES
path=%bcc32%
bcc32 -w- teste.cpp
#pause
del *.obj *.tds 
cls
exit





