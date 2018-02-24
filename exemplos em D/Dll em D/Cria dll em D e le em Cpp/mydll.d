module mydll;

	extern (C) {
	 import std.stdio;
	export{
	
	void dllprint() {
		writeln("\nmydll.dll Lida com sucesso!!!\n"); 
	}

	int somar(int x, int y) {
		return x + y;
	}

}
}