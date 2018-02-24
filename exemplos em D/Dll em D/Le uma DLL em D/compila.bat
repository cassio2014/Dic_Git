@echo off
dmd test.d mydll.lib mydll.res
"C:\Program Files\Microsoft Visual Studio\VC98\bin\link"/dump /exports mydll.dll /out:mydll.txt
exit
