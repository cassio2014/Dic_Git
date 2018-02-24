module clasifica;

import funcoes;

import std.stdio;
import std.datetime;
import std.random;

int rand(int a) {
	auto r = uniform(0,a + 1);
	return r;
}	


int maxi = 60000000;

MonoTime  Ti; // tempo inicial
MonoTime  Tf; // tempo final
Duration  Td; // tempo difirença

void main() {

	int[] tabela;
	tabela.length = maxi; 
 	TOTAL_ITENS = maxi;
	
    Ti = MonoTime.currTime;
	CLS;
    stdout.flush();
	writeln("\n\tGerando Tabela com ",maxi," posicoes....\n ");
	write("\tTabela = { ");
	int contador=0;
    stdout.flush();
	while(contador < tabela.length)
	{
		tabela[contador] = rand(maxi);
		//write(tabela[contador]," ");
		contador++;
	}
	write("}.");
    Tf = MonoTime.currTime;
    Td = Tf - Ti;
	write("\n\n\tTabela Gerada em ",Td.seconds," segundos.");
    Ti = MonoTime.currTime;
	writeln("\n\n\tclasificando....");
    stdout.flush();
	//==============================
		 CLASIFICAR(tabela.ptr);
	//==============================
    stdout.flush();

    Tf = MonoTime.currTime;
    Td = Tf - Ti;


	write("\tclasificada em ");
    writeln(Td.seconds," segundos.!!!\n");
	writeln("\t",TOTAL_TROCAS," Trocas efetuadas.");
	writeln("\t",TOTAL_RECURS," Chamada de recursao efetuadas.");

	write("\n\tTabela = { ");
//	contador=0;
// 	while(contador < tabela.length){
//		write(tabela[contador]," ");
//		contador++;
//	}
 
	write("}.");
	writeln("\n");
	PAUSAR;
	
}
