/** objetivo: demonstrar como é impresso no terminal.
 
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

module ex_dwrite;


pragma(lib,"dic");

import std.stdio;
import std.string;
import core.thread;
import dic.dic;

extern (C) int kbhit();
alias tecla = kbhit;

/** demostra o uso do dwrite e do dwriteln */
int main()
{
    dchar[] letra =
    [
        '☺','☻','♥','♦','♣','♠','♂','♀','♫','☼','►',
        '◄','↕','‼','¶','§','▬','↨','↑','↓','→','←','∟','↔','▲','▼','^',
        '_','⌂','Ç','ü','é','â','ä','à','å','ç','ê','ë','è','ï','î',
        'ì','Ä','Å','É','æ','Æ','ô','ö','ò','û','ù','ÿ','Ö','Ü','ø',
        '£','Ø','ƒ','á','í','ó','ú','ñ','Ñ','ª','º','¿','®','¬','½',
        '¼','¡','«','»','░','▒','▓','│','┤','Á','Â','À','©','╣','║',
        '╗','╝','¢','¥','┐','└','┴','┬','├','─','┼','ã','Ã','╚','╔',
        '╩','╦','╠','═','╬','¤','ð','Ð','Ê','Ë','È','ı','Í','Î','Ï',
        '┘','┌','█','▄','¦','Ì','▀','Ó','ß','Ô','Ò','õ','Õ','µ','þ',
        'Þ','Ú','Û','Ù','ý','Ý','¯','­','±','‗','¾','¶','§','÷','°',
        '¨','¹','³','²','■' ];

    foreach(ler;letra)
    {
        dwrite(ler," ");
    }
    writeln("\n");
//    writeln("0123456789");
//    writeln("abcdefghijklmnopqrstuvwxyz");
//    writeln("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
//    writeln("\' \" ! @ # $ % & * ( ) [ ] { } ? ; : < > |");
    dwriteln("☺ ☻ ♥ ♦ ♣ ♠");
    dwriteln("â Â ä Ä à À á Á å Å ã Ã ç Ç ê Ê è È");
    dwriteln("é É ë Ë ï Ï í Í î Î ì Ì ö Ö ó Ó õ Õ");
    dwriteln("ò Ò ô Ô ü Ü ú Ú û Û ù Ù ñ Ñ ý Ý");
    dwriteln("® © ª º ½ ¾ ¼ ° ± ¤ « » ¥  § Ð ¢");
    dwriteln("░ ▒ ▓ █ ▄ ■ ▀ ♂ ♀ ↕ ↑ ↓ → ← ↔ ▬ ► ◄ ▲ ▼");
    dwriteln("♫ ☼ ¹ ² ³ ¶ ‼ £ ƒ æ Æ þ Þ ð ⌂ ¿ ø Ø");
    dwriteln("╔ ╗ ═ ‗ ╬ ╚ ╩ ╣ ╦ ╠ ║ ╝");
    dwriteln("┌ ┐ ¬ _ | └ ┘ ┬ ┴ ├ ─ ┼ ┤");
    dwriteln();
    dwriteln("\nuse \"acentuação\"  e gráficos -> ░▒░ juntos ♣ com palavras.\n");
    dwriteln("use somente scapes validos\n\nExemplo:");
    dwriteln("   \\xc2\\xa5  = \xc2\xa5\n   \\u00a5    = \u00a5\n   alt + 190 = ¥\n");
    
    dwriteln("não use:\n   exemplo: \\211 = ","\"\211\""," da erro na conversão da string.\n");
    dwriteln("Da  ERRO NA CONVERSÃO SE USAR \\211 = \211 ");
    dwriteln("SEM ERRO NA CONVERSÃO USE \\u00eb = \u00eb\n");
    
    write("\t** <tecle algo para sair...> **");
    while(!tecla)	{stdout.flush();}
    return 0;
}
