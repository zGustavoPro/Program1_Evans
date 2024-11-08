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
           function cortcontrol():integer;
             procedure dispersion();
             procedure dividirpar(var A,B:vector);
             procedure mesclarordenada(A,B:vector);
             procedure purgar();
             procedure ord_asc();//metodo de selecion ascendente
             procedure ord_desc();  //descendente
             procedure DosVect_Asc(A,B:Vector); //vectores ascendende
             procedure DosVec_desc(A,B:vector); //dos vectores descendente _ a un tercero ascendente
             procedure tresVectores_asc(A,B,C:vector);
             function primo(n:integer):boolean;
             procedure primo_noprimo(A,B:vector);
             procedure multiplo(A,B:vector);// multiplo de 3 y 4
             procedure intercalar(A,B:vector);

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
  // i:=1;
    if(pos>0)and (pos<=dim)then
    begin
     for i:=pos to dim do
    begin
      elem[i]:=elem[i+1];
      end;
     dim:=dim-1;
    end
    else
    begin
        ShowMessage('Fuera de rango...');
    end;
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
 for i:=dim downto 2 do
 begin
   elem[i]:= elem[i-1];
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

function vector.cortcontrol: integer;
var
  i,cc:integer;
begin
  self.ordInter();
i:=1;
cc:=0;
while(i<=dim-1)do
     begin
     if (elem[i]<>elem[i+1])then
     cc:=cc+1;
     i:=i+1;
     end;
result:=cc;
end;

procedure vector.dispersion;
var
  i,ce:integer;
  cad:string;
begin
 i:=1;
 ce:=1;
 cad:='';
 while (i<=dim-1) do
        begin
        if(elem[i]<>elem[i+1])then
        begin
        cad:=cad+inttostr(elem[i])+'=>'+inttostr(ce)+#10#13;
        ce:=1;
        end else
        ce:=ce+1;
        i:=i+1;
        end;
 cad:=cad+inttoStr(elem[i])+'=>'+IntToStr(ce)+#10#13;
 showmessage(cad);
end;

procedure vector.dividirpar(var A, B: vector);
var
  i:integer;
begin
  i:=1;
  A.setdim(0);
  B.Setdim(0);
  while (i<=dim)do
         begin
         if(elem[i] mod 2=0)then
         A.addelem(elem[i]) else
         B.addelem(elem[i]);
         i:=i+1;
         end;
end;

procedure vector.mesclarordenada(A, B: vector);
var
  i,j:integer;
begin
  dim:=0;
  i:=1;
  j:=1;
  while (i<=A.getdim())and (j<=B.getdim()) do
         begin
         if (A.getelem(i)<B.getelem(j))then
         begin
         addelem(A.getelem(i));
         i:=i+1;
         end else
         begin
           addelem(B.getelem(j) );
           j:=j+1;     end;
end;
  while (i<=A.getdim())do
         begin
         addelem(A.getelem(i));
         i:=i+1;
         end;
    while (j<=B.getdim())do
         begin
         addelem(B.getelem(j));
         j:=j+1;
         end;
  end;

procedure vector.purgar;
var
d,pos:integer;
begin
 pos:=1;
 d:=0;
 while (pos<=dim-1)do
      begin
      d:=pos+1;
      while (d<=dim) do
           begin
           if (elem[pos]=elem[d])then
           remelem(d) else
           d:=d+1;
           end;
      pos:=pos+1;
      end;
end;

procedure vector.ord_asc;
  var
i,j,aux,min:integer;
begin
  for i:=1 to dim do
  begin
  min:=i;
  for j:=i+1 to dim do  begin
  if elem[j]<elem[min]then
  min:=j;
  end;
   aux:=elem[i];
   elem[i]:=elem[min];
   elem[min]:=aux;
  end;
end;


procedure vector.ord_desc;
 var
i,j,may,aux:integer;
begin
 for i:=1 to dim do
 begin
 may:=i;
 for j:=i+1 to dim do
 begin
   if elem[j]>elem[i] then
    may:=j
 end;
 aux:=elem[i];
 elem[i]:=elem[may];
 elem[may]:=aux;
