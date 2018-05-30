import std.stdio;
import std.format;
import std.process;

void sprintf(ref string s, ...)
{
	void putc(dchar c)
	{
		s ~= c;
	}
	std.format.doFormat(&putc, _arguments, _argptr);
}

void main() {
	string testString;
	// Remember the format string:
	//   % - begins format
	//   0 - use leading '0's
	//   6 - we want 6 total chars printed (includes one for decimal)
	//   . - indicate precision (numbers after decimal)
	//   2 - do not show anything less than 1 cent
	sprintf(testString, "Your change %s is $%5.2f.", "Bob", 12.3456);
	writeln(testString);

	system("pause");
}
