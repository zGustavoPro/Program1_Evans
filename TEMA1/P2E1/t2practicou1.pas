unit T2PracticoU1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,dialogs;
const
max_ele=150;
type

  { P2U1 }

  P2U1=class
    private
      ele:array [1..max_ele]of integer;
       x:integer;
       public
          constructor crear();
      procedure cargar ();
      procedure eliminar();
      function primo(n:integer):boolean;
      procedure mostrar ();

  end;


implementation

{ P2U1 }

constructor P2U1.crear();
var
  i:integer;
begin
x:=0;
for i:=1 to max_ele do
ele[i]:=0;
end;

procedure P2U1.cargar();
var i:integer;
begin
 x:=n(i)

end;

procedure P2U1.eliminar();
var
begin

end;

function P2U1.primo(n: integer): boolean;
var      i,c:integer;
begin
c:=0;
 for i:=1 to n  to
begin
if (i mod ele[i] )= 0 then
inc(c);
 if c=2 then
 result:=true else
   result:=false;
end;
end;

procedure P2U1.mostrar();
begin

end;

end.

