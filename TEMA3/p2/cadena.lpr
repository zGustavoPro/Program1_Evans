program cadena;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, PracticoU3
  { you can add units after this };
    var
      x:TPracticoU3;
      t1,t2:string;
begin
  x:=TPracticoU3.crear;
  readln(t1);
  readln(t2);
  x.setText1(t1);
  x.settext2(t2);
  x.union();
  readln;
   x.free;
end.

