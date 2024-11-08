unit TpracticoU10;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU10 }

  PracticoU10 = class
    public
     class function mult(n,m:integer):integer;

  end;

implementation

{ PracticoU10 }

 class function PracticoU10.mult(n, m: integer): integer;
 c:integer;
begin
  c:=n*m;
  result:=c;
end;

end.

