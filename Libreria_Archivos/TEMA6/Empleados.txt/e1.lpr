program e1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes
  { you can add units after this };
     var
       f:text;
       s,nom:string;
       i,n:integer;
begin
     writeln('Cuantos datos desea ingresar');
     readln(n);
     s:='';
   nom:='Lista_Sueldos.txt';
   assign(f,nom);
   {$I-}
   rewrite(f);
    {$I+}
    if(IOResult<>0)then
    begin
      writeln('Error al crear txt');
     exit;
    end;
    i:=1;
    writeln('Nombre',#09,'Sexo',#09,'cargo',#09,'sueldo',#09,'moneda');
      while(i<=n)do begin
        readln(s);
        writeln(f,s);
        i:=i+1;
      end;
    close(f);
     writeln('Archivo txt creado');
end.

