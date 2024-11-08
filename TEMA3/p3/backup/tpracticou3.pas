unit TPracticoU3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU3 }

  PracticoU3=class
    private
    pal:string;
    patron:string;
    public
    constructor crear();
    procedure setpal(palb:string);
    function getpal():string;
    procedure setpat(pat:string);
    function getpat():string;
    procedure busq();
  end;

implementation

{ PracticoU3 }

constructor PracticoU3.crear;
begin
  pal:='';
  patron:='';
end;

procedure PracticoU3.setpal(palb: string);
begin
  pal:=palb;
end;

function PracticoU3.getpal: string;
begin
   result:=pal;
end;

procedure PracticoU3.setpat(pat: string);
begin
   patron:=pat;
end;

function PracticoU3.getpat: string;
begin
   result:=patron;
end;

procedure PracticoU3.busq;
var
  aux:string;
  p,cont:integer;
begin
   aux:=pal;
   repeat
    cont:=1;
    p:=pos(patron,aux);
    writeln(cont,':',p );
    aux:=copy(aux,p+length(patron),length(aux));
    cont:=cont +1;
   until p=0 ;
   if cont=1 then
   begin
     writeln('el patron no se encontro') ;
   end;
end;

end.

