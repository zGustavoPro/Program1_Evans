program P1E23;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracticoU23
  { you can add units after this };
    var
 n1,n2:integer;  r:string;
begin
  readln(n1);
  readln(n2);
 r:= PracticoU23.union(n1,n2);
 writeln(r);
  readln;
end.

