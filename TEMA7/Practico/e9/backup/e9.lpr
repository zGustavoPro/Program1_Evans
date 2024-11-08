program e9;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes
  { you can add units after this };
      Type
    Alumno=Record
      Ci:Integer;
      Reg:Integer;
      Nomb:String[60];
      Dom:String[80];
    end;
    var
       f:file of Alumno;
       r:Alumno; //objeto alumno
     nom:String;
       n:Integer; //cantidad de alumnos
       i:Integer; //puntero
begin
      procedure ejerI();
var
  i, j: integer;
  c1, r1, c2, r2: Integer;
  n1, d1, n2, d2: String;
begin
  Abrir();
  // Ordenamiento burbuja
  for i := 1 to (tamano() - 1) do
  begin
    Accesar(c1, r1, n1, d1, i);

    for j := i + 1 to tamano() do
    begin
      Accesar(c2, r2, n2, d2, j);

      if CompareStr(n1, n2) > 0 then
      begin
        permutar(c1, r1, n1, d1, i, c2, r2, n2, d2, j);
        Accesar(c1, r1, n1, d1, i);
      end;
    end;
  end;

  Cerrar();
end;


end.

