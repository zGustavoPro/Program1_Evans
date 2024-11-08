unit TpracticoU8;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

{ PractucoU8 }

PracticoU8=class
 class function signo(n,m:integer):integer;

end;
implementation

{ PractucoU8 }

 class function PractucoU8.signo(n, m: integer): integer;
 var
   r,i:integer;
begin
 r:=0;
 if (n=0) or (m=0) then
 r:=0
 else
   begin
     if (n>0) and (m>0) then
     begin
       for i:=1 to abs(m) do
r:=r+abs(n);
   end else
   if (n<0) and (m>0) then
   begin
     for i:=1 to abs(n) do
     r:= r+m;
     r:=-r;
   end else

     if (n>0) and (m<0) then
        begin
           for i:=1 to abs(m) do
           r:= r+n;
           r:=-r;
        end else
        begin
          for i:=1 to abs(n) do
          r:=r+abs(m);
               end;
        end;
              Result := r;
end;

end.

