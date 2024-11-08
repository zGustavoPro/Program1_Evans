unit Uventana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids, Menus,TMatriz;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label5: TLabel;
    Elem_rep: TMenuItem;
    Inv_Matriz: TMenuItem;
    Deter_3x3: TMenuItem;
    Deter_2x2: TMenuItem;
    Diag_Prin: TMenuItem;
    Diag_Sec: TMenuItem;
    Elem_Moda: TMenuItem;
    Cal_inversa: TMenuItem;
    DP: TMenuItem;
    DS: TMenuItem;
    Salir: TMenuItem;
    TII: TMenuItem;
    TID: TMenuItem;
    TSD: TMenuItem;
    TSI: TMenuItem;
    M_adjunta: TMenuItem;
    M_Transpuesta: TMenuItem;
    Multi_M: TMenuItem;
    Resta_Matriz: TMenuItem;
    Ord_Asc: TMenuItem;
    Suma_M: TMenuItem;
    Sum_Bloq: TMenuItem;
    MenuItem6: TMenuItem;
    p: TEdit;
    ele: TEdit;
    Label1: TLabel;
    Ej_PractU5: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    Sum_Colm: TMenuItem;
    sum_Fil: TMenuItem;
    Mul_Matrizes: TMenuItem;
    SetElemM2: TMenuItem;
    GetElemM2: TMenuItem;
    Resultado: TLabel;
    MenuItem1: TMenuItem;
    Crear: TMenuItem;
    Filas: TMenuItem;
    Columnas: TMenuItem;
    GetElem: TMenuItem;
    Menu_Mat: TMainMenu;
    SetElem: TMenuItem;
    SG1: TStringGrid;
    SG2: TStringGrid;
    SG3: TStringGrid;
    procedure Cal_inversaClick(Sender: TObject);
    procedure ColumnasClick(Sender: TObject);
    procedure CrearClick(Sender: TObject);
    procedure Deter_2x2Click(Sender: TObject);
    procedure Deter_3x3Click(Sender: TObject);
    procedure Diag_SecClick(Sender: TObject);
    procedure DPClick(Sender: TObject);
    procedure DSClick(Sender: TObject);
    procedure Elem_ModaClick(Sender: TObject);
    procedure Elem_repClick(Sender: TObject);
    procedure FilasClick(Sender: TObject);
    procedure GetElemClick(Sender: TObject);
    procedure Inv_MatrizClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure Multi_MClick(Sender: TObject);
    procedure M_adjuntaClick(Sender: TObject);
    procedure M_TranspuestaClick(Sender: TObject);
    procedure Ord_AscClick(Sender: TObject);
    procedure Resta_MatrizClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure Suma_MClick(Sender: TObject);
    procedure Sum_BloqClick(Sender: TObject);
    procedure Mul_MatrizesClick(Sender: TObject);
    procedure SetElemM2Click(Sender: TObject);
    procedure GetElemM2Click(Sender: TObject);
    procedure SetElemClick(Sender: TObject);
    procedure Sum_ColmClick(Sender: TObject);
    procedure sum_FilClick(Sender: TObject);
    procedure Diag_PrinClick(Sender: TObject);
    procedure TIDClick(Sender: TObject);
    procedure TIIClick(Sender: TObject);
    procedure TSDClick(Sender: TObject);
    procedure TSIClick(Sender: TObject);
  private
    M1:Matriz;
    M2:Matriz;
    M3:Matriz;
  public
    procedure updateSG1();
    procedure updateSG2();
    procedure updateSG3();
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CrearClick(Sender: TObject);
begin
  M1:=Matriz.crear();
  M2:=Matriz.crear();
  M3:=Matriz.crear();
  ShowMessage('Matriz Creada');
  updateSG1();
  updateSG2();
  updateSG3();
end;

procedure TForm1.Deter_2x2Click(Sender: TObject);
begin
 ele.text:=IntToStr(M1.Determinante2x2());
