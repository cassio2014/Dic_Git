module lerDll;

import funcoes;
import std.stdio;
import std.process;
import std.random;


int main(string[] argv)
{
    CLS;
    TOTAL_ITENS = 20;
    int[] a;
    a.length = TOTAL_ITENS;
    int x;
    write("\n\n{ ");
    for(x=0;x<TOTAL_ITENS; x++){
        a[x]=uniform(0,TOTAL_ITENS+1);
        write(a[x], " ");
    }
    write("}\n\n ");

    CLASIFICAR(a.ptr);

    writeln("\t",TOTAL_TROCAS," trocas.");
    writeln("\t",TOTAL_RECURS," recursao(quick).\n");

    write("\n{ ");
    for(x=0;x<TOTAL_ITENS; x++){
        write(a[x], " ");
    }
    
    writeln("}\n\n ");

	PAUSAR;
    return 0;
}
