unit Tventana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, TEmpleados,
  Tcadena;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Listar: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListarClick(Sender: TObject);
  private
   t:FEmpleados;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ListarClick(Sender: TObject);
begin
 ShowMessage(t.MaySueldo_Mujer_Mostrar());
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    T := FEmpleados.create();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage(t.getMaySueldo_AlPromedio());
end;

end.

