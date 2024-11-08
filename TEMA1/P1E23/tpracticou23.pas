unit TPracticoU23;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU23 }

  PracticoU23 = class
    class function union (n1,n2:integer):string;
  end;

implementation

{ PracticoU23 }

 class function PracticoU23.union(n1, n2: integer):string;
begin

result:=IntToStr(n1)+IntToStr(n2);

end;

end.

