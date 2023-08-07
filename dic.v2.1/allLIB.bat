@echo off
dmd -lib -D -oflib32\dic.lib dic\dic.d dic\linguas.d dic\portugues.d 
dmd -m64 -lib -D -oflib64\dic.lib dic\dic.d dic\linguas.d dic\portugues.d 
exit
