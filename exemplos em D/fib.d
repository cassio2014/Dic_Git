import std.stdio;
//import std.process;
import std.math;
import std.conv;

long fib(long n)
{
	if (n <= 2)
		return 1;
	else
	{
		return fib(n-1) + fib(n-2);
		//printf("%d\t",x);
		//return x;
	}
		
	    
}
long n;
int main(string[] args)
{

	if (args.length < 2) {
		printf("usage: fib n\n"
			   "Compute nth Fibonacci number\n");
		//system("pause");	   
		return 1;
	}

	n = to!long(args[1]);
	writeln("fib(",n,") = ",fib(n));
	//system("pause");
	return 0;

}
