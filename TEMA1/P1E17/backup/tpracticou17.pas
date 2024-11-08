unit TPracticoU17;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU17 }

  PracticoU17 = class
    public
    class  function calculadora(num1:string; op:char; num2:string ):int64;
  end;

implementation

{ PracticoU17 }

 class function PracticoU17.calculadora(num1:string; op:char; num2:string):int64;
 var
   n1,n2:integer;
   r:integer;
   s:string;
begin
     if not (op in ['+','-','x','/']) then
     begin
        result:=-99;
        exit;
     end;
     n1 := StrToInt(num1);
     n2 := StrToInt(num2);
     case op of
    '+':
      r:=n1+n2;
    '-':
      r:=n1-n2;
     '/':
      if n2 = 0 then
      begin
       result:=-99;
       exit;
      end else
        begin
      r:= n1 div n2;
        end;
    'x':
      r:= n1 * n2;

     end;
      if (r>=-3637) and (r<=3637) then
      begin
         s:=IntToStr(r);
         s:=copy (s,1,4);
         result:=StrToInt(s);
      end else
      begin
        result:=-98;
      exit;
      end;
      end;
end.