end;

procedure TForm1.Deter_3x3Click(Sender: TObject);
begin
  ele.text:=IntToStr(M1.Determinante3x3());
end;

procedure TForm1.Diag_SecClick(Sender: TObject);
begin
 M1.diag_sec();
end;

procedure TForm1.DPClick(Sender: TObject);
begin
M1.DP();
end;

procedure TForm1.DSClick(Sender: TObject);
begin
 M1.DS();
end;

procedure TForm1.Elem_ModaClick(Sender: TObject);
begin
 p.Text:=IntToStr(M1.Moda_TSI_TID());
end;

procedure TForm1.Elem_repClick(Sender: TObject);
begin
  M1.Rep_elemM();
end;

procedure TForm1.ColumnasClick(Sender: TObject);
begin
  M1.setcols(StrToInt(InputBox('Cuantas Columnas','','')));
   ShowMessage('Columnas Creadas');
   updateSG1();
end;

procedure TForm1.Cal_inversaClick(Sender: TObject);
 var f,c:integer;
begin
   M2.Adjunta(M1);
   SG1.colCount:=M2.getcols();
   SG1.RowCount:=M2.getfils();
   for f:=1 to M2.getfils() do
   for c:=1 to M2.getcols() do
   SG1.cells[c-1,f-1]:= FloatToStr((1/M1.Determinante3x3())*(M2.getElem(f,c)));
   end;

procedure TForm1.FilasClick(Sender: TObject);
begin
   M1.setfils(StrToInt(InputBox('Cuantas Filas','','')));
   ShowMessage('Filas Creadas');
   updateSG1();
end;

procedure TForm1.GetElemClick(Sender: TObject);
var
f,c:string;
begin
   f:=InputBox(' Fila','','');
    c:=InputBox('Columna','','');
    if (f<>'')and (c<>'') then begin
   ele.Text:=IntToStr(M1.GetElem( StrToInt(f),StrToInt(c)));
   updateSG1();
   end else
     exit;
end;

procedure TForm1.Inv_MatrizClick(Sender: TObject);
begin
 M1.inver_Mtriz();
 updateSG1();
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  M3.suma_matriz(M1,M2);
  updateSG3();
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
var
f,c:Integer;
begin
   f:=StrToInt(InputBox(' Filas','',''));
    c:=StrToInt(InputBox('Columnas','',''));
    M2.setfils(f);
    M2.setcols(c);
    updateSG2();
    ShowMessage('Filas y Columnas  Creadas');
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
var
n,aux:integer;
begin
    ShowMessage('calcular promedio de toda una fila o columna');
aux:= StrToInt(inputBox('fila = 1 o  columna = 2','',''));
if aux=1 then  begin
n:= StrToInt(inputBox(' Numero De Fila  ','',''));
M1.prom_fil(n); end else   begin
 n:= StrToInt(inputBox(' Numero De Columna  ','',''));
 M1.prom_col(n); end;
end;

procedure TForm1.Multi_MClick(Sender: TObject);
begin
  M3.mult_Matriz(M1,M2);
  updateSG3();
end;

procedure TForm1.M_adjuntaClick(Sender: TObject);
begin
M2.Adjunta(M1);
updateSG2();
updateSG1();
end;

procedure TForm1.M_TranspuestaClick(Sender: TObject);
begin
 M1.Transpuesta(M2);
 updateSG2();
end;

procedure TForm1.Ord_AscClick(Sender: TObject);
begin
 M1.ord_matriz();
 updateSG1();
end;

procedure TForm1.Resta_MatrizClick(Sender: TObject);
begin
  M3.resta_matriz(M1,M2);
  updateSG3();
end;

procedure TForm1.SalirClick(Sender: TObject);
begin
 close();
end;

procedure TForm1.Suma_MClick(Sender: TObject);
begin
 M3.suma_Matriz(M1,M2);
 updateSG3();
