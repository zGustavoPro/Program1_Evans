unit Utexto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,SysUtils,Dialogs;
type
  Ftexto=class
    private
      f:text;
      nom:string;
      public
        constructor crear();
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

end.

