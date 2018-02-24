import std.algorithm;
import std.array;
import std.csv;
import std.stdio;
import std.typecons;

extern (C) int kbhit();
alias tecla = kbhit;

void main()
{
auto text = "Name,Occupation,Salary\r"
    "Joe,Carpenter,300000\nFred,Blacksmith,400000\r\n";
foreach(record; csvReader!(string[string])(text, null))
{
    writefln("%s works as a %s and earns $%s per year.",
             record["Name"], record["Occupation"],
             record["Salary"]);
}
  writeln("\n\tTecle enter para sair....");
  while(!tecla){stdout.flush();}
}
