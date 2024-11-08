program P1E16;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracticoU16
  { you can add units after this };
var
  n1,n2:integer;
   op:char;
   r:integer;
begin
  readln(n1,op,n2);


  r:=PracticoU16.operador(n1,op,n2);
  if r=-99 then
  begin
    writeln('no ingresaste ningun operador');
  end else
  begin
  writeln(r);
  end;

  readln;

end.

