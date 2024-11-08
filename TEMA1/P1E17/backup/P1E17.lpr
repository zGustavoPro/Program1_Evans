program P1E17;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracticoU17
  { you can add units after this };
          var
            a,b:string;
            c:char;
            res:int64;
begin
  readln(a);
  readln(c);
  readln(b);
  res:=PracticoU17.calculadora(a,c,b);
  if res=-99 then
  begin
  writeln('error');
  end else
  if res=-98 then
  begin
    writeln('numero se paso de la cifra');
  end else
  begin
    writeln(res);
    end;
    readln;
end.

