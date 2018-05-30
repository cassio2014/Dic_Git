import std.string;
import std.stdio;
import std.c.stdlib;
import std.conv:to;
import std.format;import core.thread;extern(C) int kbhit();

long hexToLong(string s)
{
	long v = strtoul(toStringz(s), null, 16);
	return v;
}

void numtofomatstr(ref string s, ...) {
	void putc(dchar c) {
		s ~= c;
	}
	doFormat(&putc, _arguments, _argptr);
}

/** TENTA EXIBIR ALGUMA COISA
 PREVIAMENTE MONTADA */
void ler(T...)(T args)
{
	writef("%s  ",args);
}

void main()
{
	string testString;
	string numerohexa = "A";
	long numero =hexToLong(numerohexa);
	writeln("numero hexa ",numerohexa," = ",numero," em decimal.");
	numtofomatstr(testString,"%X", numero);
	writeln("numero decimal ",numero," em hexa = ",testString,".\n\n");
	writefln("Binary     : %b", numero);
	writefln("Octal      : %o", numero);
	writefln("Hexadecimal: \\x%04X", numero);
	writefln("Decimal    : %d\n\n", numero);
	int i;
	string d;

	for(i=1;i<=255;i++)
	{
		if(i % 13 == 0)writeln();
		numtofomatstr(d,"\\x%02X", i);
		writef("%s ",d);
		//ler(d);
		d="";
	}
    while(!kbhit()){stdout.flush();}}
