import imprimir;
import std.stdio;
import std.process;

int main(string[] argv)
{
	writefln("\n\nLendo a DLL.\n");
    imprima();
	writeln("\n\n ");
	wait(spawnShell("pause"));
    return 0;
}
