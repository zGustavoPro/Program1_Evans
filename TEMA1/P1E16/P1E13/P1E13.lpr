program P1E13;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TpracticoU13
  { you can add units after this };
var
  a,b,c:char;
  n:string;
  //conversor:PracticoU13;

begin
  // conversor:=PracticoU13.create;
  readln(a);
  readln(b);
  readln(c);
  n:=PracticoU13.v_caract(a,b,c);
  writeln(n);
  // conversor.free;
   readln;
end.

