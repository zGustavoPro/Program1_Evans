unit enteros;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids, Menus,
  TInteger;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Ord_Desc: TMenuItem;
    Ord_Asc: TMenuItem;
    Setvalor: TButton;
    GetValor: TButton;
    crear: TButton;
    ele: TEdit;
    Label1: TLabel;
    p: TEdit;
    SG: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure crearClick(Sender: TObject);
    procedure GetValorClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure Ord_AscClick(Sender: TObject);
    procedure Ord_DescClick(Sender: TObject);
    procedure SetvalorClick(Sender: TObject);
  private
    v:parcial1;
  public
     procedure UpdateSG();
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  v.binario(StrToFloat(p.Text));
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  p.Text:=IntToStr(v.getdim());
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  V.dec_lit(StrToFloat(inputbox('Numero A Convertir A Literal','','')));
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 V.num_rom(StrToInt(inputbox('Numero A Convertir A Romano','','')));
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 p.Text:=V.num_octal(StrToInt(ele.Text));
 ele.Text:='';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  p.Text:=V.Frac_dec_bin(StrToFloat(ele.Text));
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
   p.Text:=V.Frac_dec_octal(StrToFloat(ele.Text));
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  V.prim_cap(StrToInt(inputbox('desde 1 hasta ','','')));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  v.setdim(StrToInt(ele.Text));
  ele.text:='';
  updateSG();
end;

procedure TForm1.crearClick(Sender: TObject);
begin
  v:=parcial1.create();
  updateSG();
  ShowMessage('vector creado');
end;

procedure TForm1.GetValorClick(Sender: TObject);
begin
  ele.Text:= IntToStr(v.getvalor(StrToInt(p.Text)));
  p.Text:='';
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  v.invertir(StrToInt(InputBox('ingrese el numero a invertir','','')));
end;

procedure TForm1.Ord_AscClick(Sender: TObject);
begin
  v.ord_asc();
  updateSG();
end;

procedure TForm1.Ord_DescClick(Sender: TObject);
begin
  v.ord_desc();
  updateSG();

end;

procedure TForm1.SetvalorClick(Sender: TObject);
begin
  v.setvalor(StrToInt(p.Text),StrToInt(ele.Text));
  p.Text:='';
  ele.Text:='';
  updateSG();
end;

procedure TForm1.UpdateSG;
var
  i:integer;
begin
  SG.ColCount:=v.getdim();
  for i:=1 to v.getdim() do
  SG.Cells[i-1,0]:=IntToStr(v.getvalor(i));
end;

end.

