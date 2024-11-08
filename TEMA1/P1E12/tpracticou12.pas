unit TpracticoU12;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type
  PracticoU12=class
    public
     class function baseb(n,b:integer):string;
  end;

implementation
 class function PracticoU12.baseb(n,b:integer):string;
      var
   r:integer;
   begin
    r:=0;
    if n<=0 then
    begin
     result:='0';
    end else
    if (n>0) and  ((2 < b) and (b < 9)) then
    begin
     result:='';
     while n>0 do
begin
 r:= n mod  b;
  result:=IntToStr(r)+ result;
   n:=n div b;
 end;
    end else
    begin
     result:= 'b tiene q ser mayor a 2 y menor a 9';
    end;

   end;

end.

