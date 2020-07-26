/*  ORDENACAO QUICKSORT  RECURSIVA */

#include<stdio.h>
#include<windows.h>
#include <stdlib.h>// necessário p/ as funções rand() e srand()
#include <time.h>//necessário p/ função time()


#define maxi 60000000 
#pragma resource "bcc32.RES"

void quick(int *a, int count);
void qs(int *a, int l,int r);

long troca=0,teste=0;
int cont=0;
SYSTEMTIME lt; 
DWORD tgt;
DWORD tct;
int tg;
int *a;

int xx;
int yy; 
  
int main()
{    

    system("cls");
    /* alocação dinamica das matriz : int a[max];*/

    a = (int *)calloc(maxi,sizeof(int));
     
   if (!a){
          printf ("\n\n\tErro: Memoria Insuficiente\n\n");
          system("pause");
          exit(1);
      }else{
          printf ("\n\n\t** Memoria Alocada com Sucesso **");
      }      

/* Pega a hora do systena local.*/  
    
    GetLocalTime(&lt);
    
  printf("\n\tHora inicial: %2d:%02d:%02d.%02d\n\n", lt.wHour, lt.wMinute,lt.wSecond, lt.wMilliseconds);

  /* tgt = tempo para geração da tabela */
   tgt = GetTickCount();

	srand(time(NULL));

  /* entrada de dados*/
  for(cont=0;cont<maxi;cont++)
	{
	 a[cont]=rand() % maxi;
	}

  printf("\tMatriz de %d de itens, gerada aleatoriamente: %d ms\n\n ",maxi,GetTickCount()-tgt);
  for(cont=0;cont<7;cont++){
		printf(" %i",a[cont]);
		}
		printf("\n\n");
  /*  tct = Tempo para clasificar a taleba inicial */		
  tct = GetTickCount();
  
 /* aqui clasificamos a tabela
  ============================*/
       quick(a,maxi);         /*
  ============================*/

   /* Pega a Hora final*/
   GetLocalTime(&lt);
   
   /* tg = Tempo Gasto em Segundos*/
   tg = (GetTickCount() - tct) /1000;
   
  printf("\tMatriz organizada em %d segundos.\n\n",tg);
 
  printf("\t%ld trocas efetuadas \n",troca);
  printf("\t%ld chamadas de recursao efetuadas \n\n",teste);
   
   printf("\tHora Final: %2d:%02d:%02d.%02d\n\n", lt.wHour, lt.wMinute,lt.wSecond, lt.wMilliseconds);
   printf("\t");
  for(cont=0;cont<maxi;cont++){
        yy = cont;
        if ((a[cont] >= 0) && ( a[cont] <= 10 )) 
		{
		  xx = cont + 1;
		  if ( a[yy] != a[xx]  )
		  {
		       printf("%i ",a[cont]);
		  } 
		 }
			 else
		 {
		 	break;
		 }
	
   }
         printf("\n\n ");
      
  system("pause");
  return 0;

}

void quick(int *a, int count)
{
	qs(a, 0 , count-1);
}


/* ==============================================*/
void qs(int *a, int l,int r)
{
  int x,y;
  int i;
  int j;
  i=l;
  j=r;
  x=a[(l+r)/2];

/* ordenacao*/
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

  if(l<j) { qs(a, l , j); teste++; }
  if(i<r) { qs(a, i , r); teste++; }
}
