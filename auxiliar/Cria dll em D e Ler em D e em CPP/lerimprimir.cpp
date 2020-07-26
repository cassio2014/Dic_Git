#include <stdio.h>
#include <windows.h>

#pragma resource "resbcc.res"

// crio uma interfeice  para ler o dll e colocar o conteudo
// na variavel Dfunc

typedef int (WINAPI*Dfunc)(...);

Dfunc imprima;

int main(int argc, char *argv[]) {
HINSTANCE hLib=LoadLibrary("imprimir.dll");
if (!hLib) {
  printf("erro ao ler a dll \n");
  system("pause");
  return 1;
  }

imprima=(Dfunc)GetProcAddress((HMODULE)hLib, "imprima");

printf("Lida em \'C\'\n\n");
printf("Lendo imprimir.dll!\n\n");
imprima();
return 0;
}