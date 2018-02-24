import std.stdio;
import std.process;

dchar lastLetter(const dchar[] str)
{
    return str[$ - 1];
}

void main()
{
    writeln("a ultima letra da palavra constant e = ",lastLetter("constant"),"\n");
}
