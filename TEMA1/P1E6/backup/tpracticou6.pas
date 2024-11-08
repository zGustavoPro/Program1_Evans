unit TpracticoU6;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { PracticoU6 }

  PracticoU6=class
    public
     class  procedure multiplicacion(n,m:integer);
  end;

implementation

{ PracticoU6 }

 class procedure PracticoU6.multiplicacion(n, m: integer);
 var
i,r:integer;
begin
   r:=0;
   for i:=1 to n do
   begin
    r:= r+ m ;
end;
   writeln(r);
   end;
end;

end.

