unit Uvector;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,dialogs;
const
  max=1024;
  type

    { VECTOR }

    VECTOR=class
      private
    x:array[1..max] of integer;
    dim:integer;
    public
      constructor crear();
      procedure setdim (num:integer);
     function getdim():integer;
     procedure setvalor(pos,num:integer);
     function getvalor(pos:integer):integer;
   procedure cargar ();
    function mostrar():string;
    procedure adicionar(num:integer);
    procedure insertar(num,pos:integer);
   function obtener(num:integer):integer;
    procedure cantida();
    procedure invertir();
    procedure rotar(num:integer);
    function BusQ(num:integer):integer;
    procedure OrdIns();
    procedure OrdSel();
    procedure OrdBur();//ascendente
     procedure OrdBur_desc();
  { procedure OrdInter(a,b:integer); }
    {function OrdQuicshort():string; }
    function BusB(num:integer):integer;
    Function  ordfrec(num:integer):integer;
    procedure elimrep();



       end;
implementation

{ VECTOR }

constructor VECTOR.crear;
var i:integer;
begin
 dim:=0;
   for i:=1 to max do
     x[i]:=0;
end;

procedure VECTOR.setdim(num: integer);
begin
 if (num>0) and (num<=max) then
 dim:=num else
   ShowMessage('fuera de rango');
end;

function VECTOR.getdim: integer;
begin
 getdim:=dim;
end;

procedure VECTOR.setvalor(pos,num: integer);
var
i:integer;
begin
 if (pos>=1)and(pos>=dim)then
 x[pos]:=num
 else
 ShowMessage('fuera de rango');
 end;

function VECTOR.getvalor(pos:integer): integer;
begin
   if (pos>=1) and (pos<=dim) then
   result:= x[pos] else
     result:=-999;
end;

procedure VECTOR.cargar();
var i:integer;
begin
 for i:=1 to dim do
 x[i]:=StrToInt(InputBox('Elemento','v ['+IntToStr(i)+'] =',''));
  end;
function VECTOR.mostrar: string;
var
i:integer;
cad:string;
begin
   cad:='';
  for i:=1 to self.dim do
    begin
   cad:=cad+IntToStr(x[i])+',';
    end;
    result:=cad;
end;

procedure VECTOR.adicionar(num: integer);
begin
  if dim<max then
  begin
  dim:=dim+1;
  x[dim]:=num;
  end else
    ShowMessage('almacenamiento lleno');
end;

procedure VECTOR.insertar(num, pos: integer);
var j,i:integer;
begin
  if  dim< max then
  begin
  if (pos>0) and (pos <= dim) then
 begin
  dim:=dim+1;
  for  i:=1 to pos  do
  begin
  if i=pos then
  begin
  for j:= dim downto i do
    x[i+1]:=x[i];
     end;
  x[pos]:=num;
   end;
  end;
 end else
 ShowMessage('almacenamiento lleno');
end;

function VECTOR.obtener(num: integer): integer;
var i,pos:integer;
begin
  if (num>=0) and (num<= dim ) then
  begin
  for  i:=1 to dim do
  begin
  if i= num then
  result:=x[i]
  else
    result:=-1;
  end;
  end;
  end;

procedure VECTOR.cantida;
var
cant:integer;
begin
  cant:= dim;
  ShowMessage('cantida de elemntos '+IntToStr(cant));
end;

procedure VECTOR.invertir;
var
aux,i:integer;
begin
  for i:=1 to (dim div 2) do
  aux:= x[dim-i+1];
  x[i]:= x[dim-i+1];
  x[i]:= aux;
end;

procedure VECTOR.rotar(num: integer);
var i,j,aux:integer;
begin
  for j:=1 to num do   begin
  aux:= x[1];
  for i:=1 to dim-1 do  begin
  x[i]:=x[i+1];
     end;
  x[dim]:=aux;
  end;
end;

function VECTOR.BusQ(num: integer): integer;
var i:integer;
begin
 for i:=1 to dim do
 begin
 if i=num then
 begin
 ShowMessage('Posicion Del Areglo Encontrado');
 result:=i; end else
 ShowMessage('Posicion Del Arreglo No Encontrado');
   result :=-999;
 end ;
end;

procedure VECTOR.OrdIns;
var
pos ,i,aux:integer;
begin
   for i:=1 to dim do
   pos:=i;
   aux:=x[i];
   while (pos>0) and (x[pos-1]>aux )do
   begin
   x[pos]:= x[pos-1];
   pos:=pos-1;
   end;
    x[pos]:=aux;
end;

procedure VECTOR.OrdSel();
var
i,min,j,aux:integer;
begin
  for i:=1 to dim do
  begin
  min := x[i];
  for j:=i+1 to dim do
  begin
  if x[j]< x[min] then
  begin
  min:= j;
  end;
  end;
  aux:= x[i];
  x[i]:=x[min];
  x[min]:=aux;
  end;
end;

procedure VECTOR.OrdBur();
var
i,j,aux:integer;
begin
 for i:=1 to dim-1 do begin
 for j :=1 to dim-1 do begin
 if x[j]>x[j+1] then
 aux:=x[j];
 x[j]:=X[j+1];
 x[j+1]:=aux;
 end;
 end;
end;

procedure VECTOR.OrdBur_desc;
var
i,j,aux:integer;
begin
 for i:=1 to dim-1 do begin
 for j :=1 to dim-1 do begin
 if x[j]<x[j+1] then
 aux:=x[j];
 x[j]:=X[j+1];
 x[j+1]:=aux;
 end;
 end;

end;

 {procedure VECTOR.OrdInter(a, b: integer);
var p1,d:integer;
begin
 for p1:=a to b-1 do
 for d:=p1+1 to b do
 if x[d]<x[p1] then

end;    }

{function VECTOR.OrdQuicshort():string;
var
aux,pivote,i:string;
min:array[1..dim] of integer;
may:array[1..dim] of integer;
begin
   pivote:=x[1];
   for i:=2 to dim do
   begin
   if x[i]<pivote then
   min[i]:=x[i] else
     may[i]:=x[i];
   end;
   result := min,may,pivote;
end;         }

function VECTOR.BusB(num: integer): integer;
var
sw:boolean;
inf,sup,mitad:integer;
begin
    OrdBur(); // llamando ala clase ordenar bur
    sw:=false;
    inf:=1;
    sup:=dim;
    while (inf<=sup) do
          begin
            mitad:=(inf+sup)div 2;
            if x[mitad]= num then
              sw:=true;
                break;
               if x[mitad]>num then
               begin
               sup:=mitad ;
               mitad :=(inf+sup) div 2;
               end;
               if x[mitad]< num then
               begin
               inf:=mitad;
               mitad:=(inf+sup) div 2;
               end;
          end;
    if sw=true then
    writeln ('encontrado',mitad) else
      writeln ('no encontrao');
end;

function VECTOR.ordfrec(num: integer): integer;
var i,c:integer;
begin
   c:=0;
 for i:=1 to dim do
 begin
 if x[i]=num then
 c:=c+1;
   end;
 result:=c;
end;

procedure VECTOR.elimrep;
var i,j:integer;
aux:array[1..max] of integer;
begin
   for i:=1 to dim do
   begin
   for j:=2  to dim do
   begin
   if x[j]=x[i] then
   begin
   end else
   aux[i]:=x[i];
     end;
   end;
   x[i]:=aux[i];
end;
end.


