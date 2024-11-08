program P1E5;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TpracticoU5
  { you can add units after this };
       var
         n1:integer;
begin
  readln(n1);
  PracticoU5.paroimpar(n1);
end.

