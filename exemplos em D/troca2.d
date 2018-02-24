module troca2;

import std.stdio;
import std.process;


void troca(int[] a, int[] b, int x)
{
	a[x]=a[x]+b[x];
	b[x]=a[x]-b[x];
	a[x]=a[x]-b[x];
}

int main()
{
	int[] a = [5,1,4];
	int[] b = [9,2,7];
	int x=0;
	writeln("\n");
	writeln(a[x]," | ",b[x]);
	troca(a,b,x);
	writeln(a[x]," | ",b[x]);
	writeln("\n");
	//executeShell("pause");
	wait(spawnShell("pause"));
	return 0;
}
