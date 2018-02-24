module ASM;

import std.stdio;
import std.process;

void main()
{
	int  A;
	asm
	{
		mov EAX, 7 ;
		push EAX ;
		mov EAX, 2 ;
		pop EBX ;
		imul EBX ;
		push EAX ;
		mov EAX, 3 ;
		push EAX ;
		mov EAX, 1 ;
		pop EBX ;
		add EAX, EBX ;
		pop EBX ;
		sub EAX, EBX ;
		neg EAX ;
		mov [A], EAX ;
	}
	string B = "              int  A;\n" ~
		"	asm\n" ~
			"	{\n" ~
			"		mov EAX, 7 ;\n" ~
			"		push EAX ;\n" ~
			"		mov EAX, 2 ;\n" ~
			"		pop EBX ;\n" ~
			"		imul EBX ;\n" ~
			"		push EAX ;\n" ~
			"		mov EAX, 3 ;\n" ~
			"		push EAX ;\n" ~
			"		mov EAX, 1 ;\n" ~
			"		pop EBX ;\n" ~
			"		add EAX, EBX ;\n" ~
			"		pop EBX ;\n" ~
			"		sub EAX, EBX ;\n" ~
			"		neg EAX ;\n" ~
			"		mov [A], EAX ;\n" ~
			"	}\n";

	writeln("\n",B,"\t\tA=7*2-(3+1) = ", A);
	writeln();
    wait(spawnShell("pause"));
}
