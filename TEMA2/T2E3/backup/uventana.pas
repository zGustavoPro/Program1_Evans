unit Uventana;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,dialogs;
const
  max_ele=120;
  type

    { vector }

    vector=class
      private
        elem:array [1..max_ele] of integer;           //[ ]
        dim:integer;
        public
          constructor crear();
          procedure setelem(pos,ele:integer);
          function getelem(pos:integer):integer;
          procedure setdim(dime:integer);
          function getdim():integer;
          procedure addelem(ele:integer);
          procedure inselem(pos,ele:integer);
          procedure remelem(pos:integer);
          function busqsec(ele:integer):integer;
          procedure ordInter();
          function obtener (pos:integer):integer;
          procedure cant ();
          procedure invertir();
          procedure rotar();
          function Busqbin(num:integer):integer;
           procedure eliminarrep();
           function frec(num:integer):integer;

    end;

implementation

{ vector }

constructor vector.crear;
var pos:integer;
begin
  dim:=0;
  for pos:=1 to max_ele do
  elem [ pos]:= 0;
end;

procedure vector.setelem(pos, ele: integer);
begin
    if (pos>=1) and (pos<=dim) then
    elem[ pos]:=ele
    else
    ShowMessage('posicion fuera de rango' );

end;

function vector.getelem(pos: integer): integer;
begin
    if (pos>=1) and (pos<=dim)then
    result:= elem[ pos]
    else
    result:=-999;
end;

procedure vector.setdim(dime:integer);
begin
    if (dime>=0) and (dime<=max_ele)then
    dim:=dime
    else
    Showmessage('dimension fuera de rango');
end;

function vector.getdim: integer;  //devolver num
begin
 result:=dim;
end;

procedure vector.addelem(ele: integer);      //añadir num
begin
    if (dim<max_ele)then
    begin
      dim:=dim+1;
      elem[ dim]:=ele;
    end else
    Showmessage('almacenamiento lleno');
end;

procedure vector.inselem(pos, ele: integer);      //insertar num
 var j,i:integer;
begin
  i:=1;
  if (pos>0) and (pos <= dim) then  begin
  for  i:=dim downto pos  do
  begin
    elem[i+1]:=elem[i];
     end;
  elem[pos]:=ele;
 end else
 ShowMessage('fuera de rango');
 end;

procedure vector.remelem(pos: integer); //eliminar
var i:integer;
begin
 if (dim<>0) then
 begin
 if (pos>=1) and (pos<=dim) then
 begin
   for i:=1 to (dim-1) do
   begin
     elem[ i] :=elem[ i+1];
     dim:=dim-1;
   end;
 end else
 Showmessage('posicion fuera de rango');
    end else
    Showmessage ('almacenamiento vacio');
end;


function vector.busqsec(ele: integer): integer;
var
  i:integer;
  sw:boolean;
begin
 i:=1;
 sw:=false;
 while (i<=dim) and (NOT sw) do
begin
  if (ele=elem[i]) then
   sw:=true
  else
  i:=i+1;
  end;
  if sw then
  result:=i
  else
  result:=-1;
end;

procedure vector.ordInter;
var p,d,aux:integer;
begin
 for p:=1 to dim-1 do
 begin
   for d:=p+1 to dim do
   begin
     if (elem[d]<elem[p] )then
     begin
     aux:=elem[d];
     elem[d]:= elem[p];
     elem[p]:=aux;
     end;
   end;
 end;
end;

function vector.obtener(pos: integer): integer;
var
  i:integer;
begin
  if (pos>0) and (pos<=dim) then
    result:=elem[pos] else
  ShowMessage('fuera de rango...');
  result:=-1;
end;

procedure vector.cant;
var
  cant1:integer;
begin
   cant1:=dim;
   ShowMessage(IntToStr(cant1));
end;

procedure vector.invertir;
var
  i,aux:integer;
begin
   for i:=1 to dim div 2 do
   begin
   aux:= elem[i];
   elem[i]:= elem[dim-i+1];
   elem[dim-i+1]:= aux;
   end;
end;

procedure vector.rotar;
var
  i,aux:integer;
begin
 aux:=elem[dim];
 for i:=1 to dim-1 do
 begin
   elem[i+1]:= elem[i];
 end;
 elem[1]:= aux;
end;

function vector.Busqbin(num: integer): integer;
var
  inf,sup,mitad:integer;
  sw:boolean;
begin
  OrdInter();
  sw:=false;
  inf:=1;
  sup:=dim;
  while(inf<=sup) do begin
mitad:= (inf+sup)div 2;
  if elem[mitad]= num then
begin
    sw:=true;
    break;
    end;
  if elem[mitad]>num then
  begin
  sup:=mitad;
  mitad:=(sup+inf) div 2;
  end;
  if elem[mitad]<num then
  begin
inf:=mitad;
mitad:= (sup+inf)div 2;
  end;
  end;
  if sw then
  result:=mitad else
result:=-1;

end;
 procedure vector.eliminarrep;
  var aux,i:integer;
begin
 aux:=dim;    setDim(0);  //elem[1,1,2,2]
 for i:=1 to aux do begin //dim=0
   if(frec(elem[i])=0)then //fre(2)
     addElem(elem[i]);     //[1,2]
 end;

end;

function vector.frec(num: integer): integer;
var cont,i:integer;
begin
cont:=0;
  for i:=1 to dim   do
  begin
  if elem[i]= num then
  cont:=cont+1;
  end;
  result:=cont;
end;

end.

