/** objetivo: um placar eletronico demo..

 projeto: dic

 Este trabalho está licenciado sob uma
 Licença Creative Commons
 Atribuição-NãoComercial 4.0 Internacional.
 Para ver uma cópia desta licença, visite

 www.creativecommons.org/licenses/by-nc/4.0

 licença: <a href="http://creativecommons.org/licenses/by-nc/4.0/">creative commons 4.0</a>

 Autor: Cassio Butrico

 email: cassio_butrico@hotmail.com

 versão: 2.0

 Data: 6 de agosto de 2014.

 */

module placar;

import std.stdio;
import core.thread;
import std.process;

import dic.dic;

pragma(lib,"dic");

extern(C) int kbhit();
extern(C) int getch(); 

/** string rolar movimenta caracter por caracter pela trela **/
string rolar(string args)
{
        string Auxiliar;
        string PrimeiraLetra;
        foreach(x,letra;args){
           if(x==0){PrimeiraLetra ~= letra;continue;}
            Auxiliar ~= letra;
        }
        Auxiliar ~= PrimeiraLetra;
        return Auxiliar;
}

int main(string[] args)
{
    string placar = dicconv(
        "░░░░░░░░░░░░" ~
            " placar eletrônico " ~
            "░░░░░░░░░░░░");
    string segplacar = "Segundo placar segundo placar";
    wait(spawnShell("cls"));
    int l;
    while(!kbhit)
    {   
       // wait(spawnShell("cls"));
        write("\n\n");
        write("\n\n");
        write("\n\n");
        placar = rolar(placar);
        writeln("\t",placar);
        write("\n\n");
        segplacar = rolar(segplacar);
        writeln("\t",segplacar);
        write("\n\n");
        writeln("\tOk travado...");
        //stdout.flush();
        Thread.sleep(110.msecs);
        wait(spawnShell("cls"));
    }
    // ;
     printf("\n tecla precionada %d\n\b",getch);
     
    
    return 0;
}
