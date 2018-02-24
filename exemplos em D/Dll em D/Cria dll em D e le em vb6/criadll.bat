@echo off
cls
"C:\Program Files\Microsoft Visual Studio\VB98\vb6.exe" /m cmuti.vbp
dmd -ofcmult.dll -L/IMPLIB cmult.d dll.d cmult.def
"C:\Program Files\Microsoft Visual Studio\VC98\Bin\link" /dump /exports cmult.dll /out:cmult.txt
exit




