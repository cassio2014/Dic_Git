#include<stdio.h>
#include<stdlib.h>
#pragma resource "resource.RES"
void imprima (void);

int main()
{
	printf("\n\nLendo a DLL. \n\n");
	imprima();	
	printf("\n\n\n");
	system("pause");
	return 0;
}

