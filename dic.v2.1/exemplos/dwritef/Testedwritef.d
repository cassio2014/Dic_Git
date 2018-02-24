module Testedwritef;

import std.stdio;
import std.process;
import dic.dic;
import core.stdc.locale;

pragma(lib, "dic");


/** 
Flags (can be used together)
- flush left
+ print the sign
# print in the alternative way
0 print zero-filled

space print space-filled
Format Specifiers

s default
b binary
d decimal
o octal
x,X hexadecimal
f,F floating point in the standard decimal notation
e,E floating point in scientific notation
a,A floating point in hexadecimal notation
g,G as e or f

( element format start
) element format end
| element delimiter
We have been using f

private @property  trustedStdout() @trusted
{
	return stdout;
}

void dwritef(string, A...)(in string fmt, A args)
{
	string frase = dicconv(fmt);
	trustedStdout.writef(frase, args);  
}

void dwritefln(string, A...)(in string fmt, A args)
{
	string frase = dicconv(fmt);
	trustedStdout.writefln(frase, args);  
}
*/
int main(){
	setlocale(LC_NUMERIC, "");
	int value = 120;
	writeln("\n");
	dwritefln("Valor      :║%d",value);
	dwritefln("Hexadecimal:║%x", value);
	dwritefln("Octal      :║%o", value);
	dwritefln("Binario    :║%b\n\n",value);
	
 dwritefln("R$%6.2f", 26.55);
 dwritefln("R$%6.02f", 6.7);
 
	dwritefln("\n\n %1$d ║ %1$x ║ %1$o ║ %1$b\n",value);
	dwritefln("10 espaços a direita  :║%10s║", value);
	dwritefln("10 espaços a esquerda :║%-10s║\n", value);

	dwriteln;
	wait(spawnShell("pause"));
	return 0;
}
