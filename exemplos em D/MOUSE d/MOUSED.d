import std.stdio;
import core.sys.windows.windows;

enum : LPSTR
{
	IDC_HAND =           cast(LPSTR)(32649),
	IDC_HELP =           cast(LPSTR)(32651),
	IDC_WAIT =           cast(LPSTR)(32514),
}

int main(string[] args)
{
	HANDLE hIn  = GetStdHandle(STD_INPUT_HANDLE);
    HANDLE hOut = GetStdHandle(STD_OUTPUT_HANDLE);
    auto  MouseWhere  = COORD (18, 0);
    auto DClickWhere  = COORD (18, 1);
	auto  clickwher   = COORD (18, 2);
     

    bool Continue = TRUE;
    DWORD EventCount;
    INPUT_RECORD InRec;
    DWORD NumRead;
	DWORD Event;
 
    writeln("Mouse is at     = ");
    writeln("Double Click at = ");
    write  ("Click at        = ");
	stdout.flush();
    
 
    while (Continue)
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
                   if (InRec.KeyEvent.wVirtualKeyCode == VK_ESCAPE)
                     { Continue = FALSE;}
				   break;
				case MOUSE_EVENT:
					if (InRec.MouseEvent.dwEventFlags == MOUSE_MOVED)
					{
						SetConsoleCursorPosition(hOut, MouseWhere);
						write(InRec.MouseEvent.dwMousePosition.X ," : ");
						write(InRec.MouseEvent.dwMousePosition.Y ,"   ");
						stdout.flush();
					}
					else if (InRec.MouseEvent.dwEventFlags == DOUBLE_CLICK)
					{
						SetConsoleCursorPosition(hOut, DClickWhere);
						write(InRec.MouseEvent.dwMousePosition.X ," : ");
						write(InRec.MouseEvent.dwMousePosition.Y ,"   ");
						stdout.flush();
					}             
					else if(InRec.MouseEvent.dwButtonState & FROM_LEFT_1ST_BUTTON_PRESSED)
					{
					SetConsoleCursorPosition(hOut, clickwher);
                    write(InRec.MouseEvent.dwMousePosition.X ," : ");
                    write(InRec.MouseEvent.dwMousePosition.Y ,"   ");
					stdout.flush();
					}
					break;
				default:break;
			}             
          GetNumberOfConsoleInputEvents(hIn,&EventCount);
        }
    }
	
     return 0;
}
