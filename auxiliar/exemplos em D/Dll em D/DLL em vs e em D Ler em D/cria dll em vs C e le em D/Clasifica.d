module lerDll;

import funcoes;
import std.stdio;
import std.process;
import std.random;


int main(string[] argv)
{
    CLS;
    TOTAL_ITENS = 60000000;
    int[] a;
    a.length = TOTAL_ITENS;
    int x;
    int y;
    writeln("\n  ==> gerando ",TOTAL_ITENS, " numeros.");
    write("\n\n{ ");
    for(x=0;x<TOTAL_ITENS; x++){
        a[x]=uniform(0,TOTAL_ITENS+1);
 		y++;
		if (y <= 4) write(a[x], " ");
    }

        write("}\n\n ");

    CLASIFICAR(a.ptr);

    writeln("\t",TOTAL_TROCAS," trocas.");
    writeln("\t",TOTAL_RECURS," recursao(quick).\n");
    y = 0;
    write("\n{ ");
    for(x=0;x<TOTAL_ITENS; x++)
    {
       if (a[x] != 0 )
       {
		  y++;
		  if (y <= 10)   write(a[x], " ");
	    }
    }
    write(" --> ",a[TOTAL_ITENS - 1]);
    writeln(" }\n\n ");

	PAUSAR;
    return 0;
}
