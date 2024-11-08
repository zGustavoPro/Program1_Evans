program e4;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes
  { you can add units after this };
  Type
  Alumno=Record
    Ci:Integer;
    Reg:Integer;
    Nomb:String[60];
    Dom:String[80];
  end;
 //Modificar una fila 'Domicilio'
  var
     f:file of Alumno;
     r:Alumno; //objeto alumno
   nom:String;
   num,pos:Integer;
   sw:boolean;
begin
   nom:='../e1/Alumnos.dat';
   Assign(f,nom);
   {$I-}
   Reset(f);
   {$I+}
   If(IOResult<>0)then begin
     WriteLn('Error en Apertura de Archivo TIPO....');
     readln();
     Exit;
   end;
   write('Ingrese el Carnet Identidad que Remplazara : ');
   readln(num);
   pos:=0;
   sw:=false;
   while((not EOF(f)) and(not sw))do begin//busqueda
     read(f,r);
     if(num=r.Ci)then begin
       sw:=true;
       pos:=FilePos(f)-1;
     end;

   end;
   if(sw)then begin
     WriteLn('<-----Los datos del Registro Encontrado---->');
     writeln('Carnet   : ',r.Ci);
     writeln('registro : ',r.Reg);
     writeln('Nombre   : ',r.Nomb);
     writeln('Direccion: ',r.Dom);
     writeln('Digite los datos nuevos : ');
     write('Direccion: ');
     ReadLn(r.Dom);
     Seek(f,pos);
     write(f,r);
   end else begin
     writeln('Carnet no encontrado...');
   end;
   close(f);
   readln;
    end.

