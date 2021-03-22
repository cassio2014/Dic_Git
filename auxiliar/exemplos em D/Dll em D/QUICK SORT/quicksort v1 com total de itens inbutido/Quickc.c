#include <stdio.h>
#include <windows.h>

#pragma resource "bcc32.RES"

int maxi = 6000000;
int cont=0;

SYSTEMTIME lt;
DWORD tgt;
DWORD tct;
int tg;

typedef void (WINAPI*Dfunc)();
Dfunc clasifica;
int *a;

int main(){
    HINSTANCE hLib=LoadLibrary("quicksort.dll");
    if (!hLib) { printf("erro ao ler a quicksort.dll \n"); system("pause");return 51; }
    clasifica=(Dfunc)GetProcAddress((HMODULE)hLib,"clasifica");
     
   a = (int *)malloc(maxi*sizeof(int));
   if (!a){
          printf ("\n\n\tErro: Memoria Insuficiente\n\n");
          system("pause");
          exit(1);
      }else{
          printf ("\n\n\t** Memoria Alocada com Sucesso **\n");
      }      
        
    GetLocalTime(&lt);
    printf("\n\n\tHora inicial: %2d:%02d:%02d.%02d\n\n", lt.wHour, lt.wMinute,lt.wSecond, lt.wMilliseconds);

  /* tgt = tempo para gera‡Æo da tabela */
     tgt = GetTickCount();

  /* entrada de dados*/
  for(cont=0;cont<maxi;cont++)
	{
	 a[cont]=rand() %maxi;
	}

  printf("\n\tMatriz de %d de itens, gerada aleatoriamente: %d ms\n\n ",maxi,GetTickCount()-tgt);
  for(cont=0;cont<maxi;cont++)
    {
         /* printf(" %i",a[cont]);*/
    }

  /*  tct = Tempo para clasificar a taleba inicial */
  tct = GetTickCount();

 /* aqui clasificamos a tabela
  ============================*/
       clasifica(a,maxi);      /*
  ============================*/

    /* Pega a Hora final*/
     GetLocalTime(&lt);

    /* tg = Tempo Gasto em Segundos*/
    tg =(GetTickCount() - tct) /999;

    printf("\n\n\tMatriz organizada em %03d segundos.\n\n",tg);
    printf("\tHora Final: %2d:%02d:%02d.%02d\n\n", lt.wHour, lt.wMinute,lt.wSecond, lt.wMilliseconds);
    for(cont=0;cont<maxi;cont++)
   {
            /* printf("\t%i",a[cont]);*/
     }

  printf("\n");
  getch();
  FreeLibrary((HMODULE)hLib);
  free(a);

  return 0;

}
