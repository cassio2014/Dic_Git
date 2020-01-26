# Projeto DIC #

 Este projeto está licenciado sob uma
 Licença Creative Commons
 Atribuição-NãoComercial 4.0 Internacional.
 Para ver uma cópia desta licença, visite

 www.creativecommons.org/licenses/by-nc/4.0

 licença: [creative commons 4.0](http://creativecommons.org/licenses/by-nc/4.0/)

 Autor: Cassio Butrico

 email: cassio_butrico@hotmail.com

 versão: 2.1

 Data: 28 de Janeiro de 2020.
 
 DMD v2.079.0 - WINDOWS.

### Para que é este projeto? ###

* DIC dicionario de letras tradutor.
* Totalmente escrito em linguagem D.
* versão: 2.1

### Como eu configuro? ###

* DIC é um lib "dic.lib"
* esta versão é para windows
* Para criar a lib use:
*  lib32.bat
* isso cria o lib para 32bit.
* se quiser o lib para 64bit rode o allLib.bat

# exemplo :
      c:\dic.v2\lib32.bat
	  ou
	  c:\dic.v2\allLib.bat

### Como instalar ? ###

* Depois que você criou as libs.
copie a pasta dic para a pasta import.

## Geralmente esta em :
      C:\D\dmd2\src\druntime\import

## a lib 32 ma pasta :
      C:\D\dmd2\windows\lib
  
## a lib 64 na pasta :
      C:\D\dmd2\windows\lib64
  
# exemplo:
       mkdir C:\D\dmd2\src\druntime\import\dic
       copy dic\*.* C:\D\dmd2\src\druntime\import\dic
       copy lib32\dic.lib C:\D\dmd2\windows\lib
       copy lib64\dic.lib C:\D\dmd2\windows\lib64
	   
	   
* Na pasta resource tem um arquivo 
* zip, Resources.zip nele tem programas binarios e dll que 
* deverã ser colocada na pasta bin do D.

	   
# use em seus programas:  
* import dic.dic;
* pragma(lib,"dic.lib");

### para mostrar strings com acentos use dwrite ou dwriteln.
### para converter uma string use dicconv.	 

### Como uso? ###

* dwrite
* dwriteln
* dicconv

# dwrite:
      dwrite("Você pode colocar acentos, e tb simbolos graficos ▒░░ :)";

# dwriteln a mesma coisa, so que pula uma linha.

# dicconv:
converte uma string criada, para ser usada com write ou writeln normalmente

# exemplo:
      string nome = dicconv("Cássio");
      writeln(nome);
	  

# observe:
    dwriteln("\nuse \"acentuação\"  ¥ gráficos -> ░▒░ juntos ♣ com palavras.\n");
    dwriteln("use somente scapes validos\n\nExemplo:");
    dwriteln("   \\xc2\\xa5  = \xc2\xa5\n   \\u00a5    = \u00a5\n   alt + 190 = ¥\n");
    dwriteln("não use:\n   exemplo: \\211 = ","\"\211\""," da erro na conversão da string.\n");
    dwriteln("DÁ ERRO NA CONVERSÃO SE USAR \\211 = \211 ");
    dwriteln("SEM ERRO NA CONVERSÃO USE \\u00eb = \u00eb\n");
# Saida:
     use "acentuação"  ¥ gráficos -> ░▒░ juntos ♣ com palavras.

     use somente scapes validos

      Exemplo:
         \xc2\xa5  = ¥
         \u00a5    = ¥
         alt + 190 = ¥

      não use:
          exemplo: \211 = "ë" da erro na conversão da string.

       D├ü ERRO NA CONVERS├âO SE USAR \211 = ë 

       SEM ERRO NA CONVERSÃO USE \u00eb = ë

### O mesmo é valido para dicconv ok.

#OS CARACTERES ACEITOS:
  ☺ ☻ ♥ ♦ ♣ ♠ ♂ ♀ ♫ ☼ ► ◄ ↕ ‼ ¶ § ▬ ↨ ↑ ↓ → ← ∟ ↔ ▲ ▼ ^ _ ⌂ Ç ü é â ä à
  å ç ê ë è ï î ì Ä Å É æ Æ ô ö ò û ù ÿ Ö Ü ø £ Ø ƒ á í ó ú ñ Ñ ª º
  ¿ ® ¬ ½ ¼ ¡ « » ░ ▒ ▓ │ ┤ Á Â À © ╣ ║ ╗ ╝ ¢ ¥ ┐ └ ┴ ┬ ├ ─ ┼ ã Ã ╚ ╔
  ╩ ╦ ╠ ═ ╬ ¤ ð Ð Ê Ë È ı Í Î Ï ┘ ┌ █ ▄ ¦ Ì ▀ Ó ß Ô Ò õ Õ µ þ Þ Ú Û
  Ù ý Ý ¯ ­ ± ‗ ¾ ¶ § ÷ ° ¨ ¹ ³ ² ■

# divirta-se.
