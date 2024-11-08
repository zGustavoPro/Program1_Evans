unit TPracticoU21;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU21 }

  PracticoU21 = class
    public
     class procedure pr_sg (n:integer; var pr,sg:integer);
  end;

implementation

{ PracticoU21 }

 class procedure PracticoU21.pr_sg(n: integer; var pr, sg: integer);
   var
     dig:integer;
begin
  pr:=-1;
  sg:=-1;
  while n > 0 do
begin
  dig := n mod 10;
  if dig > pr then
  begin
    sg:=pr;
    pr:= dig;
    end else
    if (dig>sg) and (dig<> pr) then
    begin
     sg:=dig;
     end;
    n:= n div 10;
  end;
end;

end.

