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
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Label1: TLabel;
    pos: TEdit;
    ele: TEdit;
    SG: TStringGrid;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     V:vector;
     procedure updateSG();//actualizar
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
      updateSG();
      ShowMessage('');
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

procedure TForm1.Button2Click(Sender: TObject);
begin
  V.setdim(StrToInt(ele.text));
  updateSG();
  ele.text:='';
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

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.updateSG;
var
i:integer;
begin

  SG.ColCount:=V.getdim();  //
  for i:=1 to V.getdim() do
  SG.Cells[i-1,0 ]:=IntToStr(V.getelem(i));
end;

end.

