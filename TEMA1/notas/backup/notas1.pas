unit notas1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;
const
  max_ele=150;
  type

    { NotasC }

    NotasC=class
      private
      nombre:array [1..max_ele]of string;
      elem:array[1..max_ele]of integer;
      dim:integer;
      public
      constructor crear();
      procedure cargar();
      procedure mostrar();
      procedure aprobados();
      procedure reprobados();
      function promedio():integer;
      function mejornota():integer;
    end;


implementation

{ NotasC }

constructor NotasC.crear;
var  i:integer;
begin
  dim:=0;
  for i:=1 to max_ele do
  begin
    nombre[i]:='';//nombre
    elem[i]:=0;
  end;
end;

procedure NotasC.cargar;
var i:integer;
begin
  dim:=StrToInt(InputBox( 'notas del curso','cuantas notas','0'));
  for i:=1 to dim do
  begin
    nombre[i]:= InputBox('notas del curso', 'nombre['+IntToStr(i)+']=','');
    elem[i]:=StrToInt(InputBox('notas delcurso','notas ['+IntToStr(i)+']','0'));
  end;
end;

procedure NotasC.mostrar;
 var i:integer;    cad:string;
begin
    cad:='las notas del curso'+#10#13;
    for i:=1 to dim do
    begin
      cad:= cad+'['+nombre[i]+#09+IntToStr(elem[i])+']'+#10#13;
      end;
    ShowMessage(cad);

end;
procedure NotasC.aprobados;
var i:integer; cad:string;
begin
   cad:= 'los aprobadosson:'+#10#13;
   for i:=1 to dim do
   begin
     if (elem[i]>51) then
     begin
       cad:= cad+'['+nombre[i]+#10#13+IntToStr(elem[i])+'...aprobados....';
       ShowMessage(cad);
       end;
   end;
end;

procedure NotasC.reprobados;
var i:integer; cad:string;
begin
  cad:= 'los reprobados son:='+#10#13;
  for i:=1 to dim do
    if (elem[i]<51) then
    begin
      cad:= cad+'['+nombre[i]+#09+IntToStr(elem[i])+' reprobados ' ;
      ShowMessage(cad);
      end;
end;

function NotasC.promedio: integer;
var sum,i:integer;
begin
  sum:=0;
  for i:=1 to dim do
  begin
    sum:= sum+elem[i];
    result:=sum div dim;
  end;
end;

function NotasC.mejornota: integer;
var
  i,may,pos:integer;
begin
 may:=elem[i]; //1 valor ingresado
 pos:=1;   //se guarda en en el menor valor
 for i:=2 to dim do
 begin
   if elem[i]> may then
   begin
     may:=elem[i];
     pos:=1;
   end;
 end;
 ShowMessage('la mejor nota es:'+IntToStr(may)+'del estudiante'+nombre[pos]);
end;

end.

