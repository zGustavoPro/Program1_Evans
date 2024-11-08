program T3E1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TP3E1
  { you can add units after this };
      var
  s:PracticoU3;
  pal:string;
  divpal:string;
begin
   s:=PracticoU3.crear;
  readln(pal);
  readln(divpal);
  s.setcad(pal);
  s.setdiv(divpal);
  readln;
  s.free;
end.

