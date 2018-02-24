import funcoes;
import std.stdio;
import std.datetime;
import dic.dic;

pragma(lib,"dic");
pragma(lib,"funcoes");

int maxi =  600000;
int Ti;
int Tf;
int Td;

void main() {

	int[] tabela;
	tabela.length = maxi;
 	TOTAL_ITENS = maxi;

    auto tv = Clock.currTime;
	CLS;
	dwriteln("\n\tGerando Tabela com ",maxi," posições....\n ");
	write("\tTabela = {Gerando");
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
	//==============================
		 CLASIFICAR(tabela.ptr);
	//==============================
	tv = Clock.currTime;
	Tf=tv.second;
	Td=Tf - Ti;
	writeln("\tclasificada em ",Td," segundos.!!!\n");
	writeln("\t",TOTAL_TROCAS," Trocas efetuadas.");
	writeln("\t",TOTAL_RECURS," Chamada de recursao efetuadas.");
	write("\n\tHorario final  : ",
	      tv.hour,":",
	      tv.minute,":",
	      tv.second,"\n\n");

	write("\tTabela = {Gerada");
	contador=0;
// 	while(contador < tabela.length){
//		write(tabela[contador]," ");
//		contador++;
//	}
 	write("}.");
	writeln("\n");
	PAUSAR;
}
