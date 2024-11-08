unit Pventana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls, Menus,
  Tventana,TInteger,Uvector,Uventana;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Cant_elem: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ele1: TEdit;
    ele2: TEdit;
    ele3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MainMenu1: TMainMenu;
    Mult3_Par_Palindromo: TMenuItem;
    Ord_Desc_A_B: TMenuItem;
    Ord_burb_Asc: TMenuItem;
    Ord_Burb_Desc: TMenuItem;
    Mezcla_C_A_B: TMenuItem;
    Mod_exms: TMenuItem;
    SG1: TStringGrid;
    SG2: TStringGrid;
    SG3: TStringGrid;
    SG4: TStringGrid;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Cant_elemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Mezcla_C_A_BClick(Sender: TObject);
    procedure Mult3_Par_PalindromoClick(Sender: TObject);
    procedure Ord_burb_AscClick(Sender: TObject);
    procedure Ord_Burb_DescClick(Sender: TObject);
    procedure Ord_Desc_A_BClick(Sender: TObject);
  private
   V1:VectorPlus;
   V2:VectorPlus;
   V3:VectorPlus;
   V4:VectorPlus;
  public
   procedure updateSG1();
    procedure updateSG2();
    procedure updateSG3();
    procedure updateSG4();
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Mezcla_C_A_BClick(Sender: TObject);
begin
  V4.Intercalar_C_A_B(V3,V1,V2);
  updateSG4();
end;

procedure TForm1.Mult3_Par_PalindromoClick(Sender: TObject);
begin
  V1.Div_par_capic_Mul3(V2,V3,V4);
  updateSG2();
  updateSG3();
  updateSG4();
end;

procedure TForm1.Ord_burb_AscClick(Sender: TObject);
begin
 V1.Ord_Burb_Asc();
 updateSG1();
end;

procedure TForm1.Ord_Burb_DescClick(Sender: TObject);
begin
  V1.Ord_Burb_Desc();
  updateSG1();
end;

procedure TForm1.Ord_Desc_A_BClick(Sender: TObject);
begin
  V3.Mez_Desc(V1,V2);
  updateSG3();
end;

procedure TForm1.updateSG1;
 var i:integer;
begin
  SG1.ColCount:=V1.getdim();
  for i:=1 to V1.getdim() do
  SG1.Cells[i-1,0 ]:=IntToStr(V1.getval(i));

end;


procedure TForm1.updateSG2;
  var i:integer;
begin
  SG2.ColCount:=V2.getdim();  //
  for i:=1 to V2.getdim() do
  SG2.Cells[i-1,0 ]:=IntToStr(V2.getval(i));

end;


procedure TForm1.updateSG3;
  var i:integer;
  begin
    SG3.ColCount:=V3.getdim();  //
    for i:=1 to V3.getdim() do
    SG3.Cells[i-1,0 ]:=IntToStr(V3.getval(i));

  end;

procedure TForm1.updateSG4;
 var i:integer;
  begin
    SG4.ColCount:=V4.getdim();  //
    for i:=1 to V4.getdim() do
    SG4.Cells[i-1,0 ]:=IntToStr(V4.getval(i));
  end;


procedure TForm1.Button8Click(Sender: TObject);
begin
  V1:=VectorPlus.crear();
  V2:=VectorPlus.crear();
  V3:=VectorPlus.crear();
  V4:=VectorPlus.crear();
  updateSG1();
  updateSG2();
  updateSG3();
  updateSG4();
  ShowMessage('Vector Iniciado');
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  ele1.Text:=IntToStr(v1.getdim());
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  close();
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  V1.add_ele(StrToInt(ele1.Text));
  ele1.Text:='';
  updateSG1();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  V2.add_ele(StrToInt(ele2.Text));
  ele2.Text:='';
  updateSG2();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  V3.add_ele(StrToInt(ele3.Text));
  ele3.Text:='';
  updateSG3();
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  V1.ordenarV();
 ele1.Text:=IntToStr(V1.cortcon());
 updateSG1();
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  V1.Par_Impar(V2,V3);
  updateSG2();
  updateSG3();
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  V1.Intercalar_A_B(V2,V3);
  updateSG1();
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  V1.Pur_cortControl();
  updateSG1();
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
   V1.setdim(StrToInt(ele1.Text));
   ele1.Text:='';
   updateSG1();
end;

procedure TForm1.Cant_elemClick(Sender: TObject);
begin
  V1.CantElem();
end;

end.

