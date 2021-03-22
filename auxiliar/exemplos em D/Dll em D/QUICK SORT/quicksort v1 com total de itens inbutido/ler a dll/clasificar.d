module clasificar;

import quicksort;
import std.stdio;
import std.process;
import std.random;

pragma(lib, "quicksort");

int rand(int x) {
	auto r = uniform(0,x+1);
	return r;
}

immutable int max = 20;

void main() {

	int[] tabela;
	tabela.length = max; 


	writeln("\n\tGerando matriz com ",max," posicoes....\n ");
	write("Tabela = { ");
	int contador=0;
	while(contador < tabela.length)
	{
		tabela[contador] = rand(max);
		write(tabela[contador]," ");
		contador++;
	}
	write("}.");

	writeln("\n\n\tclasificando....");
	//==============================
		 clasifica(tabela.ptr,max);
	//==============================
	writeln("\tclasificada!\n");
	write("Tabela = { ");
	contador=0;
	while(contador < tabela.length){
		write(tabela[contador]," ");
		contador++;
	}
	write("}.");
	writeln("\n");
	wait(spawnShell("pause"));
}