end;

procedure TForm1.Sum_BloqClick(Sender: TObject);
var
f1,f2,c1,c2:integer;
begin
 f1:=StrToInt(inputBox(' Indice  Fila  :','',''));
 f2:=StrToInt(inputBox('  Fila Final :','',''));
  c1:=StrToInt(inputBox(' Indice  Columna  :','',''));
 c2:=StrToInt(inputBox(' Columna Final :','',''));
  P.Text:=IntToStr(M1.sum_bloque(f1,f2,c1,c2));
end;

procedure TForm1.Mul_MatrizesClick(Sender: TObject);
begin
  M3.mult_Matriz(M1,M2);
  updateSG3();
end;

procedure TForm1.SetElemM2Click(Sender: TObject);
var
  f,c,e:string;
begin
    f:=(InputBox(' Fila','',''));
    c:=(InputBox('Columna','',''));
    e:=(InputBox('elemento','',''));
     if (f<>'')and (c<>'')and (e<>'') then begin
    M2.setElem(StrToInt(f),StrToInt(c),StrToInt(e));
   updateSG2();
     end else exit;
end;

procedure TForm1.GetElemM2Click(Sender: TObject);
var
f,c:string;
begin
   f:=InputBox(' Fila','','');
    c:=InputBox('Columna','','');
    if (f<>'')and (c<>'') then begin
   ele.Text:=IntToStr(M2.GetElem( StrToInt(f),StrToInt(c)));
   updateSG2();
   end else
     exit;
end;



procedure TForm1.SetElemClick(Sender: TObject);
var
  f,c,e:string;
begin
    f:=(InputBox(' Fila','',''));
    c:=(InputBox('Columna','',''));
    e:=(InputBox('elemento','',''));
     if (f<>'')and (c<>'')and (e<>'') then begin
    M1.setElem(StrToInt(f),StrToInt(c),StrToInt(e));
   updateSG1();
     end else exit;
end;

procedure TForm1.Sum_ColmClick(Sender: TObject);
begin
  ele.Text:=IntToStr(M1.sum_colum(StrToInt(p.Text)));
  p.Text:='';
end;

procedure TForm1.sum_FilClick(Sender: TObject);
begin
  ele.Text:=IntToStr(M1.sum_fil(StrToInt(p.Text)));
  p.Text:='';
end;

procedure TForm1.Diag_PrinClick(Sender: TObject);
begin
  M1.Diag_prin();
end;

procedure TForm1.TIDClick(Sender: TObject);
begin
  M1.TID();
end;

procedure TForm1.TIIClick(Sender: TObject);
begin
 M1.TII();
end;

procedure TForm1.TSDClick(Sender: TObject);
begin
  M1.TSD();
end;

procedure TForm1.TSIClick(Sender: TObject);
begin
  M1.TSI();
end;

procedure TForm1.updateSG1;
var
  f,c:integer;
begin
  SG1.ColCount:=M1.getcols();
  SG1.RowCount:=M1.getfils();

  for f:=1 to M1.getfils() do
  for c:=1 to M1.getcols() do
  SG1.Cells[c-1,f-1]:=IntToStr(M1.getElem(f,c));
end;

procedure TForm1.updateSG2;
  var
  f,c:integer;
begin
  SG2.ColCount:=M2.getcols();
  SG2.RowCount:=M2.getfils();

  for f:=1 to M2.getfils() do
  for c:=1 to M2.getcols() do
  SG2.Cells[c-1,f-1]:=IntToStr(M2.getElem(f,c));
end;

procedure TForm1.updateSG3;
      var
  f,c:integer;
begin
  SG3.ColCount:=M3.getcols();
  SG3.RowCount:=M3.getfils();

  for f:=1 to M3.getfils() do
  for c:=1 to M3.getcols() do
  SG3.Cells[c-1,f-1]:=IntToStr(M3.getElem(f,c));
end;

end.

