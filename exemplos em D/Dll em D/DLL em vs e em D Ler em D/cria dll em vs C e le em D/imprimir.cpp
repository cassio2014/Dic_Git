//*********************************************************
//                  Subs e Funcoes
//*********************************************************
#include <stdio.h>
#include <windows.h>

#define DLL_EXPORTAR extern "C"  __declspec(dllexport)

  // função de inicialização da DLL
 BOOL APIENTRY
 DllMain(HANDLE hModule, DWORD dwReason, LPVOID lpReserved)
 {
        return TRUE;
 }


void qs(int *, int ,int );

DLL_EXPORTAR
void CLS(){
  system("cls");
}

DLL_EXPORTAR
void PAUSAR(){
   system("pause");
}

DLL_EXPORTAR
 int TOTAL_ITENS=0;

DLL_EXPORTAR
 int TOTAL_TROCAS=0;

DLL_EXPORTAR
 int TOTAL_RECURS=0;

DLL_EXPORTAR
void CLASIFICAR(int *a)
{
	qs(a, 0 , TOTAL_ITENS-1);
}

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
				TOTAL_TROCAS++;
			}
  } while(i<=j);

  if(l<j) { qs(a, l , j); TOTAL_RECURS++; }
  if(i<r) { qs(a, i , r); TOTAL_RECURS++; }
}
