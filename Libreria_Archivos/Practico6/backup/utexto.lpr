program utexto;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, Ttexto
  { you can add units after this };
var
  f,copia: PTexto;
  cad: String;
begin
   f := PTexto.crear();
  f.setnom('texto.txt');
  copia := f.CopiarArchivoTXT;
  f.cerrar();
end.



