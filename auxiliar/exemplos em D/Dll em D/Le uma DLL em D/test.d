import mydll;
import std.process;

pragma(lib,"mydll.lib");

void main()
{
	dllprint();
	wait(spawnShell("pause"));
 }
