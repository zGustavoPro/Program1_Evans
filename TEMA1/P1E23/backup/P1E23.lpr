program P1E23;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracticoU23
  { you can add units after this };
    var
    z, r, n1,n2:integer;
begin
  readln(n1);
  readln(n2);
  PracticoU23.union(n1,n2);
  readln;
end.

