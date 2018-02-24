module Cadastro;

import std.stdio;
import std.string;
import std.file;
import std.csv;
import std.typecons;
import std.conv;
import core.sys.windows.windows;
import dic.dic;

pragma(lib,"dic");

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




    int[int] Cartão;
    char Escolha;
    string Nome_do_Arquivo = "cartao.dat";
    bool existe;

	string repete(string a, int i)
	{
		int b;
		string c;
		for(b=0;b<=i;b++)
		{c ~= a;}
		return c;
	}
	void Menu_Principal()
	{
		cls;
        dwriteln("\t╔", repete("═",40), "╗");
		dwriteln("\t║ ",repete("░",38)," ║");
		dwriteln("\t║ ",repete("░",12)," Cadastro ",
		         repete("░",15), " ║");
		dwriteln("\t║ ",repete("░",38)," ║");
		dwriteln("\t╠",repete("═",40),  "╣");
		dwriteln("\t║",repete(" ",40),  "║");
		dwriteln("\t║",repete(" ",10),"1 - cadastrar.            ",
		         repete(" ",3),   "║");
		dwriteln("\t║",repete(" ",10),"2 - Alterar.            ",
		         repete(" ",5),"║");
		dwriteln("\t║",repete(" ",10),"3 - consultar.            ",
		         repete(" ",3),"║");
		dwriteln("\t║",repete(" ",10),"4 - Listar              ",
		         repete(" ",5),"║");
		dwriteln("\t║",repete(" ",10),"5 - Sair.               ",
		         repete(" ",5),"║");
		dwriteln("\t║",repete(" ",40),  "║");
		dwriteln("\t╚",repete("═",40),  "╝");
	}
	void telacadastro()
	{
		cls;
		dwriteln("\t╔", repete("═",40), "╗");
		dwriteln("\t║ ",repete("░",12)," cadastrar ",
		         repete("░",14), " ║");
		dwriteln("\t╚",repete("═",40),  "╝");
	}
	void telaalterar()
	{
		cls;
		dwriteln("\t\t╔", repete("═",40), "╗");
		dwriteln("\t\t║ ",repete("░",12),"  Alterar  ",
		         repete("░",14), " ║");
		dwriteln("\t\t╚",repete("═",40),  "╝");
	}
	void telaconsultar()
	{
		cls;
		dwriteln("\t╔", repete("═",40), "╗");
		dwriteln("\t║ ",repete("░",12)," Consultar ",
		         repete("░",14), " ║");
		dwriteln("\t╚",repete("═",40),  "╝");
	}
	void telalistar()
	{
		cls;
		dwriteln("\t╔", repete("═",40), "╗");
		dwriteln("\t║ ",repete("░",12),"  Listar   ",
		         repete("░",14), " ║");
		dwriteln("\t╚",repete("═",40),  "╝");
	}

int main()
{
    if(exists(Nome_do_Arquivo))
    {
        existe = true;
        File cadcat = File(Nome_do_Arquivo, "r");
    }
    else
    {
        File cadcat = File(Nome_do_Arquivo, "w");
        int cont;
        for(cont = 1;cont <=70;cont++)
        {
           cadcat.writeln(cont,",0");
        }
        existe=true;
        cadcat.close();
    }

	auto cadcat = File(Nome_do_Arquivo, "r");
	foreach (line; cadcat.byLine())
	{
		auto ler = csvReader!(Tuple!(int, int))(line);
		foreach (lendo; ler)
		{
			Cartão[lendo[0]]  = lendo[1];
		}
	}
    void mostrar()
    {
            int x;
            for(x=0;x <= 9;x++)
            {
                dwritef("\t%02d│%03d║",x + 1  ,Cartão[x + 1]);
                dwritef("\t%02d│%03d║",x + 11 ,Cartão[x + 11]);
                dwritef("\t%02d│%03d║",x + 21 ,Cartão[x + 21]);
                dwritef("\t%02d│%03d║",x + 31 ,Cartão[x + 31]);
                dwritef("\t%02d│%03d║",x + 41 ,Cartão[x + 41]);
                dwritef("\t%02d│%03d║",x + 51 ,Cartão[x + 51]);
                dwritef("\t%02d│%03d║",x + 61 ,Cartão[x + 61]);
                writeln();
            }
    }
	void cadalt()
    {
        string opcao;
        while(opcao != "0")
        {
            if(Escolha == '1')
            {telacadastro();}
            else
            {telaalterar(); }

            writeln();
            mostrar();
            writeln();
            dwrite("\tDigite indice : ");
            int h;
            string hh = chomp(readln());
            if(isNumeric(hh))
            {h = parse!int(hh);}else {opcao="0";}
            if(h < 1 || h > 70)
            {h=0;
            }
            else
            {
                if(h in Cartão)
                {
                    writeln("\tIndice : ",h," Valor : ", Cartão[h]);
                    dwrite("\tNovo valor: ");
                    string novo = chomp(readln());
                    if(isNumeric(novo) && novo.length == 3)
                    {
                        Cartão[h] = parse!int(novo);
                    }
                }
            }
        }
        cadcat.close();
        cadcat = File(Nome_do_Arquivo, "w");
        int x;
        for(x=1;x<=70;x++)
        {
            cadcat.writeln(x,",",Cartão[x]);
        }
    }

	void cadastrar()
	{
        telacadastro();
        if(existe)
        {
            char apagar;
            writeln("\n");
            writeln("\tArquivo ",Nome_do_Arquivo, " existente.\n\tdeseja zerar :");
            dwrite("\ts/n ==> ");
			apagar=Tecla;
			dwrite(apagar);
			Sleep(250);
            if(apagar == 's' || apagar == 'S' )
            {
                auto cadcat = File(Nome_do_Arquivo, "w");
                int cont;
                for(cont = 1;cont <=70;cont++)
                {
                    cadcat.writeln(cont,",0");
                    Cartão[cont]=0;
                }
                cadcat.close();
            }
        }
     cadalt();
	}

	void alterar()
	{
        cadalt();
	}

	void consultar()
	{
	    string sair;
	    while(sair != "0")
        {
        telaconsultar();
		writeln();
		mostrar();
		writeln();
		dwrite("\tDigite indice : ");
		int h;
		string hh = chomp(readln());
		if(isNumeric(hh))
		{h = to!int(hh);}else {h=0;}
		if(h < 1 || h > 70)
		{
			sair="0";
		}
		else
		{
			if(h in Cartão)
			{
				writeln("\t\tIndice : ",h," Valor : ", Cartão[h]);
				dwrite("\t<Espere...>");
				//Tecla;
				Sleep(6000);
			}
		}

        }

	}

	void listar()
	{
        telalistar();
		writeln();
		mostrar();
		writeln();
	}

    while(Escolha != '5')
    {
      Menu_Principal();
      writeln();
      dwrite("\t Escolha a opção : ");
      Escolha=Tecla;
		dwrite(Escolha);
		Sleep(230);
	  switch(Escolha)
	  {
	    case '1' :
	        cadastrar();
	        break;

        case '2':
            alterar();
            break;

        case '3':
            consultar();
            break;

        case '4':
            listar();
			writeln("\n\t<enter> para voltar ao menu.");
			readln();
            break;

        default:
            break;
	  }
    }
	return 0;
}
