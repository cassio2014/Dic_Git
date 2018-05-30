module teste;

import std.stdio;
import std.string;
import dic.dic;

pragma(lib,"dic");

void main()
{
	string[string] dicio =
	[
		"9562" : "\xc8","200" : "\xc8" , "╚" : "\xc8"
	];

	string a = "9562";
	string b = "\xc8";
	string c = "200";
	string d = "╚";

	if(c in dicio)
	{
		dwriteln("\n\n\té achou = ",dicio[c]);
	}
	else
	{
		dwriteln("\n\n\tse achou = ",c);
	}
	readln();
}


