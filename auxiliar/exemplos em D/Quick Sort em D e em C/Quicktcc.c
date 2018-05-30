/*  ORDENACAO QUICKSORT  RECURSIVA */

#include<stdio.h>
#include <stdlib.h>
#include<windows.h>

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
	 
  /*
 typedef struct _SYSTEMTIME {
    WORD wYear;
    WORD wMonth;
    WORD wDayOfWeek;
    WORD wDay;
    WORD wHour;
    WORD wMinute;
    WORD wSecond;
    WORD wMilliseconds;
  } SYSTEMTIME, *PSYSTEMTIME;
*/  

/* Pega a hora do systena local.*/  
    
    GetLocalTime(&lt);
  
  
    
  printf("\n\n\tHora inicial: %2d:%02d:%02d.%02d\n\n", lt.wHour, lt.wMinute,lt.wSecond, lt.wMilliseconds);

  /* tgt = tempo para geração da tabela */
   tgt = GetTickCount();

  /* entrada de dados*/
  for(cont=0;cont<maxi;cont++)
	{
	 a[cont]=rand() %maxi;
	}

  printf("\tMatriz de %d de itens, gerada aleatoriamente: %d ms\n\n ",maxi,GetTickCount()-tgt);
  for(cont=0;cont<maxi;cont++){
		/*printf(" %i",a[cont]);*/
		}

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
   

  
 // for(cont=0;cont<maxi;cont++){
		
        //  printf(" \t%i",a[cont]);
          //printf("\n\n ");
      
		  // }
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
