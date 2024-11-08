unit TPracticoU6;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU3 }

  PracticoU3=class
    private
      pal:string;
      pal2:string;
      patron:string;
      public
      constructor crear();
      procedure setpal(s:string);
      function getpal():string;
       procedure setpal2(s:string);
      function getpal2():string;
      procedure setpatron(s:string);
      function getpatron():string;
      procedure intercalar();
      procedure remplazar ();
      procedure inverpal();
      function posipal():integer;
      procedure eliminar();

  end;

implementation

{ PracticoU3 }

constructor PracticoU3.crear;
begin
  pal:='';
  pal2:='';
  patron:='';
end;

procedure PracticoU3.setpal(s: string);
begin
  pal:=s;
end;

function PracticoU3.getpal: string;
begin
  result:=pal;
end;

procedure PracticoU3.setpal2(s: string);
begin
 pal2:=s;
end;

function PracticoU3.getpal2: string;
begin
 result:=pal2;
end;

procedure PracticoU3.setpatron(s: string);
begin
  patron:=s;
end;

function PracticoU3.getpatron: string;
begin
  result:=patron;
end;

procedure PracticoU3.intercalar;
var
  pal3:string;
begin
    pal3:='';
 while (pal<>'' ) and (pal2<>'') do
begin
pal3:=pal3+' '+ copy(pal,1,pos(' ',pal)-1);
delete(pal,1,pos(' ',pal));
pal3:=pal3+' '+copy(pal2,1,pos(' ',pal2)-1);
delete(pal2,1,pos(' ',pal2));
end;
 pal3:=trim(pal3+' '+pal+' '+pal2);
 writeln(pal3);
 end;

procedure PracticoU3.remplazar;
var
 p,i:integer;
 pal3:string;
begin
 pal3:='';
 { for i:=1 to length(pal) do
  begin
  if copy(pal,1,length(patron))=patron  then
  begin
  pal3:= pal3+copy(pal,1,pos(patron,pal)-1);
  pal3:=pal3+pal2;
  delete(pal,1,pos(patron,pal)+length(patron)) ;
  end;
  end;        }
     p:=pos(patron,pal);
     pal3:=pal;
     while p>0 do
begin
delete(pal3,p,length(patron));
insert(pal2,pal3,p);
p:=pos(patron,pal3)
end;
  pal3:=pal3;
  writeln(pal3);
end;

procedure PracticoU3.inverpal();
var
s:string;
i:integer;
begin
  s:='';
 // for i:=1 to length(pal) do
 for i:=length(pal) downto 1 do
begin
//s:=pal[i]+s;
 s:=s+pal[i];
end;
writeln(s);
end;

function PracticoU3.posipal: integer;
var
p,k:integer;
s:string;
begin
 p:=pos(pal2,pal);
 k:=length(pal2);
   if((pal[p-1]=' ') or (pal[p-1]='')) and ((pal[p+k] ='')or(pal[p+k] =' '))then
 //if copy(pal,p,length(pal2))= pal2 then
 begin
 result:=p;
 end else
 begin
 result:=-1;
 end;
 end;

procedure PracticoU3.eliminar;
var
aux:string;
p:integer;
begin
 aux:=pal;
  p:=pos(pal2,aux);
 while p>0 do
   begin
   delete(aux,p,length(pal2));
   insert('',aux,p);
   p:=pos(pal2,aux);
   end;
 insert(pal2,aux,p);
 writeln(aux);
end;

end.

