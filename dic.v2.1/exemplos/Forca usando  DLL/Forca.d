/** objetivo: Jogo Da Forca
 *            com Rotinas auxiliares em  DLL.

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

 Data Criação...: 06 de agosto  de 2014.
 Data Alteração : 06 de outubro de 2016.

 */
module forca;

import std.stdio;
import std.string;
import std.file;
import std.csv;
import std.conv;
import std.typecons;
import core.sys.windows.windows;

import dic.dic;
import auxiliares;

pragma(lib, "dic");
pragma(lib, "auxiliares"); // Rotinas auxiliares.
pragma(lib, "Winmm");      // Rotina de som do Windows.

/** Mostra a versão do jogo */
void versao(){
	HANDLE hWnd;
	MessageBoxW(hWnd, "Forca versão 1.1.0\n(c) Cassio Butrico.\ncassio_butrico@hotmail.com", "Jogo da Forca.",
	MB_OK | MB_ICONINFORMATION);
}

/** registro(Pergunta, Resposta); */
struct registro
{
	string Pergunta;
	string Resposta;
}


enum{
 SND_SYNC           = 0x0000,
 SND_ASYNC          = 0x0001,
 SND_NODEFAULT      = 0x0002,
 SND_MEMORY         = 0x0004,
 SND_LOOP           = 0x0008,
 SND_NOSTOP         = 0x0010,
}

alias sndPlaySound PlaySound;

pragma(msg,"\n\tJogo da Forca.\n\n\tcompilando........");

/**Cursor visivel= true, invisivel= false.   */
auto cursor = CONSOLE_CURSOR_INFO(30,false);


enum
{
   /** Intencidade  */  intencidade,
   /**Preta     = 0 */  Preta    = 0,
	/** Vermelha = 1 */  Vermelha = 1,
	/** Verde    = 2 */  Verde    = 2,
	/** Amarela  = 3 */  Amarela  = 3,
	/** Azul     = 4 */  Azul     = 4,
	/** Lilas    = 5 */  Lilas    = 5,
	/** Cyan     = 6 */  Cyan     = 6,
	/** Branca   = 7 */  Branca   = 7,
}

/** rc = repete("<c>",n); <c>= caracter a repetir n= numero de vezes.*/
alias repete rc;

/**Cordenada para a posisao do mouse
   e a letra corespondente.*/
struct cordenada
{
		int Linha;
		int Coluna;
		dchar letra=' ';

};


string[] Forca = ["  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
                  "  ▒▒    █",
                  "  ▒▒  ▄▀",
                  "  ▒▒▀▀",
                  "  ▒▒",
                  "  ▒▒",
                  "  ▒▒",
                  "  ▒▒",
                  " ▄▒▒▄",
                  "▒▒▒▒▒▒"];

string[] Boneco=["  ▄▄█▄▄",// 0 a 7 chances
                 "  █O O█",
                 "  ▀▀█▀▀",
                 "▄▄▄███▄▄▄",
                 "█ █████ █",
                 "▀ █████ ▀",
                 "  █▀▀▀█",
                 " ▄█   █▄"];

/** Monta a forca */
void Monta_forca()
{
	Lin = 2; Col = 32;
	Cores(Branca,Preta);
	gotoxy(Col,Lin);
	dwrite("╔");
	dwrite(rc("═",14));
	dwrite("╗");
	gotoxy(Col,++Lin);
	dwrite("║");
	Cores(Amarela,Preta);
	dwrite(" JOGO DA FORCA ");
	Cores(Branca,Preta);
	dwrite("║");
	gotoxy(Col,++Lin);
	dwrite("╚");
	dwrite(rc("═",14));
	dwrite("╝");

	Lin = 6;Col = 5;
	Cores(Azul,Preta);
	foreach(ler;Forca)
	{
		gotoxy(Col,Lin++);
		dwrite(ler);
	}
}

dchar[] Alfabeto;

/** letra contem a cordenada da tela e o conteudo da posição. */
cordenada[] letras;

dchar[] PalavraChave;
registro[] PalavraLida;

dchar Letra;

bool Enforcou = true;
bool Sair = false;
int Lin, Col, Acertos, TotaLetras,Erros,Tentativa;

/** Arquivo com palavras para forca  Forca.dat. */
string Nome_do_Arquivo = "Forca.dat";

/** Variavel para saber se tem o arquivo Forca.dat.*/
bool existe;

/** Pegar informação */
registro pegar;



