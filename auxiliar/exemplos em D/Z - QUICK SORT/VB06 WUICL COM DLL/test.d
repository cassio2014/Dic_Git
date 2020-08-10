module test;

import funcoes;
import std.stdio;
import std.datetime;
import dic.dic;

pragma(lib,"dic");
pragma(lib, "funcoes");

int maxi = 60_000_000;
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
		if (contador < 5)
		   write(tabela[contador]," ");
		contador++;

	}
	write("... }.");
	tv = Clock.currTime;
	Ti=tv.second;
	dwrite("\n\n\tHorário inicial : ",
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
	dwriteln("\t",recursao," Chamada de recursão efetuadas.");
	dwrite("\n\tHorário final  : ",
	      tv.hour,":",
	      tv.minute,":",
	      tv.second,"\n\n");

	write("\tTabela = { ");
	contador=0;
    while(contador < 15)//tabela.length)
    {
      //  if(contador % 8 == 0)write("\n ");
      write(tabela[contador]," "); //"\t");
	    contador++;
	}
	write("... }.");
	writeln("\n");
	PAUSAR;







}
