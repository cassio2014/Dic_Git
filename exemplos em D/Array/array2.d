module array2;

import std.string;
import std.stdio;
import std.process;

struct dicionario
{
	string[]  palavra;
	string[]  definição;
}

void main()
{
	auto portugues = 
		dicionario(["Arroz",
			"Feijao",
			"Queijo",
			"Cassio",
			"Pao"],
		["tipo Agulinha.",
			"tipo Tropeiro.",
			"branco de minas.",
			"meu criador claro.",
			"Com mortandela."]);
	
	writeln(portugues.palavra[0]," ",portugues.definição[0]);
	writeln(portugues.palavra[1]," ",portugues.definição[1]);
	writeln(portugues.palavra[2]," ",portugues.definição[2]);
	writeln(portugues.palavra[3]," ",portugues.definição[3]);
	writeln(portugues.palavra[4]," ",portugues.definição[4]);
	writefln("");
	wait(spawnShell("pause"));
}