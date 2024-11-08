program P1E19;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracticoU19
  { you can add units after this };
                 var
                   n:integer;
                   br: string;
begin
  readln(n);
  br:= PracticoU19.binario(n);
    writeln('el numero convertido a binari es: ',br);
    readln;
end.

