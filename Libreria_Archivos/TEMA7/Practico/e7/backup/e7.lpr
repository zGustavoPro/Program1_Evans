program e7;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes,Ttexto;
  { you can add units after this }
      Type
   Alumno=Record
     INF110:byte;
     LIN100:byte;
     MAT101:Byte;
     FIS101:Byte;
     INF119:Byte;
      Ci:Integer;
      Reg:Integer;
      Nomb:String[60];
      Dom:String[80];
   end;
   var
      p:PTexto;
      f:file of Alumno;

      r:Alumno; //Tipo alumno
      n:Integer; //cantidad de alumnos
      i:Integer; //puntero
begin
    p:=PTexto.crear();
   p.setnom('AlumnosProgramacion.txt');
   p.creararchivo();
   p.abrir();
  Assign(f,'../e5/Notas.dat');
    {$I-}
    Reset(f);
    {$I+}
    If(IOResult<>0)then begin
      WriteLn('Error ....');
      Exit;
    end;
    while (not eof(f)) do
begin
  read(f,r);
  if (r.INF110>=51)then
  begin
    p.escribirlinea(InttoStr(r.ci));
     p.escribirlinea(inttostr(r.reg));
     p.escribirlinea(r.nomb);
      p.escribirlinea(r.dom);
      p.escribirlinea(IntToStr(r.INF110));
  end;
end;
    p.cerrar();
    close(f);
end.

