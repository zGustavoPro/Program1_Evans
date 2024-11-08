program e10;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes
  { you can add units after this };

begin
  procedure FileTipo.ejerJ();
var          i,j:integer; //PUNTEROS
     c1,r1,c2,r2:Integer;
     n1,d1,n2,d2:String;
begin
 Abrir();
 c1:=0;r1:=0;n1:='';d1:='';
 c2:=0;r2:=0;n2:='';d2:='';
 for i:=1 to (tamano()-1)do begin
 Accesar(c1,r1,n1,d1,i);
    for j:=i+1 to tamano()do begin
    Accesar(c2,r2,n2,d2,j);
      if(r1>r2)then begin
        permutar(c1,r1,n1,d1,i,c2,r2,n2,d2,j);
        Accesar(c1,r1,n1,d1,i);
        end;
    end;
 end;
 Cerrar();
end;
end.

