program P1E18;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracticoU18
  { you can add units after this };
            var
              n,res:integer;
begin
  readln(n);
  res:= PracticoU18.romano (n);
  writeln(res);
  readln;
end.

