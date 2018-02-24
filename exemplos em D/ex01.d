import std.stdio;
import std.cstream;
import std.conv;
import std.process;

// welcome message to user
void displayWelcome()
{
	writef("Welcome to my adding program!\n\n");
}


// ask for an integer from user and return it
int askInt()
{
	char[] line;
	int num;

	writef("Enter an integer> ");

	line = din.readLine;

	num = std.conv.to!int(line);

	return num;
}

void displayResult(int result)
{
    writefln("The answer is %d", result);
}


// wait for user to press enter
void waitEnter()
{
	wait(spawnShell("pause"));
}


int main()
{
	int answer; // goal
	int n1, n2; //operands

		displayWelcome();

		n1 = askInt();
		n2 = askInt();

		answer = n1 + n2;// solve

		displayResult(answer);

		waitEnter();
		return 0;
}
