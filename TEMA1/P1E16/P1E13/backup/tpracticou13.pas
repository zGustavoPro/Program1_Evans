unit TpracticoU13;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU13 }

  PracticoU13 = class
    public
     function v_caract(a,b,c:char):string;
  end;

implementation

{ PracticoU13 }

  function PracticoU13.v_caract(a, b, c: char): string;
begin
  result:='';
  if (a in ['1','2','3','4','5','6','7','8','9','0'])  and   (b in ['1','2','3','4','5','6','7','8','9','0']) and (c in ['1','2','3','4','5','6','7','8','9','0'])  then
  begin
    result:= a+b+c;

     end else
     begin
       result:='   los numeros tienen q estar entre el 0 y 9';
       end
end;

end.

