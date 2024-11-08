program P1E11;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TpracticoU11,TpracticoU8
  { you can add units after this };
     var
      r, m,n:integer;
      s:string;
begin
  readln(n);
  readln(m);
 r:= PracticoU8.signo( n,m);
 s:=practicoU11.can_dig(r);
 writeln (' numero de:',s,' cifras')  ;
 readln;
end.

