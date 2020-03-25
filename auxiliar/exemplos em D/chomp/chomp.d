module chomp;

import std.stdio;
import std.string;
import std.process;


void main() {

    write("\n\nEntre com fraze acentuada:\n ");
    auto m = readln.chomp;
    writeln("a fraze digitada \n: ",m);
	 wait(spawnShell("pause"));
}
