#include <stdio.h>
#include <windows.h>

#pragma resource "bcc32.RES"

int maxi = 60000000;
int cont=0;

SYSTEMTIME lt;
DWORD tgt;
DWORD tct;
int tg;

typedef void (WINAPI*Dfunc)(...);
Dfunc CLASIFICAR;

typedef void (WINAPI*Dfun)();
Dfun PAUSAR;
Dfun CLS;

typedef int (WINAPI*Dvar);
Dvar TOTAL_ITENS;

typedef long (WINAPI*Lvar);
Lvar TOTAL_RECURS;
Lvar TOTAL_TROCAS;


typedef int (WINAPI*Cfun)(...);
Cfun GERAR;



int main(){

    HINSTANCE hLib=LoadLibrary("funcoes.dll");
    if (!hLib)
    {
       printf("erro ao ler a fun‡äes.dll \n");
       system("pause");
       return 51;
    }

    CLASIFICAR=(Dfunc)GetProcAddress((HMODULE)hLib,"CLASIFICAR");
    TOTAL_ITENS=(Dvar)GetProcAddress((HMODULE)hLib,"TOTAL_ITENS");
    TOTAL_RECURS=(Lvar)GetProcAddress((HMODULE)hLib,"TOTAL_RECURS");
    TOTAL_TROCAS=(Lvar)GetProcAddress((HMODULE)hLib,"TOTAL_TROCAS");
    GERAR=(Cfun)GetProcAddress((HMODULE)hLib,"RAND");
    PAUSAR=(Dfun)GetProcAddress((HMODULE)hLib,"PAUSAR");
    CLS=(Dfun)GetProcAddress((HMODULE)hLib,"CLS");

    *TOTAL_ITENS = maxi;

#define pausar PAUSAR()
#define cls CLS()

   cls;
   int *a;
   a = (int *)malloc(maxi*sizeof(int));
   if (!a){
          printf ("\n\n\tErro: Mem¢ria Insuficiente\n\n");
          pausar;
          exit(1);
      }else{
          printf ("\n\n\t** Mem¢ria Alocada com Sucesso **\n\n");
      }

  /* tgt = tempo para gera‡Æo da tabela */
     tgt = GetTickCount();

  /* entrada de dados*/
  for(cont=0;cont<maxi;cont++)
	{
	   //a[cont]=rand() %maxi;
	    a[cont]=GERAR(maxi);
	}

  printf("\n\tMatriz de %d de itens, gerada aleatoriamente: %d ms\n\n ",maxi,GetTickCount()-tgt);

  printf("\t{");
  /*
  for(cont=0;cont<maxi;cont++)
    {
          printf(" %i",a[cont]);
    }
	*/
  printf(" }\n\n");


    /* Pega a Hora final*/
     GetLocalTime(&lt);
     printf("\tHora inicial: %2d:%02d:%02d.%02d\n\n",
	 lt.wHour,
	 lt.wMinute,
	 lt.wSecond,
	 lt.wMilliseconds);
     printf("\r\tCLASIFICANDO....\n");

    /*  tct = Tempo para clasificar a taleba inicial */
    tct = lt.wSecond;
 /* aqui clasificamos a tabela
  ============================*/
       CLASIFICAR(a);          /*
  ============================
   tg - Tempo Gasto            */
    GetLocalTime(&lt);
   tg = lt.wSecond;
 printf("\t  %d Trocas.\n\r\t  %d Recursäes.\n\r ",*TOTAL_TROCAS,*TOTAL_RECURS);

  printf("\tCLASIFICADA en %d segundos.\n\n",tg-tct);
  printf("\tHora Final:   %2d:%02d:%02d.%02d\n\n",
    lt.wHour,
    lt.wMinute,
	lt.wSecond,
	lt.wMilliseconds);

    printf("\t{");
	/*
    for(cont=0;cont<maxi;cont++)
    {
       printf(" %i",a[cont]);
     }
	 */
    printf(" }\n\n");

  pausar;
  FreeLibrary((HMODULE)hLib);
  free(a);
  return 0;
}
