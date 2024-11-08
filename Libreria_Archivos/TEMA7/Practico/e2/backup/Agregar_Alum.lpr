program Agregar_Alum;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes
  { you can add units after this };
   type
     Alumno=Record
       Ci:integer;
       Reg:integer;
       Nomb:string[80];
       Dom:String[80];
     end;
     var
       f:file of Alumno;
       r:alumno;
       nom:string;
       i,n:integer;
begin
   nom:='../e1/Alumnos.dat';
   Assign(f,nom);
   {$I-}
   Reset(f);
   {$I+}
   If(IOResult<>0)then begin
     WriteLn('Error en Apertura de Archivo TIPO....');
     Exit;
   end;
   writeln('  Carnet   Registro  Nombre               Direccion');
   while(not eof(f))do begin
     read(f,r);
         write('    Carnet Ci : ');
        ReadLn(r.Ci);
        write('    Registro : ');
        ReadLn(r.Reg);
        write('    Nombre Completo : ');
        ReadLn(r.Nomb);
        write('    Direccion : ');
        ReadLn(r.Dom);
   end;
   close(f);
   readln;
end.

