module funcoes;

extern (C){
//=======================
export
void CLS();
export
void PAUSAR();		
export 
int RAND(int x);
//=======================
export{
int TOTAL_ITENS;
long TOTAL_RECURS;
long TOTAL_TROCAS;
	}
//=======================
export
void CLASIFICAR(int *a);
//=======================
}
