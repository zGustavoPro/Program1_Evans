unit Uventana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,conversion;

type

  { TForm1 }

  TForm1 = class(TForm)
    crear: TButton;
    octal: TButton;
    Hexadecimal: TButton;
    baseN: TButton;
    Romano: TButton;
    literal: TButton;
    salir: TButton;
    setvalor: TButton;
    getvalor: TButton;
    invertir: TButton;
    capicua: TButton;
    par: TButton;
    impar: TButton;
    primo: TButton;
    binario: TButton;
    S: TEdit;
    r: TEdit;
    B: TEdit;
    titulo: TLabel;
    procedure baseNClick(Sender: TObject);
    procedure binarioClick(Sender: TObject);
    procedure capicuaClick(Sender: TObject);
    procedure crearClick(Sender: TObject);
    procedure getvalorClick(Sender: TObject);
    procedure HexadecimalClick(Sender: TObject);
    procedure imparClick(Sender: TObject);
    procedure invertirClick(Sender: TObject);
    procedure literalClick(Sender: TObject);
    procedure octalClick(Sender: TObject);
    procedure parClick(Sender: TObject);
    procedure primoClick(Sender: TObject);
    procedure RomanoClick(Sender: TObject);
    procedure salirClick(Sender: TObject);
    procedure setvalorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    V:numeros;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.crearClick(Sender: TObject);
begin
  V:=numeros.crear();
  ShowMessage('espacio creado');
end;

procedure TForm1.getvalorClick(Sender: TObject);
begin
S.Text:=IntToStr(V.getvalor());
end;

procedure TForm1.HexadecimalClick(Sender: TObject);
begin

    r.Text:=V.hexadecimal();
end;

procedure TForm1.imparClick(Sender: TObject);
begin
 V.impar();
end;

procedure TForm1.setvalorClick(Sender: TObject);
begin
   V.setvalor(StrToInt(S.Text));
   S.Text:='';
end;
 procedure TForm1.invertirClick(Sender: TObject);
begin
  V.invertir();
end;

procedure TForm1.literalClick(Sender: TObject);
begin
 r.Text:= V.literal();
end;

procedure TForm1.octalClick(Sender: TObject);
begin
 r.Text:= V.octal();
end;

procedure TForm1.parClick(Sender: TObject);
begin
  V.par();
end;

procedure TForm1.primoClick(Sender: TObject);
begin

    V.primo();
end;

procedure TForm1.RomanoClick(Sender: TObject);
begin
r.Text:=V.romano();
end;

procedure TForm1.salirClick(Sender: TObject);
begin
  close();
end;

 procedure TForm1.capicuaClick(Sender: TObject);
begin
  V.capicua();
end;

procedure TForm1.binarioClick(Sender: TObject);
begin
 r.Text:= V.binario();
end;


procedure TForm1.baseNClick(Sender: TObject);
var
  base:integer;
begin
      // if TryStrToInt(B.Text, base) then
  begin
  base:=B.Text;
  r.Text := V.baseN(base);
  end;
  end;

end.

