program lerdll;


{$APPTYPE CONSOLE}  {$H+}

uses
  SysUtils;

procedure imprima; external 'imprimir.dll';

{$R *.res}

begin
  WriteLn('Lida em ░Pascal░ !!!');
  WriteLn;
  imprima;
end.

