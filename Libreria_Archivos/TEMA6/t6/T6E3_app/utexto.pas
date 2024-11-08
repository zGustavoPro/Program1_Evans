unit Utexto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,SysUtils,Dialogs;
type

  { Ftexto }

  Ftexto=class
    private
      f:text;
      nom:string;
      estado:integer;//0=escritura 1=lectura
      public
        constructor iniciar();
        procedure setNom(nombre:string);
        function getnom():string;
        procedure crear();
        procedure abrir();
        procedure escribirchar(car:char);
         procedure escribirlinea(linea:string);
         function leerchar():char;
         function leerlinea():string;
         procedure cerrar();
         function fin():boolean;
  end;


implementation

{ Ftexto }

constructor Ftexto.iniciar;
begin

end;

procedure Ftexto.setNom(nombre: string);
begin

end;

function Ftexto.getnom: string;
begin

end;

procedure Ftexto.crear;
begin

end;

procedure Ftexto.abrir;
begin

end;

procedure Ftexto.escribirchar(car: char);
begin

end;

procedure Ftexto.escribirlinea(linea: string);
begin

end;

function Ftexto.leerchar: char;
begin

end;

function Ftexto.leerlinea: string;
begin

end;

procedure Ftexto.cerrar;
begin

end;

function Ftexto.fin: boolean;
begin

end;

end.

