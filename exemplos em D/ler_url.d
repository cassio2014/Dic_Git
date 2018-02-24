import std.net.curl;
import std.stdio;

void main()
{
	writeln(get("http://google.com/"));
}