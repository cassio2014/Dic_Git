module quick;
/**
 Criei um exemplo na linguagem D
 utilizando a Biblioteca DGUI.
 ==============================================================
 Autor : Cassio Butrico   cassio_butrico@ig.com.br
 ===============================================================
 
 Para compilar em ambiente windos
 
 use:
 dmd quick.d quICK.res -L/SUBSYSTEM:windows:4
 
 --------------------------------------------------------------
 janela.rc
 
 #define IDI_quICK 100
 
 IDI_quICK ICON DISCARDABLE "quICK.ico"
 ==============================================================
 
 */

pragma(lib, "dgui.lib");	/// USE ISSO SE FOR COMPILAR MANUALMENTE.

import dgui.all;
import std.random;

int rand(int x){
	
	int r = uniform(0,x+1);
	return r;
}

void QuickSort(int[] a);
void qs(int[] a, int l,int r);

long troca;
long recursao;

//=======================
void QuickSort(int[] a)
{
	qs(a, 0 , a.length-1);
}
//========================

void qs(int[] a, int l,int r)
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
			troca++;
		}
	} while(i<=j);
	
	if(l<j) { qs(a, l , j); recursao++; }
	if(i<r) { qs(a, i , r); recursao++; }
}

enum
	IDI_quICK   = 100;    ///O meu icone

class MainForm:  Form
{
	MenuBar           meuMenu;
	TrackBar          deslizar;
	Label             label01;
	RichTextBox       Text01Box;
	RichTextBox       Text02Box;
	ProgressBar       barra01;
	ProgressBar       barra02;
	Button            botao01;
	Button            botao02;
	
	
	/// Valores iniciais para a Janela
	string Titulo            = "Quick Sort";
	
	// variaveis Globais
	int[] Tabela;
	string Testo;
	int cont=0;
	int max;
	int Valor;
	
	this()
	{
		/// =====  Formulario ======
		text                     = Titulo;
		startPosition            = FormStartPosition.centerScreen; ///Posição inicial do Formulario na tela
		minimizeBox              = true;
		maximizeBox              = false;
		icon                     = Application.resources.getIcon(IDI_quICK);//Pega o Icone do Resource
		size                     = Size(790, 600);
		formBorderStyle          = FormBorderStyle.fixed3d;
		
		/// MenuBar
		meuMenu                  = new MenuBar();
		MenuItem meArquivos      = this.meuMenu.addItem("Arquivos");
		MenuItem Separador       = this.meuMenu.addItem("|",false);
		MenuItem meSair          = this.meuMenu.addItem(" Sair");
		MenuItem meSaindo        = meArquivos.addItem("Sair");
		menu                     = this.meuMenu;
		
		// RichTextBox
		Text01Box                = new RichTextBox;
		Text01Box.bounds         = Rect(300,20,450,220);
		Text01Box.borderStyle    = borderStyle.fixedSingle;
		Text01Box.scrollBars    = true;
		Text01Box.parent         = this;
		
		// RichTextBox
		Text02Box                = new RichTextBox;
		Text02Box.bounds         = Rect(300,270,450,220);
		Text02Box.borderStyle    = borderStyle.fixedSingle;
		Text02Box.scrollBars    = true;
		Text02Box.parent         = this;
		
		
		//Label
		label01                 = new Label;
		label01.bounds          = Rect(120,50,50,20);
		label01.text            = "10";
		label01.parent          = this;
		
		
		//'TrackBar
		deslizar               = new TrackBar;
		deslizar.bounds        = Rect(30,100,240,100);
		deslizar.maxRange      = 9000;
		deslizar.minRange      = 10;
		deslizar.value         = 10;
		deslizar.parent        = this;
		deslizar.valueChanged.attach((TrackBar, sender )
		                             {
			label01.text    = to!string(deslizar.value);
			botao02.enabled         = false;
			barra01.value   = 0;
			barra02.value   = 0;
			Text01Box.text  ="";
			Text02Box.text  ="";
			Testo = "";
		});
		
		// ProgressBar
		barra01                 = new ProgressBar;
		barra01.bounds          = Rect(50,210,190,30);
		barra01.maxRange        = 100;
		barra01.minRange        = 0;
		barra01.value           = 0;
		barra01.parent          = this;
		
		// ProgressBar
		barra02                 = new ProgressBar;
		barra02.bounds          = Rect(50,460,190,30);
		barra02.maxRange        = 100;
		barra02.minRange        = 1;
		barra02.value           = 1;
		barra02.parent          = this;
		
		//Button
		botao01                    = new Button();
		botao01.bounds             = Rect(50,345,80,50);
		botao01.text               = "criar";
		botao01.parent             = this;
		botao01.click.attach((Control sender, EventArgs e)
		                     {
			Text01Box.text         ="";
			Text02Box.text         ="";
			barra01.value          = 0;
			barra02.value          = 0;
			Testo = "";
			//botao01.enabled         = false;
			//deslizar.enabled        = false;
			max                     = deslizar.value;
			Tabela.length           = deslizar.value;
			barra01.maxRange        = max;
			for(cont=0;cont<max;cont++)
			{
				Valor               = rand(max);
				Tabela[cont]        = Valor;
				Testo              ~= to!string(Valor) ~"  ";
				barra01.value           = cont+1;
			}
			Text01Box.text          = Testo;
			botao02.enabled         = true;
			
		});
		
		//Button
		botao02                    = new Button();
		botao02.bounds             = Rect(160,345,80,50);
		botao02.text               = "Clasificar";
		botao02.enabled            = false;
		botao02.parent             = this;
		botao02.click.attach((Control sender, EventArgs e)
		                     {
			//====================
			QuickSort(Tabela);
			//====================
			Testo = "";
			barra02.maxRange        = max;
			for(cont=0;cont<max;cont++)
			{
				Valor              = Tabela[cont];
				Testo             ~= to!string(Valor) ~"  ";
				barra02.value      = cont+1;
			}
			Testo   ~= "\n\n \tTocas efetuadas = " ~
				to!string(troca) ~
					"\n\n\tRecursão efetuadas = " ~
					to!string(recursao) ~" \n\n";
			Text02Box.text          = Testo;
			botao01.enabled         = true;
			botao02.enabled         = false;
			deslizar.enabled        = true;
		});
		meSaindo.click.attach(&this.mSaindo);     ///====== Cria evento para o menu Arquivos sair	======
		meSair.click.attach  (&this.mSaindo);     ///====== Cria evento para o menu sair	uso o mesmo evento  do menu Arquivos sair======
	}
	public void mSaindo(MenuItem sender, EventArgs e) ///===== executa evento para o menu mSaindo	======
	{
		Application.exit();
	}
}

//========================================
///inicios dos procedimentos  main
//=========================================

int main(string[] args)
{
	auto MinhaJanela   = new MainForm;
	Application.run(MinhaJanela);
	return 0;
}
