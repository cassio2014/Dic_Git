#!rdmd
module mydll;

import std.stdio;

export
void dllprint() {
	printf("\n\tlendo \'mydll.dll\' ...\n\n"); 
	printf("A rotima \"dllprint()\", Funciona !!!\n\n");
}
