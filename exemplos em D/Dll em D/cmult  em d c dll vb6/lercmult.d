module lercmult;

import std.stdio;
import std.process;
import cmult;

float[11] A;
float[11] B;
float[11] C;
int n;

int main(){
   for(n=1;n<11;n++)
   {
      A[n] = n * 1.1;
      B[n] = n * 2.2;
   }

   Multiplica(A.ptr,B.ptr,C.ptr,10);

   for(n=1;n<11;n++)
   {
       printf("C(%i) = %f \n\r",n, C[n]);
   }

   wait(spawnShell("pause"));
   return 0;

}
