import std.stdio;
import std.string;
import std.process;

void print(string title, int[] slice)
{
    writeln(title, ":");

    foreach (i, element; slice) {
        writefln("%3s:%5s", i, element);
    }
}

int read_int(string message)
{
    int result;
    write(message, "? ");
    readf(" %s", &result);
    return result;
}

int[] readNumbers()
{
    int[] result;

    int count = read_int("How many numbers are you going to enter");

    foreach (i; 0 .. count) {
        result ~= read_int(format("Number %s", i));
    }

    return result;
}

void main()
{
    int[] numbers = readNumbers();
    print("Before sorting", numbers);
    numbers.sort;
    print("After sorting", numbers);
	writefln(" ");

}
