@echo off
cls
dmd -ofmydll.dll -L/IMPLIB mydll.d dll.d mydll.def
"C:\Program Files\Microsoft Visual Studio\VC98\bin\link" /dump /exports mydll.dll /out:mydll.txt
path=%path%;%bcc32%
bcc32 -w- lermydll
del *.obj *.tds 
exit







