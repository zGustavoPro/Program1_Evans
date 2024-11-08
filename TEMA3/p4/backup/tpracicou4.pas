unit TPracicoU4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU3 }

  PracticoU3=class
    private
      pal:string;
      public
        constructor crear();
        procedure setpal(s:string);
        function getpal():string;
        function parrafo():integer;
  end;

implementation

{ PracticoU3 }

constructor PracticoU3.crear;
begin
  pal:='';
end;

procedure PracticoU3.setpal(s: string);
begin
 pal:=s;
end;

function PracticoU3.getpal: string;
begin
  result:=pal;
end;

function PracticoU3.parrafo(): integer;
var
c,i:integer;
k:char;
cant:integer;
begin
  k:='.';
  c:=0;
 cant:=length(pal);
 for i:=1 to cant do
 begin
   if i=k then
   c:=c+1 else
     begin
       end;
   end;
 result:=c;
end;

end.

