unit tpracticou14;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type
  PracticoU14 = class
    public
      class function caract_mas(n1,n2,n3:char):string;
  end;

implementation
       class function PracticoU14.caract_mas(n1,n2,n3:char):string;


         begin

           If ((n1 in ['0','1','2','3','4','5','6','7','8','9'])and(n2 in ['0','1','2','3','4','5','6','7','8','9'])and(n3 in ['0','1','2','3','4','5','6','7','8','9'])) then
          begin
            result:='+'+n1+n2+n3;
          end else
          begin
            result:= 'debes ingresar un numero entre el 0 y el 9';
          end;
         end;

end.

