program E1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes,Upersona;

  { you can add units after this }

var
 f:Fpersona;
begin

 f.cargar();
  f.mostrar();

end.

