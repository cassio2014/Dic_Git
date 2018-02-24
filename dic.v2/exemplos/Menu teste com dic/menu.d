/** objetivo: menu com caracteres graficos.

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

module menu;

import std.stdio;
import std.process;
import dic.dic;

pragma(lib,"dic.lib");
extern(C) int kbhit();
alias pausa = kbhit;

int main()
{
	string repete(string a, int i)
	{
		int b;
		string c;
		for(b=0;b<=i;b++)
		{c ~= a;}
		return c;
	}

	void Tela()
	{
        wait(spawnShell("cls"));
		dwriteln("\n");
		//dwrite("");
		dwriteln("\t╔", repete("═",40), "╗");
		dwriteln("\t║ ",repete("░",38)," ║");
		dwriteln("\t║ ",repete("░",15),"  MENU  ",
		         repete("░",14), " ║");
		dwriteln("\t║ ",repete("░",38)," ║");
		dwriteln("\t╠",repete("═",40),  "╣");
		dwriteln("\t║",repete(" ",40),  "║");
		dwriteln("\t║",repete(" ",10),"1 - Opção.            ",
		         repete(" ",7),   "║");
		dwriteln("\t║",repete(" ",10),"2 - Opção.            ",
		         repete(" ",7),"║");
		dwriteln("\t║",repete(" ",40),  "║");
		dwriteln("\t╚",repete("═",40),  "╝");
	}

	Tela;
	while(!pausa){stdout.flush();}
	return 0;

}