/** Rotina inicializar limpa tudo e recontrou a Forca.*/
void Inicializar()
{
	cls;
	PalavraChave.length = 0;
	TotaLetras = 0;
	Acertos = 0;
	Erros = 0;
	Tentativa = 9;
	Enforcou = true;
	Sair = false;
	Monta_forca;

	Alfabeto=['A','B','C','D','E','F','G','H','I','J','K','L','M',
			  'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];

	Lin=6;  Col=27;
	Cores(Amarela,Preta);

	foreach(ler;Alfabeto)
	{
		letras ~= cordenada(Lin,Col,ler);
		gotoxy(Col,Lin);
		dwrite(ler);
		if (Col >= 50){Col=25;Lin++;}
		Col+=2;
	}
}

/** Rotina para pegar a palavra Chave.*/
void PegaPalavraChave()
{
	/** hout variavel para manipulação de dados na console*/
	HANDLE hout = GetStdHandle(STD_OUTPUT_HANDLE);

	//se tiver o arquivo Forca.dat
	if(existe)
	{
		/** aqui escolho aleatoriamente a palavra
		    e a coloco em PalavraChave. */
		int Acha = rand(PalavraLida.length);

		pegar = PalavraLida[Acha];

		foreach(Ler;PalavraLida[Acha].Resposta)
		{
			PalavraChave ~= Ler;
		}

	}
	else
	{
		cursor.bVisible = true;
		SetConsoleCursorInfo(hout, &cursor);
		Cores(Azul,Preta);
		gotoxy(27,11);dwrite("Pergunta: ");
		gotoxy(27,12);dwrite("Resposta: ");
		Cores(Amarela,Preta);
		gotoxy(37,11);pegar.Pergunta = readln.chomp;
		gotoxy(37,12);pegar.Resposta = readln.chomp;

		foreach(ler;pegar.Resposta.toUpper)
		{
			PalavraChave ~= ler;
		}

		cursor.bVisible = false;
		SetConsoleCursorInfo(hout, &cursor);

		gotoxy(27,11);dwrite(repete(" ",40));
		gotoxy(27,12);dwrite(repete(" ",40));

	}

	// separação em letras na tela
	// arrumar
	Cores(Verde,Preta);
	gotoxy(27,15);
	foreach(Ler;PalavraChave)
	{
		dwrite("_ ");
	}
}


/**Rotina para saber se tem a letra digitada*/
bool ProcuraLetra(dchar achou)
{
	foreach(Ler;PalavraChave)
	{
		if(Ler == achou) return true;
	}
	return false;
}

/**Rotina procura letra no Alfabeto e limpa a letra.*/
bool NoAlfabeto(dchar Letra)
{
	Lin=6;Col=27;
	Cores(Amarela,Preta);
	foreach(c,Ler;Alfabeto)
	{
		if(Ler == Letra)
		{
			Alfabeto[c] = ' ';
			gotoxy(Col,Lin);
			dwrite(Alfabeto[c]);
			return true;
		}
		gotoxy(Col,Lin);
		if (Col >= 50){Col=25;Lin++;}
		Col += 2;
	}
	return false;
}

unittest{ versao; }


int main(string [] args)
{
	cls; // Limpa a tela

   /** Monto a janela */
   Janela("Jogo Da Forca",100,100,840,502);

	CONSOLE_SCREEN_BUFFER_INFO csbiInfo;
	HANDLE hIn  = GetStdHandle(STD_INPUT_HANDLE);
	HANDLE hout = GetStdHandle(STD_OUTPUT_HANDLE);

	// salva o status da console
	GetConsoleScreenBufferInfo(hout, &csbiInfo);
	WORD wOldColorAttrs= csbiInfo.wAttributes;

	// tiro a visibilidade do cursos na tela.
	cursor.bVisible = false;
	SetConsoleCursorInfo(hout, &cursor);


	// Verifico se existe o arquivo Forca.dat
CADASTRO:
	if(exists(Nome_do_Arquivo))
	{
		existe = true;
		registro Ler;

      /** CadForca, arquivo para palavras da forca */
		auto CadForca = File(Nome_do_Arquivo, "r");

		// vamos ler e guardar as palavras.
		foreach(Lidas;CadForca.byLine())
		{
			auto Item = csvReader!(Tuple!(string, string))(Lidas);
			foreach (lendo; Item)
			{
				Ler.Pergunta = to!string(lendo[0]);
				Ler.Resposta = to!string(lendo[1]);
				PalavraLida ~= Ler;
			}
		}
		CadForca.close;
	}else{
		/* pergunto para o usuario se ele quer criar o arquivo
		 com as palavras para a forca, caso nao queira ele
		 podera digitar a palavra, caso queira cria o arquivo e
		 crio um cadastro para informar as palavras
		 no final volto para ler as palavras recem criadas
		 e continuo jogando. */

		 Monta_forca;
		 Cores(Verde,Preta);
		 gotoxy(16,15);
       versao;
		 cursor.bVisible = true;
		 SetConsoleCursorInfo(hout, &cursor);
	 	 dwrite("Criar O arquivo com palavras <s/n> ? ");
		 Letra=Tecla;

		 if(Letra == 'S' || Letra =='s')
		 {
			// monto cadastro.
			existe = true;

			/** Pegar Pergunta e Resposta. */
			registro pegar;

			auto CadForca = File(Nome_do_Arquivo, "a+");
			cls;
			Monta_forca;
			Cores(Amarela,Preta);
			gotoxy(34,06);dwrite("Versão 1.1.0");
			gotoxy(16,16);dwrite("Tecle <enter> para Finalizar.");
			string palavra, aux;

VOLTA_CAD:

			Cores(Azul,Preta);
			gotoxy(27,11);dwrite("Pergunta: ");
			gotoxy(27,12);dwrite("Resposta: ");
			Cores(Amarela,Preta);
			gotoxy(37,11);pegar.Pergunta = readln().chomp();
			gotoxy(37,12);pegar.Resposta = readln().chomp();
			gotoxy(27,11);dwrite(repete(" ",40));
			gotoxy(27,12);dwrite(repete(" ",40));

			if(pegar.Resposta == "" || pegar.Pergunta == "")
			 {
				CadForca.writeln("Nome Do Jogo,JOGO DA FORCA");
				CadForca.close;
				goto CADASTRO;
			}
			else
			{
				CadForca.writeln(pegar.Pergunta,",",pegar.Resposta.toUpper);
				goto VOLTA_CAD;
			}
		 }
		 else
		 {
			existe = false;
			Letra='n';
		}
	}

	cursor.bVisible = false;
	SetConsoleCursorInfo(hout, &cursor);

VOLTAR:

	Inicializar;
	PegaPalavraChave;
	Col=27; Lin=15;
	gotoxy(Col,Lin);
	if(ProcuraLetra(' '))
	{
		foreach(Ler;PalavraChave)
		{
			if(Ler == ' '){dwrite("  ");Acertos++;}
			Col +=2;
			gotoxy(Col,Lin);
		}
	}
	 TotaLetras = PalavraChave.length - Acertos;
	 Acertos=0;
	 bool  Conti = true;
    DWORD EventCount;
	 DWORD Event;
    int KeyEvents = 0;
    INPUT_RECORD InRec;
    DWORD NumRead;

 	// daqui em diante e onde verifico tudo.
	while(!Sair)
	{
		Cores(Cyan,Preta);
		gotoxy(27,10);dwrite("Você tem ");
		Cores;dwrite(Tentativa);
		Cores(Cyan,Preta);dwrite(" Tentativas !!");
		Cores(Verde,Preta);
		gotoxy(27,12);dwrite(pegar.Pergunta," ? ");

//xxxxxxxxxxxxxxxxxx MOUSE EVENT xxxxxxxxxxxxxxxxxxxxxxxx
	EventCount=0;
    while (Conti)
    {
        Sleep(30);
        GetNumberOfConsoleInputEvents(hIn,&EventCount);
        while (EventCount > 0)
        {
           ReadConsoleInputA(hIn,&InRec,1,&NumRead);
		   Event = InRec.EventType;
		   switch(Event)
		   {
			 case KEY_EVENT:
				if(InRec.FocusEvent.bSetFocus == true)
				 {
					Letra = InRec.KeyEvent.AsciiChar;
					Conti = false;
					EventCount=0;
				 }
				 break;
			case MOUSE_EVENT:
			 if(InRec.MouseEvent.dwButtonState & FROM_LEFT_1ST_BUTTON_PRESSED)
				{
					Col=InRec.MouseEvent.dwMousePosition.X;
					Lin=InRec.MouseEvent.dwMousePosition.Y;
					foreach(Ler;letras)
					{
						if(Ler.Linha == Lin && Ler.Coluna == Col)
						{
							Letra = Ler.letra;
        					Conti = false;
							EventCount=0;
						}
					}
				}
				break;
			default:
		   }

        }
    }
	Conti = true;
	ReadConsoleInputA(hIn,&InRec,0,&NumRead);
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

		// não aceita espaços em branco, pois ja foram contados.
		if(Letra == ' ')continue;
		// a tecla <esc> e a saida ou desistencia. obs Porta dos fundos
		if(Letra == 27){Enforcou = true;Sair=true;Letra = ' ';continue; }
		/** aqui trasformo as letras em Maiusculas.*/
		if(Letra >= 'a' && Letra <= 'z') Letra -= 32;
		/** Se não tem no alfabeto ignore a letra*/
		if(!NoAlfabeto(Letra))
      {
         PlaySound( "Stecla.wav",  SND_ASYNC);
         continue;
      }


      PlaySound( "Tecla.wav",  SND_ASYNC);
		Cores(Lilas,Preta);
		Col=27; Lin=15;
		gotoxy(Col,Lin);
		if(ProcuraLetra(Letra))
		{
			foreach(Ler;PalavraChave)
			{
				if(Ler == Letra){dwrite(Letra," ");Acertos++;}
				Col +=2;
				gotoxy(Col,Lin);
			}
		}
		else
		{
			Tentativa--;
			Erros++;
		}
		if(TotaLetras == Acertos)
		{
			Enforcou = false;
			Sair=true;
         Sleep(50);
         PlaySound( "enter.wav",  SND_ASYNC);
			continue;
		}
		// da qui em diante monto o Boneco na forca
		Cores;
		switch(Erros)
		{
			case 0: break;
			case 1:gotoxy(15, 7);dwrite(Boneco[0]);break;
			case 2:gotoxy(15, 8);dwrite(Boneco[1]);break;
			case 3:gotoxy(15, 9);dwrite(Boneco[2]);break;
			case 4:gotoxy(15,10);dwrite(Boneco[3]);break;
			case 5:gotoxy(15,11);dwrite(Boneco[4]);break;
			case 6:gotoxy(15,12);dwrite(Boneco[5]);break;
			case 7:gotoxy(15,13);dwrite(Boneco[6]);break;
			case 8:gotoxy(15,14);dwrite(Boneco[7]);break;

		   default:Enforcou = true;Sair=true;break;
		}
	}// fim do while

	// aqui verifico se foi enforcado ou não.
	if(Enforcou)
	{
		Cores(Vermelha,Preta);
		gotoxy(15,7);dwrite(Boneco[0]);
		gotoxy(15,8);dwrite(Boneco[1]);
		gotoxy(15,9);dwrite(Boneco[2]);
		gotoxy(15,10);dwrite(Boneco[3]);
		gotoxy(15,11);dwrite(Boneco[4]);
		gotoxy(15,12);dwrite(Boneco[5]);
		gotoxy(15,13);dwrite(Boneco[6]);
		gotoxy(15,14);dwrite(Boneco[7]);
      Sleep(50);
      PlaySound( "errou.wav",  SND_ASYNC);
		gotoxy(27,10);
		Cores(Branca,Preta);
		dwrite("Você ");
		Cores(Vermelha,Preta);
		dwrite("PERDEU !!!  ");
		Cores(Branca,Preta);
		dwrite("A Palavra era:");
		gotoxy(27,12);
		writeln(rc(" ",30));
		gotoxy(27,12),
		Cores(Lilas,Preta);
		dwrite(PalavraChave);
	}
	else
	{
		gotoxy(27,10);
		dwrite(rc(" ", 40));
		gotoxy(27,10);
		Cores(Branca,Preta);
		dwrite("Você ");
		Cores(Verde,Preta);
		dwrite("GANHOU !!!");
	}

	gotoxy(27,17);
	Cores(Azul,Preta);
	cursor.bVisible = true;
	SetConsoleCursorInfo(hout, &cursor);
	dwrite("Novo Jogo <S/N>? :");
	auto m = readln.chomp;
	//Letra=Tecla;
	cursor.bVisible = false;
	SetConsoleCursorInfo(hout, &cursor);
	if(m == "s" || m == "S"){Letra=' '; goto VOLTAR;}


	/** Restaura os atributos de tersto da console. */
	SetConsoleTextAttribute(hout, wOldColorAttrs);

	/** volto a visibilidade do cursos na tela.*/
	cursor.bVisible = true;
	SetConsoleCursorInfo(hout, &cursor);

	pragma(msg,"\tCompilado !!!\n\n");

	return 0;
}


