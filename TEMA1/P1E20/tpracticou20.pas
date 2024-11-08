unit TPracticoU20;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { Practico }

  PracticoU20 = class
    public
     class  function octal (n:double):string;

  end;

implementation

{ Practico }

 class function PracticoU20.octal(n: double): string;
 var
  r, p_bin:string;
  c,c1, i,p_ent:integer;
   p_dec:double;
   p_oct:string;
begin
c1:=0;
  p_bin:='';
  p_oct:='';
  p_ent:= trunc (n);
  P_dec:=  n - p_ent;
  while p_ent > 0 do
  begin
     c1:=p_ent mod 8;
    p_bin :=IntToStr(c1 )+ p_bin ;
    p_ent:= p_ent div 8;
   end;
  r:= p_bin + '.';
  for i:= 1 to 5 do
    begin
    p_dec:=p_dec*8;
     c:= trunc(p_dec);
    p_oct:= p_oct+IntToStr(c) ;
    p_dec:= p_dec -c;
    end;
    result:=r+p_oct;

//result:=result+p_oct;
end;

end.

