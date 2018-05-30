module troca1;

import std.stdio;
import std.process;


void troca(int[] a, int i, int j)
{
	a[i]+=a[j];
	a[j]=a[i]-a[j];
	a[i]-=a[j];
}

int main()
{ //           0 1 2 3 4 5
	int[] a = [5,1,4,0,8,6];

	writeln(a);
	troca(a,0,3);
	troca(a,4,5);
	writeln(a);
	writeln();

	wait(spawnShell("pause"));
	return 0;
}
