
module cores;

import std.stdio;
import std.string;
import std.exception :enforce;
import std.conv;
import core.sys.windows.windows;
import std.windows.syserror;


enum
	{
		COMMON_LVB_REVERSE_VIDEO = 0x4000, //
		COMMON_LVB_UNDERSCORE    = 0x8000, //
	}

__gshared
{
	Terminal stdout;
	Terminal stderr;
}

static this()
{
	stdout = Terminal(std.stdio.stdout);
	stderr = Terminal(std.stdio.stderr);
}

static ~this()
{
	stdout.restoreDefaults;
	stderr.restoreDefaults;
}

enum Color
{
	black   = 0,
	red     = 1,
	green   = 2,
	yellow  = 3,
	blue    = 4,
	magenta = 5,
	cyan    = 6,
	white   = 7,
}


@property
static string name()
{
    return "Windows";
}

@property
bool hasColors()
{
    return true;
}


@property
bool hasCapability(in Capability capability)
{
    return true;
}


void writecf(T...)(in Color color, T args)
{
	auto oldColor = stdout.foregroundColor(color);
	scope(exit) stdout.foregroundColor(oldColor);
	writef(args);
}


void writecfln(T...)(in Color color, T args)
{
	auto oldColor = stdout.foregroundColor(color);
	scope(exit) stdout.foregroundColor(oldColor);
	writefln(args);
}

void writec(T...)(in Color color, T args)
{
	auto oldColor = stdout.foregroundColor(color);
	scope(exit) stdout.foregroundColor(oldColor);
	write(args);
}

void writecln(T...)(in Color color, T args)
{
	auto oldColor = stdout.foregroundColor(color);
	scope(exit) stdout.foregroundColor(oldColor);
	writeln("\n",args);
}


private:

enum Capability
{
	foreground,
	background,
	boldFace,
	blinkFace,
	reverseFace,
	underlineFace,
	allOff,
}



	enum WORD[Color] WindowsForegroundColor = [
		Color.black   : 0,
		Color.red     : FOREGROUND_RED,
		Color.green   : FOREGROUND_GREEN,
		Color.yellow  : FOREGROUND_RED | FOREGROUND_GREEN,
		Color.blue    : FOREGROUND_BLUE,
		Color.magenta : FOREGROUND_RED | FOREGROUND_BLUE,
		Color.cyan    : FOREGROUND_BLUE | FOREGROUND_GREEN,
		Color.white   : FOREGROUND_BLUE | FOREGROUND_GREEN | FOREGROUND_RED,
	];

	enum Color[WORD] WindowsForegroundColorReverse = [
		0                                                   : Color.black,
		FOREGROUND_RED                                      : Color.red,
		FOREGROUND_GREEN                                    : Color.green,
		FOREGROUND_RED | FOREGROUND_GREEN                   : Color.yellow,
		FOREGROUND_BLUE                                     : Color.blue,
		FOREGROUND_RED | FOREGROUND_BLUE                    : Color.magenta,
		FOREGROUND_BLUE | FOREGROUND_GREEN                  : Color.cyan,
		FOREGROUND_BLUE | FOREGROUND_GREEN | FOREGROUND_RED : Color.white,
	];

	enum WORD[Color] WindowsBackgroundColor = [
		Color.black   : 0,
		Color.red     : BACKGROUND_RED,
		Color.green   : BACKGROUND_GREEN,
		Color.yellow  : BACKGROUND_RED | BACKGROUND_GREEN,
		Color.blue    : BACKGROUND_BLUE,
		Color.magenta : BACKGROUND_RED | BACKGROUND_BLUE,
		Color.cyan    : BACKGROUND_BLUE | BACKGROUND_GREEN,
		Color.white   : BACKGROUND_BLUE | BACKGROUND_GREEN | BACKGROUND_RED,
	];

	enum Color[WORD] WindowsBackgroundColorReverse = [
		0                                                   : Color.black,
		BACKGROUND_RED                                      : Color.red,
		BACKGROUND_GREEN                                    : Color.green,
		BACKGROUND_RED | BACKGROUND_GREEN                   : Color.yellow,
		BACKGROUND_BLUE                                     : Color.blue,
		BACKGROUND_RED | BACKGROUND_BLUE                    : Color.magenta,
		BACKGROUND_BLUE | BACKGROUND_GREEN                  : Color.cyan,
		BACKGROUND_BLUE | BACKGROUND_GREEN | BACKGROUND_RED : Color.white,
	];


