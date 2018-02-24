#include <stdio.h>
#include <conio.h>
#include <windows.h>

#pragma resource "resource.RES"

// crio uma interfeice  para ler o dll e colocar o conteudo
// na variavel Dfunc

typedef int (WINAPI*Dfunc)(...);

Dfunc dllprint; 
Dfunc somar; 


int main(int argc, char *argv[]) {
HINSTANCE hLib=LoadLibrary("mydll.dll");
if (!hLib) { printf("erro ao ler a dll \n"); getch();return 1; }

dllprint=(Dfunc)GetProcAddress((HMODULE)hLib, "dllprint");
somar   =(Dfunc)GetProcAddress((HMODULE)hLib, "somar");

int x = 5;
int y = 6;
int soma;

soma = somar(x, y);
printf("\nLendo minha DLL \"mydll.dll\"\n\n");
printf("pasando para somar(%i, %i)\n\n",x,y);
printf("a Soma de %i + %i = %i\n",x,y, soma);
dllprint();

system("pause");
}
