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

import dic.dic;

pragma(lib,"dic");

extern(C) int kbhit();

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
    writeln("\n\n\n\n\n\n");
    while(!kbhit)
    {
        placar = rolar(placar);
        write("\r\t",placar);
        stdout.flush();
        Thread.sleep(100.msecs);
    }

    return 0;
}
