module auxiliares;

enum
{
    /** Preta    = 0 */ Preta       = 0,
    /** Vermelha = 1 */ Vermelha    = 1,
    /** Verde    = 2 */ Verde       = 2,
    /** Amarela  = 3 */ Amarela     = 3,
    /** Azul     = 4 */ Azul        = 4,
    /** Lilas    = 5 */ Lilas       = 5,
    /** Cyan     = 6 */ Cyan        = 6,
    /** Branca   = 7 */ Branca      = 7,
}

extern(C){
export{

import std.conv;
import std.random;
import core.sys.windows.windows;


/** Janela(Nome da Janela, posição x, posição y, Largura, altura) */
void Janela(LPCSTR Nome="Janela",
            int pos_x=50,
            int pos_y=50,
            int larg=800,
            int altu=600);


/** repete("C" caracter a repetir, n numero de vezes)  */
string repete(string a, int i);

/** recebe um caracter vindo do teclado. */
char Tecla();

/** cls apaga a tela */
void cls();

/** gotoxy posiciona o cursor x = coluna y = linha*/
void gotoxy(int x=0, int y=0);

/**Cores muda a cor do testo fente e fubdo */
void Cores(int Cfente=7, int Cfundo=0,
            bool CfentIntenc = true,
            bool CfundoItenc = false);

/** Rotina para criar numeros inteiros randomicos */
int rand(int x);

}
}
