unit Tconjunto;
 {$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;
const
  max_ele=1200;

  type

    { conjunto }

    conjunto=class
      private
        elem:array[1..max_ele]of char;
        dim:integer;
        public
          constructor crear();
          function pertenece(ele:char):boolean;
          procedure agregar(ele:char);
          procedure eliminar(ele:char);
          procedure setelem(p:integer; ele:char);
          function getelem(p:integer):char;
          procedure setdim(dime:integer);
          function getdim():integer;
    end;

implementation

{ conjunto }

constructor conjunto.crear();
var
  i:integer;
begin
 dim:=0;
  for i:=1 to max_ele do
  begin
  elem[i]:=char(0);
  end;
end;

function conjunto.pertenece(ele: char): boolean;
var
sw:boolean;
p:integer;
begin
  sw:=false;
  p:=1;
  while (p<=dim) and (not sw) do
begin
  if (ele=elem[p])then
  sw:=true else
    p:=p+1;
  end;
  result:=sw;
end;

procedure conjunto.agregar(ele: char);
begin
  if (not pertenece(ele))then
  begin
    dim:=dim+1;
    elem[dim]:=ele;
  end;
end;

procedure conjunto.eliminar(ele: char);
var
sw:boolean;
p,d:integer;
begin
 sw:=false;
 p:=1;
 while (p<= dim ) and (not sw) do
begin
  if (ele=elem[p])then
  sw:=true else
    p:=p+1;
  end;
 for d:=p to  dim-1 do
 elem[d]:=elem[d+1];
 dim:=dim-1;
end;

procedure conjunto.setelem(p: integer; ele: char);
begin
 if (p>0) and (p<=dim) then
 elem[p]:=ele else
  // ShowMessage('posicion fuera de rango');
end;

function conjunto.getelem(p: integer): char;
begin
  if (p>0) and (p<=dim) then
  result:=elem[p] else
    result:=char(0);
end;

procedure conjunto.setdim(dime: integer);
begin
 if(dime>0) and (dime<=max_ele)then
 dim:=dime else
   //ShowMessage('fuera de rango');
end;

function conjunto.getdim(): integer;
begin
 result:=dim;
end;

end.



