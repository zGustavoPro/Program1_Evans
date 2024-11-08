program P1E8;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TpracticoU8
  { you can add units after this };
             var
               n,m:integer;
begin
  readln(n);
  readln(m);
writeln  (PracticoU8.signo(n,m));

  readln;
end.

