unit TpracticoU9;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

 { PracticoU9 }

 PracticoU9 = class
  class function Dresta(n,m:integer):integer;

 end;

implementation

{ PracticoU9 }

 class function PracticoU9.Dresta(n, m: integer): integer;
 var
  c, r,i:integer;
begin
c:=0;
r:=0;
  if ((n=0) and (m=0)) or ((n=0) or (m=0)) then

  begin
   r:=0;
  end else
 if (n<0) or  (m<0) then
 begin
   r:=0;
 end else
if (n<m) then
 begin
   r:=0;
 end ;
begin
  while (n>=m) do
begin
   n:=n-m;
     c:=c+1;
 end;
  result:=c;
end;

end;

end.

