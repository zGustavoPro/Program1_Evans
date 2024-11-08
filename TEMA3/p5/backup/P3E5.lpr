program P3E5;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracticoU5
  { you can add units after this };
      var
        s:PracticoU3;
        pal:string;
        c:integer;
begin
  readln(pal);
  s:=PracticoU3.crear;
  s.setpal(pal);
  c:=s.cantpal();
  writeln(c);
  readln;
end.

