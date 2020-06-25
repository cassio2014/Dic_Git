#include <stdio.h>
#include <windows.h>

#pragma resource "bcc.RES"

int maxi = 60000000;
int cont=0;

SYSTEMTIME lt;
DWORD tgt;
DWORD tct;
int tg;
int dife;

typedef void (WINAPI*Dfunc)(int *);
Dfunc CLASIFICAR;

typedef void (WINAPI*Dfun)();
//Dfun PAUSAR;
Dfun CLS;

typedef int (WINAPI*Dvar);
Dvar TOTAL_ITENS;

typedef long (WINAPI*Tvar);
Tvar TOTAL_RECURS;
Tvar TOTAL_TROCAS;


 //typedef int (WINAPI*Cfun)();
// Cfun gera;

int *a;

int main(){

    HINSTANCE hLib=LoadLibrary("funcoes.dll");
    if (!hLib)
    {
       printf("erro ao ler as funcoes.dll \n");
       system("pause");
       return 51;
    }

    CLASIFICAR=(Dfunc)GetProcAddress((HMODULE)hLib,"CLASIFICAR");
    TOTAL_ITENS=(Dvar)GetProcAddress((HMODULE)hLib,"TOTAL_ITENS");
    TOTAL_RECURS=(Tvar)GetProcAddress((HMODULE)hLib,"TOTAL_RECURS");
    TOTAL_TROCAS=(Tvar)GetProcAddress((HMODULE)hLib,"TOTAL_TROCAS");
    //gera=(Cfun)GetProcAddress((HMODULE)hLib,"rand");
    //PAUSAR=(Dfun)GetProcAddress((HMODULE)hLib,"PAUSAR");
    CLS=(Dfun)GetProcAddress((HMODULE)hLib,"CLS");

    *TOTAL_ITENS = maxi;

#define cls CLS()
//#define pausar PAUSAR()

   cls;

   a = (int *)malloc(maxi*sizeof(int));
   if (!a){
          printf ("\n\n\tErro: Memoria Insuficiente\n\n");
          system("pause");
          exit(1);
      }else{
          printf ("\n\n\t** Mem\242ria Alocada com Sucesso **\n\n");
      }

   /* tgt = tempo para geracao da tabela */
     tgt = GetTickCount();

  /* entrada de dados*/
  for(cont=0;cont<maxi;cont++)
	{
	   a[cont]=rand() %maxi;
	   /* a[cont]=gera(maxi); */
	}
   
   dife = GetTickCount()-tgt;
   if (dife < 0) dife=60 + dife;
   
  printf("\n\tMatriz de %d de itens, gerada aleatoriamente: %d ms\n\n ",maxi,dife);
 
  for(cont=0;cont<10;cont++)
    {
          printf(" %i",a[cont]);
    }


 /*
     Pega a Hora final*/
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
   
   dife = tg-tct;
   if (dife < 0) dife = 60 + dife;

 printf("\t  %d Trocas.\n\r\t  %d Recurs\344es.\n\r ",*TOTAL_TROCAS,*TOTAL_RECURS);

  printf("\tCLASIFICADA en %d segundos.\n\n",dife);
  printf("\tHora Final:   %2d:%02d:%02d.%02d\n\n",
  lt.wHour,
  lt.wMinute,
  lt.wSecond,
  lt.wMilliseconds);

    for(cont=0;cont<10;cont++)
    {
       printf(" %i",a[cont]);
     }
  
  printf("\n");
  system("pause");
  FreeLibrary((HMODULE)hLib);
  free(a);
  return 0;
}
