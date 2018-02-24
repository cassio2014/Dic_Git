/** objetivo: pequeno dicionario de palavras.

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
module dicionario;

import std.stdio;
import std.string;
import dic.dic;
pragma(lib,"dic.lib");

struct dicionário
{
	string Palavra;
	string Definicao;
}

int main(string[] args)
{
	dicionário[] Portugues= [
		dicionário("salame","tipo italiano."),
		dicionário("arroz","tipo Agulinha."),
		dicionário("queijo","tipo branco mineiro."),
		dicionário("cassio","o meu criador claro..."),
		dicionário("pão","com mortândela."),
        dicionário("feijão","tipo tropeiro.")
	];

	bool Resultadodapesquisa;

	dwrite("Digite uma palavra: ");
	string palavra = chomp(readln());

	foreach(achou;Portugues)
	{
		if(dicconv(achou.Palavra) == palavra)
		{
			Resultadodapesquisa = true;
			dwriteln("\n\t",achou.Palavra," ",achou.Definicao,"\n");
		}
	}
	if(!Resultadodapesquisa)
		dwriteln("Palavra não encontrada");

	write("Pressione <enter> para sair....");
	readln();
	return 0;
}

