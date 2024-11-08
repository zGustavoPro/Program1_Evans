unit TPracticoU5;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU5 }

  PracticoU5=class
    private
      pal:string;
      public
        constructor crear();
        procedure setpal(s:string);
        function getpal():string;
        function cantpal():integer;


  end;

implementation

{ PracticoU5 }

constructor PracticoU5.crear;
begin
  pal:='';
end;

procedure PracticoU5.setpal(s:string);
begin
  pal:=s;
end;

function PracticoU5.getpal: string;

begin
  result:=pal;
end;

function PracticoU5.cantpal: integer;
var
  i,c:integer;
    p:char;
begin
  c:=0;
  for i:=1 to length(pal) do
  begin
    if pal[i] in ['a','+','-','_',',','?'] then
    c:=c+1;
    end;
  result:=c;
end;

end.

