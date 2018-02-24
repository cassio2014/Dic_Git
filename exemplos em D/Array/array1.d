module array1;

import std.string;
import std.stdio;
import std.process;

import dic.dic;

pragma(lib,"dic");

struct dicionario
{
	string[]  palavra= ["Arrôz","Feijão","Queijo","Cássio","Pão"];
	string[]  definição= [
	"tipo agulinha.",
	"tipo trôpeiro.",
	"branco de minas.",
	"o meu criador claro.",
	"Com mortandela."];
}

void main()
{
	dicionario Portugues;
	dwriteln(Portugues.palavra[0]," ",Portugues.definição[0]);
	dwriteln(Portugues.palavra[1]," ",Portugues.definição[1]);
	dwriteln(Portugues.palavra[2]," ",Portugues.definição[2]);
	dwriteln(Portugues.palavra[3]," ",Portugues.definição[3]);
	dwriteln(Portugues.palavra[4]," ",Portugues.definição[4]);
	writefln("");
	wait(spawnShell("pause"));
}
