program P1E14;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, tpracticou14
  { you can add units after this };
var
  n1,n2,n3:char;
  r:string;

begin
  readln(n1);
  readln(n2);
  readln(n3);
  r:=PracticoU14.caract_mas(n1,n2,n3);
  writeln(r);
  readln;
end.

