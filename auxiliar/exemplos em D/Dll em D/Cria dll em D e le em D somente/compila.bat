@echo off
rc mydll.rc
dmd -ofmydll.dll -L/IMPLIB mydll.d dll.d mydll.def
dmd teste.d mydll.lib mydll.res
"C:\Program Files\Microsoft Visual Studio\VC98\Bin\link" /dump /exports mydll.dll /out:mydll.txt
 cls
del *.obj
test
exit