program P3E6;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracticoU6
  { you can add units after this };
          var
            s:PracticoU3;
         pat,pal,pal2:string;
         n:integer;

begin
  readln(pal);  //palabra
  readln(pal2); //insert
  readln(pat);   //patron
  s:=PracticoU3.crear;
  s.setpal(pal);
 s.setpal2(pal2);
  s.setpatron(pat);
 // s.intercalar();
 s.remplazar();
//s.inverpal();
 // n:= s.posipal();
  //writeln(n);
 // s.eliminar();
  readln;
  s.free;
end.

