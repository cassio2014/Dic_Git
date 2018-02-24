module gotoxy;

import std.stdio;
import core.sys.windows.windows;

extern(C) int getch();
alias getch Tecla;

void gotoxy(short x=0, short y=0)
{
  	COORD VaPara;
	VaPara.X = cast(short) x;
	VaPara.Y = cast(short) y;
	HANDLE hStdOut = GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleCursorPosition(hStdOut,VaPara);
}

int main(){
    gotoxy(10,12);
    write("linha 12 coluna 10");stdout.flush;
	gotoxy;
	write("0:0");stdout.flush;
    gotoxy(0,12);
	write("012345678>");
	stdout.flush;
	Tecla;
    return 0;
}
