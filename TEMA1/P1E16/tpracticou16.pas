unit TPracticoU16;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU16 }

  PracticoU16  = class
    public
      class function operador(n1:integer; op:char; n2:integer):integer;

  end;

implementation

{ PracticoU16 }

 class function PracticoU16.operador(n1: integer; op: char; n2: integer): integer;


begin
  if op='+' then
  begin
    result:=n1+n2 ;
    end else
    if op='-' then
    begin
      result:= n1-n2;
      end else
      if op='x' then
      begin
        result:=n1*n2;
        end       else
        if op='/'then
        begin
          result:= n1 div n2;
          end else
          begin
           result:= -99;
            end;

end;

end.

