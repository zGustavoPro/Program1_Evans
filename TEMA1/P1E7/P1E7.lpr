program P1E7;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TpracticoU7
  { you can add units after this };
         var
           n,m:integer;
begin
  readln(n);
  readln(m);
  PracticoU7.mresta(n,m);
  readln;
end.

