module chomp;

import std.stdio;
import std.string;
import std.process;


void main() {

    write("\n\nentre com fraze acentuada:\n ");
    auto m = readln.chomp;
    writeln("a fraze digitada : ",m);
	 wait(spawnShell("pause"));
}
