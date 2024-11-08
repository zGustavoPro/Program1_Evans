unit TArchivo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,Utexto,PCadena,Tconjunto,Ttexto;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Archivos: TMenuItem;
    Guardar_como: TMenuItem;
    Editar: TMenuItem;
    cantidad_Palabras: TMenuItem;
    Cantidad_Parrafos: TMenuItem;
    Buscar_Palabra: TMenuItem;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Mezclar_dos_archivos: TMenuItem;
    OD: TOpenDialog;
    Remplazar_Palabra: TMenuItem;
    Salir: TMenuItem;
    Abrir: TMenuItem;
    SD: TSaveDialog;
    procedure AbrirClick(Sender: TObject);
    procedure Buscar_PalabraClick(Sender: TObject);
    procedure cantidad_PalabrasClick(Sender: TObject);
    procedure Cantidad_ParrafosClick(Sender: TObject);
    procedure Guardar_comoClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure Mezclar_dos_archivosClick(Sender: TObject);
    procedure Remplazar_PalabraClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
  private
    f4:PTexto;
   f1:Texto;
   f2:texto;
   f3:texto;
   c:cadena;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.AbrirClick(Sender: TObject);
begin
 if (OD.Execute) then
 begin
 Memo1.Clear;
 f1:=texto.crear();
 f1.setnom(OD.FileName);
f1.abrir();
while(Not f1.esfin())do
begin
Memo1.Lines.Add(f1.leerlinea());
end;
f1.cerrar();
end;
  end;

procedure TForm1.Buscar_PalabraClick(Sender: TObject);
var
p:string;
i:integer;
begin
  p:=inputbox('Que palabra desea Buscar?','','');
  c:=cadena.crear();
  i:=0;
 while (i<=Memo1.Lines.Count) do
 begin
 c.addpal(Memo1.Lines.Strings[i]);
 i:=i+1;
 end;
 if (c.buscpal(p)=-1)then
 ShowMessage('la palabra no fue encontrada') else
 ShowMessage('la palabra buscada se encuentra en la posicion => '+IntToStr(c.buscpal(p)));
end;

procedure TForm1.cantidad_PalabrasClick(Sender: TObject);
var
  i:integer;
begin
 c:=cadena.crear();
 i:=0;
 while (i<=Memo1.Lines.Count) do
 begin
 c.addpal(Memo1.Lines.Strings[i]);
 i:=i+1;
 end;
 ShowMessage('Cantida de palabras son '+ IntToStr(c.cantpal()))
end;

procedure TForm1.Cantidad_ParrafosClick(Sender: TObject);
var
 i:integer;
begin
  c:=cadena.crear();
  i:=0;
  While(i<=Memo1.Lines.Count)do
  begin
    c.addpal(Memo1.Lines.Strings[i]);
    i:=i+1;
  end;
  ShowMessage('Cantida De Parrafos Son '+IntToStr(c.Cant_Parr()));
end;

procedure TForm1.Guardar_comoClick(Sender: TObject);
var
  i:integer;
begin
  f1:=texto.crear();
 if (SD.Execute) then
 begin
  f1.setnom(SD.FileName);
  f1.crear_archivo();
  i:=0;
  while(i<=Memo1.Lines.Count)do
  begin
   f1.escribirlinea(Memo1.Lines.Strings[i]);
   i:=i+1;
  end;
  F1.cerrar();
 end;
 end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var
  p:real; may:string;
begin
      f4:=PTexto.crear();
     f4.setnom(OD.FileName);
     f4.MayorYpromedio(p,may);
     ShowMessage('promedio'+FloatToStr(p)+#10#13+'mayor sueldo: '+may);
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
     self.f4.setNom('salida.txt');

  f4.frecuenciaDePalabras(f4);
end;

  procedure TForm1.Mezclar_dos_archivosClick(Sender: TObject);
var
  i,k:integer;
begin
   if (OD.Execute) then
 begin
 Memo1.Clear;
 f1:=texto.crear();
 f1.setnom(OD.FileName);
f1.abrir();
while(Not f1.esfin())do
begin
Memo1.Lines.Add(f1.leerlinea());
end;
f1.cerrar;
end;
    if (OD.Execute) then
 begin
 Memo2.Clear;
 f2:=texto.crear();
 f2.setnom(OD.FileName);
f2.abrir();
while(Not f2.esfin())do
begin
Memo2.Lines.Add(f2.leerlinea());
end;
f2.cerrar();
end;
    i:=0;
    k:=0;
 while (i<Memo1.Lines.Count)or(k< Memo2.Lines.Count)do
  begin
    if i<Memo1.Lines.Count then
    begin
      Memo3.Lines.Add(Memo1.Lines.Strings[i]);
      i:=i+1;
    end;

    if k< Memo2.Lines.Count then
    begin
      Memo3.Lines.Add(Memo2.Lines.Strings[k]);
      k:=k+1;
    end;
  end;

 memo1.Clear;
 memo2.Clear;
end;


procedure TForm1.Remplazar_PalabraClick(Sender: TObject);
var
pal1,pal2:string;
i:integer;
begin
 i:=0;
 c:=cadena.crear();
  pal1:=inputbox('Palabra a Reemplazar','','');
  pal2:= inputbox('Por la Palabra','','');
  while(i<=Memo1.Lines.Count)do
  begin
    c.addpal(Memo1.Lines.Strings[i]);
    i:=i+1;
   end;
  c.cambpal(pal1,pal2);
   Memo1.lines.Text:=c.getpal();
end;

procedure TForm1.SalirClick(Sender: TObject);
begin
  Close();
end;

end.

