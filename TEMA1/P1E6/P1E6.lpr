program P1E6;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TpracticoU6
  { you can add units after this };
       var
         n,m:integer;
begin
  readln(n);
  readln(m);
  PracticoU6.multiplicacion(n,m);
  readln;
end.

