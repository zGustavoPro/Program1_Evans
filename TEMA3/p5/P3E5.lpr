program P3E5;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracticoU5
  { you can add units after this };
      var
        s:PracticoU5;
        pal:string;
        c:integer;
begin
  readln(pal);
  s:=PracticoU5.crear;
  s.setpal(pal);
  c:=s.cantpal();
  writeln(c);
  readln;
end.

