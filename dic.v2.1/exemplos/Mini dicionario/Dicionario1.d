module dicionario;

import std.stdio;
import std.string;

struct dicionario
{
	string Palavra;
	string Definicao;
}
bool compararStrings(string Palavra1,string Palavra2)
{
	if(Palavra1 == Palavra2)
	{
		return true;
	}
	else
	{
		return false;
	}
}

int ProcurarStrings(dicionario[] Lingua,string Procurar,int NumeroDePalavras)
{
	int i = 0 ;
	while(i < NumeroDePalavras)
	{

		if(compararStrings(Procurar,Lingua[i].Palavra))
		{
			return i;
		}
		else
		{
			++i;
		}
	}
	return -1;
}

int main(string[] args)
{
	dicionario[] Portugues= [
		dicionario("arroz","tipo Agulinha."),
		dicionario("feijao","tipo tropeiro."),
		dicionario("queijo","tipo branco mineiro."),
		dicionario("cassio","o meu criador claro."),
		dicionario("pao","com mortandela.")
	];;

	int numeroDePalavras = Portugues.length;

	int ResultadoPesquisa;

	write("Digite uma palavra: ");
	string palavra = chomp(readln());

	ResultadoPesquisa = ProcurarStrings(Portugues,palavra,numeroDePalavras);
	if(ResultadoPesquisa != -1)
	{
		writeln("\n",Portugues[ResultadoPesquisa].Definicao,"\n");
	}
	else
	{
		write("\nPalavra nao encontrada\n\n");
	}

	write("Pressione <enter> para sair....");
	getchar();
	return 0;
}

