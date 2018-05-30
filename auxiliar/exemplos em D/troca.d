module troca;

import std.stdio;
import std.process;


void troca( ref int a, ref int b)
{
	a=a+b;
	b=a-b;
	a=a-b;
}
int main()
{
	int a = 5;
	int b = 8;

	writeln(a," | ",b);
	troca(a,b);
	writeln(a," | ",b);
	writeln();
	wait(spawnShell("pause"));
	//system("pause");
	return 0;
}
