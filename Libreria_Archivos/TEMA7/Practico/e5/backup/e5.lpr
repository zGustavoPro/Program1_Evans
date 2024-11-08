program e5;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes
  { you can add units after this };

Type
   Alumno=Record
     Reg:Integer;
     INF110:byte;
     LIN100:byte;
     MAT101:Byte;
     FIS101:Byte;
     INF119:Byte;
   end;
   var
      f:file of Alumno;
      r:Alumno; //Tipo alumno
      n:Integer; //cantidad de alumnos
      i:Integer; //puntero
begin
    writeln('Cuantos alumnos Registrara : ');
    Readln(n);
    Assign(f,'Notas.dat');
    {$I-}
    Rewrite(f);
    {$I+}
    If(IOResult<>0)then begin
      WriteLn('Error en Creacion de Archivo TIPO....');
      Exit;
    end;
     i:=0;
      while(i<n) do begin
       writeln('Alumno Nro. ',i+1);
         write('    Carnet Ci : ');
        ReadLn(r.Ci);
        write('    Registro : ');
        ReadLn(r.Reg);
        write('    Nombre Completo : ');
        ReadLn(r.Nomb);
        write('    Direccion : ');
        ReadLn(r.Dom);
       write('INF110 : ');
       ReadLn(r.INF110);
       write('LIN100 : ');
       ReadLn(r.LIN100);
       write('MAT101 : ');
       ReadLn(r.MAT101);
       write('FIS101 : ');
       ReadLn(r.FIS101);
       write('INF119 : ');
       ReadLn(r.INF119);
       write(f,r);//Escribimos lo que tiene 'r' en archivo'f'
       i:=i+1;
      end;
      Close(f);//cierra el archivo
   readln;
end.

