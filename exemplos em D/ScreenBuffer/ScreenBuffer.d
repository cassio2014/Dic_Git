module ScreenBuffer;

import core.sys.windows.windows;

extern (C) int getch();

alias WriteConsoleOutputA WriteConsoleOutput;
alias SetConsoleTitleA    SetConsoleTitle;

int main(string[] args)
{
enum {
		GRID_WIDTH  = 10,
		GRID_HEIGHT = 7,
		POS_X       = 25,
		POS_Y       = 2,
	}

	SetConsoleTitle("SCREEN BUFFER TESTE.");
	CHAR_INFO [GRID_WIDTH * GRID_HEIGHT] screenBuffer;
	auto drawRect = SMALL_RECT (POS_X, 
								POS_Y, 
								POS_X + (GRID_WIDTH - 1), 
								POS_Y + (GRID_HEIGHT - 1)); 

	auto gridSize = COORD(GRID_WIDTH , GRID_HEIGHT);
	auto zeroZero = COORD(0, 0);
	HANDLE OutputH;
	OutputH = GetStdHandle(STD_OUTPUT_HANDLE);
	int x, y;
	for(y = 0; y < gridSize.Y; y++)
	{
		for(x = 0; x < gridSize.X; x++)	
		{
			screenBuffer[x + y * GRID_WIDTH].UnicodeChar = 'C';
			screenBuffer[x + y * GRID_WIDTH].Attributes = FOREGROUND_GREEN;
		}
	}
	
		WriteConsoleOutput(OutputH, (screenBuffer).ptr, gridSize, zeroZero, &drawRect);

	 	drawRect.Top += 3;	
		drawRect.Left += 5;	
		drawRect.Right += 5;
		drawRect.Bottom += 5;

	for(y = 0; y < gridSize.Y; y++)	
	{
		for(x = 0; x < gridSize.X; x++)	
		{
			screenBuffer[x + y * GRID_WIDTH].UnicodeChar = 'A';
			screenBuffer[x + y * GRID_WIDTH].Attributes =    FOREGROUND_BLUE | 
															(BACKGROUND_RED  | 
															BACKGROUND_GREEN | 
															BACKGROUND_BLUE);
		}
	}

	 WriteConsoleOutput(OutputH, (screenBuffer).ptr, gridSize, zeroZero, &drawRect);

	 	drawRect.Top += 3;	
		drawRect.Left += 5;	
		drawRect.Right += 5;
		drawRect.Bottom += 5;

	for(y = 0; y < gridSize.Y; y++)	
	{
		for(x = 0; x < gridSize.X; x++)	
		{
			screenBuffer[x + y * GRID_WIDTH].UnicodeChar = 'S';
			screenBuffer[x + y * GRID_WIDTH].Attributes =    FOREGROUND_RED;
		}
	}
	WriteConsoleOutput(OutputH, (screenBuffer).ptr, gridSize, zeroZero, &drawRect);

	 getch();
	 return 0;
}
