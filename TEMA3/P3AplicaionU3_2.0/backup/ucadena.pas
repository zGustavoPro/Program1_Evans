unit Ucadena;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  Tcadena, Tconjunto;

type

  { TForm1 }

  TForm1 = class(TForm)
    BuscChar: TButton;
    Button1: TButton;
    Button2: TButton;
    rotar_abc: TButton;
    Encriptar: TButton;
    Desencriptar: TButton;
    v2rotar: TButton;
    v2add: TButton;
    Salir: TButton;
    CantPal: TButton;
    Label3: TLabel;
    Minusculas: TButton;
    SG2: TStringGrid;
    Titulo: TButton;
    InsPal: TButton;
    ElimPal: TButton;
    CambPal: TButton;
    BuscPal: TButton;
    AddPal: TButton;
    InvPal: TButton;
    RotarPal: TButton;
    Mayusculas: TButton;
    crear: TButton;
    CantChar: TButton;
    pos2: TEdit;
    ele2: TEdit;
    SetDim: TButton;
    GetDim: TButton;
    SetChar: TButton;
    GetChar: TButton;
    AddChar: TButton;
    InsChar: TButton;
    ElimChar: TButton;
    InterChar: TButton;
    Label2: TLabel;
    pos: TEdit;
    ele: TEdit;
    Label1: TLabel;
    SG: TStringGrid;
    procedure AddCharClick(Sender: TObject);
    procedure AddPalClick(Sender: TObject);
    procedure BuscCharClick(Sender: TObject);
    procedure BuscPalClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DesencriptarClick(Sender: TObject);
    procedure EncriptarClick(Sender: TObject);
    procedure rotar_abcClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure CambPalClick(Sender: TObject);
    procedure CantCharClick(Sender: TObject);
    procedure CantPalClick(Sender: TObject);
    procedure crearClick(Sender: TObject);
    procedure ElimCharClick(Sender: TObject);
    procedure ElimPalClick(Sender: TObject);
    procedure GetCharClick(Sender: TObject);
    procedure GetDimClick(Sender: TObject);
    procedure InsCharClick(Sender: TObject);
    procedure InsPalClick(Sender: TObject);
    procedure InterCharClick(Sender: TObject);
    procedure InvPalClick(Sender: TObject);
    procedure MayusculasClick(Sender: TObject);
    procedure MinusculasClick(Sender: TObject);
    procedure RotarPalClick(Sender: TObject);
    procedure SetCharClick(Sender: TObject);
    procedure SetDimClick(Sender: TObject);
    procedure TituloClick(Sender: TObject);
    procedure v2addClick(Sender: TObject);
    procedure v2rotarClick(Sender: TObject);
  private
    cad:cadena;
    cad2:cadena;
  public
   procedure updateSG();
   procedure updateSG2();

  end;

var
  Form1: TForm1;
  c:conjunto;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.crearClick(Sender: TObject);
begin
  cad:=cadena.create();
  cad2:=cadena.create();
  c:=conjunto.create();
  updateSG();
   updateSG2();

   ShowMessage('Objeto Iniciado');
end;

procedure TForm1.ElimCharClick(Sender: TObject);
begin
  cad.eliminar(ele.Text[1]);
  ele.Text:='';
  updateSG();
end;

procedure TForm1.ElimPalClick(Sender: TObject);
begin
  cad.ElimPal(ele2.Text);
  ele2.Text:='';
  updateSG();
end;

procedure TForm1.BuscCharClick(Sender: TObject);
begin
  pos.Text:=IntToStr(cad.buscarchar(ele.Text[1]));
  ele.Text:='';
end;

procedure TForm1.BuscPalClick(Sender: TObject);
begin
 { pos2.Text:=IntToStr(cad.BuscPal(ele2.Text));
  ele2.Text:=''; }
   pos2.Text:=IntToStr(cad.BuscPal(InputBox('Ingrese la palabra','','')));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
s,x1:string;
d:byte;
begin
 x1:=inputbox('palabra a encriptar','','');
 d:=StrToInt(inputbox('posicion a recorrer','',''));
 ele2.Text:=cad.encriptar_pal(x1,d);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
s,x1:string;
d:byte;
begin
   x1:=inputbox('palabra a encriptar','','');
 d:=StrToInt(inputbox('posicion a recorrer','',''));
 ele2.text:=cad.desencriptar_pal(x1,d);
end;

procedure TForm1.DesencriptarClick(Sender: TObject);
 var k : byte;
