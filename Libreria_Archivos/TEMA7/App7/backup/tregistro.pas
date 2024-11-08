unit TRegistro;
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;

type
  Persona = Record     //Registro
       ci: integer;
       re:integer;
       nom: String[30];
       apm: String[60];
       em:string[90];
       sex: char;
  end;
  { Tipo }
  Tipo=Class
    private
      f:file of Persona;
      nom:string;
      estado:integer;
    public
      constructor create();
      procedure setNom(nomb:string);
      function getNom():string;
      procedure crear();
      procedure abrir();
      procedure escribir(reg:Persona);
      procedure leer(var reg:Persona);
      procedure cerrar();
      function fin():boolean;
      procedure setposicion(pos:integer);
      function getposicion():integer;
      function cantidad():integer;
      procedure posicionar(pos:integer);

      procedure adicionar (c,r:integer; nomb,ape,empleo,sexo:string);
  end;

implementation
{ Tipo }
constructor Tipo.create;
begin
  nom:='Persona.dat';
  estado:=2;//0=Abierto,2=Cerrado
end;

procedure Tipo.setNom(nomb: string);
begin
  nom:=nomb;
end;

function Tipo.getNom: string;
begin
  result:=nom;
end;

procedure Tipo.crear;
begin
   if(estado=2)then// Modo Cerrado
   begin
     assign(f,nom);
     {$I-}
     rewrite(f);
     {$I+}
     if(IOResult<>0)then
     begin
       ShowMessage('Error al CREAR archivo con TIPO...');
       exit;
     end;
     estado:=0;// Modo Abierto
   end
   else
      ShowMessage('El Archivo con TIPO se encuentra ABIERTO...');
end;

procedure Tipo.abrir;
begin
   if(estado=2)then// Modo Cerrado
   begin
     assign(f,nom);
     {$I-}
     reset(f);
     {$I+}
     if(IOResult<>0)then
     begin
       ShowMessage('Error al ABRIR archivo con TIPO...');
       exit;
     end;
     estado:=0;// Modo Abierto
   end
   else
      ShowMessage('El Archivo con TIPO se encuentra ABIERTO...');
end;

procedure Tipo.escribir(reg: Persona);
begin
   if(estado=0)then//Modo Abierto
   begin
      write(f,reg);
   end
   else
     ShowMessage('El Archivo con TIPO se encuentra CERRADO...');
end;

procedure Tipo.leer(var reg: Persona);
begin
   if(estado=0)then//Modo Abierto
   begin
      read(f,reg);
   end
   else
     ShowMessage('El Archivo con TIPO se encuentra CERRADO...');
end;

procedure Tipo.cerrar;
begin
   if(estado=0)then //Modo Abierto
   begin
      close(f);
      estado:=2;
   end;
end;

function Tipo.fin: boolean;
begin
   result:=eof(f);
end;

procedure Tipo.setposicion(pos: integer);
begin
    if(estado=0)then //Modo Abierto
    begin
       seek(f,pos);
    end
    else
      ShowMessage('El Archivo con TIPO se encuentra CERRADO...');
end;

function Tipo.getposicion: integer;
begin
   result:=filepos(f);
end;

function Tipo.cantidad: integer;
begin
   result:=filesize(f);
end;

procedure Tipo.posicionar(pos: integer);
begin
  if (pos>0)and(pos<=filezice(f))then
     seek(f,pos) else
     ShowMessage(  'posicion fuera de rango'  );

end;

procedure Tipo.adicionar(c, r: integer; nomb, ape, empleo, sexo: string);
   var e :Persona;
begin
    e.ci:=c;
    e.re:=r;
    e.nom :=nomb;
    e.apm:=ape;
    e.em:=empleo;
    e.sex:=sexo[1];
    self.escribir(e);
end;

end.



