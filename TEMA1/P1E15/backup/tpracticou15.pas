unit TPracticoU15;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU15 }

  PracticoU15 = class
    public
     class  function conver(n1:array of char ):integer;
  end;

implementation

{ PracticoU15 }

 class function PracticoU15.conver(n1: array of char): integer;
 var
   i,numero:integer;
   t:integer;
   s:string;
begin
  numero:=0;

  for i:= Low(n1) to High (n1) do
  begin
    if not (n1[i] in ['0','1','2','3','4','5','6','7','8','9']) then
    begin
        result:= -999 ;
    end else
         begin
       numero := numero * 10 + Ord(n1[i]) - Ord('0');
       inc(i);
         end;
    end;

 begin
  if t = -1 then
  begin
      numero:= -numero;
  end;
 end;

 if  (numero<=32767)  and (numero >=-32767) then
 begin
  result:= numero;
 end else
 begin
   result:=-999;
 end;
end;

end.

