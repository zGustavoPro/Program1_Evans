program E2;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes,SysUtils
  { you can add units after this };
  var
    f:text;
    nom,linea:string;
begin
  nom:='../T6E1/misdatos.txt';
  assign(f,nom);
  {$I-}
  reset(f);
   {$I+}
   if (IOResult<>0)then
   begin
     writeln('error al abrir archivo');
     exit;
   end;
   while (NOT eof(f))do
begin
  readln(f,linea);
  writeln(linea);
end;
   close(f);
end.

