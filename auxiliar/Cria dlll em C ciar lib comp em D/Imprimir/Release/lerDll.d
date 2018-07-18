module lerDll;

import imprimir;
import std.stdio;

extern (C) int getch();

int main(string[] argv)
{
	//alias _imprima imprima;

	writeln("\n\nLendo....\n");
	imprima();
	writeln("\n\nTecle algo para sair..... ");
	getch;
   	return 0;
}
