module Quick_D;

import std.stdio;
import std.random;
import std.algorithm;
import std.process;
import core.stdc.stdio;
import core.stdc.time ;

int rand(int x) {
	auto r = uniform(0,x+1);
	return r;
}

void Qs(int[] a, int l,int r)
{
	int x,y;
	int i=0,j=0;
	i=l; j=r;
	x = a[((l + r) / 2)];

	// ordenacao
	do
	{
		while(a[i] < x && i < r ) i++;
		while(x < a[j] && j > l ) j--;
		if(i<=j)
		{
			y=a[i];
			a[i]=a[j];
			a[j]=y;
			i++;
			j--;
			troca++;
		}
	} while(i<=j);

	if(l<j) { Qs(a, l , j); teste++; }
	if(i<r) { Qs(a, i , r); teste++; }
}

void Quick(int[] a)
{
	int count = a.length;
	Qs(a, 0 , count-1);
}
long troca=0,teste=0;

//******************************
void main() {
	// pego a hora do systema
	time_t startime, endtime;

	// crio a tabela dinamoca
	immutable int max = 60000000;//0;
	int [] tabela;
	tabela.length = max;
	int [] Qtabela;
	Qtabela.length = max;

	writeln("\n\tGerando matriz com ",max," posicoes....");
	write("\tGerando...");
	writeln();
	int counter = 0;

	time(&startime);
	while (counter < tabela.length)
    {	tabela[counter] = rand(max);
		// Duplico a tabela <tabela> em <Qtabela>
		Qtabela[counter] = tabela[counter];
		++counter;
	}
	time(&endtime);
	writeln("\tGerada em ",endtime - startime," segundos!\n");

	writeln("\tOrdeno a <tabela> pelo nodo interno \"tabela.sort\".");
    writeln("\n\tClasificando...\t\t\t\t",tabela[8]," - ",Qtabela[8]);

	time(&startime);
	//=======================
	     // tabela.sort;
	     sort(tabela);
	//=======================
	time(&endtime);

	writeln("\tclasificada em ",endtime - startime," segundos!\n");

//	counter = 0;
//	while (counter < tabela.length) {
//		write(tabela[counter]," ");
//		++counter;
//	}

	// Tabela <Qtabela> manipulada por recursao
	writeln("\tOrdeno a <Qtabela> pelo metodo criado \"Quick(Qtabela)\".");
	writeln("\n\tClasificando...\t\t\t\t",tabela[8]," - ",Qtabela[8]);

	time(&startime);
	//===========================
	      Quick(Qtabela);
	//===========================
	time(&endtime);

	writeln("\tclasificada em ",endtime - startime," segundos!\t\t",tabela[8]," - ",Qtabela[8],"\n");
	writeln("\t",troca," Tocas efetuadas.");
	writeln("\t",teste," Chamadas de recursao efetuadas.");
//	for(int cont=0;cont < Qtabela.length;cont++){
//		write(Qtabela[cont], " ");
//	}

	writeln("\n");
	wait(spawnShell("pause"));
}

