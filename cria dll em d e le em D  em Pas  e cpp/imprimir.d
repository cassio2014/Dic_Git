
extern(C){
pragma(lib, "dic");	
  export
	void imprima() {
		import std.stdio;
		import dic.dic;
		import std.process;
		writeln("imprima() na \'imprimir.dll\', sucesso!!!\n");
		dwriteln("veja se  é ç ou não é !!!!\n");
		wait(spawnShell("pause"));
	}
}
