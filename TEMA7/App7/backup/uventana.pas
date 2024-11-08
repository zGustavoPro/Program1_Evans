unit Uventana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,TRegistro;

type

  { TForm1 }

  TForm1 = class(TForm)
    Babrir: TButton;
    Bcerrar: TButton;
    Bpr: TButton;
    BAnt: TButton;
    Bsg: TButton;
    Bult: TButton;
    Badic: TButton;
    Buscar: TButton;
    Act: TButton;
    Bnom: TButton;
    Salir: TButton;
    c: TEdit;
    Emp: TEdit;
    Label7: TLabel;
    r: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    N: TEdit;
    A: TEdit;
    OP: TOpenDialog;
    Sexo: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    procedure ActClick(Sender: TObject);
    procedure BabrirClick(Sender: TObject);
    procedure BadicClick(Sender: TObject);
    procedure BAntClick(Sender: TObject);
    procedure BcerrarClick(Sender: TObject);
    procedure BprClick(Sender: TObject);
    procedure BsgClick(Sender: TObject);
    procedure BultClick(Sender: TObject);
    procedure BuscarClick(Sender: TObject);
    procedure BnomClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
  private
   f:tipo;
   reg:persona;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BabrirClick(Sender: TObject);
var
  s:string;
begin
  ShowMessage('Abrir archivo.dat');
 // if (OD.Execute) then
 // begin
    f:=Tipo.create();
     s:=inputbox(' archivo => Nombre.Extension','','');
    f.setnom(s);
 //f.setnom(OD.FileName);
 f.abrir();
f.leer(reg);
c.text:=IntToStr(reg.ci);
r.text:=IntToStr(reg.re);
N.text:=reg.nom;
A.text:=reg.apm;
emp.text:=reg.em;
Sexo.text:=reg.sex;
//end;
Babrir.Enabled:=false;
Bcerrar.Enabled:=true;
act.Enabled:=true;
 bnom.Enabled:=true;
 buscar.Enabled:=true;
 bpr.Enabled:=true;
 bant.Enabled:=true;
 bsg.Enabled:=true;
 bult.Enabled:=true;
 badic.Enabled:=true;

end;

procedure TForm1.ActClick(Sender: TObject);
begin
 f.posicionar(f.getposicion()-2);
    reg.ci:=StrToint(c.text);
  reg.re:=StrToint(r.text);
  reg.nom:=N.text;
  reg.apm:=A.text;
  reg.em:=emp.text;
  reg.sex:=Sexo.text[1];
  f.escribir(reg);
  ShowMessage('Actualizo correctamente');
end;

procedure TForm1.BadicClick(Sender: TObject);
var
  s:string;
begin
 s:=inputbox(' archivo => Nombre.Extension','','');
  f:=tipo.create();
  f.setnom(s);
  f.abrir();
  f.posicionar(f.cantidad());
  reg.ci:=StrToint(c.text);
  reg.re:=StrToint(r.text);
  reg.nom:=N.text;
  reg.apm:=A.text;
  reg.em:=emp.text;
  reg.sex:=Sexo.text[1];
  f.escribir(reg);
  f.cerrar();
   c.text:='';
r.text:='';
N.text:='';
A.text:='';
emp.text:='';
Sexo.text:='';
end;

procedure TForm1.BAntClick(Sender: TObject);
begin
  if (f.getposicion()>1)then
  begin
   f.setposicion(f.getposicion()-2);
   f.leer(reg);
   c.text:=IntToStr(reg.ci);
r.text:=IntToStr(reg.re);
N.text:=reg.nom;
A.text:=reg.apm;
emp.text:=reg.em;
Sexo.text:=reg.sex;
  end else
  ShowMessage('Esta en el Primer Registro');
end;

procedure TForm1.BcerrarClick(Sender: TObject);
begin
  f.cerrar();
c.text:='';
r.text:='';
N.text:='';
A.text:='';
emp.text:='';
Sexo.text:='';
//t
Babrir.Enabled:=true;
Bcerrar.Enabled:=false;
act.Enabled:=false;
 bnom.Enabled:=false;
 buscar.Enabled:=false;
 bpr.Enabled:=false;
 bant.Enabled:=false;
 bsg.Enabled:=false;
 bult.Enabled:=false;
 badic.Enabled:=false;
end;

procedure TForm1.BprClick(Sender: TObject);
begin
  f.posicionar(0);
  f.leer(reg);
  c.text:=IntToStr(reg.ci);
r.text:=IntToStr(reg.re);
N.text:=reg.nom;
A.text:=reg.apm;
emp.text:=reg.em;
Sexo.text:=reg.sex;
end;

procedure TForm1.BsgClick(Sender: TObject);
begin
  if (not f.fin())then
  begin
   f.leer(reg);
c.text:=IntToStr(reg.ci);
r.text:=IntToStr(reg.re);
N.text:=reg.nom;
A.text:=reg.apm;
emp.text:=reg.em;
Sexo.text:=reg.sex;
  end else
ShowMessage('Esta en el ultimo Registro');
end;

procedure TForm1.BultClick(Sender: TObject);
begin
  f.setposicion(f.cantidad()-1);
  f.leer(reg);
  c.text:=IntToStr(reg.ci);
r.text:=IntToStr(reg.re);
N.text:=reg.nom;
A.text:=reg.apm;
emp.text:=reg.em;
Sexo.text:=reg.sex;
end;

procedure TForm1.BuscarClick(Sender: TObject);
var
  pos:integer;
  s:string;
begin
 s:=inputbox(' archivo => Nombre.Extension','','');
 pos:=StrToInt(Inputbox('posicion de registro','',''));
 f:=tipo.create();
 f.setNom(s);
  f.abrir();
  if (Pos>0)and (pos<f.cantidad())then  begin
  f.posicionar(f.cantidad());
  f.leer(reg);
     c.text:=IntToStr(reg.ci);
r.text:=IntToStr(reg.re);
N.text:=reg.nom;
A.text:=reg.apm;
emp.text:=reg.em;
Sexo.text:=reg.sex;
  end else
  ShowMessage('Posicion fuera de rango');
  f.cerrar();
end;

procedure TForm1.BnomClick(Sender: TObject);
var
  nombre:string;
  sw:boolean;
begin
  sw:=false;
 nombre:=inputbox('ingrese el nombre a buscar','','');
 f.posicionar(0);
 while( not f.fin())and (not sw)do
f.leer(reg);
 if (nombre=reg.nom) then
    sw:=true;
 if sw=true then
 begin
 c.text:=IntToStr(reg.ci);
r.text:=IntToStr(reg.re);
N.text:=reg.nom;
A.text:=reg.apm;
emp.text:=reg.em;
Sexo.text:=reg.sex;
end
  else
 ShowMessage('Registro no encontrado');
end;

procedure TForm1.SalirClick(Sender: TObject);
begin
  close();
end;



end.

