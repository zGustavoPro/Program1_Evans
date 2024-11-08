
unit z2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  { PracticoU15 }

  PracticoU1212 = class
    public
      class function Conver(cfr: array of Char): integer;
  end;

implementation

{ PracticoU15 }

class function PracticoU1212.Conver(cfr: array of Char): integer;
var
  i, numero: integer;
begin
  numero := 0;

  // Comienza desde el primer dígito
  i := Low(cfr);

  while (i <= High(cfr)) and (i <= Low(cfr) + 4) do
  begin
    if not (cfr[i] in ['0'..'9']) then
    begin
      // Si encuentra un carácter no válido, retorna 0
      Result := 0;
      Exit;
    end;
    // Convierte el carácter en un dígito y agrega al número
    numero := numero * 10 + Ord(cfr[i]) - Ord('0');
    Inc(i);
  end;

  Result := numero;
end;

end.


