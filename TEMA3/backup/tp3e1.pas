unit TP3E1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;
const
  max=150;
type

  { PracticoU3 }

  PracticoU3=class
  private
   cad:string;
   divca:string;

  public
   constructor crear();
   procedure setcad(s:string);
   function getcad():string;
   procedure setdiv(s:string);
   function getdiv():string;
   procedure divcad();

  end;

implementation

{ PracticoU3 }


constructor PracticoU3.crear;
begin
  cad:='';
  divca:='';

end;

procedure PracticoU3.setcad(s:string);
begin
  cad:= s;
end;

function PracticoU3.getcad: string;
begin
  result:=cad;
end;

procedure PracticoU3.setdiv(s: string);
begin
  divca:= s;
end;

function PracticoU3.getdiv: string;
begin
result:=divca;
end;

procedure PracticoU3.divcad();
var
part1,part2:string;
p:integer;
begin
part2:='';
 p:=pos(divca,cad);
 if p>0 then
 begin
   part2:=copy(cad,1,p+length(divca)-1);
  writeln(part2);
   part1:=copy(cad,p+length(divca),length(cad));
   writeln(part1);
 end else
 writeln('no se encontro la palabra');
end;

end.

