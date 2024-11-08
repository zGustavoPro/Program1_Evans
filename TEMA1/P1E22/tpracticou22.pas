unit TPracticoU22;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU22 }

  PracticoU22 = class
   class  procedure mr_sgmr(n:integer; var mn1,mn2:integer);
  end;

implementation

{ PracticoU22 }

 class procedure PracticoU22.mr_sgmr(n: integer; var mn1, mn2:integer);
 var
 dig:integer;
begin
  // mn1 = 10 mn2=10
  while n>0 do
begin
   dig := n mod 10 ;
   if dig < mn1 then
   begin
     mn2:= mn1;
     mn1:= dig;
   end else
   if ( dig <  mn2 ) and ( dig <> mn1 )then
   begin
    mn2:= dig;
    end;
       n:=n div 10;
   end;
 end;

end.

