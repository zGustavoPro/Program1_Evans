
program z1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, z2;

var
  cfr: array[1..5] of Char;
  r: integer;
  i: integer;

begin
  writeln('Ingreso de cinco caracteres (puede incluir un signo - al principio)');
  for i := 1 to 5 do
  begin
    read(cfr[i]);
    if (cfr[i] = #10) or (cfr[i] = #13) then
      Break;
  end;

  r := PracticoU1212.Conver(cfr);
  if r = 0 then
  begin
    writeln('Error: caracteres no válidos');
    readln;
  end
  else
  begin
    writeln('El número correspondiente es: ', r);
    readln;
  end;

  readln;
end.

