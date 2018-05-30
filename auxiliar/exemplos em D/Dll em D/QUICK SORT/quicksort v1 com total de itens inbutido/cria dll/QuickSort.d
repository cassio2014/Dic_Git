module QuickSort;

extern (C){
//=======================
export
void clasifica(int *a, int x)
{
	//int total = x;
	qs(a, 0 , x-1);
}
//========================

void qs(int *a, int l,int r)
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
			}
  } while(i<=j);
  if(l<j) { qs(a, l , j); }
  if(i<r) { qs(a, i , r); }
}

//=======================
}