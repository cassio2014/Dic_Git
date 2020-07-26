unit PuzzleU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil,
  Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons;

type

  { TfrmPUZZLE }

  TfrmPUZZLE = class(TForm)
    btmSair: TButton;
    btmMisturar: TButton;
    lbTotClick: TLabel;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    pnPUZZLE: TPanel;
  procedure btmMisturarClick(Sender: TObject);
  procedure btmSairClick(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure Botaoclick(sender: Tobject);
  procedure lbTotClickDblClick(Sender: TObject);
  procedure MoverBotao(Index: Integer);
  procedure Inverter(Ix: integer; Iy: integer);
  procedure Misturar;
  procedure pnPUZZLEClick(Sender: TObject);
  procedure pnPUZZLEDblClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Nome:string;
  macete:Boolean;
  Botao : array[1..16] of TPanel;
  TotalClick: Integer;
  Compara : array[1..16] of string =
                         ('A','B','C','D',
                          'E','F','G','H',
                          'I','J','K','L',
                          'M','N','O',' ');

  frmPUZZLE: TfrmPUZZLE;

implementation

{$R *.lfm}

{ TfrmPUZZLE }

procedure TfrmPUZZLE.Misturar;
var
  x, IndA, IndB: integer;
begin
     //Misturo as letras

     Randomize;

     for x:= 1 to 32 do
     begin
          IndA:=Random(16)+1;
          IndB:=Random(16)+1;
          if (IndA = IndB) then IndB:=Random(16)+1;
          Inverter(IndA,IndB);
     end;

    for x:= 1 to 16 do
    begin
      if Botao[x].Caption <> Compara[x] then
        Botao[x].Font.Color:=RGBToColor(0,0,0)
      else
        Botao[x].Font.Color:=RGBToColor(0,64,128);
    end;

     TotalClick:=0;
     lbTotClick.Caption:= intTostr(TotalClick);
end;

procedure TfrmPUZZLE.pnPUZZLEClick(Sender: TObject);
begin

end;


procedure TfrmPUZZLE.pnPUZZLEDblClick(Sender: TObject);

begin
    if macete = false then
      macete :=true
     else
       macete:=false;
end;

procedure TfrmPUZZLE.Inverter(Ix: integer; IY: integer);
var
  Troca: string;
begin
     if Botao[IX].Caption = ' ' then
      begin
        Botao[IX].Visible:= true;
        Botao[IY].Visible:= false;
      end
     else if Botao[IY].Caption = ' ' then
       begin
        Botao[IY].Visible:= true;
        Botao[IX].Visible:= false;
       end;

     //troca as posições, do caption
     Troca:=Botao[Ix].Caption;
     Botao[Ix].Caption := Botao[IY].Caption;
     Botao[IY].Caption:=Troca;
end;

procedure TfrmPUZZLE.MoverBotao(Index: Integer);
   var
     Ganhou :Boolean;
     x      :integer;
Begin

    if (Index =  5) and (Botao[4].Caption = ' ' ) then  exit;
    if (Index =  4) and (Botao[5].Caption = ' ' ) then  exit;
    if (Index =  8) and (Botao[9].Caption = ' ' ) then  exit;
    if (Index =  9) and (Botao[8].Caption = ' ' ) then  exit;

    if macete = false then
     begin
      if (index = 12) and (Botao[13].Caption = ' ') then  exit;
      if (index = 13) and (Botao[12].Caption = ' ') then  exit;
     end;


      { TODO : Verificar a posição e trocar para esquerda }
     if (index < 16) and (Index >=1)
       and (Botao[Index+1].Caption = ' ') then
     begin
         Inverter(Index, Index+1);
         TotalClick:=TotalClick + 1;
     end;

      { TODO : Verificar a posição e trocar para Direita }
     if (index > 1 ) and (Index <= 16)
       and (Botao[Index-1].Caption = ' ') then
     begin
         Inverter(Index, Index-1);
         TotalClick:=TotalClick + 1;
     end;

      { TODO : Verificar a posição e trocar para Baixo }
     if (index <=12 ) and (Index >=1)
       and (Botao[Index + 4].Caption = ' ') then
     begin
         Inverter(Index, Index + 4);
         TotalClick:=TotalClick + 1;
     end;

      { TODO : Verificar a posição e trocar para ciima}
     if (index <=16 ) and (Index >=5)
       and (Botao[Index - 4].Caption = ' ') then
     begin
         Inverter(Index, Index - 4);
         TotalClick:=TotalClick + 1;
     end;

      lbTotClick.Caption:= intTostr(TotalClick);

      Ganhou:=true;
      // verifico se ganhou
      for x:= 1 to 16 do
      begin
        if Botao[x].Caption <> Compara[x] then
            begin
                Ganhou:= false;
                Botao[x].Font.Color:=RGBToColor(0,0,0);
            end
        else
          Botao[x].Font.Color:=RGBToColor(0,64,128);
	end;
      if Ganhou = true then
      begin
          ShowMessage(Nome + ' Você completou com '
            + IntToStr(TotalClick) +  ' Clickes.' );
          btmMisturar.Enabled:=true;
      end;

end;

procedure TfrmPUZZLE.Botaoclick(sender: Tobject);
var
  Index:integer;
begin
     // Descubro qual botao foi precionado
     // e obtenho o indice = index
     if (Sender is TPanel) and
       TryStrToInt(TPanel(Sender).Hint, Index)
       then
       begin
        // aqui chamo a rotina para mover os Botões.
         MoverBotao(Index);
       end;

end;

procedure TfrmPUZZLE.lbTotClickDblClick(Sender: TObject);
begin
      btmMisturar.Enabled:=true;
end;

procedure TfrmPUZZLE.btmSairClick(Sender: TObject);
begin
     //sai do programa
     Application.Terminate;
end;

procedure TfrmPUZZLE.btmMisturarClick(Sender: TObject);
begin
   // aqui rotina para misturar as leytas.
  Misturar;
   btmMisturar.Enabled:=false;
   macete:=false;
end;

procedure TfrmPUZZLE.FormCreate(Sender: TObject);
var
  X: integer;


begin
     Botao[1]         :=Panel1;
     Botao[2]         :=Panel2;
     Botao[3]         :=Panel3;
     Botao[4]         :=Panel4;
     Botao[5]         :=Panel5;
     Botao[6]         :=Panel6;
     Botao[7]         :=Panel7;
     Botao[8]         :=Panel8;
     Botao[9]         :=Panel9;
     Botao[10]        :=Panel10;
     Botao[11]        :=Panel11;
     Botao[12]        :=Panel12;
     Botao[13]        :=Panel13;
     Botao[14]        :=Panel14;
     Botao[15]        :=Panel15;
     Botao[16]        :=Panel16;

     for x:=1 to 16 do
     begin
       Botao[x].Hint := IntToStr(x);
       Botao[x].OnClick:= @Botaoclick;
     end;


     macete:= false;
     Nome:= 'WishBone';
     frmPUZZLE.Caption:= Nome;
     Misturar;
     btmMisturar.Enabled:=false;

end;

end.

