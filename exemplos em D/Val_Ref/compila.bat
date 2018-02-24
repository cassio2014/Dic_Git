@echo off
rc Val_Ref.rc
dmd -O -release Val_Ref.d Val_Ref.res
del *.obj *.res
