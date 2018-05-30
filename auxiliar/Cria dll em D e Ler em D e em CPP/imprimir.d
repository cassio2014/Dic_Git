
extern(C){
  export
	void imprima() {
		import std.stdio;
		import std.process;
		writeln("imprima() na \'imprimir.dll\', sucesso!!!\n");
		wait(spawnShell("pause"));
	}
}
