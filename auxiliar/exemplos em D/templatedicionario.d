/**  objetivo: gera um template para um dicionario..

 projeto: dic

 Este trabalho está licenciado sob uma
 Licença Creative Commons
 Atribuição-NãoComercial 4.0 Internacional.
 Para ver uma cópia desta licença, visite.

 www.creativecommons.org/licenses/by-nc/4.0

 licença: <a href="http://creativecommons.org/licenses/by-nc/4.0/">creative commons 4.0 </a>

 Autor: Cassio Butrico

 email: cassio_butrico@hotmail.com

 versão: 1.0

 Data: 6 de agosto de 2014.


 */
module templatedicionario;
import std.stdio;
import std.string;
import std.conv;
import std.stdio;
import std.file;
/** struct dic é a estrutura para montagem
 do dicionario */
struct dic
{
	int numero;
	dchar caracter;
}

{
	File gravar = File(".\\dic\\"~ nome ~ ".d", "w");
	File linguas = File(".\\dic\\linguas.d", "w");

	dic[] dicionario =
	[
		dic(1,'☺'),     dic(2,'☻'),     dic(3,'♥'),
		dic(4,'♦'),     dic(5,'♣'),     dic(6,'♠'),
		dic(203,'â'), dic(266,'Â'), dic(204,'ä'),
		dic(216,'Ä'), dic(205,'à'), dic(267,'À'),
		dic(240,'á'), dic(265,'Á'), dic(206,'å'),
		dic(217,'Å'), dic(306,'ã'), dic(307,'Ã'),
		dic(207,'ç'), dic(200,'Ç'), dic(210,'ê'),
		dic(322,'Ê'), dic(212,'è'), dic(324,'È'),
		dic(202,'é'), dic(220,'É'), dic(211,'ë'),
		dic(323,'Ë'), dic(213,'ï'), dic(330,'Ï'),
		dic(241,'í'), dic(326,'Í'), dic(214,'î'),
		dic(327,'Î'), dic(215,'ì'), dic(336,'Ì'),
		dic(224,'ö'), dic(231,'Ö'), dic(242,'ó'),
		dic(340,'Ó'), dic(344,'õ'), dic(345,'Õ'),
		dic(225,'ò'), dic(343,'Ò'), dic(223,'ô'),
		dic(342,'Ô'), dic(201,'ü'), dic(232,'Ü'),
		dic(243,'ú'), dic(351,'Ú'), dic(226,'û'),
		dic(352,'Û'), dic(227,'ù'), dic(353,'Ù'),
		dic(244,'ñ'), dic(245,'Ñ'), dic(251,'®'),
		dic(270,'©'), dic(246,'ª'), dic(247,'º'),
		dic(253,'½'), dic(363,'¾'), dic(254,'¼'),
		dic(370,'°'), dic(361,'±'), dic(317,'¤'),
		dic(256,'«'), dic(257,'»'), dic(260,'░'),
		dic(261,'▒'), dic(262,'▓'), dic(333,'█'),
		dic(334,'▄'), dic(376,'■'), dic(337,'▀'),
		dic(311,'╔'), dic(273,'╗'), dic(315,'═'),
		dic(362,'‗'), dic(316,'╬'), dic(310,'╚'),
		dic(312,'╩'), dic(271,'╣'), dic(313,'╦'),
		dic(314,'╠'), dic(272,'║'), dic(274,'╝'),
		dic(332,'┌'), dic(277,'┐'), dic(252,'¬'),
		dic(137,'_'), dic(174,'|'), dic(300,'└'),
		dic(331,'┘'), dic(302,'┬'), dic(301,'┴'),
		dic(303,'├'), dic(304,'─'), dic(305,'┼'),
		dic(264,'┤'), dic(263,'│'), dic(365,'§'),
		dic(234,'£'), dic(354,'ý'), dic(355,'Ý'),
	];


	//================================================================================
	string tela1 =
		"/**  objetivo: dicionario. \n\n";
			" projeto: dic \n\n" ~
			" Este trabalho está licenciado sob uma \n" ~
			" Licença Creative Commons \n" ~
			" Atribuição-NãoComercial 4.0 Internacional.\n "~
			" Para ver uma cópia desta licença, visite \n\n" ~
			" www.creativecommons.org/licenses/by-nc/4.0\n\n" ~
			" licença: <a href=\"http://creativecommons.org/licenses/by-nc/4.0/\">creative commons 4.0 </a>\n\n" ~
			" Autor: Cassio Butrico \n\n" ~
			" email: cassio_butrico@hotmail.com \n\n" ~
			" versão: 1.0 \n\n" ~
			" Data:  6 de agosto de 2014.\n" ~
			"module dic."~ nome ~";\n\n" ~
			"	struct " ~ nome ~" \n" ~
			"	{ \n" ~
			"		string converte; \n" ~
			"		int numero; \n" ~
			"	} \n\n" ~
			"	alias dic = "~ nome ~"; \n\n" ~

			"	"~ nome ~"[] dicionario = ";
	//===============================================================================

	gravar.writeln(tela);
	gravar.write("[");
	int t = dicionario.length;
	foreach(x,achou;dicionario)
	{

		string aux = to!string(dicionario[x].numero);
		dchar letra = dicionario[x].caracter;
		int a = to!int(letra);
		if(x != t-1)
		{
			if(x % 3 == 0) gravar.writeln();
			gravar.writef("dic(\"\\%s\"  , %-4s), ",aux,a);
		}
		else
		{
			gravar.writef("\ndic(\"\\%-3s\", %-4s)\n];\n\n ",aux,a);
		}

	}
	linguas.writeln(licenca);
	linguas.writeln(LINGUAS);
	linguas.writeln(idioma);

}