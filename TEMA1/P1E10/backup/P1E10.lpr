program P1E10;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TpracticoU10
  { you can add units after this };
       var
     c,  n,  m :integer;
begin
  readln(n);
  readln(m);
  c:=n*m;
  writeln(c);
end.

