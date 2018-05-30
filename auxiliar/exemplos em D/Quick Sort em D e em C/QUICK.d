//   ORDENACAO QuickSortSORT  RECURSIVA
module QUICK;

import std.stdio;
import std.process;
import std.random;
import core.stdc.time;

immutable  max = 60_000_000;

// Rotina para criar numeros inteiros randomicos
int rand(int x){

	int r = uniform(0,x+1);
	return r;
}

void QuickSort(int[] a);
void qs(int[] a, int l,int r);
long troca;
long recursao;

void  main()
{
	// pego a hora do systema
	time_t startime, endtime;
	troca=0;
	recursao=0;
	int[] a;
	a.length = max;
	int cont=0;

	writeln("\n\tMatriz de ", max ," itens gerada aleatoriamente:\n\tGerando....");

    time(&startime);
    write("\n\t{ Gerada");
	for(cont=0;cont<max;cont++)
	{ a[cont]=rand(max);
	//  write(a[cont]," ");
	  }
	writeln(" }\n");
    time(&endtime);

    writeln("\tGerada em ",endtime - startime," segundos!\n");
	writeln("\tClasificando...");

	time(&startime);
	//====================
	      QuickSort(a);
	//====================
	time(&endtime);

    //writeln("inicial : ",startime," final :",endtime);
	writeln("\tClasificada em ",endtime - startime," segundos!");
	writef("\n\t%d Trocas efetuadas.",troca);
	writef("\n\t%d Chamadas de recursao efetuadas.\n ",recursao);

	writeln("\n\tA Matriz organizada.\n");

    write("\t{ Clasificada ");
//	for(cont=0;cont<max;cont++)
//	{ write(a[cont]," ");}
	writeln("}\n\n");


	wait(spawnShell("pause"));
}



//=======================
void QuickSort(int[] a)
{ qs(a, 0 , a.length-1);}
//========================

void qs(int[] a, int l,int r)
{
	int x,y;
	int i=0,j=0;
	i=l; j=r;
	x=a[((l+r)/2)];

	// ordenacao
	do
	{
		while(a[i]< x && i<r ) i++;
		while(x<a[j] && j>l ) j--;
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

	if(l<j) { qs(a, l , j); recursao++; }
	if(i<r) { qs(a, i , r); recursao++; }
}
