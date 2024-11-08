unit TpracticoU11;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

 { PracticoU11 }

 PracticoU11 = class
   public
      class function can_dig(n:integer):string;
   end;

implementation

{ PracticoU11 }

 class function PracticoU11.can_dig(n: integer): string;
 var
   s:integer;
begin
 s:=Length(IntToStr(n));
 result:=IntToStr( s);
end;

end.

