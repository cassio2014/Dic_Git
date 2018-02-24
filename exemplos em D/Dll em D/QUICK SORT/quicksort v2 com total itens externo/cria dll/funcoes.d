module funcoes;

extern (C){
//=======================
export
void PAUSAR(){
       import std.process;
       wait(spawnShell("pause"));
}

export
void CLS(){
   import std.process;
   wait(spawnShell("cls"));
}

export
int RAND(int a) {
	import std.random;
	auto r = uniform(0,a + 1);
	return r;
}

export
int TOTAL_ITENS;
export
long TOTAL_RECURS;
export
long TOTAL_TROCAS;
//=======================
export
void CLASIFICAR(int *a)
{
	QS(a, 0 , TOTAL_ITENS - 1);
}
//========================

void QS(int *a, int l,int r)
{
  int x,y;
  int i=0,j=0;
  i=l; j=r;
  x=a[((l+r)/2)];

// ordenacao
  do
  {
		while(a[i]< x && i<r ) i++;
		while(x<a[j] && j>l ) j--;
		if(i<=j)
			{
				y=a[i];
				a[i]=a[j];
				a[j]=y;
				i++;
				j--;
				TOTAL_TROCAS++;
			}
  } while(i<=j);
  if(l<j) { QS(a, l , j);TOTAL_RECURS++;}
  if(i<r) { QS(a, i , r);TOTAL_RECURS++;}
}
//=======================
}
