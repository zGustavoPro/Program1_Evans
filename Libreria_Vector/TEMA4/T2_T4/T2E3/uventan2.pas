unit uventan2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  Uventana;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    SGC: TStringGrid;
    vector_C: TLabel;
    _A_B: TEdit;
    purga: TButton;
    dividirpar: TButton;
    mesCord: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Label1: TLabel;
    vectorB: TLabel;
    vectorA: TLabel;
    pos: TEdit;
    ele: TEdit;
    SG: TStringGrid;
    SGB: TStringGrid;
    SGA: TStringGrid;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure dividirparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mesCordClick(Sender: TObject);
    procedure purgaClick(Sender: TObject);
  private
     V:vector;
     A:vector;
     B:vector;
     C:vector;
     procedure updateSG();//actualizar
     procedure updateSGA();
     procedure updateSGB();
      procedure updateSGC();
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.Button1Click(Sender: TObject);
begin
      V:=vector.crear();
      A:=vector.crear();
      B:=vector.crear();
      C:=vector.crear();
      updateSGA();
         updateSGB();
           updateSGC();
      updateSG();
      ShowMessage('');
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  V.dispersion();
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  B.addelem(StrToInt(_A_B.text));
  _A_B.Text:='';
  updateSGB();
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
   A.addelem(StrToInt(_A_B.text));
  _A_B.Text:='';
  updateSGA();
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
 A.Ord_Asc();
 B.Ord_Asc();
 updateSGB();
 updateSGA();

end;

procedure TForm1.Button24Click(Sender: TObject);
begin
 A.Ord_Desc();
 B.Ord_Desc();
 updateSGB();
 updateSGA();
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
  C.DosVect_Asc(A,B);
  updateSGC();
end;

procedure TForm1.Button26Click(Sender: TObject);
begin
   C.DosVec_Desc(A,B);
  updateSGC();
end;

procedure TForm1.Button27Click(Sender: TObject);
begin
v.tresVectores_asc(A,B,C);
updateSG();
end;

procedure TForm1.Button28Click(Sender: TObject);
begin
  C.addelem(StrToInt(_A_B.text));
  _A_B.Text:='';
  updateSGC();
end;

procedure TForm1.Button29Click(Sender: TObject);
begin
  v.primo_noprimo(A,B);
  updateSGA();
  updateSGB();
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
 pos.Text:=IntToStr(V.busqsec(strtoint(ele.Text)));
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  V.ordInter();
  updateSG();
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
   ele.Text:= IntToStr(V.obtener(StrToInt(pos.Text))) ;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
V.cant();
updateSG;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  V.invertir();
  updateSG;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  V.rotar();
  updateSG();
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  pos.Text:= IntToStr(V.Busqbin(StrToInt(ele.Text)));
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  pos.Text:= IntToStr(V.frec(StrToInt(ele.Text)));
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  V.eliminarrep();
  updateSG;
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  ShowMessage('cantida de corte de control es '+IntToStr(V.cortcontrol() ));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  V.setdim(StrToInt(ele.text));
  updateSG();
  ele.text:='';
end;

procedure TForm1.Button30Click(Sender: TObject);
begin
  V.multiplo(A,B);
  updateSG();
  updateSGA();
  updateSGB();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
      ele.Text:=IntToStr(v.getdim());
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   v.setelem(StrToInt(pos.text),StrToInt(ele.Text));
   updateSG();
   pos.Text:='';
   ele.text:='';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ele.Text:=IntToStr(V.getelem(StrToInt(pos.text)));
  pos.Text:='';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  V.addelem(StrToInt(ele.Text));
  updateSG();
  ele.text:='';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 V.inselem(StrToint(pos.text),StrToInt(ele.Text));
 updateSG();
 pos.Text:='';
 ele.Text:='';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  V.remelem(StrToint(pos.text));
  updateSG();
  pos.Text:='';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  close();
end;

procedure TForm1.dividirparClick(Sender: TObject);
begin
 v.dividirpar(A,B);
updateSGA();
updateSGB();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.mesCordClick(Sender: TObject);
begin
  v.mesclarordenada(A,B);
  updateSG();
end;

procedure TForm1.purgaClick(Sender: TObject);
begin
  V.purgar();
  updateSG();

end;

procedure TForm1.updateSG;
var
i:integer;
begin

  SG.ColCount:=V.getdim();  //
  for i:=1 to V.getdim() do
  SG.Cells[i-1,0 ]:=IntToStr(V.getelem(i));
end;

procedure TForm1.updateSGA;
var i:integer;
begin
  SGA.ColCount:=A.getdim();  //
  for i:=1 to A.getdim() do
  SGA.Cells[i-1,0 ]:=IntToStr(A.getelem(i));

end;

procedure TForm1.updateSGB;
var i:integer;
begin
     SGB.ColCount:=B.getdim();  //
  for i:=1 to B.getdim() do
  SGB.Cells[i-1,0 ]:=IntToStr(B.getelem(i));
end;

procedure TForm1.updateSGC;
   var i:integer;
begin
     SGC.ColCount:=C.getdim();  //
  for i:=1 to C.getdim() do
  SGC.Cells[i-1,0 ]:=IntToStr(C.getelem(i));
end;


end.

