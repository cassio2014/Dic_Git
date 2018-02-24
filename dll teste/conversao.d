module conversao;

import std.stdio;
import std.string;

import dici;
pragma(lib, "dici");

extern(C) int getch();
alias getch tecle;


int main(string[] args)
{
	
	writeln("\n\n\tExemplo.\n");
	
	string a = "\261";//   \261 = ▒
	writeln("\t",a," = Usando scaps \\261.\n");
	
	string b = achar("▒"); // usando funsão achar.
	writeln("\t",b," = Usando achar(\"",achar("▒"),"\").\n");
   
	write("\tTecle algo para sair..."); 
	stdout.flush;
	tecle;
	
	return 0;
}
