program P1E4;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TpracticoU4
  { you can add units after this };
       var
         n:integer;
begin
  readln (n);
  PracticoU4.alfabeto(n);
  readln;
end.

