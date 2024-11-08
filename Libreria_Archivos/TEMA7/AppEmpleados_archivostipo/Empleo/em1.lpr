program em1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes
  { you can add units after this };
         type
     {persona}

  Empleados=Record         //registro
   nomb:string[90];
   sex:string[90];
   cargo:string[90];
   sueldo:integer;
   moneda:string[90];
    end;
  var
    f:file of Empleados;  i,n:integer;
    e:Empleados;
    nom:string;
begin
   writeln('Cuantos Empleados Registrara : ');
     Readln(n);
     nom:='Empleados.dat';
     Assign(f,nom);  //Assignacion de un archivo
     {$I-}
     Rewrite(f);//remplazamos y Abrimos un archivo nuevo
     {$I+}
     If(IOResult<>0)then begin
       WriteLn('Error en Creacion de Archivo TIPO....');
       Exit;
     end;
      i:=0;
       while(i<n) do begin
        writeln('Empleado Nro. ',i+1);
        write(' nombre : ');
        ReadLn(e.nomb);
        write('sexo : ');
        ReadLn(e.sex);
        write('   cargo : ');
        ReadLn(e.cargo);
        write(' Sueldo:  ');
        Readln(e.sueldo);
         write('moneda');
         readln(e.moneda);
        write(f,e);
        i:=i+1;
       end;
end.

