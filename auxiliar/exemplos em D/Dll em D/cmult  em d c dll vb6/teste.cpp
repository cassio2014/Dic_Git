#include <stdio.h>
#include <windows.h>

#pragma resource "resource.RES"

typedef void (WINAPI*Dfunc)(...);
Dfunc multiplica;

float A[11];
float B[11];
float C[11];
int n;

int main(){

    HINSTANCE hLib=LoadLibrary("cmult.dll");
    if (!hLib) { printf("erro ao ler a cmult.dll \n"); system("pause");return 51; }

   multiplica=(Dfunc)GetProcAddress((HMODULE)hLib,"Multiplica");
   
   for(n=1;n<11;n++)
   {
      A[n] = n * 1.1;
      B[n] = n * 2.2;               
   }
   
   multiplica(A,B,C,10);
   
   for(n=1;n<11;n++)
   {
       printf("C(%i) = %f \n\r",n, C[n]);
   }
   system("pause");
   
   FreeLibrary((HMODULE)hLib);
   system("pause");
   return 0;
}
