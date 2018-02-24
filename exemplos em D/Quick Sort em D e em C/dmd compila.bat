@echo off
rc resource.rc
dmd -O -release -d Clasifica_sort_interno.d resource.res
dmd -O -release -d rand.d resource.res
dmd -O -release -d sort2.d resource.res
dmd -O -release -d QUICK.d resource.res
dmd -O -release -d Quick_D.d resource.res
del *.obj *.pdb