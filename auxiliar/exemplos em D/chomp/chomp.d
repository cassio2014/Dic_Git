module chomp;

import std.stdio;
import std.string;
import std.process;


void main() {

    writeln("\n\nentre com frase acentuada:\n ");
    auto m = readln.chomp;
    writeln("\na frase digitada : ",m,"\n\n");
	wait(spawnShell("pause"));
}
