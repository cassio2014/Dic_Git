module auxiliares;

pragma(msg,"\n\n\tCriando a DLL....");

extern(C){
export{
	
import std.conv;
import std.random;
import core.sys.windows.windows;

enum 
{
   /** Intencidade  */  intencidade,
   /** Preta    = 0 */  Preta    = 0,
   /** Vermelha = 1 */  Vermelha = 1,
   /** Verde    = 2 */  Verde    = 2,
   /** Amarela  = 3 */  Amarela  = 3,
   /** Azul     = 4 */  Azul     = 4,
   /** Lilas    = 5 */  Lilas    = 5,
   /** Cyan     = 6 */  Cyan     = 6,
   /** Branca   = 7 */  Branca   = 7,
}

/** Janela(Nome da Janela, posição x, posição y, Largura, altura) */
void Janela(LPCSTR Nome="Janela", 
            int pos_x=50, 
            int pos_y=50, 
            int larg=800,   
            int altu=600){
   
   // pega a indentificação da janela.
   HWND wh = GetConsoleWindow();
   
   // Movea janela para a requerida posição.
   MoveWindow(wh, pos_x, pos_y, larg, altu, TRUE);
   
   SetConsoleTitleA(Nome);
}


/** repete(caracter a repetir , numero de vezes)       Ex: repete("|",10). */
string repete(string a, int i)
{
	int b;
	string c;
	for(b=0;b<=i;b++)
	{c ~= a;}
	return c;
}


enum WORD[int] CorDaFrente = [
	Preta		: 0x0000,
	Vermelha	: FOREGROUND_RED,
	Verde		: FOREGROUND_GREEN,
	Amarela		: FOREGROUND_RED  | FOREGROUND_GREEN,
	Azul		: FOREGROUND_BLUE,
	Lilas		: FOREGROUND_RED  | FOREGROUND_BLUE,
	Cyan		: FOREGROUND_BLUE | FOREGROUND_GREEN,
	Branca	    : FOREGROUND_BLUE | FOREGROUND_GREEN | FOREGROUND_RED,
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
	FillConsoleOutputCharacterA(hout,'\u0020',nc,home,&ncw);
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

/**Cores muda a cor do testo fente e fubdo */
void Cores(int Cfente=7, int Cfundo=0, 
			bool CfentIntenc = true, 
			bool CfundoItenc = false)
{
	HANDLE hStdout = GetStdHandle(STD_OUTPUT_HANDLE); 
	WORD Fente, Fundo, IntencFente, IntencFundo;
	if(CfentIntenc) IntencFente = FOREGROUND_INTENSITY;
	if(CfundoItenc) IntencFundo = BACKGROUND_INTENSITY;
	Fente = CorDaFrente[Cfente] | IntencFente;
	Fundo =  CorDeFundo[Cfundo] | IntencFundo;
	SetConsoleTextAttribute(hStdout, Fente | Fundo);
}

/** Rotina para criar numeros inteiros randomicos */
int rand(int x)
{	
	int r = uniform(0,x);
	return r;
}

}
}
pragma(msg,"\n\n\tDll Criada..!! \n");