end;
 end;

procedure vector.DosVect_Asc(A, B: Vector);
  var
  i,j:integer;
begin
  dim:=0;
  i:=1;
  j:=1;
  while (i<=A.getdim())and (j<=B.getdim()) do
         begin
         if (A.getelem(i)<B.getelem(j))then
         begin
         addelem(A.getelem(i) );
         i:=i+1;
         end else
         begin
           addelem(B.getelem(j) );
           j:=j+1;
         end;
end;
  while (i<=A.getdim())do
         begin
         addelem(A.getelem(i));
         i:=i+1;
         end;
    while (j<=B.getdim())do
         begin
         addelem(B.getelem(j));
         j:=j+1;
         end;
  end;

procedure vector.DosVec_desc(A, B: vector);
  var
   i,j:integer;
 begin
   dim:=0;
   i:=A.getdim();
   j:=B.getdim();
   while (i>=1)and (j>=1) do
          begin
          if (A.getelem(i)<B.getelem(j))then
          begin
          addelem(A.getelem(i) );
          i:=i-1;
          end else
          begin
            addelem(B.getelem(j) );
            j:=j-1;
          end;
 end;
   while (i>=1)do
          begin
          addelem(A.getelem(i));
          i:=i-1;
          end;
     while (j>=1)do
          begin
          addelem(B.getelem(j));
          j:=j-1;
          end;
   end;

    procedure vector.tresVectores_asc(A,B,C:vector);
var
i,j,k:integer;
begin
  dim:=0;
  i:=1;
  j:=1;
  k:=1;
  while (i<=A.getdim())or(j<=B.getdim())or(k<=C.getdim())do
  begin
    if(i<=A.getdim())and((j>B.getdim())or((A.getelem(i)<=B.getelem(j))and(A.getelem(i)<=C.getelem(k))))then
    begin
      addelem(A.getelem(i));
      i:=i+1;
    end
    else if(j<=B.getdim())and((i>A.getdim())or((B.getelem(j)<=A.getelem(i))and(B.getelem(j)<=C.getelem(k))))then
    begin
      addelem(B.getelem(j));
      j:=j+1;
    end
    else
    begin
      addelem(C.getelem(k));
      k:=k+1;
    end;
  end;
end;

    function vector.primo(n: integer): boolean;
    var
    c,i:integer;
    begin
     c:=0;
     for i:=1 to n do
     begin
      if n mod i =0 then
      c:=c+1
     end;
     if c=2 then
     result:=true else
     result:=false;
    end;

    procedure vector.primo_noprimo(A, B: vector);
    var
    i:integer;
    begin
     A.setdim(0);
     B.setdim(0);
    for i:=1 to dim do
    begin
    if  primo(elem[i]) then
    A.addelem(elem[i]) else
    B.addelem(elem[i]);
    end;
    end;

    procedure vector.multiplo(A, B: vector);
    var k,i:integer;
    begin
     A.setdim(0);
     B.Setdim(0);
      i:=1;
     while (i<=dim) do
     begin
      if elem[i] mod 2 = 0 then
      begin
      A.addelem(elem[i]);
      //self.remelem(i);
      end ; //else
      if elem[i] mod 3 = 0 then
      begin
      B.addelem(elem[i]);
      self.remelem(i);
      continue;
      end; //else
      i:=i+1;
      end;
     {   k:=1;
    while k<=dim do
     begin
     if ((elem[k] mod 2 = 0) or (elem[k] mod 3 = 0))then
     remelem(k) else
     k :=k+1;
     end;    }
     setdim(0);
     end;

    procedure vector.intercalar(A, B: vector);
    var i,j:integer;
begin
  i:=1;  j:=1;  dim:=0;
  while (i<=A.getDim())AND(j<=B.getDim())do begin
     addElem(A.getElem(i));
     i:=i+1;
     addElem(B.getElem(j));
     j:=j+1;
  end;
  while(i<=A.getDim())do begin
      addElem(A.getElem(i));
      i:=i+1;
  end;
  while(j<=B.getDim())do begin
      addElem(B.getElem(j));
      j:=j+1;
  end;
end;

end.

