unit unotas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,notas1;

type

  { TForm1 }

  TForm1 = class(TForm)
    crear: TButton;
    cargar: TButton;
    mostrar: TButton;
    aprobados: TButton;
    reprobados: TButton;
    promedio: TButton;
    mejornota: TButton;
    salir: TButton;
    procedure aprobadosClick(Sender: TObject);
    procedure crearClick(Sender: TObject);
    procedure cargarClick(Sender: TObject);
    procedure mejornotaClick(Sender: TObject);
    procedure mostrarClick(Sender: TObject);
    procedure promedioClick(Sender: TObject);
    procedure reprobadosClick(Sender: TObject);
    procedure salirClick(Sender: TObject);
  private
       n:NotasC;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.crearClick(Sender: TObject);
begin
n.crear();
ShowMessage('notas creadas');
end;

procedure TForm1.aprobadosClick(Sender: TObject);
begin
   n.aprobados();
end;

procedure TForm1.cargarClick(Sender: TObject);
begin
 n.cargar();
end;

procedure TForm1.mejornotaClick(Sender: TObject);
begin
  n.mejornota();
end;

procedure TForm1.mostrarClick(Sender: TObject);
begin
  n.mostrar();
end;

procedure TForm1.promedioClick(Sender: TObject);
begin
 ShowMessage('promedio del curso'+IntToStr(n.promedio ()));
end;

procedure TForm1.reprobadosClick(Sender: TObject);
begin
    n.reprobados();
end;

procedure TForm1.salirClick(Sender: TObject);
begin
   close;
end;

end.

