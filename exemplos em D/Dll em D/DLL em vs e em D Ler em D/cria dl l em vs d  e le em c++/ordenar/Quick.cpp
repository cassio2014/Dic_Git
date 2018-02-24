#include <stdio.h>
#include <windows.h>

int maxi = 60000000;
int cont=0;

SYSTEMTIME lt;
DWORD tgt;
DWORD tct;
DWORD tg;

typedef void (WINAPI*Dfunc)(...);
Dfunc CLASIFICAR;

typedef void (WINAPI*Dfun)();
Dfun PAUSAR;
Dfun CLS;

typedef int *Dvar;
Dvar TOTAL_ITENS;

typedef long *Lvar;
Lvar TOTAL_RECURS;
Lvar TOTAL_TROCAS;

 //typedef int (WINAPI*Cfun)(...);
 //Cfun gera;

 //=============================================
int main(){

   HINSTANCE hLib=LoadLibrary(TEXT("funcoes.dll"));

    if (!hLib) 
    { 
       printf("erro ao ler a funcoes.dll \n"); 
       system("pause");
       return 51; 
    }

    CLASIFICAR=(Dfunc)GetProcAddress((HMODULE)hLib,"CLASIFICAR");
    TOTAL_ITENS=(Dvar)GetProcAddress((HMODULE)hLib,"TOTAL_ITENS");
    TOTAL_RECURS=(Lvar)GetProcAddress((HMODULE)hLib,"TOTAL_RECURS");
    TOTAL_TROCAS=(Lvar)GetProcAddress((HMODULE)hLib,"TOTAL_TROCAS");
   // gera=(Cfun)GetProcAddress((HMODULE)hLib,"RAND");
    PAUSAR=(Dfun)GetProcAddress((HMODULE)hLib,"PAUSAR");
    CLS=(Dfun)GetProcAddress((HMODULE)hLib,"CLS");
    
    *TOTAL_ITENS = maxi;

#define cls CLS()
#define pausar PAUSAR()
    
   cls;
   int *a;    
   a = (int *)malloc(maxi*sizeof(int));
   if (!a){
          printf ("\n\n\tErro: Memoria Insuficiente\n\n");
          pausar;
          exit(1);
      }else{
          printf ("\n\n\t** Memoria Alocada com Sucesso **\n\n");
      }      
          
  /* tgt = tempo para geração da tabela */
     tgt = GetTickCount();

  /* entrada de dados*/
  for(cont=0;cont<maxi;cont++)
	{
	   a[cont]=rand() %maxi;
	   //a[cont]=gera(maxi);
	}

  printf("\n\tMatriz de %d itens, gerada aleatoriamente: %d ms\n ",maxi,GetTickCount()-tgt);
  
	//for(cont=0;cont<maxi;cont++)
	//{
	//		printf(" %i",a[cont]);
	//}
    /* Pega a Hora final*/
     GetLocalTime(&lt);
     printf("\n\n\tHora inicial: %2d:%02d:%02d.%02d\n\n", 
	 lt.wHour, 
	 lt.wMinute,
	 lt.wSecond, 
	 lt.wMilliseconds);
     printf("\r\tCLASIFICANDO....");
   
/*  tct = Tempo para clasificar a taleba inicial */
    tct = lt.wSecond;
 /* aqui clasificamos a tabela
  ============================*/
       CLASIFICAR(a);          /*
  ============================
   tg - Tempo Gasto            */ 
   GetLocalTime(&lt);
   tg = lt.wSecond;
 printf("\n\t  %d Trocas.\n\r\t  %d Recursoes.\n\r ",*TOTAL_TROCAS,*TOTAL_RECURS);
 int Temg = tg - tct;
 if (Temg < 0) Temg =Temg + 60;
  printf("\tCLASIFICADA en %d segundos.\n\n", Temg );
  printf("\tHora Final:   %2d:%02d:%02d.%02d\n\n",
    lt.wHour, 
    lt.wMinute,
	lt.wSecond, 
	lt.wMilliseconds);
  
/*    for(cont=0;cont<maxi;cont++)
    {
       printf(" %i",a[cont]);
     }
 */  
  printf("\n\n");
  pausar;
  FreeLibrary((HMODULE)hLib);
  free(a);
  return 0;
}
