/** objetivo: Jogo Da Forca.

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
module forca;

import core.sys.windows.windows;
import dic.dic;
import std.conv;
import std.file;
import std.random;
import std.stdio;
import std.string;

pragma(lib, "dic");

/**Cordenada para a posisao do mouse
   e a letra corespondente.*/
struct cordenada
{
		int Linha;
		int Coluna;
		char letra=' ';
		
};

enum 
{
	Preta		= 0,
	Vermelha	= 1,
	Verde		= 2,
	Amarela		= 3,
	Azul		= 4,
	Lilas		= 5,
	Cyan		= 6,
	Branca		= 7,
}

enum WORD[int] CorDaFrente = [
	Preta		: 0x0000,
	Vermelha	: FOREGROUND_RED,
	Verde		: FOREGROUND_GREEN,
	Amarela		: FOREGROUND_RED  | FOREGROUND_GREEN,
	Azul		: FOREGROUND_BLUE,
	Lilas		: FOREGROUND_RED  | FOREGROUND_BLUE,
	Cyan		: FOREGROUND_BLUE | FOREGROUND_GREEN,
	Branca		: FOREGROUND_BLUE | FOREGROUND_GREEN | FOREGROUND_RED,
];

enum WORD[int] CorDeFundo = [
	Preta		: 0x0000,
	Vermelha	: BACKGROUND_RED,
	Verde		: BACKGROUND_GREEN,
	Amarela		: BACKGROUND_RED  | BACKGROUND_GREEN,
	Azul		: BACKGROUND_BLUE,
	Lilas		: BACKGROUND_RED  | BACKGROUND_BLUE,
	Cyan		: BACKGROUND_BLUE | BACKGROUND_GREEN,
	Branca		: BACKGROUND_BLUE | BACKGROUND_GREEN | BACKGROUND_RED,
];

/** recebe um caracter vindo do teclado. */
char Tecla()
{
	HANDLE hIn = GetStdHandle(STD_INPUT_HANDLE);
    INPUT_RECORD InRec;
    DWORD EventCount;
    DWORD NumRead;
	DWORD Event;
	GetNumberOfConsoleInputEvents(hIn,&EventCount);
	while (EventCount > 0)
	{
		ReadConsoleInputA(hIn,&InRec,1,&NumRead);
		Event = InRec.EventType;
		switch(Event)
		{
			case KEY_EVENT:	
				if(InRec.FocusEvent.bSetFocus == true)
				   EventCount =0;
				break;
			default:
				break;
			}
        }
		 ReadConsoleInputA(hIn,&InRec,0,&NumRead);
		return InRec.KeyEvent.AsciiChar;
}

/** cls apaga a tela */
void cls()
{
	HANDLE hout =GetStdHandle(STD_OUTPUT_HANDLE);
	DWORD nc, ncw;
	auto home = COORD(0,0);
	CONSOLE_SCREEN_BUFFER_INFO sbi;
	GetConsoleScreenBufferInfo(hout,&sbi);
	nc = sbi.dwSize.X * sbi.dwSize.Y;
	FillConsoleOutputAttribute(hout,sbi.wAttributes,nc,home,&ncw);
	FillConsoleOutputCharacterA(hout,' ',nc,home,&ncw);
	SetConsoleCursorPosition(hout,home);
}



/** gotoxy posiciona o cursor x = coluna y = linha*/
void gotoxy(int x=0, int y=0)
{

	COORD VaPara;
	VaPara.X = cast(short) x;
	VaPara.Y = cast(short) y;
	HANDLE hStdOut = GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleCursorPosition(hStdOut,VaPara);

}

/**Cores muda a cor do testo fente e fuNdo */
void Cores(int Cfente=7, int Cfundo=0, bool CfentIntenc = true, bool CfundoItenc = false)
{
	HANDLE hStdout = GetStdHandle(STD_OUTPUT_HANDLE); 
	WORD Fente, Fundo, IntencFente, IntencFundo;
	if(CfentIntenc) IntencFente = FOREGROUND_INTENSITY;
	if(CfundoItenc) IntencFundo = BACKGROUND_INTENSITY;
	Fente = CorDaFrente[Cfente] | IntencFente;
	Fundo =  CorDeFundo[Cfundo] | IntencFundo;
	SetConsoleTextAttribute(hStdout, Fente | Fundo);
}

string[] Forca = ["  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    ",
                  "  ▒▒    █              ",
                  "  ▒▒  ▄▀               ",
                  "  ▒▒▀▀                 ",
                  "  ▒▒                   ",
                  "  ▒▒                   ",
                  "  ▒▒                   ",
                  "  ▒▒                   ",
                  " ▄▒▒▄                  ",
                  "▒▒▒▒▒▒                 "];

