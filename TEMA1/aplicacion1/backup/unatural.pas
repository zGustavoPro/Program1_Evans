unit Unatural;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,TUnatural;

type

  { TForm1 }

  TForm1 = class(TForm)
    salir: TButton;
    crear: TButton;
    menor: TButton;
    setvalor: TButton;
    getvalor: TButton;
    cantidad: TButton;
    sumas: TButton;
    pares: TButton;
    impares: TButton;
    primos: TButton;
    mayor: TButton;
    V: TEdit;
    D: TEdit;
    P: TEdit;
    Numeros: TLabel;
    procedure cantidadClick(Sender: TObject);
    procedure crearClick(Sender: TObject);
    procedure getvalorClick(Sender: TObject);
    procedure imparesClick(Sender: TObject);
    procedure mayorClick(Sender: TObject);
    procedure menorClick(Sender: TObject);
    procedure paresClick(Sender: TObject);
    procedure primosClick(Sender: TObject);
    procedure salirClick(Sender: TObject);
    procedure setvalorClick(Sender: TObject);
    procedure sumasClick(Sender: TObject);
  private
   N:natural;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.crearClick(Sender: TObject);
begin
  N:=natural.crear();
end;

procedure TForm1.cantidadClick(Sender: TObject);
begin
  V.TEXT:=IntToStr(N.cantida());
end;

procedure TForm1.getvalorClick(Sender: TObject);
begin
  V.TEXT:=IntToStr(N.getvalor());
end;

procedure TForm1.imparesClick(Sender: TObject);
begin
  ShowMessage('los numeros impares de 1 a n som:');
 N.impares();
end;

procedure TForm1.mayorClick(Sender: TObject);
begin
  V.TEXT:=IntToStr(N.mayor());
end;

procedure TForm1.menorClick(Sender: TObject);
begin
  V.TEXT:=IntToStr(N.menor());
end;

procedure TForm1.paresClick(Sender: TObject);
begin
  ShowMessage('los numeros pares de 1 a n son:');
  N.pares();
end;

procedure TForm1.primosClick(Sender: TObject);
begin
  N.primos();
end;

procedure TForm1.salirClick(Sender: TObject);
begin
  close();
end;

procedure TForm1.setvalorClick(Sender: TObject);
begin
  N.setvalor(StrToInt(V.TEXT));
  V.TEXT:='';
end;

procedure TForm1.sumasClick(Sender: TObject);
begin
  V.Text:=IntToStr(N.suma());
end;

end.

