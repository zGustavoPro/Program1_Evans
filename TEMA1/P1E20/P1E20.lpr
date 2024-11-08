program P1E20;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracticoU20
  { you can add units after this };
      var
        n:double;
        res: string;
begin
  readln(n);
  res:= PracticoU20.octal(n);
  writeln(res);
  readln;
end.

