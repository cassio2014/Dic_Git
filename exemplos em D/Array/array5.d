module array5;

import std.string;
import std.stdio;
import std.process;

struct dicionario {
    string palavra;  
    string definição;
}

void main() {
    
    
    dicionario[] Dicionario = [
        dicionario("Arroz","tipo Agulinha."),
        dicionario("Feijao","tipo tropeiro."),
        dicionario("Queijo","tipo branco mineiro."),
        dicionario("Cassio","o meu criador claro."),
        dicionario("Pao","com mortandela.")
    ];;
    
    writeln(Dicionario[0].palavra," ",Dicionario[0].definição);
    writeln(Dicionario[1].palavra," ",Dicionario[1].definição);
    writeln(Dicionario[2].palavra," ",Dicionario[2].definição);
    writeln(Dicionario[3].palavra," ",Dicionario[3].definição);
    writeln(Dicionario[4].palavra," ",Dicionario[4].definição);
	writefln("");
	wait(spawnShell("pause"));
}

