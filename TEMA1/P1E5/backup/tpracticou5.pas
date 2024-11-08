unit TpracticoU5;

{$mode ObjFPC}{$H+}

interface
uses
  Classes, SysUtils;
type

  { PracticoU5 }

  PracticoU5=class
    public
     class procedure paroimpar (n:integer);
  end;

implementation

{ PracticoU5 }

 class procedure PracticoU5.paroimpar(n: integer);
 var
  t, p,i:integer;
begin
   i:=1;
   p:=2;
          for t:=1 to n do
   begin
   while (((n mod 2)=0) and (p<=n)) do
    begin
      writeln(p,' ');
      p:=p+2;
    end ;

    while ((n mod 2)<>0 and (i<=n))do
    begin
      writeln(i,' ');
      i:=i+2;
     end;
      end;


end;

end.

