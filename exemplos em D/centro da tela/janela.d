module janela;

/+ Compile with:
 +  dmd winsamp winsamp.def
 + or:
 +  dmd winsamp -L-Subsystem:Windows
 +/

pragma(lib, "gdi32");

import core.runtime;
import core.sys.windows.windows;
import std.string;

enum IDI_MYICON       = 100; // pega o icone do resource 
enum IDC_BTNCLICK     = 101;
enum IDC_BTNDONTCLICK = 102;


extern(Windows)
	int WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int iCmdShow)
{
	int result;
	void exceptionHandler(Throwable e) 
	{ 
		throw e; 
	}
	
	try
	{
		Runtime.initialize();
		result = myWinMain(hInstance, hPrevInstance, lpCmdLine, iCmdShow);
		Runtime.terminate();
	}
	catch (Throwable e)
	{
		MessageBoxA(null, e.toString().toStringz, "Error", MB_OK | MB_ICONEXCLAMATION);
		result = 0;
	}
	
	return result;
}

int myWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int iCmdShow)
{
	string caption = "A Minha Janela em D";
	string className = "DWndClass";
	HWND hWnd, btnClick, btnDontClick;
	MSG  msg;
	WNDCLASS wndclass; // + - = WNDCLASSEX
	
	wndclass.style         = CS_VREDRAW | CS_HREDRAW | CS_DBLCLKS;
	wndclass.lpfnWndProc   = &WindowProc;
	wndclass.cbClsExtra    = 0;
	wndclass.cbWndExtra    = 0;
	wndclass.hInstance     = hInstance;
	wndclass.hIcon         = LoadIconA(hInstance,MAKEINTRESOURCEA(IDI_MYICON));// le o icone do resorce
	wndclass.hCursor       = LoadCursorA(null, IDC_ARROW);
	wndclass.hbrBackground = cast(HBRUSH)GetStockObject(WHITE_BRUSH);
	wndclass.lpszMenuName  = null;
	wndclass.lpszClassName = className.toStringz;
	
	if (!RegisterClassA(&wndclass))
	{
		MessageBoxA(null, "Couldn't register Window Class!", caption.toStringz, MB_ICONERROR);
		return 0;
	}
	
	hWnd = CreateWindowA(className.toStringz,  // window class name
	                     caption.toStringz,    // window caption
	                     WS_THICKFRAME   |
	                     WS_MAXIMIZEBOX  |
	                     WS_MINIMIZEBOX  |
	                     WS_SYSMENU      |
	                     WS_VISIBLE,           // window style
	                     //CW_USEDEFAULT,        // initial x position
	                     //CW_USEDEFAULT,        // initial y position
	                     (GetSystemMetrics(SM_CXFULLSCREEN) - 600) / 2,
	                     (GetSystemMetrics(SM_CYFULLSCREEN) - 400) / 2,
	                     600,                  // initial x size
	                     400,                  // initial y size
	                     HWND_DESKTOP,         // parent window handle
	                     null,                 // window menu handle
	                     hInstance,            // program instance handle
	                     null);                // creation parameters
	
	if (hWnd is null)
	{
		MessageBoxA(null, "Couldn't create window.", caption.toStringz, MB_ICONERROR);
		return 0;
	}
	
	btnClick = CreateWindowA("BUTTON", "Me Click", WS_CHILD | WS_VISIBLE,
	                         0, 10, 100, 30, hWnd, cast(HMENU)IDC_BTNCLICK, hInstance, null);
	
	btnDontClick = CreateWindowA("BUTTON", "Nao CLICK!", WS_CHILD | WS_VISIBLE,
	                             110, 10, 120, 30, hWnd, cast(HMENU)IDC_BTNDONTCLICK, hInstance, null);
	
	ShowWindow(hWnd, iCmdShow);
	UpdateWindow(hWnd);
	
	while (GetMessageA(&msg, null, 0, 0))
	{
		TranslateMessage(&msg);
		DispatchMessageA(&msg);
	}
	
	return msg.wParam;
}

int* p;
extern(Windows)
	LRESULT WindowProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam) nothrow
{
	switch (message)
	{
		case WM_COMMAND:
		{
			switch (LOWORD(wParam))
			{
				case IDC_BTNCLICK:
					if (HIWORD(wParam) == BN_CLICKED)
						MessageBoxA(hWnd, "Ola, Mundo!", "Agradecimento",
						            MB_OK | MB_ICONINFORMATION);
					PostQuitMessage(0);
					
					break;
					
				case IDC_BTNDONTCLICK:
					if (HIWORD(wParam) == BN_CLICKED)
					{
						MessageBoxA(hWnd, "Voce foi Avisado...", "Tome Cuidado...",
						            MB_OK | MB_ICONEXCLAMATION);
						*p = 1;
						
					}
					
					break;
					
				default:
			}
			break;
		}
			
		case WM_PAINT:
		{
			enum text = "O Windows";
			PAINTSTRUCT ps;
			
			HDC  dc = BeginPaint(hWnd, &ps);
			scope(exit) EndPaint(hWnd, &ps);
			RECT r;
			GetClientRect(hWnd, &r);
			HFONT font = CreateFontA(80, 0, 0, 0, FW_EXTRABOLD, FALSE, FALSE,
			                         FALSE, ANSI_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
			                         DEFAULT_QUALITY, DEFAULT_PITCH | FF_DONTCARE, "DroidSans-Bold");
			HGDIOBJ old = SelectObject(dc, cast(HGDIOBJ) font);
			SetTextAlign(dc, TA_CENTER | TA_BASELINE);
			TextOutA(dc, r.right / 2, r.bottom / 2, text.toStringz, text.length);
			DeleteObject(SelectObject(dc, old));
			
			break;
		}
			
		case WM_DESTROY:
			PostQuitMessage(0);
			break;
			
		default:
			break;
	}
	
	return DefWindowProcA(hWnd, message, wParam, lParam);
}
