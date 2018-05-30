module MiniPaint;

import core.sys.windows.windows;

alias WriteConsoleOutputA WriteConsoleOutput;
alias SetConsoleTitleA    SetConsoleTitle;

int main(string[] args)
{
	HANDLE hIn;
    HANDLE hOut;
	auto Pm = COORD(0,0);
    bool Continue = TRUE;
    INPUT_RECORD InRec;
    DWORD EventCount;
    DWORD NumRead;
	DWORD IndexCb;
	DWORD Event;
	DWORD nc;
 
    hIn = GetStdHandle(STD_INPUT_HANDLE);
    hOut = GetStdHandle(STD_OUTPUT_HANDLE);

	SetConsoleTitle("Pequeno paint.");

	CONSOLE_SCREEN_BUFFER_INFO sbi;
	GetConsoleScreenBufferInfo(hOut,&sbi);

	CHAR_INFO gascbe; // botao esquerdo
	CHAR_INFO gascbm; // botao do meio
	CHAR_INFO gascbd; // botao direito

	gascbe.UnicodeChar = '\333'; // █
	gascbm.UnicodeChar = ' ';
	gascbd.UnicodeChar = '\261'; // ▒
	gascbd.Attributes  = FOREGROUND_BLUE  |
						 FOREGROUND_GREEN |
						 FOREGROUND_RED   |
						 FOREGROUND_INTENSITY;

	nc = sbi.dwSize.X * sbi.dwSize.Y;

	CHAR_INFO[] consoleBuffer;
	consoleBuffer.length = nc;

 	SetConsoleCursorPosition(hOut, COORD(sbi.srWindow.Right , sbi.srWindow.Bottom ));
 
void Limpar()
{
		foreach(x,ler;consoleBuffer)
		{
			consoleBuffer[x].AsciiChar = ' ';
			consoleBuffer[x].Attributes = 
			BACKGROUND_BLUE  |
			BACKGROUND_GREEN |
			BACKGROUND_RED   |
			BACKGROUND_INTENSITY;
		}
}

	Limpar;//limpa a tela 

	auto charBufSize  = COORD(sbi.dwSize.X,sbi.dwSize.Y);
	auto characterPos = COORD(0,0);

	//aqui mostra a tela montada.
	WriteConsoleOutput(hOut,(consoleBuffer).ptr,charBufSize,characterPos,&sbi.srWindow);
   

    while (Continue)
    {
       GetNumberOfConsoleInputEvents(hIn,&EventCount);
       while (EventCount > 0)
        {
            ReadConsoleInputA(hIn,&InRec,1,&NumRead);
		    Event = InRec.EventType;
			switch(Event)
			{
				case KEY_EVENT:
					if (InRec.KeyEvent.wVirtualKeyCode == VK_ESCAPE)
						{ Continue = FALSE;EventCount = 0; }
					else if(InRec.KeyEvent.AsciiChar == 'c' ){
						Limpar;
						WriteConsoleOutput(hOut, (consoleBuffer).ptr,charBufSize, characterPos, &sbi.srWindow);
					}
					break;
				case MOUSE_EVENT:
					if(InRec.MouseEvent.dwButtonState & FROM_LEFT_1ST_BUTTON_PRESSED)
					{
						Pm.X = InRec.MouseEvent.dwMousePosition.X;
						Pm.Y = InRec.MouseEvent.dwMousePosition.Y;
						IndexCb = sbi.dwSize.X * Pm.Y + Pm.X;
						consoleBuffer[IndexCb].UnicodeChar = gascbe.UnicodeChar;
						Sleep(40);
						WriteConsoleOutput(hOut, (consoleBuffer).ptr, 
													charBufSize, 
													characterPos, 
													&sbi.srWindow);
					}
					else if(InRec.MouseEvent.dwButtonState & RIGHTMOST_BUTTON_PRESSED)
					{
						Pm.X = InRec.MouseEvent.dwMousePosition.X;
						Pm.Y = InRec.MouseEvent.dwMousePosition.Y;
						IndexCb = sbi.dwSize.X * Pm.Y + Pm.X;
						consoleBuffer[IndexCb].UnicodeChar = gascbd.UnicodeChar;
						Sleep(40);
						WriteConsoleOutput(hOut, (consoleBuffer).ptr, 
													charBufSize, 
													characterPos, 
													&sbi.srWindow);
					}
					else if(InRec.MouseEvent.dwButtonState & FROM_LEFT_2ND_BUTTON_PRESSED)
					{
						Pm.X = InRec.MouseEvent.dwMousePosition.X;
						Pm.Y = InRec.MouseEvent.dwMousePosition.Y;
						IndexCb = sbi.dwSize.X * Pm.Y + Pm.X;
						consoleBuffer[IndexCb].UnicodeChar = gascbm.UnicodeChar;
						Sleep(40);
						WriteConsoleOutput(hOut, (consoleBuffer).ptr, 
													charBufSize, 
													characterPos, 
													&sbi.srWindow);
					}
					break;
				default:
			}
        }
   }
	
     return 0;
}
