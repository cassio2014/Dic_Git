/** objetivo: demonstrar como é impresso no terminal.

 projeto: dic

 Este trabalho está licenciado sob uma
 Licença Creative Commons
 Atribuição-NãoComercial 4.0 Internacional.
 Para ver uma cópia desta licença, visite

 www.creativecommons.org/licenses/by-nc/4.0

 licença: <a href="http://creativecommons.org/licenses/by-nc/4.0/">creative commons 4.0</a>

 Autor: Cassio Butrico

 email: cassio_butrico@hotmail.com

 versão: 2.0

 Data: 6 de agosto de 2014.

 */

module EX_dicconv;

pragma(lib, "dic");

import std.stdio;
import std.string;
import core.thread;
import dic.dic;

extern (C) int kbhit();
alias tecla = kbhit;

/// demostra o uso do dwrite e do dwriteln
int main()
{

	dwrite("\n\n\tteste de conversão\n\n");
    string a = "\tA palavra é região." ;
    writeln("    antes de converter:\n");
    writeln(a);
	string b = dicconv(a);
	writeln("\n  depois de converter:\n");
	writeln(b);
	dwriteln("\n\t** <tecle algo para sair...> **\n");
	while(!tecla){stdout.flush();}
	return 0;
}
