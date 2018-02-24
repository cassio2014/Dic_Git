#!rdmd
 /* Hello World em D
   Para compilar:
     dmd hello.d
   ou para otimizar:
     dmd -O -inline -release hello.d
*/
import std.stdio;

void main(char[][] args)
{
	writefln("Hello World, Reloaded");

	// infer&ecirc;ncia de tipo automatica e foreach nativo
	foreach(argc, argv; args)
	{
		// Orientado a Objetos
		CmdLin cl = new CmdLin(argc, argv);
		// printf melhorado
		writeln(cl.argnum, cl.suffix, " arg: ", cl.argv);
		// Gerenciamento de memoria automatico ou explicito
		delete cl;
	}

	// classes e estruturas aninhadas
	struct specs
	{
		// todos os membros inicializados automaticamente
		int count, allocated;
	}

	// funcoes aninhadas podem se referir
	// a variaveis mais externas, como args
	specs argspecs()
	{
		specs* s = new specs;
		
		// nenhuma necessidade para'-&gt;'
		s.count = args.length; // pega o comprimento do vetor com .length
		s.allocated = typeof(args).sizeof; // propriedades de tipo nativas
		foreach(argv; args)
			s.allocated += argv.length * typeof(argv[0]).sizeof;
		return *s;
	}

	// built-in string and common string operations
	writefln("argc = %d, " ~ "allocated = %d", argspecs().count, argspecs().allocated);
	import std.process;
	wait(spawnShell("pause"));
}

class CmdLin
{
	private int _argc;
	private char[] _argv;

	public:
		this(int argc, char[] argv)	// constructor
		{
			_argc = argc;
			_argv = argv;
		}

		int argnum()
		{
			return _argc + 1;
		}

		char[] argv()
		{
			return _argv;
		}

		char[] suffix()
		{
			char[] suffix = "th".dup;
			switch(_argc)
			{
				case 0:
					suffix = "st".dup;
					break;
				case 1:
			         suffix = "nd".dup;
					break;
				case 2:
					suffix = "rd".dup;
					break;
				default:
					break;
			}
			return suffix;
		}
}
