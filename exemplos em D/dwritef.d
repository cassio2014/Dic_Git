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
import std.c.locale;
pragma(lib,"dic.lib");

void main()
{
    writeln();
	setlocale(LC_NUMERIC , ""); // isso muda o ponto decimal para virgula
    int Valor1 = 123;
    dwritefln("%s tem R$ %2.2f Reais.", "você", 15.16234);
    writeln();
    writefln("Alinhamento normal a direita  :|%10d|", Valor1);
    writefln("Alinhamento a esquerda        :|%-10d|", Valor1);

    writeln();
    int valor3 = 12;

    writefln("Binario     : %b", valor3);
    writefln("Octal       : %o", valor3);
    writefln("Hexadecimal : %x", valor3);
    writefln("Decimal     : %d", valor3);

    readln();

}
