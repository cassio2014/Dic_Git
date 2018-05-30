import std.stdio;
import std.string;
import std.process;
import std.algorithm;
import std.file;
//import std.container : SList;

int main(string[] args)
{
	if (args.length == 1) {
		writeln("\n\nUse: lerbas <nome.bas>\n");
		wait(spawnShell("pause"));
		return(1);
	}
	if (exists(args[1]))
	{
		File file = File(args[1], "r");

      int contalinha=0;
      string[50] line;
	   while (!file.eof()) 
		{
		   line[contalinha] = chomp(file.readln());
		   writefln("%2d | %s",contalinha, line[contalinha]);
		   contalinha++;
	    }
	writeln("\n*** FIM ***\n");
    //writeln("Tem \"PRINT\" na linha \"0\" ? : Resposta = ",find(line[0], "PRINT")?"Sim.\n":"nao.\n");
    //writeln(" 0 | " ,line[0],"\n");
    //char[] nome = (line[0]).dup;
    //writeln("tamanho total da linha \"0\" = ",nome.length," Caracteres.\n");
	file.close();
	}else{
		writeln("\n\nUse: lerbas <nome.bas>\n"); 
	}
	wait(spawnShell("pause"));
	return (0);
}