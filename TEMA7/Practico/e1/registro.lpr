program registro;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes
  { you can add units after this };
     Type
    Alumno=Record
      Ci:Integer;
      Reg:Integer;
      Nomb:String[60];
      Dom:String[80];
    end;
    var
       f:file of Alumno;
       r:Alumno; //objeto alumno
     nom:String;
       n:Integer; //cantidad de alumnos
       i:Integer; //puntero
begin
     writeln('Cuantos alumnos Registrara : ');
     Readln(n);
     nom:='Alumnos.dat';
     Assign(f,nom);  //Assignacion de un archivo
     {$I-}
     Rewrite(f);//remplazamos y Abrimos un archivo nuevo
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
        write(f,r);
        i:=i+1;
       end;
       Close(f);//cierra el archivo   o
    readln;
end.
