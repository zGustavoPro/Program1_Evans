unit Tventana;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,dialogs,Uvector,TInteger;
const
  max=1024;
  type

  { vectorPlus }

  vectorPlus=class
    private
      V:VECTOR;
      p1:Parcial1;
      x:array[1..max]of integer;
      dim:integer;
      public
        constructor crear();
        procedure setdim(n:integer);
        function getdim():integer;
        procedure add_ele(ele:integer);
        procedure remelem(n:integer);
        function getval(n:integer):integer;
        procedure ordenarV();
        function cortcon():integer;  //corte de control
        procedure CantElem();
        procedure Par_Impar(var V1,V2:vectorPlus);
        procedure Intercalar_A_B( V1,V2:vectorPlus);
        procedure Pur_cortControl();
        procedure Intercalar_C_A_B(VC,VA,VB:VectorPlus);
        procedure Ord_Burb_Asc();
         procedure Ord_Burb_Desc();
         procedure Mez_Desc(V1,V2:VectorPlus);
         procedure Div_par_capic_Mul3(var V2,V3,V4:VectorPlus);
         procedure Elem_Moda();

    end;

implementation

{ vectorPlus }

constructor vectorPlus.crear;
var
  i:integer;
begin
 p1:=Parcial1.crear();
V:=VECTOR.crear();
 dim:=0;
 for i:=1 to max do
 x[i]:=0;
end;

procedure vectorPlus.setdim(n: integer);
begin
if (n>0)  and (n<max) then
dim:=n;
end;

function vectorPlus.getdim: integer;
begin
   result:=dim;
end;

procedure vectorPlus.add_ele(ele: integer);
begin
   if (dim<max)then
    begin
      dim:=dim+1;
      X[dim]:=ele;
    end else
    Showmessage('almacenamiento lleno');
end;

procedure vectorPlus.remelem(n: integer);
 var i:integer;
begin
  // i:=1;
    if(n>0)and (n<=dim)then
    begin
     for i:=n to dim do
    begin
      x[i]:=x[i+1];
      end;
     dim:=dim-1;
    end
    else
    begin
        ShowMessage('Fuera de rango...');
    end;
end;


function vectorPlus.getval(n: integer): integer;
begin
     if (n>=1) and (n<=dim)then
    result:= x[n]
    else
    result:=-999;
end;

procedure vectorPlus.ordenarV;
var p,d,aux:integer;
begin
 for p:=1 to dim-1 do
 begin
   for d:=p+1 to dim do
   begin
     if (x[d]<x[p] )then
     begin
     aux:=x[d];
     x[d]:= x[p];
     x[p]:=aux;
     end;
   end;
 end;
end;


function vectorPlus.cortcon: integer;
 var
  i,cc:integer;
begin
i:=1;
cc:=0;
while(i<=dim-1)do
     begin
     if (x[i]<>x[i+1])then
     cc:=cc+1;
     i:=i+1;
     end;
result:=cc;
  end;

procedure vectorPlus.CantElem;
 var
  i,ce:integer;
  cad:string;
begin
 i:=1;
 ce:=1;
 cad:='';
 while (i<=dim-1) do
        begin
        if(x[i]<>x[i+1])then
        begin
        cad:=cad+inttostr(x[i])+'=>'+inttostr(ce)+#10#13;
        ce:=1;
        end else
        ce:=ce+1;
        i:=i+1;
        end;
 cad:=cad+inttoStr(x[i])+'=>'+IntToStr(ce)+#10#13;
 showmessage(cad);
end;


procedure vectorPlus.Par_Impar(var V1, V2: vectorPlus);
 var
  i:integer;
begin
  i:=1;
  V1.setdim(0);
  V2.Setdim(0);
  while (i<=dim)do
         begin
         if(x[i] mod 2=0)then
         V1.add_ele(x[i]) else
         V2.add_ele(x[i]);
         i:=i+1;
         end;
end;


procedure vectorPlus.Intercalar_A_B(V1,V2: vectorPlus);     //A:V1 B:V2
      var i,j:integer;
