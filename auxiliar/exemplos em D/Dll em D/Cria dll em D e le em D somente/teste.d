#!rdmd
import mydll;
import std.process;

void main()
{
	dllprint();
	wait(spawnShell("pause"));
 }
