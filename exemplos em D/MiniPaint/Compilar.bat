@echo off
rc MiniPaint.rc
dmd -O -release MiniPaint.d MiniPaint.RES
del *.obj
