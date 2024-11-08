unit minicalculadora;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    suma: TButton;
    resta: TButton;
    multiplicacion: TButton;
    divisor: TButton;
    salir: TButton;
    v1: TEdit;
    v2: TEdit;
    result: TEdit;
    titulo: TLabel;
    procedure divisorClick(Sender: TObject);
    procedure multiplicacionClick(Sender: TObject);
    procedure restaClick(Sender: TObject);
    procedure sumaClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.sumaClick(Sender: TObject);
var
  num1,num2,r:integer;
begin
  num1:=StrToInt(v1.text);
  num2:=StrToInt(v2.text);
  r:=num1+num2;
  result.text:=IntToStr(r);

end;

procedure TForm1.restaClick(Sender: TObject);
var
  num1,num2,r:integer;
begin
  num1:=StrToInt(v1.text);
  num2:=StrToInt(v2.text);
  r:=num1-num2;
  result.text:=IntToStr(r);
end;

procedure TForm1.multiplicacionClick(Sender: TObject);
var
  num1,num2,r:integer;
begin
  num1:=StrToInt(v1.text);
  num2:=StrToInt(v2.text);
  r:=num1*num2;
  result.text:=IntToStr(r);
end;

procedure TForm1.divisorClick(Sender: TObject);
var
 num1,num2,r:double;
begin
  num1:=StrToFloat(v1.text);
  num2:=StrToFloat(v2.text);
  r:=num1 / num2;
  result.text:=FloatToStr(r);
end;

end.