enum NOT_IMPLEMENTED = "Not implemented for your OS. Please file an enhancement request.";

struct Terminal
{
	this(File file)
	in
	{
		assert(file == std.stdio.stdout || file == std.stdio.stderr);
	}
	body
	{
		_file = file;
		_startUpAttributes = getCharacterAttributes();
	}
	@property
	Color foregroundColor(in Color color)
	{
		auto oldColor = foregroundColor();
		setCapability(Capability.foreground, color);
		return oldColor;
	}

	@property
	Color foregroundColor() const
	{
	  WORD characterAttributes = getCharacterAttributes() & 0x0007;
       return WindowsForegroundColorReverse[characterAttributes];
	}

	@property
	Color backgroundColor(in Color color)
	{
		auto oldColor = backgroundColor();
		setCapability(Capability.background, color);
		return oldColor;
	}

	@property
	Color backgroundColor() const
	{
      WORD characterAttributes = getCharacterAttributes() & 0x0070;
      return WindowsBackgroundColorReverse[characterAttributes];
	}

	@property
	void restoreDefaults()
	{
		setCapability(Capability.allOff);
	}

	@property
	void bold(in bool on)
	{
		setFace(Capability.boldFace, on);
	}


	@property
	void blink(in bool on)
	{
		setFace(Capability.blinkFace, on);
	}

	@property
	void reverse(in bool on)
	{
		setFace(Capability.reverseFace, on);
	}


	@property
	void underline(in bool on)
	{
		setFace(Capability.underlineFace, on);
	}


	private:
	WORD _startUpAttributes;
	File _file;
	alias _file this;

	void setFace(in Capability param, in bool on)
	{
		if (on) setCapability(param);
		else restoreDefaults;
	}


		WORD getCharacterAttributes() const
		{
			HANDLE stdoutHandle = GetStdHandle(STD_OUTPUT_HANDLE);
			enforce(stdoutHandle != INVALID_HANDLE_VALUE, sysErrorString(GetLastError()));
			CONSOLE_SCREEN_BUFFER_INFO consoleInfo;
			enforce(GetConsoleScreenBufferInfo(stdoutHandle, &consoleInfo), sysErrorString(GetLastError()));
			return consoleInfo.wAttributes;
		}

	void setCapability(T...)(in Capability capability, in T args) if (T.length <= 1)
	{
		extern(C) static int putcharcout(int c)
		{
			return fputc(c, std.stdio.stdout.getFP);
		}
		extern(C) static int putcharcerr(int c)
		{
			return fputc(c, std.stdio.stderr.getFP);
		}


			_file.flush();
			WORD characterAttributes = getCharacterAttributes();
			final switch(capability)
			{
				case Capability.foreground:
					static if (args.length == 1)
					{
						characterAttributes = (characterAttributes & ~0x0007) |
						                      WindowsForegroundColor[args];
						break;
					}
					else assert(false, "This can never happen.");
				case Capability.background:
					static if (args.length == 1)
					{
						characterAttributes = (characterAttributes & ~0x0070) |
						                      WindowsBackgroundColor[args];
						break;
					}
					else assert(false, "This can never happen.");
				case Capability.boldFace:
					characterAttributes |= FOREGROUND_INTENSITY;
					break;
				case Capability.blinkFace:
					characterAttributes |= BACKGROUND_INTENSITY;
					break;
				case Capability.reverseFace:
					characterAttributes |= COMMON_LVB_REVERSE_VIDEO;
					characterAttributes = (characterAttributes & ~0x0077) |
					                      WindowsForegroundColor[backgroundColor] |
										  WindowsBackgroundColor[foregroundColor];
					break;
				case Capability.underlineFace:
					characterAttributes |= COMMON_LVB_UNDERSCORE;
					break;
				case Capability.allOff:
					characterAttributes = _startUpAttributes;
					break;
			}

			HANDLE stdoutHandle = GetStdHandle(STD_OUTPUT_HANDLE);
			enforce(SetConsoleTextAttribute(stdoutHandle, characterAttributes), sysErrorString(GetLastError()));

	}

}
void main()
{

    foreach (color; __traits(allMembers, Color))
	writecf(mixin("Color." ~ color), "%s ", color);
	writecln(Color.red, "Este e vermelho");


	readln();

}
