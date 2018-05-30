//*********************************************************
//                  Subs e Funcoes
//*********************************************************
#include <stdio.h>
#include "imprimir.h"
#include <windows.h>

  // função de inicialização da DLL
 BOOL APIENTRY
 DllMain(HANDLE hModule, DWORD dwReason, LPVOID lpReserved)
 {
        return TRUE;
 }

void imprima ()
{
    printf("ok a dll imprimir lida e esta funcionando...");
}

   
