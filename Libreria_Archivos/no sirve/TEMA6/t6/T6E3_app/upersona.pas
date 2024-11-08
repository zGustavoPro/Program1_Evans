unit Upersona;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type
     {persona}

  persona=Record         //registro
    ci:integer;
    nom:string[30];
    apm:string[30];
    sex:char;
    end;

    { FPersona }

    FPersona=class
      private
        nom:string;
        f:file of persona;
        public
          procedure cargar();
          procedure mostrar();
    end;



implementation

{ FPersona }

procedure FPersona.cargar;
var
pos,n:integer;
reg:persona;
begin
 nom:='persona.dat';
 {$I-}
 assign(f,nom);
 {$I+}
  if (IOResult<>0)then
  begin
    writeln('Error al Crear  Archivo con Tipo');
    exit;
  end;
 writeln('cuantos registros:');
 readln(n);
 pos:=0;
 while pos<n do
 begin
   write('carnet de Identidad: ');
   readln(reg.ci);
   write('Nombre: ');
   readln(reg.nom);
   write('Apellidos: ');
   readln(reg.apm);
   write('sexo: ');
   readln(reg.sex);
   write(f,reg);
   pos:=pos+1;
     end;
 close(f);
end;

procedure FPersona.mostrar;
var
reg:persona;
begin
  nom:='persona.dat';
  assign(f,nom);
  {$I-}
    reset(f);
  {$I+}

        if (IOResult<>0)then
  begin
    writeln('Error al abrir Archivo con Tipo');
    exit;
  end;
writeln('carnet',#09,'nombres',#09,'Apellidos',#09,'Sexo');
while (not eof(f))do
begin
  read(f,reg);
 writeln(reg.ci,#09,reg.nom,#09,reg.apm,#09,reg.sex);
 end;
close(f);
end;

end.

