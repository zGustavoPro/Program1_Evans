program P1E9;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TpracticoU9
  { you can add units after this };
        var
          resultado,n,m:integer;
begin
  readln (n);
  readln(m);
  resultado:= PracticoU9,Dresta(n,m);
  writeln(resultado );
  readln;
end.

