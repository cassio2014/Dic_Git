module contador_fixo;
import std.stdio;
import core.thread;
import std.process;

void main()
{
	for (int number = 0; ; ++number) {
		write("\rNumero: ", number);
		stdout.flush();
		Thread.sleep(500.msecs);
		if (number == 20 )
			break;
	}
	writeln();
	wait(spawnShell("pause"));
}
