import std.stdio;
import std.process; // system("pause")
import std.random; // uniform(x,y) gera numeros randomicos entre x e y 
                   // exemplo    uniform(0,40) numeros enrte 0 a 40

int rand(int x){
	auto r = uniform(0,x+1);
	return r;
}
int rand(int x,int y){
	auto r = uniform(x,y+1);
	return r;
}
double rand(double x){
	auto r = uniform(0.0,x);
	return r;
}
double rand(double x,double y){
	auto r = uniform(x,y);
	return r;
}

void main() {
	auto gen = 40;
	auto gen1 = 40.1;
	writeln("Gera 10 numeros entre 0 a ",gen,"\n");
	for(int i =1;i<=10;i++){
	   writeln("Numero: ",i," gerado = ",rand(gen));
	}
	writeln("\nGera 10 numeros entre 0.0 a ",gen1,"\n" );
	for(int i =1;i<=10;i++){
	   writeln("Numero: ",i," gerado = ",rand(gen1));
	}
	writeln();
	wait(spawnShell("pause"));
}
