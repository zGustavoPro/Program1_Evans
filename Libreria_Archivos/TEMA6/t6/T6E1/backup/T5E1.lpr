program T5E1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, Uventana,System
  { you can add units after this };
  var
 f:text;
 nom:string;
begin
  nom:='misdatos.text';
  assign(f,nom);
  {$I-}
  rewrite(f);
  {$I-}
  if (IOResult<>0)then
  begin
    write('Errr Al Crear TxT...');
    exit;
  end;
  writeln(f,'1124123');
  writeln(f,'juan carlos perez');
  writeln (f,'Electronica');
  close(f);
  writeln('archivo TXT creado...');

end.

