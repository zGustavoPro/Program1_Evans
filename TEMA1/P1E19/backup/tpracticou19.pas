unit TPracticoU19;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

   { PracticoU19 }

   PracticoU19 = class
     public
      class  function binario (n:double):string;
   end;


implementation

{ PracticoU19 }

 class function PracticoU19.binario(n:double):string;
 var
 br, p, i:integer;  res: string;    // entero a binario
  pdc, z:double; z2:string;
begin
   pdc:=0;
   z2:=''; // almacenar parte binaria de fraccion
  z:= n;
  //parte decimal pdc


     pdc:= z - trunc(n);
     p:= trunc(n);

   res:='';
   while p > 0 do
    begin
     br :=  p mod 2 ;
     res:= IntToStr(br) + res;
     p:= p div 2 ;
    end;
     res:= res +'.';
        for i:= 1 to 3 do
        begin
         pdc:= pdc * 2 ;
         if pdc >= 1 then
         begin
          // z2 tipo cadena
          z2:= z2+'1';
          pdc:= pdc -1;
         end else
         begin
          z2:= z2 + '0';
         end;
        end;
      result:=res+z2;
end;

end.

