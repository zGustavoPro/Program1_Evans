unit TCadena;

  {$mode ObjFPC}{$H+}

interface

uses
 Classes, SysUtils,dialogs,Tconjunto;
const
 max=2024;
 type

   { cadena }

   cadena=class
     private
       x:array[1..max ] of char;
       dim:integer;
        May,Min,Dig,Sep:conjunto;
       public
         constructor crear();
         procedure setdim(n:integer);
         function getdim():integer;
          procedure insertar(p:integer; ele:char);
          procedure adicionar(ele:char);
          procedure eliminar(ele:char);
          procedure intercambiar(p:integer; p2:integer); //intercambiar char
          function cantidadchar():integer;
          procedure setchar(p:integer; ele:char);
          function getchar(P:integer):char;
          function BuscarChar(ele:char):integer;
          procedure setvalor(p:integer; ele:char);
          function cantpal():integer;
          procedure inserpal(p:integer; pal:string);
          procedure elimpal(pal:string);
          procedure cambpal(pal2:string;pal:string);
          function buscpal(palB:string):integer;
          procedure addpal(pal:string);
          function inverpal():string;
          procedure rotarpal(cant:word);
          procedure mayuscula();
          procedure minuscula();
          procedure titulo(pal:string);
          procedure leerpal(var pos:integer; var pal:string);




   end;

implementation

{ cadena }

constructor cadena.crear();
var
 i:integer;
begin
 dim:=0;
for i:=1 to max do
x[i]:= char(0);

May:=conjunto.crear;   // A hasta Z
 for i:=0 To 25 do
 May.agregar(char(65+i));

  Min:=conjunto.crear;   // a hasta z
 for i:=0 To 25 do
  Min.agregar(char(97+i));

   dig:=conjunto.crear;   // 0 hasta 9
 for i:=0 To 9 do
  dig.agregar(char(48+i));

  sep:=conjunto.crear;
sep.agregar(' ');
sep.agregar('.');
sep.agregar('-');
sep.agregar('_');
sep.agregar(',');
sep.agregar(':');
sep.agregar(';');


end;

procedure cadena.setdim(n:integer);
begin
if (n>0) and (n<max) then
dim:=n else
ShowMessage('fuera de rango');
end;

function cadena.getdim(): integer;
begin
 result:=dim;
end;

procedure cadena.insertar(p: integer; ele: char);
var
 i:integer;
begin
dim:=dim+1;
 if (p>0) and (p<=dim) then
 begin
      for i:=dim downto (p+1) do
      begin
       x[i]:=x[i-1];
      end;
 x[p]:=ele;
 end
 else
ShowMessage('Posicion Fuera De Rango');
end;

procedure cadena.adicionar(ele: char);
begin
if dim<= max then
begin
dim:=dim+1;
x[dim]:=ele;
end else
ShowMessage('memoeria llena');
end;

procedure cadena.eliminar(ele: char);
var
 k:integer;
i:integer;
sw:boolean;
begin
k:=1;
for i:=1 to dim do
begin
  if x[i]<>ele then
  begin
  x[k]:=x[i];
  k:=k+1;
  sw:=true;
  end else
  begin
  sw:=false;
  end;
  end;
  if  sw then
  ShowMessage ('No Se Encontro El Caracter A Eliminar') else
    dim:=dim-1;
  end;

procedure cadena.intercambiar(p: integer; p2:integer);
var
aux:char;
begin
if (p>0) and (p<=dim) and (p2>0)and (p2<= dim) then
begin
  aux:= x[p];
  x[p]:= x[p2] ;
  x[p2]:=aux;
end;
end;

function cadena.cantidadchar(): integer;
var
cant:integer;
begin
cant:=dim;
result:=cant;
end;

procedure cadena.setchar(p: integer; ele: char);
begin
 if (p>0)and(p<=dim)then
 x[p]:=ele else
   ShowMessage('fuera de rango');
end;

function cadena.getchar(P: integer): char;
begin
if (p>0) and (p<=dim) then
result:=x[p] else
  result:=char(0);
end;

function cadena.BuscarChar(ele: char): integer;
var
i:integer;
begin
for i:=1 to dim do
begin
  if x[i]= ele then
  result:=i else
    result:=-1;
end;
end;

procedure cadena.setvalor(p: integer; ele: char);
begin
  if (p>=1) and (p<=dim)then
  x[p]:= ele else
  ShowMessage('fuera de rango');
end;

function cadena.cantpal: integer;
 var
  i:integer;
  c:integer;
  pal_ant:char;
begin
  c:=0;
  pal_ant:=' ';
  for i:=1 to dim do
  begin
    if (x[i]in[',', '.', ':', ';', '_', '-', ' '])and(pal_ant<>' ')then
    begin
      c:=c+1;
    end;
    pal_ant:=x[i];
  end;
  if pal_ant<>' 'then
  begin
    c:=c+1;
  end;
  result:=c;
end;




