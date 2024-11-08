program e6;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes
  { you can add units after this };
{a) Crear un archivo "Alumnos.dat" con información de los Alumnos de 1er Semestre:

    • CI, Reg, Nombre, Domicilio

111   202001  Alumno01  H      Av. Busch

222   202002   Alumno02  H   Av. Centenario

333  202003    Alumno03  H     Av. Santos Dumont

444 202004    Alumno04  M  Av. Lujan

    • Nota INF110 Introducción a la Informatica, Nota LIN100 Ingles, Nota MAT101

      Calculo I, Nota FIS101 Fisica I, Nota INF119 Estructuras Discretas.

70  80 50 20  80

80 50 100 30 90

50 90 80 90 70

90 80 80 70 60}
    Type
    Alumno=Record
      Ci:Integer;
      Reg:Integer;
      Nomb:String[60];
      Dom:String[80];
    end;
    var
     f:file of Alumno;
       r:Alumno;
     nom:String;
      pos,n,i:Integer; sw:boolean;
begin
     n:=202004;
     sw:=false;
    nom:='../e1/Alumnos.dat';
     Assign(f,nom);
     {$I-}
     Reset(f);
     {$I+}
     If(IOResult<>0)then begin
       WriteLn('Error en Creacion de Archivo TIPO....');
       Exit;
     end;
     pos:=0;
      while((not eof(f) and (not sw)))do
begin
  read(f,r);
     if(n=r.reg)then begin
       sw:=true;
       pos:=FilePos(f)-1; end;
end;

      if sw then
      begin
      while(not eof(f)) do
      begin
         read(f,r);
           seek (f,pos-1);
          write(f,r);
      seek(f,pos+1);
      write(f,r);
      end;
       seek(f,FileSize(f)-1);
    truncate(f);
    writeln('Registro eliminado exitosamente.');
      end else begin
          writeln('Registro no encontrado');
      end;
      close(f);
end.

