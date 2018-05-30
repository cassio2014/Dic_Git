module array3;

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
	string[][string] conjunto;
	conjunto["palavras"]   = ["Arroz","Feijao","Queijo","Cassio","Pao"];
	conjunto["definições"] = ["tipo agulinha.","tipo tropeiro.","branco de minas.","o meu criador claro.","Com mortandela."] ;
	
	dicionario Dicionario;
	Dicionario.palavra   ~= conjunto["palavras"];
	Dicionario.definição ~= conjunto["definições"];
	
	writeln(Dicionario.palavra[0]," ",Dicionario.definição[0]);
	writeln(Dicionario.palavra[1]," ",Dicionario.definição[1]);
	writeln(Dicionario.palavra[2]," ",Dicionario.definição[2]);
	writeln(Dicionario.palavra[3]," ",Dicionario.definição[3]);
	writeln(Dicionario.palavra[4]," ",Dicionario.definição[4]);
	writefln("");
	wait(spawnShell("pause"));
}