procedure cadena.inserpal(p: integer; pal: string);
var
i:integer;
begin
p:=1;
if not(x[p-1]=' ') then
  insertar(p,' ');
for i:=1 to length(pal) do
  begin
  p:=p+1;
  insertar(p,pal[i]);
  end;
if not(x[p+1]=' ')then
  insertar(p+1,' ');
  end;

procedure cadena.elimpal(pal: string);
var
i,p,n:integer;
begin
 p:=buscpal(pal);
 if (p<>-1)then
 n:=length(pal);
  for i:=p to dim-n do
        x[i]:=x[i+n];
        dim:=dim-n;
  end;

procedure cadena.cambpal(pal2: string; pal: string);
var
p:integer;
begin
   p:=buscpal(pal2);
   if (p<>-1) then
   begin
   elimpal(pal2);
   inserpal(p,pal);
   end else
   ShowMessage('No Se Encontro La Palabra A Cambiar');
end;

function cadena.buscpal(palB: string): integer;
var
  i,j,n:integer;
  pal:string;
  separadores:set of char;
begin
  separadores:=[',','.',':',';','_','-',' '];
  n:=Length(palB);
  for i:=1 to dim do
  begin
    pal:='';
    if not(x[i]in separadores)then
    begin
      j:=i;
      while(j<=dim)and not(x[j]in separadores)do
      begin
        pal:=pal+x[j];
        j:=j+1;
      end;
      if pal=palB then
      begin
        result:=i;
        Exit;
      end;
    end;
  end;
  result := -1;
end;
{function cadena.buscpal(palB: string):integer;
 var
    pos,i:integer;
    pal:String;
    sw:Boolean;
begin
 sw:=false; pal:='';
 i:=1;
 while((i<=dim )and(not sw))do
 begin
   pos:=i;
   LeerPal(i,pal);
   if(pal=palB)then
     sw:=true;
 end;
  if(sw)then
   result:=pos
  else
   result:=-1;
end;         }
procedure cadena.addpal(pal: string);
var n,i:integer;
begin
  n:=Length(pal);
  if not (dim+n+1<=max)then
ShowMessage('Posición fuera de rango');
  if(dim<>0)then begin
   dim:=dim+1;
   x[dim]:=' ';
  end;
  for i:=1 to n do begin
      dim:=dim+1;
      x[dim]:=pal[i];
  end;
end;


{function cadena.inverpal: string;
var
pos:integer;
pal,cadena:String;
begin
      pos:=1;  cadena:=''; pal:='';
    while(pos<=dim)do
    begin
     LeerPal(pos,pal);
     if(pal<>'')then
       cadena:=pal+' '+cadena;
    end;
    dim:=0;
    AddPal(cadena);
    result:=cadena;
end;   }
 function cadena.inverpal: string;
var
  pos:integer;
  pal,cad_inv:string;
  enPal:boolean;
  i:integer;
begin
 { pos:=1;
  cad_Inv:='';
  pal:='';
  enPal:=False;
  while pos<=dim do
  begin
    if(x[pos]in[' ',',','.',':',';','_','-'])then
    begin
      if enPal then
      begin
        cad_Inv:=pal+' '+cad_Inv;
        pal:='';
        enPal:=False;
      end;
    end
    else
    begin
      pal:=pal+x[pos];
      enPal:=True;
    end;
    pos:=pos+1;
  end;
  if enPal then
    cad_Inv:=pal+' '+cad_Inv;
  dim:=0;
  AddPal(cad_Inv);
  Result:=cad_Inv;  }
  pal:='';
  cad_inv:='';
  for i:=1 to dim do
  begin
  pal:=pal+x[i];
  cad_inv:=x[i]+cad_inv;
  end;
  addpal(cad_inv);
  elimpal(pal);
  result:=pal;
end;

procedure cadena.rotarpal(cant: word);
var
e:char;
j,i:word;
begin
   for j:=1 to cant do begin
     e:=x[1];
     for i:=1 to dim-1 do begin
       x[i]:=x[i+1];
     end;
     x[dim]:=e;
   end;
end;

procedure cadena.mayuscula;
   var i:integer;
       cadena:String;
   begin
     for i:=1 to dim do
     BEGIN
     cadena:=x[i];
     x[i]:=(UpperCase(cadena))[1];
     end;

end;

procedure cadena.minuscula;
   var i:integer;
       cadena:String;
   begin
     for i:=1 to dim do
     BEGIN
     cadena:=x[i];
     x[i]:=(Lowercase(cadena))[1];
     end;

end;

procedure cadena.titulo(pal: string);
begin
  pal:=uppercase(pal);
  inserpal(1,pal);
end;

procedure cadena.LeerPal(var pos: integer; var pal: String);
begin
  while(pos<=dim)and(self.sep.pertenece(x[pos]))do
    pos:=pos+1;
  pal:='';
  while(pos<=dim)and(not self.sep.pertenece(x[pos]))do begin
    pal:=pal+x[pos];
    pos:=pos+1;
  end;
end;
end.







