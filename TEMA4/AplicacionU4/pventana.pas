unit Pventana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  Tventana;

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
    SG1: TStringGrid;
    SG2: TStringGrid;
    SG3: TStringGrid;
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
  private
   V1:VectorPlus;
   V2:VectorPlus;
   V3:VectorPlus;
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

procedure TForm1.FormCreate(Sender: TObject);
begin

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


procedure TForm1.Button8Click(Sender: TObject);
begin
  V1:=VectorPlus.crear();
  V2:=VectorPlus.crear();
  V3:=VectorPlus.crear();
  updateSG1();
  updateSG2();
  updateSG3();
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

