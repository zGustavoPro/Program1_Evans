unit TpracticoU24;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU24 }

  PracticoU24=class
    public
   class   function intercalar(n1,n2:integer):integer;
  end;

implementation

{ PracticoU24 }

 class function PracticoU24.intercalar(n1, n2: integer): integer;
 var
 alm,inc:integer;
begin
       alm:=0;
  inc:=1;

  while(n1>0)or(n2>0) do
  begin
    if n1>0 then
    begin
      alm:=alm+(n1 mod 10)*inc;
      n1 := n1 div 10;
      inc:=inc*10;
    end;

    if n2>0 then
    begin
      alm:=alm+(n2 mod 10)*inc;
      n2:= n2 div 10;
      inc:= inc*10;
    end;
  end;
  Result:=alm;
end;

end.

