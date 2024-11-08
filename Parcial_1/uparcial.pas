unit Uparcial;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  Tparcial;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    crear: TButton;
    ele: TEdit;
    p: TEdit;
    setdim: TButton;
    getdim: TButton;
    setval: TButton;
    getval: TButton;
    cap_prim: TButton;
    SG: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cap_primClick(Sender: TObject);
    procedure crearClick(Sender: TObject);
    procedure getdimClick(Sender: TObject);
    procedure getvalClick(Sender: TObject);
    procedure setdimClick(Sender: TObject);
    procedure setvalClick(Sender: TObject);
  private
   v:parcial1;
  public
  procedure updateSG();
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.setdimClick(Sender: TObject);
begin
    v.setdim(StrToInt(ele.Text));
  ele.text:='';
  updateSG();
end;

procedure TForm1.setvalClick(Sender: TObject);
begin
 v.setvalor(Strtoint(p.text),strtoint(ele.text));
 P.TEXT:='';
 ele.text:='';
 updateSG();
end;

procedure TForm1.getdimClick(Sender: TObject);
begin
   p.Text:=IntToStr(v.getdim());
end;

procedure TForm1.cap_primClick(Sender: TObject);
begin
     V.prim_cap(StrToInt(inputbox('desde 1 hasta ','','')));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  v.ord_desc();
  updateSG();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  v.ord_burb();
  updateSG();
end;

procedure TForm1.crearClick(Sender: TObject);
begin
  v:=parcial1.create();
  updateSG();
  ShowMessage('vector creado');
end;

procedure TForm1.getvalClick(Sender: TObject);
begin
 ele.Text:= IntToStr(v.getvalor(StrToInt(p.Text)));
  p.Text:='';
end;

procedure TForm1.updateSG;
 var
  i:integer;
begin
  SG.ColCount:=v.getdim();
  for i:=1 to v.getdim() do
  SG.Cells[i-1,0]:=IntToStr(v.getvalor(i));
end;
end.

