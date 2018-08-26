import std.stdio;
import std.conv;
extern (C) int kbhit();

void main()
{
	int contador;
	char c;
	for(contador=1;contador <=255;contador++)
	{
		if(contador % 3 == 0 || contador <= 14) writeln();
		c = to!char(contador);
		writef("alt + %3d = %-3c     ",contador,c);
	}
      while(!kbhit){stdout.flush();}
}
