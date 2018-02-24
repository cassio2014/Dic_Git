import std.stdio;
import std.process;

void main()
{
    string[int] names = [ 1:"um", 7:"sete", 20:"vinte" ];

    int[string] values;

    foreach (key, value; names) {
        values[value] = key;
    }

    writeln("O Valor de vinte e = ",values["vinte"],"\n");
}