string[] Boneco=["  ▄▄█▄▄ ",// 0 a 7 chances
                 "  █O▲O█ ",
                 "  ▀▀█▀▀ ",
                 "▄▄▄███▄▄▄ ",
                 "█ █████ █ ",
                 "▀ █████ ▀ ",       
                 "  █▀▀▀█ ",
                 " ▄█   █▄ "];

/** Monta a forca */
void Monta_forca()
{
	gotoxy(8,5);
	Cores(Branca,Preta);
	dwrite("JOGO DA FORCA");

	Lin = 6;Col = 5;
	Cores(Azul,Preta);
	foreach(ler;Forca)
	{
		gotoxy(Col,Lin);
		dwrite(ler);
		Lin++;
	}
}

char[] Alfabeto;
cordenada[] letras;
char[] PalavraChave;
string[] PalavraLida;
char Letra;
bool Enforcou = true;
bool Sair = false;
int Lin, Col, Acertos, TotaLetras,Erros,Tentativa;

/** Arquivo com palavras para forca  Forca.dat. */
string Nome_do_Arquivo = "Forca.dat";

/** Variavel para saber se tem o arquivo Forca.dat.*/
bool existe;

/** Rotina para criar numeros inteiros randomicos */
int rand(int x)
{	
	int r = uniform(0,x);
	return r;
}

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

/** Rotina para pegar a palavra Chave mostrabdo astericos.*/
void PegaPalavraChave()
{
	//se tiver o arquivo Forca.dat 
	if(existe)
	{
		/** aqui escolho aleatoriamente a palavra
		    e a coloco em PalavraChave. */
		int Acha = rand(PalavraLida.length);
		foreach(Ler;PalavraLida[Acha])
		{
			PalavraChave ~= Ler;
		}
	}else
	{
		gotoxy(27,11);
		Cores(Azul,Preta);
		dwrite("Palavra : ");
		gotoxy(36,11);
		Cores(Amarela,Preta);
		while(Letra != 13 )
		{
			Letra=Tecla;
			
			if(Letra == 13)continue;
			if(Letra >= 'a' && Letra <='z') Letra -= 32;
			if(Letra != ' ' && Letra < 'A' || Letra > 'Z' )continue;
			PalavraChave ~= Letra;
			dwrite("*");
		}
		gotoxy(27,11);
		dwrite("                                                ");

	}
	Cores(Verde,Preta);
	gotoxy(27,15);
	foreach(Ler;PalavraChave){dwrite("_ ");}
}

/**Rotina para saber se tem a letra digitada*/
bool ProcuraLetra(char achou)
{
	foreach(Ler;PalavraChave)
	{
		if(Ler == achou) return true;
	}
	return false;
}

