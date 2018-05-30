//*********************************************************
//    tcc compilar   tcc -shared imprimir.c
//*********************************************************

#include <windows.h>
#define DLL_EXPORT __declspec(dllexport)

DLL_EXPORT   void imprima ()
{
    printf("ok a dll imprimir foi lida e esta funcionando...");
}

   
