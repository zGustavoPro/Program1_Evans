program P1E22;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracticoU22
  { you can add units after this };
    var
      n,mn1,mn2:integer;
begin
  mn1:=10;
  mn2:= 10;
  readln(n);
  PracticoU22.mr_sgmr(n,mn1,mn2);
  writeln('el menor dig es : ',mn1);
  writeln('el segundo menor es : ',mn2);
  readln;

end.

