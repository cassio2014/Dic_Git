import funcoes;

import std.stdio;
import std.datetime;
pragma(lib, "funcoes");

int maxi = 60_000_000;
int Ti;
int Tf;
int Td;

void main() {
	int[] tabela;
	tabela.length = maxi;

	TOTAL_ITENS = maxi; // variavel da dll

	auto tv = Clock.currTime;
	CLS; // funsao na dll
	writeln("\n\tGerando Tabela com ",maxi," posicoes....\n ");
	write("\tTabela = { ");
	int contador=0;
	while(contador < tabela.length)
	{
		tabela[contador] = RAND(maxi); // rand funsao na dll
		//write(tabela[contador]," ");
		contador++;
	}
	write("}.");
	tv = Clock.currTime;
	Ti=tv.second;
	write("\n\n\tHorario inicial : ",
	      tv.hour,":",
	      tv.minute,":",
	      tv.second);

	writeln("\n\n\tclasificando....");
	//=======FUNSAO NA DLL =========
		 CLASIFICAR(tabela.ptr);
	//==============================
	tv = Clock.currTime;
	Tf=tv.second;
	Td=Tf - Ti;
	if (Td < 0) Td = 60+Td;
	
	// TOTAL_TROCAS  VARIAVEL NA DLL
	// TOTAL_RECURS   VARIAVEL NA DLL
	writeln("\tclasificada em ",Td," segundos.!!!\n");
	writeln("\t",TOTAL_TROCAS," Trocas efetuadas.");
	writeln("\t",TOTAL_RECURS," Chamada de recursao efetuadas.");
	write("\n\tHorario final  : ",
	      tv.hour,":",
	      tv.minute,":",
	      tv.second,"\n\n");

	write("\tTabela = { ");
//	contador=0;
//	while(contador < tabela.length){
//		write(tabela[contador]," ");
//		contador++;
//	}
	write("}.");
	writeln("\n");
	PAUSAR;
}
