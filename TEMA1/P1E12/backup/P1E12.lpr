program P1E12;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TpracticoU12
  { you can add units after this };
       var
         n,b:integer;
         r:string;
begin
  readln(n);
  readln(b);
  r:= PracticoU12.bas(n,b);
  writeln(r);
  readln;
end.

