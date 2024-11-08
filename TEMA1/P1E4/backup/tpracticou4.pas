unit TpracticoU4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type
  PracticoU4=class
    public
       class procedure alfabeto(n:integer);

  end;

implementation
class procedure PracticoU4.alfabeto(n:integer);
var
  i:integer;
  letra:char;
begin
  letra:= 'a';
  for i:=1 to (n-1) do
  begin
    writeln(letra,' ');
    inc(letra);
  end;
  writeln;
end;

end.

