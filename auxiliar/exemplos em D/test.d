module test;

import std.stdio;
import core.thread;

extern(C) int kbhit();
alias pausar = kbhit;

bool[8191] flags;
pragma(msg, "Estou compilando......");

int main()
{
	int i, count, prime, k, iter;

	writefln("10 iterations");
	for (iter = 1; iter <= 10; iter++)
	{
		count = 0;
		flags[] = 1;
		for (i = 0; i < flags.length; i++)
		{
			if (flags[i])
			{
				prime = i + i + 3;
				k = i + prime;
				while (k < flags.length)
				{
					flags[k] = 0;
					k += prime;
				}
				count += 1;
			}
		}
	}
	writefln("%d primes", count);
	while(!pausar){stdout.flush();}
	return 0;
}
