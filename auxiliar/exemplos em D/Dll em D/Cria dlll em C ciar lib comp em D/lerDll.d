module lerDll;

import imprimir;
import std.stdio;
import std.process;

int main(string[] argv)
{
	alias _imprima imprima;
	writefln("\n\nLendo....\n");
    imprima();
	writeln("\n\n ");
	wait(spawnShell("pause"));
    return 0;
}
