unit UArchivo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;
type

  { Texto }

  Texto=class
    private
      nom:string;
      f:text;
      estado:integer;
      public
        constructor crear();
        procedure setnom(nomf:string);
        function getnom():string;
        procedure crear();
        procedure abrir();
        procedure escribircar(car:char);
        function leercar():char;
        procedure escribirlinea(linea:string);
        function leerlinea():string;
        function esfin():boolean;
        procedure cerrar();
  end;

implementation

{ Texto }

constructor Texto.crear;
begin
  nom:='texto.txt';
  estado:=3; //estado cerrado
end;

procedure Texto.setnom(nomf: string);
begin
 nom:=nomf;
end;

function Texto.getnom: string;
begin
  result:=nom;
end;

procedure Texto.crear;
begin
 if (estado=3)then  // 3 modo cerrado    1 modo escritura 0 modo lectura
 begin
   assign(f,nom);
   {$I-}
   rewrite(f);
    {$I+}
    if(IOResult<>0)then
    begin
     ShowMessage('Error al crear archivo');
     exit;
    end;
    estado:=1; //modo escritura
 end else
 begin
   ShowMessage('el archivo TxT se encuentra abierto');
 end;
end;

procedure Texto.abrir;
begin
 if (estado=3)then  // 3 modo cerrado    1 modo escritura 0 modo lectura
 begin
   assign(f,nom);
   {$I-}
   reset(f);
    {$I+}
    if(IOResult<>0)then
    begin
     ShowMessage('Error al abrir archivo TxT');
     exit;
    end;
    estado:=0; //modo lectura
 end else
   ShowMessage('el archivo TxT se encuentra abierto');
end;

procedure Texto.escribircar(car: char);
begin
 if (estado<>3)then
 begin
   if (estado=1 )then
   write(f,car) else
ShowMessage('No se puedo escribir, TxT esta en modo lectura');
 end else
 begin
   ShowMessage('el archivo se encuentra cerrado');
    exit;
 end;
end;

function Texto.leercar: char;
var
  car:char;
begin
   if(estado<>3)then
   begin
    if (estado=0)then
    begin
     read(f,car);
     result:=car;
     end else result:=char(0);
   end else
     result:=char(0);

end;

procedure Texto.escribirlinea(linea: string);
  begin
 if (estado<>3)then
 begin
   if (estado=1 )then
   writeln(f,linea) else
ShowMessage('No se puedo escribir, TxT esta en modo lectura');
 end else
 begin
   ShowMessage('el archivo se encuentra cerrado');
    exit;
 end;
end;

function Texto.leerlinea: string;
 var
  linea:string;
begin
   if(estado<>3)then
   begin
    if (estado=0)then
    begin
     readln(f,linea);
     result:=linea;
     end else result:='';
   end else
     result:='';

end;


function Texto.esfin: boolean;
begin
  if (estado<>3)then
   result:= eof( f )
   else
  result:=true;
end;

procedure Texto.cerrar;
begin
    if (estado<>3)then
  begin
   close(f);
  end else
  ShowMessage('el archivo ya se encuentra cerrado');
  exit;
end;

end.

