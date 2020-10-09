module Testedwritef;

import std.stdio;
import dic.dic;
import core.stdc.locale;
import std.process;

pragma(lib,"dic");

int main(){
    setlocale(LC_NUMERIC, "");

    int value = 120;
    dwriteln("\n");
    dwritefln("Valor      :║ %d",value);
    dwritefln("Hexadecimal:║ %x", value);
    dwritefln("Octal      :║ %o", value);
    dwritefln("Binario    :║ %b\n\n",value);

 dwritefln("R$%6.2f", 26.55);
 dwritefln("R$%6.02f", 6.7);


    dwritefln("\n\n %1$d ║ %1$x ║ %1$o ║ %1$b\n",value);
    dwritefln("10 espaços a direita  :║%10s║", value);
    dwritefln("10 espaços a esquerda :║%-10s║\n", value);

    dwriteln;
    wait(spawnShell("pause"));
    return 0;
}
