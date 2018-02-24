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
module dwritef;

import std.stdio;
import dic.dic;
import core.stdc.locale;
import std.process;

//pragma(lib,"dic");


void main()
{
    writeln();
	setlocale(LC_NUMERIC, ""); // isso muda o ponto decimal para virgula
    int Valor1 = 123;
    dwritefln("você tem R$%6.2f Reais.", 15.16734);
    writeln();
	dwritefln("Alinhamento a direita  :│%10d│", Valor1);
	dwritefln("Alinhamento a esquerda :│%-10d│", Valor1);

    writeln();
    int valor3 = 120;

    writefln("Binario     : %b", valor3);
    writefln("Octal       : %o", valor3);
    writefln("Hexadecimal : %x", valor3);
    writefln("Decimal     : %d\n\n", valor3);
	dwritefln(" ║ %1$d ║ %1$x ║ %1$o ║ %1$b ║\n",valor3);
	wait(spawnShell("pause"));

} 