/**Rotina procura letra no Alfabeto e limpa a letra.*/
bool NoAlfabeto(char Letra)
{
	Lin=6;Col=27;
	Cores(Amarela,Preta,true);
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


unittest{}

extern (Windows)
nothrow
@nogc{
	/**  Movia janela e redimenciona */
	BOOL MoveWindow(
		in HWND,
		in int,
		in int,
		in int,
		in int,
		in BOOL);

} 


int main(string [] args)
{

	// Get console window handle
	HWND wh = GetConsoleWindow();


	// Move window to required position
	MoveWindow(wh, 100, 100, 840, 502, TRUE);

	SetConsoleTitleA("Jogo da Forca.");
	CONSOLE_SCREEN_BUFFER_INFO csbiInfo; 
	HANDLE hout    = GetStdHandle(STD_OUTPUT_HANDLE);
	HANDLE hIn     = GetStdHandle(STD_INPUT_HANDLE);

	/** tiro a visibilidade do cursos na tela.*/
	auto cursor = CONSOLE_CURSOR_INFO(30,false) ;
	SetConsoleCursorInfo(hout, &cursor);

	/** salva o status da console*/
	GetConsoleScreenBufferInfo(hout, &csbiInfo); 
	WORD wOldColorAttrs= csbiInfo.wAttributes;

	// Verifico se existe o arquivo Forca.dat
CADASTRO:
	if(exists(Nome_do_Arquivo))
	{
		existe = true;
		auto CadForca = File(Nome_do_Arquivo, "r");

		// vamos ler e guardar as palavras.
		foreach(Lidas;CadForca.byLine()) 
		{
			PalavraLida~= to!string(Lidas);
		}
		CadForca.close;
	}else{
		/** pergunto para o usuario se ele quer criar o arquivo
		 com as palavras para a forca, caso nao queira ele
		 podera digitar a palavra, caso queira cria o arquivo e
		 crio um cadastro para informar as palavras
		 no final volto para ler as palavras recem criadas
		 e continuo jogando. */

		 Monta_forca;
		 gotoxy(27,6);
		 Cores(Amarela,Preta);
		 dwrite("Jogo da Forca Versão 1.0");
		 Cores(Verde,Preta);
		 cursor.bVisible = true;
		 SetConsoleCursorInfo(hout, &cursor);
		 gotoxy(16,15);
		 dwrite("Criar O arquivo com palavras <s/n> ? ");
		 Letra=Tecla;
		 if(Letra == 'S' || Letra =='s') 
		 {
			// monto cadastro.
			existe = true;
			auto CadForca = File(Nome_do_Arquivo, "w");
			cls;
			Monta_forca;
			gotoxy(27,6);
			Cores(Amarela,Preta);
			dwrite("Jogo da Forca Versão 1.0");
			gotoxy(16,15);
			dwrite("Tecle <enter> para sair.");
			string palavra, aux;
VOLTA_CAD:
			gotoxy(18,10);
			dwrite("                                                  ");
			gotoxy(18,10);
			Cores(Azul,Preta);  
			dwrite("Palavra : ");
			Cores(Cyan,Preta);

			 palavra = chomp(readln());

			 if(palavra == "")
			 {
				gotoxy(15,15);
				CadForca.write("FIM\n");
				CadForca.close;
				goto CADASTRO;
			}
			else
			{
				CadForca.writeln(palavra.toUpper);
				goto VOLTA_CAD;
			}
		 }
		 else
		 {
			existe = false;
		}
	}

	cursor.bVisible = false;
	SetConsoleCursorInfo(hout, &cursor);
	
VOLTAR:
	cls;
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
	bool Conti = true;
    DWORD EventCount;
	DWORD Event;
    int KeyEvents = 0;
    INPUT_RECORD InRec;
    DWORD NumRead;
 
 	// daqui em diante e onde verifico tudo.
	while(!Sair)
	{
		gotoxy(27,10);
		Cores(Cyan,Preta);
		dwrite("Você tem ");
		Cores;
		dwrite(Tentativa);
		Cores(Cyan,Preta);
		dwrite(" Tentativas !!");
//xxxxxxxxxxxxxxxxxx MOUSE EVENT xxxxxxxxxxxxxxxxxxxxxxxx
	EventCount=0;
    while (Conti)
    {
        Sleep(10);
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

		// não aceita espasos em branco, pois ja foram contados.
		if(Letra == ' ')continue;
		// a tecla esc e a saida ou desistencia. obs Porta dos fundos
		if(Letra == 27){Enforcou = true;Sair=true;continue; }
		/** aqui trasformo as letras em Maiusculas.*/
		if(Letra >= 'a' && Letra <= 'z') Letra -= 32;
		/** Se não tem no alfabeto ignore a letra*/
		if(!NoAlfabeto(Letra))continue;
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
			continue;
		}
		// da qui em diante monto o Boneco na forca
		Cores;
		switch(Erros)
		{
			case 0: break;
			case 1:gotoxy(15,7);dwrite(Boneco[0]);break;
			case 2:gotoxy(15,8);dwrite(Boneco[1]);break;
			case 3:gotoxy(15,9);dwrite(Boneco[2]);break;
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
		Cores(Vermelha,Preta,true);
		gotoxy(15,7);dwrite(Boneco[0]);
		gotoxy(15,8);dwrite(Boneco[1]);
		gotoxy(15,9);dwrite(Boneco[2]);
		gotoxy(15,10);dwrite(Boneco[3]);
		gotoxy(15,11);dwrite(Boneco[4]);
		gotoxy(15,12);dwrite(Boneco[5]);
		gotoxy(15,13);dwrite(Boneco[6]);
		gotoxy(15,14);dwrite(Boneco[7]);
		
		gotoxy(27,10);
		Cores(Branca,Preta);
		dwrite("Você ");
		Cores(Vermelha,Preta);
		dwrite("PERDEU !!!  ");
		Cores(Branca,Preta);
		dwrite("A Palavra era:");
		gotoxy(27,12),
		Cores(Lilas,Preta);
		dwrite(PalavraChave);
	}
	else
	{
		gotoxy(27,10);
		dwrite("                                                          ");
		gotoxy(27,10);
		Cores(Branca,Preta);
		dwrite("Você ");stdout.flush;
		Cores(Vermelha,Preta);
		dwrite("GANHOU !!!");
	}
	
	gotoxy(27,17);
	Cores(Azul,Preta);
	dwrite("Novo Jogo <S/N>? :");
	Letra=Tecla;
	if(Letra == 's' || Letra == 'S'){Letra=' '; goto VOLTAR;}
	if(Letra == 13){Letra=' '; goto VOLTAR;}
	
	/** Restaura o status da console */
	SetConsoleTextAttribute(hout, wOldColorAttrs);
	return 0;
}


