unit TUnatural;
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,dialogs;
type

  { natural }

  natural=class
    private
      valor:integer;
      public
        constructor crear();
        procedure setvalor (val:integer);
        function getvalor():integer;
       function cantida():integer;
       function suma():integer;
      procedure  pares();
      procedure  impares();
        procedure  primos();
        function mayor():integer;
        function menor():integer;


  end;

implementation

{ natural }

constructor natural.crear;
begin
 valor:=0;
end;

procedure natural.setvalor(val: integer);
begin
  valor:=val;
end;

function natural.getvalor: integer;
begin
  result:=valor;
end;

function natural.cantida():integer;
var
  c,a:integer;
begin
 c:=0;
 a:= valor;
while a <> 0 do
begin
    a:= a div 10;
  c:=c +1;
  end;
result:=c;
end;

function natural.suma: integer;
var dig,a,sum:integer;
begin
  sum:=0;
 a:= valor;
while a <> 0 do
begin
  dig:= a mod 10;   a:=a div 10;
  sum:=sum +dig;
  end;
result:=sum;
end;

procedure natural.pares;
var
a,i:integer;
b:string;
begin
b:='';
  a:=valor;
   for i:=1 to a do
   begin
  if (i mod 2)= 0then
     begin
    b:= b +','+ inttostr(i);
     end;
  end;
  ShowMessage ('['+b+']');
end;

procedure natural.impares;
var
a,i:integer;
b:string;
begin
b:='';
 a:=valor;
  for i:=1 to a do
  begin
    if (i mod 2)<> 0 then
begin
       b:= b+','+Inttostr(i);
end;
    end;
ShowMessage('['+b+']');
end;

procedure natural.primos;
var
n1,c,b,i:int64;
pr:string;
begin
n1:=valor;
  pr:='';
 for i:=1 to n1 do
  begin
    c:=0;
    for b:=1 to i do
     begin
 if (i mod b)=0 then
    begin
    c:=c+1;
    end;
 end;
    if c=2 then
       begin
    pr:=pr+','+IntToStr(i);
end;
  end;
 ShowMessage('['+pr+']');
 end;
function natural.mayor:integer;
var
n1,n2,may:integer;
begin
n1:=valor;
may:= n1 mod 10;
n1 := n1 div 10;
while n1 <>0 do
begin
n2:= n1 mod 10;
if n2 > may then
     begin
   may:= n2;
     end;
  n1:=n1 div 10;
    end;
    result:=may;
end;

function natural.menor:integer;
  var
n1,n2,men:integer;
begin
n1:=valor;
men:= n1 mod 10;
n1:= n1 div 10;
while n1<>0 do
begin
      n2:= n1 mod 10;
   if n2 < men then
      begin
       men:=n2;
      end;
    n1:=n1 div 10;
     end;
    result:=men;
end;

        ///terminado :)

end.


