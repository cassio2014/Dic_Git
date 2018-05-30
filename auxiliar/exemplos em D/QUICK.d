//   ORDENACAO QuickSortSORT  RECURSIVA
import std.stdio;
import std.process;
import std.random;

immutable int max = 20;
// Rotina para criar numeros inteiros randomicos
int rand(uint x)
{
	uint r = uniform(0,x+1);
	return r;
}

long troca;
long recursao;

void  main()
{
	troca=0;
	recursao=0;
	int[] a;
	a.length = max;
  	int cont=0;
  printf("\n\tMatriz de %d itens gerada aleatoriamente:\n\n\r\t[",max);

  for(cont=0;cont<max;cont++)
	{
		a[cont]=rand(max);
	}

	for(cont=0;cont<max;cont++)
	{
		printf(" %i",a[cont]);
	}
	printf(" ]\n\n\r");
	printf("\tClasificando...\n\r");
//====================
        QuickSort(a);
//====================
	printf("\tClasificada.\n");
    printf("\n\t%ld Trocas efetuadas.",troca);
    printf("\n\t%ld Chamadas de recursao efetuadas.\n ",recursao);

    printf("\n\tA Matriz organizada:\n\n\r\t[");
	for(cont=0;cont<max;cont++)
	{
		printf(" %i",a[cont]);
	}
	printf(" ]\n\n");
	wait(spawnShell("pause"));
}

//=======================
void QuickSort(int[] a)
{
	qs(a, 0 , max-1);
}
//========================

void qs(int[] a, int l,int r)
{

  int x,y;
  int i=0,j=0;
  i=l;
  j=r;
  x=a[((l+r)/2)];

// ordenacao
  do
  {
		while(a[i]< x && i<r ) i++;
		while(x<a[j] && j>l ) j--;
		if(i<=j)
			{
			     y = a[i];
			  a[i] = a[j];
			  a[j] = y;
				i++;
				j--;
				troca++;
			}
  } while(i<=j);

  if(l<j) { qs(a, l , j); recursao++; }
  if(i<r) { qs(a, i , r); recursao++; }
}