begin
  k := StrToInt(InputBox('','Ingrese el desplazamiento: ','3'));
  cad.Desencriptar(k);
  updateSG();
end;


procedure TForm1.EncriptarClick(Sender: TObject);
 var k : byte;
 begin
   k := StrToInt(InputBox('','Ingrese el desplazamiento: ','3'));
   cad.Encriptar(k);
    updateSG();
 end;

procedure TForm1.rotar_abcClick(Sender: TObject);
begin
  cad2.rota_ABC(ele2.text[1]);
  updateSG2();
end;


procedure TForm1.SalirClick(Sender: TObject);
begin
  close();
end;

procedure TForm1.CambPalClick(Sender: TObject);
begin
  cad.CambPal(pos2.Text,ele2.Text);
  pos2.Text:='';
  ele2.Text:='';
  updateSG();
end;

procedure TForm1.CantCharClick(Sender: TObject);
begin
  pos.Text:=IntToStr(cad.cantidadchar());
end;

procedure TForm1.CantPalClick(Sender: TObject);
begin
  pos2.Text:=IntToStr(cad.cantpal());
end;

procedure TForm1.AddCharClick(Sender: TObject);
begin
   cad.adicionar(ele.Text[1]);
   ele.Text:='';
   updateSG();
end;

procedure TForm1.AddPalClick(Sender: TObject);
begin
  cad.addpal(ele2.Text);
  ele2.Text:='';
  updateSG();
end;

procedure TForm1.GetCharClick(Sender: TObject);
begin
   ele.Text:=cad.getchar(StrToInt(pos.text));
   updateSG();
end;

procedure TForm1.GetDimClick(Sender: TObject);
begin
   pos.Text:=IntToStr(cad.GetDim());
end;

procedure TForm1.InsCharClick(Sender: TObject);
begin
  cad.insertar(StrToInt(pos.Text),ele.Text[1]);
  ele.Text:='';
  pos.Text:='';
  updateSG();
end;

procedure TForm1.InsPalClick(Sender: TObject);
begin
  cad.Inserpal(StrToInt(pos2.Text),ele2.Text);
  pos2.Text:='';
  ele2.Text:='';
  updateSG();
end;

procedure TForm1.InterCharClick(Sender: TObject);
begin
  cad.intercambiar(StrToInt(pos.Text),StrToInt(ele.Text));
  pos.Text:='';
  ele.Text:='';
  updateSG();
end;

procedure TForm1.InvPalClick(Sender: TObject);
begin
  ele2.Text:=cad.inverpal();
  updateSG;
end;

procedure TForm1.MayusculasClick(Sender: TObject);
begin
  cad.mayuscula();
  updateSG();
end;

procedure TForm1.MinusculasClick(Sender: TObject);
begin
  cad.minuscula();
  updateSG();
end;

procedure TForm1.RotarPalClick(Sender: TObject);
var
  s:word;
begin
  s:= StrToInt(InputBox('','cantidad',''));
  cad.Rotarpal(s);
  updateSG();
end;

procedure TForm1.SetCharClick(Sender: TObject);
begin
    cad.setchar(StrToInt(pos.Text),ele.Text[1]);
  pos.Text:='';
  ele.Text:='';
  updateSG();
end;

procedure TForm1.SetDimClick(Sender: TObject);
begin
  cad.SetDim(StrToInt(ele.Text));
  ele.Text:='';
  ShowMessage('Vector Iniciado');
  updateSG();

end;

procedure TForm1.TituloClick(Sender: TObject);
begin
  cad.Titulo(ele2.Text);
  ele2.Text:='';
  updateSG();
end;

procedure TForm1.v2addClick(Sender: TObject);
begin
  cad2.addpal(ele2.Text);
  ele2.Text:='';
  updateSG2();
end;

procedure TForm1.v2rotarClick(Sender: TObject);
var
  s:word;
begin
   s:= StrToInt(InputBox('','cantidad',''));
    cad2.Rotarpal(s);
    updateSG2();
end;

procedure TForm1.updateSG;
var
  i:integer;
begin
   SG.ColCount:=cad.getdim();
   for i:=1 to cad.getdim()do
   SG.Cells[i-1,0]:=(cad.GetChar(i));
end;

procedure TForm1.updateSG2;
 var
  i:integer;
begin
   SG2.ColCount:=cad2.getdim();
   for i:=1 to cad2.getdim()do
   SG2.Cells[i-1,0]:=(cad2.GetChar(i));
end;
end.

