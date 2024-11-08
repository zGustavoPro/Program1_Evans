program e10;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils;

Type
  Alumno = Record
    Ci: Integer;
    Reg: Integer;
    Nomb: String[60];
    Dom: String[80];
  end;

var
  f: file of Alumno;
  r: Alumno; // objeto alumno
  nom: String;
  n: Integer; // cantidad de alumnos
  i, j: Integer; // punteros

procedure Intercambiar(var a, b: Alumno);
var
  temp: Alumno;
begin
  temp := a;
  a := b;
  b := temp;
end;

begin
  nom := '../e1/Alumnos.dat';
  Assign(f, nom);
  {$I-}
  Reset(f);
  {$I+}
  if IOResult <> 0 then
  begin
    WriteLn('Error al abrir el archivo TIPO....');
    Exit;
  end;
  n := FileSize(f);
  for i := 0 to n - 2 do
    for j := 0 to n - 2 - i do
    begin
      Seek(f, j);
      Read(f, r);
      Seek(f, j + 1);
      Read(f, r);
      if r.Reg > (r.Reg) then
      begin
        Seek(f, j);
        write(f, r);
        Seek(f, j + 1);
        write(f, r);
      end;
    end;
  Close(f); // Cerrar el archivo
  Reset(f);
  while not Eof(f) do
  begin
    Read(f, r);
    writeln('Ci: ', r.Ci, ' Registro: ', r.Reg, ' Nombre: ', r.Nomb, ' Dirección: ', r.Dom);
  end;
  Close(f);
  ReadLn;
end.

