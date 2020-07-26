import std.stdio;
import std.process;
import std.random;
//import std.c.time;
import core.stdc.time ;
import std.datetime;
import std.algorithm;

int rand(int x) {
	auto r = uniform(0,x+1);
	return r;
}

void main() {

	auto tv = Clock.currTime();

	time_t startime, endtime;


	immutable max = 10_000_000;

	int [] tabela;
	tabela.length = max;
	writeln("\n\n\tGerando matriz com ",max," posicoes....\n ");
	int counter = 0;
	while (counter < tabela.length) {
		tabela[counter] = rand(max);
	  // write(tabela[counter],"\t");
		++counter;
	}

	tv = Clock.currTime();
	writeln("\tHora: ",
	        tv.hour,":",
	        tv.minute,":",
	        tv.second,"\n");//,".",tv.fracSec,"\n");
	writeln("\tclasificando....");
	time(&startime);
	//=====================
		sort(tabela);
	//=====================
	tv = Clock.currTime();
	time(&endtime);
	writeln("\tclasificada em ",endtime - startime," segundos!\n");
	writeln("\tHora: ",
	        tv.hour,":",
	        tv.minute,":",
	       tv.second,"\n");//,".",tv.fracSec);

	counter = 0;
	//while (counter < tabela.length) {
		//write(tabela[counter],"\t");
		//++counter;
	//}
	writeln("\n");
	wait(spawnShell("pause"));
}

