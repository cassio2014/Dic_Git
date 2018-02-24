//*********************************************************
//                  Subs e Funcoes
//*********************************************************

extern (C) {
	export
	void Multiplica(float *A, float *B, float *C, int Count) {
	int N;
     for(N=1;N<=Count;N++) {
			C[N]=A[N]*B[N];
		}
	}

}
   
