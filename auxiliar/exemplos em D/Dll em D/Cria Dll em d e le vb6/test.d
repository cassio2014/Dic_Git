module test;

import funcoes;
import std.stdio;
import std.datetime;

pragma(lib, "funcoes");

int maxi = 1_000_000;
int Ti;
int Tf;
int Td;

void main() 
{
	int[] tabela;
	tabela.length = maxi;

   ToTALNUMEROS(maxi);
 	
	auto tv = Clock.currTime;
	CLS; //FUNÇÃO cls na dll
	writeln("\n\tGerando Tabela com ",maxi," posicoes....\n ");
	write("\tTabela = { ");

	int contador=0;
	while(contador < tabela.length)
	{
		tabela[contador] = RAND(maxi);
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
	//=======FUNÇÃO NA DLL =========
		 CLASIFICAR(tabela.ptr);
	//==============================
	tv = Clock.currTime;
	Tf=tv.second;
	Td=Tf - Ti;
	if (Td < 0) Td = 60 + Td;
	// TOTALTROCAS  Rotinas NA DLL
	// TOTALRECURS  Rotinas NA DLL
	long trocas = 0;
    trocas = TOTALTROCAS;
	long recursao = 0;
	recursao = TOTALRECURS;
	writeln("\tclasificada em ",Td," segundos.!!!\n");
	writeln("\t",trocas," Trocas efetuadas.");
	writeln("\t",recursao," Chamada de recursao efetuadas.");
	write("\n\tHorario final  : ",
	      tv.hour,":",
	      tv.minute,":",
	      tv.second,"\n\n");

	write("\tTabela = { ");
	//contador=0;
  //  while(contador < tabela.length)
  //  {
     // write(tabela[contador]," ");
//	    contador++;
//	}
	write("}.");
	writeln("\n");
	PAUSAR;
}
