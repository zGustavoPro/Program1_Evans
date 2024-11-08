unit Vector;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids, Menus,Uvector;

type

  { TForm1 }

  TForm1 = class(TForm)
    setdim: TButton;
    getdim: TButton;
    random: TButton;
    setvalor: TButton;
    getvalor: TButton;
    crear: TButton;
    cargar: TButton;
    randon: TEdit;
    T1: TEdit;
    T2: TEdit;
    Label1: TLabel;
    Menu: TMainMenu;
    SG: TStringGrid;
    procedure getdimClick(Sender: TObject);
    procedure setdimClick(Sender: TObject);
    procedure cargarClick(Sender: TObject);
    procedure crearClick(Sender: TObject);
    procedure setvalorClick(Sender: TObject);
  private
    V:VECTOR;
    procedure updateSG();

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.crearClick(Sender: TObject);
begin
  V.crear();
  updateSG();
  ShowMessage('objeto iniciado');
end;

procedure TForm1.setvalorClick(Sender: TObject);
var
  E:integer;
begin
  E:=StrToInt(T2.Text);
  T2.text:='';
  uddateSg();
end;

procedure TForm1.setdimClick(Sender: TObject);
begin
     V.setdim(StrToInt(T1.Text));
     T1.Text:='';
     uddateSG();
end;

procedure TForm1.getdimClick(Sender: TObject);
begin
  T1.Text:=IntToStr(V.getdim());
end;

procedure TForm1.updateSG;
var
i:integer;
begin
  SG.ColCount:=V.getdim();
  for i:=1 to v.setdim() do
  SG.Cells[i-1,0]:=IntToStr(v.getelem(i));
end;

procedure TForm1.cargarClick(Sender: TObject);
begin
   ShowMessage('n1 rango del vector  n2: numeros random de 0 hsta n2');
   V.cargar(StrToInt();
end;

end.

