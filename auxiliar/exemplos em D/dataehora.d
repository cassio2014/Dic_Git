import std.stdio;
import std.datetime;
import std.process;


void main() {
	auto ct = Clock.currTime;
	write("\n\n\tData: ",ct.day," / ",ct.month," / ",ct.year,".\n");

	auto tv = Clock.currTime;
	write("\tHour: ",
	      tv.hour,":",
	      tv.minute,":",
	      tv.second,".",
	      tv.fracSec,"\n ");
	writeln("\n");
	wait(spawnShell("pause"));
}

