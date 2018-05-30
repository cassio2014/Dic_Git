module array4;

import std.string;
import std.stdio;
import std.process;

struct dicionario {
        string palavra;
        string definição;
}

void main() {
        string[] lista = ["arroz",
                "Feijao",
                "Queijo",
                "Cassio",
                "Pao",
                "tipo agulinha.",
                "tipo tropeoro.",
                "de minas branco.",
                "o meu criador claro.",
                "com mortandela."];
        // slace = corte , corta em 2 partes $ = total de item da tabela lida
        string[] palavra   = lista[0..$/2];
        string[] definição = lista[$/2..$];


        dicionario[] Dicionario;
        foreach(i,x;palavra)
        {
                Dicionario ~= dicionario(palavra[i],definição[i]);
        }

        writeln(Dicionario[0].palavra," ",Dicionario[0].definição);
        writeln(Dicionario[1].palavra," ",Dicionario[1].definição);
        writeln(Dicionario[2].palavra," ",Dicionario[2].definição);
        writeln(Dicionario[3].palavra," ",Dicionario[3].definição);
        writeln(Dicionario[4].palavra," ",Dicionario[4].definição);
		writefln("");
		wait(spawnShell("pause"));
}

