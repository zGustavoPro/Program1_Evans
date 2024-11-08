program e3;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes
  { you can add units after this };
type
  Alumno=Record
    ci:integer;
    reg:integer;
    Nomb:string[80];
    dir:string[80];
  end;
  var
    f:file of Alumno;
    r:Alumno;
    nom:string;
    n,i:integer;
     sw:boolean;

begin
  sw:=false;
  nom:='../e1/Alumnos.dat';
  Assign(f,nom);
  {$I-}
  Reset(f);
  {$I+}
  if(IOResult<>0)then
  begin
   Writeln('Error');
  end;
    Writeln('Digite el numero de registro del alumno a buscar');
    readln(n);
   while((not eof(f) and (not sw)))do
begin
    read(f,r);
    if(n=r.reg)then
    begin
    sw:=true;
    end;
end;
  if sw then
  begin
   writeln('Carnet: ',r.ci);
   writeln('Registro: ',r.reg);
    writeln('Nombre: ',r.Nomb);
   writeln('Domicilio: ',r.dom);
  end else
  begin
  Writeln('Registro no encontrado');
  end;
  Close(f);
  readln;
end.

