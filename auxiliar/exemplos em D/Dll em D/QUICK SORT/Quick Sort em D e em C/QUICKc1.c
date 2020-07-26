/*  ORDENACAO QUICKSORT  RECURSIVA */

#include<stdio.h>
#include<stdlib.h>

#define maxi 10
#pragma resource "bcc32.RES"

void quick(int *a, int count);
void qs(int *a, int l,int r);

long troca=0,teste=0;
int cont;
int *a;

int main()
{     
   system("cls");
   
  /* tabela dinamica.*/
  a=(int *)(calloc(maxi,sizeof(int)));
  if (!a){
          printf ("\n\nErro: Memoria Insuficiente\n\n **");
          exit(1);
      }else{
          printf ("\n\n\tMemoria Alocada com Sucesso\n\n");
      }
  

    cont = 0;

  for(cont=0;cont<maxi;cont++)
	{
	 a[cont]=rand() %maxi;
	}

  printf("\n  Matriz gerada aleatoriamente:\n\n ");
  for(cont=0;cont<maxi;cont++){
		printf(" %i",a[cont]);
		}

  quick(a,maxi);

  printf("\n  --------------------------\n");

  printf("\n\n  %ld trocas efetuadas \n ",troca);
  printf("\n\n  %ld chamadas de recursao efetuadas \n ",teste);


  printf("\n  --------------------------\n  Matriz organizada:\n\n ");
  for(cont=0;cont<maxi;cont++){
		printf(" %i",a[cont]);
		}
  printf("\n\n ");
  free(a);			
  system("pause");
  return 0;

}

void quick(int *a, int count)
{
	qs(a, 0 , count-1);
}


/* ----------------------------*/
void qs(int *a, int l,int r)
{
  int x,y;
  int i,j;
  i=l; j=r;
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
