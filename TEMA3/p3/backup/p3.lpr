program p3;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracticoU3
  { you can add units after this };
   var
     x:PracticoU3;
     pal:string;
     patron:string;
begin
  x:=PracticoU3.crear;
  x.setpal(pal);
  x.setpat(patron);
  x.busq();
  readln;
end.

