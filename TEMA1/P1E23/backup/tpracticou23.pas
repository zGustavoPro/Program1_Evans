unit TPracticoU23;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU23 }

  PracticoU23 = class
    class procedure union (n1,n2:integer; var result:integer);
  end;

implementation

{ PracticoU23 }

 class procedure PracticoU23.union(n1, n2: integer; var result:integer);
begin

result:= StrToInt(IntToStr(n1)+IntToStr(n2));

end;

end.

