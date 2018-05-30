import std.stdio;
import std.process;

void main()
{
    writeln("\n--- these are written in decimal ---");

    // fits an int, so the type is int
    writeln(       2_147_483_647, "\t\t",
            typeof(2_147_483_647).stringof);

    // does not fit an int and is decimal, so the type is long
    writeln(       2_147_483_648, "\t\t",
            typeof(2_147_483_648).stringof);

    writeln("\n--- these are NOT written in decimal ---");

    // fits an int, so the type is int
    writeln(       0x7FFF_FFFF, "\t\t",
            typeof(0x7FFF_FFFF).stringof);

    // does not fit an int and is not decimal, so the type is uint
    writeln(       0x8000_0000, "\t\t",
            typeof(0x8000_0000).stringof);

    // does not fit a uint and is not decimal, so the type is long
    writeln(       0x1_0000_0000, "\t\t",
            typeof(0x1_0000_0000).stringof);

    // does not fit a long and is not decimal, so the type is ulong
    writeln(       0x8000_0000_0000_0000, "\t\t",
            typeof(0x8000_0000_0000_0000).stringof);
	system("pause");
}
