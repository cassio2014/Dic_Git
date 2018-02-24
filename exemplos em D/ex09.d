import std.stdio;
import std.string;
import std.process;

void main()
{
    string op;
    double first;
    double second;

    write("Porfavor digite um operador(+,-,*,/): ");
    op = chomp(readln());

    write("Digite 2 valores separados por espacos: ");
    readf(" %s %s", &first, &second);

    double result;

    final switch (op) {

    case "soma":
        result = first + second;
        break;
			
    case "+":
        result = first + second;
        break;

    case "subtracao":  
        result = first - second;
        break;
			
    case "-":
        result = first - second;
        break;

    case "multiplicacao":
        result = first * second;
        break;
			
    case "*":
        result = first * second;
        break;

    case "divisao":
        result = first / second;
        break;
			
    case "/":
        result = first / second;
        break;
			
    }

    writeln("\nO resiltado = ",result,"\n");
	wait(spawnShell("pause"));
}
