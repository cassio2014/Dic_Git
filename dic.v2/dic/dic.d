// Escrito em D

/**
Objetivo, converter caracteres utf-8 para ascii
para visualizar no console
import $(B dic.dic) .

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
module dic.dic;

import std.stdio;
import std.string;
import std.format;
import std.conv;
import dic.linguas;

/** Templete para os textos digitados */
void dwrite(T...)(T args)
{
     write(dicconv(args));
     stdout.flush;
}
/** converte strings para seresm impressas ou gravadas */
string dicconv(T...)(T args)
{
	string  aux;
	dstring aux1;
	string  aux2, aux3;

/** foreach(le;args) - Recebe os argumentos e divide em partes 1 passada */
	foreach(le;args)
	{
/** switch - Aqui verifico que tipo de váriavel é */
		switch (typeof(le).stringof)
		{
			case "string":
				scope(failure){goto default;}
				aux1 = to!dstring(le);
				break;

			case "immutable(dchar)[]":
				scope(failure){goto default;}
				aux2 = to!string(le);
				aux1 = to!dstring(aux2);
				break;

			case "const(dchar)":
				scope(failure){goto default;}
				aux2 = to!string(le);
				aux1 = to!dstring(aux2);
				break;

			case "dchar":
				scope(failure){goto default;}
				aux1 = to!dstring(le);
				break;

			default:
				aux1="";
				aux3 ~= to!string(le);
				break;
		}
/** Nesta faze é onde realmente as coisa acontecem
		 separa o caracter pesquiso na minha biblioteca
		 caso ache converto e paro de procurar.*/
		foreach(letra;aux1)
		{
			aux ~= achar(letra);
		}
		aux3 ~= aux;
		aux="";
	}
	return aux3;
}
/** igual ao dwrite so que pula uma linha depois */
void dwriteln(T...)(T args)
{
	dwrite(args,"\n");
}
/** dwritef Formatado
     os formatos da  string:
       % - inicio do farmato
       0 - lendo '0's
       . - indica a precisão (numero de casas decimais)
       exemplo: R$%-2.2f - 23.4587 - saida R$23.46

*/
void dwritef(T...)(T args)
{
   void pf(ref string s, ...)
   {
      void pc(dchar a)
      {s ~= a;}
      std.format.doFormat(&pc, _arguments, _argptr);
   }
    string value;
    pf(value,args);
    dwrite(value);
}
/** o mesmo que dwritef so que pula uma linha */
void dwritefln(T...)(T args)
{
    dwritef(args,"\n");
}

