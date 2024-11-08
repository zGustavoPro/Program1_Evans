program P1E15;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracticoU15
  { you can add units after this };
var
 cfr:array [1..5] of char;
i,r:integer;


begin
  writeln('ingreso maximo cinco caracteres');
  for i:=1 to 5 do
  begin
    read (cfr[i]);
     if (cfr[i] = #10) or (cfr[i] = #13) then
      Break;
  end;
    r:=PracticoU15.conver(cfr);
    if r= -999 then
     begin
       writeln('error');
       readln;
     end else
    begin
      writeln ('resultado',r);
      readln;
    end;
     readln;
end.