begin
  i:=1;  j:=1;  dim:=0;
  while (i<=V1.getDim())AND(j<=V2.getDim())do begin
     add_Ele(V1.getval(i));
     i:=i+1;
     add_Ele(V2.getval(j));
     j:=j+1;
  end;
  while(i<=V1.getDim())do begin
      add_Ele(V1.getval(i));
      i:=i+1;
  end;
  while(j<=V2.getDim())do begin
      add_Ele(V2.getval(j));
      j:=j+1;
  end;
end;

procedure vectorPlus.Pur_cortControl;
 var
  i,corte:Integer;
begin
 ordenarV();
  i:=1;
  corte:=0;
  while i<dim do
  begin
    if x[i]=x[i+1] then
    begin
      remelem(i+1);
      corte:=corte+1;
    end
    else
    begin
      i:=i+1;
    end;
  end;
end;

procedure vectorPlus.Intercalar_C_A_B(VC, VA, VB: VectorPlus);
var
 a,b,c,i:integer;
 V3,V2,V1:integer;
 paco:integer;
begin
 c:=VC.getdim();
 a:=VA.getdim();
 b:=VB.getdim();
 dim:=a+b+c;
 i:=1;
 v3:=1;
 V1:=1;
 v2:=1;
 paco:=1;
 while i<=dim do
 begin
  if v3<=c then      begin
   x[i]:=VC.getval(v3);
   v3:=v3+1; i:=i+1; end;
if V1<=a then begin
 x[i]:=VA.getval(V1);
 V1:=V1+1; i:=i+1;     end;
if V2<=b then begin
 x[i]:=VB.getval(V2);
 V2:=V2+1; i:=i+1;     end;
 end;
end;
 procedure vectorPlus.Ord_Burb_Asc;
var
  i, j, aux: integer;
begin
  for i := 1 to dim - 1 do begin
    for j := 1 to dim - i do begin
      if x[j] > x[j + 1] then
      begin
        aux := x[j];
        x[j] := x[j + 1];
        x[j + 1] := aux;
      end;
    end;
  end;
end;
    procedure vectorPlus.Ord_Burb_Desc;
var
  i, j, aux: integer;
begin
  for i := 1 to dim - 1 do
  begin
    for j := 1 to dim - i do
    begin
      if x[j] < x[j + 1] then
      begin
        aux := x[j];
        x[j] := x[j + 1];
        x[j + 1] := aux;
      end;
    end;
  end;
end;

    procedure vectorPlus.Mez_Desc(V1, V2:VectorPlus);
    var i,j,k:integer;
      a,b:integer;
    begin
     a:=V1.getdim();
     b:=V2.getdim();
     j:=1; k:=1;
   while (j<=a)and(k<=b) do
   begin
      if V1.getval(j)>=V2.getval(k)then
      begin
       add_ele(v1.getval(j));
        j:=j+1;
      end else
      begin
       add_ele(v2.getval(k));
         k:=k+1;
      end;
     end;
   while j<=a do  begin
     add_ele(v1.getval(j));
        j:=j+1;   end;
     while k<=b do  begin
     add_ele(v2.getval(k));
        k:=k+1;   end;

    end;

    procedure vectorPlus.Div_par_capic_Mul3(var V2, V3, V4: VectorPlus);
    var
    i,j,k,p:integer;
    begin
     V2.setdim(0);   V3.setdim(0);   V4.setdim(0);
     i:=1;
     while i<=dim do
     begin
       if x[i] mod 2 = 0 then
     begin  V2.add_ele(x[i]); end;
       if x[i] mod 3 = 0 then
      begin V3.add_ele(x[i]); end;
       if x[i]=p1.inv(x[i]) then
      begin V4.add_ele(x[i]); end;
       i:=i+1;
     end;
    end;

    procedure vectorPlus.Elem_Moda;
    var
    i,j,c:Integer;
    aux,Moda:integer;
    begin
     moda:=0;


     for i:=1 to dim do begin
       c:=0;
     for j:=1 to dim do begin
      if x[i]=x[j] then
      c:=c+1;
       end;
      if c>moda then  begin
       moda:=c;
       aux:=x[i];
       end;
    end;
     ShowMessage('El Elemento Moda Es: '+IntToStr(aux)+' Y se repite : '+IntToStr(moda)+' Veces');
    end;

end.

