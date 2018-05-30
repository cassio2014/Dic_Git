module clsd;

import std.stdio;
import core.sys.windows.windows;

extern (C) int getch();

void cls()
 {
 HANDLE hout;
 DWORD nc, ncw;
 auto home = COORD(0,0);
 hout=GetStdHandle(STD_OUTPUT_HANDLE);
 CONSOLE_SCREEN_BUFFER_INFO sbi;
 GetConsoleScreenBufferInfo(hout,&sbi);
 nc=sbi.dwSize.X * sbi.dwSize.Y;
 FillConsoleOutputAttribute(hout,sbi.wAttributes,nc,home,&ncw);
 FillConsoleOutputCharacterA(hout,' ',nc,home,&ncw);
 SetConsoleCursorPosition(hout,home);
 }
 
 int main(){
     
    writeln("linha 0");
    writeln("linha 1");
    writeln("linha 2");
    writeln("linha 3");
    writeln("linha 4");
    writeln("\npara apagar tecle algo");
    getch;
    cls;
    writeln("\n\n\tApagou tudo,\n\nTecle algo para sair...");
    getch;
    return 0;
 }
