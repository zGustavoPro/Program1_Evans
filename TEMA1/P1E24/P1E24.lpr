program P1E24;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TpracticoU24
  { you can add units after this };
       var
         n1,n2,res:integer;
begin
  readln(n1);
  readln(n2);
  res:=PracticoU24.intercalar(n1,n2);
  writeln(res);
  readln;
end.

