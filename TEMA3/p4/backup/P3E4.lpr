program P3E4;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracicoU4
  { you can add units after this };
var
  s:PracticoU3;
   pal:string;
   t:integer;
begin
   readln(pal);
   s:=PracticoU3.crear;
   s.setpal(pal);
   t:=s.parrafo();
   writeln(t);
   readln;

end.

