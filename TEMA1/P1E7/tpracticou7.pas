unit TpracticoU7;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU7 }

  PracticoU7=class
    public
     class procedure mresta(n,m:integer);
  end;

implementation

{ PracticoU7 }

 class procedure PracticoU7.mresta(n, m: integer);
 var
   c:integer;

begin
 c:=0;

  while n>=m do
begin
n:=n-m;
  c:=c+1;
end;

 writeln(c);
 end;


end.

