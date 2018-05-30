module Val_Ref;

import std.stdio;

int testeref(ref int valor){
 return valor += 10;
}

int testeval(int valor){
 return valor += 10;
}

int A = 20;

int main(){

 writeln("\n\n");

 writeln("   valor inicial A = ",A
  ," teste val = ",testeval(A)
  ," valor de A = ", A,"\n");


 writeln("   valor inicial A = ",A
  ," teste ref = ",testeref(A)
  ," valor de A = ", A);
  
 getchar();
 return 0;
}
