unit TEmpleados;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,dialogs,TCadena,Tconjunto;
type
  Empleado = Record
        Nombre:String[60];
        sexo :String[60];
        cargo :String[60];
        sueldo : integer;
        moneda :String[60]
  end;

   { FEmpleados }

   FEmpleados=class
     private
        f:file of Empleado;
    nom,ext:String;
       modo:integer;
       public
          Constructor Create();
          Procedure setNom(s:String);
       Procedure setExt(s:String);
       procedure Crear();
       procedure Abrir();
       procedure EscribirTipo(r:Empleado);
       function LeerTipo:Empleado;
       function getNom():String;
       function getExt():String;
       Function EsFin():Boolean;
       procedure Cerrar();
       procedure Posicionar(pos:Integer);
       procedure adicionar(nombre,se,car  :String; sue : Integer; mon :String);
       function  GetMaySueldotipo(genero: char):integer; //Sueldo Mayor H o M
       function  MaySueldo_Mujer_Mostrar():String;  //Mayor sueldo Mujeres
       function  getPromedioSueldo():real; //Promedio del sueldo
       function  getMaySueldo_AlPromedio():String;   //Mostrar los sueldos mayor al promedio
       function  EmpleadoToStr(e: Empleado): String;  //concatenar
   end;

implementation

{ FEmpleados }

constructor FEmpleados.Create;
begin
    nom:='FileTipo';
  ext:='dat';
  modo:=-1;
end;

procedure FEmpleados.setNom(s: String);
begin
  nom:=s;
end;

procedure FEmpleados.setExt(s: String);
begin
   ext:=s;
end;

procedure FEmpleados.Crear;
begin
   Assign(f,nom+'.'+ext);
   {$I-}
   Rewrite(f);
   {$I+}
   if(IOResult<>0)then begin
     ShowMessage('FileTipo.Crear : Error en creacion de TIPO.');
   end else begin
     modo:=0;
   end;
end;

procedure FEmpleados.Abrir;
begin
   Assign(f,nom+'.'+ext);
  {$I-}
  Reset(f);
  {$I+}
  if(IOResult<>0)then begin
    ShowMessage('FileTipo.Abrir : Error en apertura de TIPO.');
  end else begin
    modo:=1;
  end;
end;

procedure FEmpleados.EscribirTipo(r: Empleado);
begin
     write(f,r);
end;

function FEmpleados.LeerTipo: Empleado;
var r : Empleado;
begin
   if(modo=1)then begin
    read(f,r)
  end else begin
    r.Nombre:='';
    r.sexo:='';
    r.cargo:='';
    r.sueldo:=-1;
    r.moneda:='';
  end;
    result:=r;
end;

function FEmpleados.getNom: String;
begin
  result:=nom;
end;

function FEmpleados.getExt: String;
begin
     result:=ext;
end;

function FEmpleados.EsFin: Boolean;
begin
     Result:=EOf(f);
end;

procedure FEmpleados.Cerrar;
begin
  Close(f);
  modo:=-1;
end;

procedure FEmpleados.Posicionar(pos: Integer);
begin
    if((pos>=1)and((pos-1)<=FileSize(f)))then begin
   Seek(f,pos-1);
 end else begin
   ShowMessage('FileTipo.posicionar: Fuera de rango...');
 end;
end;

procedure FEmpleados.adicionar(nombre, se, car: String; sue: Integer; mon: String);
 var e : Empleado;
begin
  e.Nombre:=nombre;
  e.sexo:=se;
  e.cargo:=car;
  e.sueldo:=sue;
  e.moneda:=mon;
  EscribirTipo(e);

end;

function FEmpleados.GetMaySueldotipo(genero: char): integer;
var e : Empleado;
    s :Integer;
begin
  s := 0;
  Posicionar(1);
  while (not EsFin()) do begin
       e := LeerTipo;
       if ((e.sexo = genero)and(e.sueldo > s)) then begin
          s := e.sueldo;
       end;
   end;
  result := s;
end;

function FEmpleados.MaySueldo_Mujer_Mostrar: String;
 var e : Empleado;
    sueldo1,sueldo2 :Integer;
    lista : String;
begin
   Abrir();
   sueldo1 := self.GetMaySueldotipo('M');
   sueldo2 := 0;
   lista := '--Lista Mujeres--' + #10#13;
   Posicionar(1);
   while (not EsFin()) do begin
       e := LeerTipo;
       if (e.sexo = 'M') then begin
          lista := lista + EmpleadoToStr(e);
           if (e.sueldo > sueldo2 )and (e.sueldo <> sueldo1) then begin
               sueldo2 := e.sueldo;
           end;
       end;
   end;
   Cerrar();
   result :=  lista +
             'Primer sueldo mayor = ' + IntToStr(sueldo1) + #10#13 +
             'segundo sueldo mayor = ' + IntToStr(sueldo2);

end;

function FEmpleados.getPromedioSueldo: real;
   var prom : Real;
    cp, sp :Integer;
    e : Empleado;
begin
   self.Posicionar(1);
   cp := 0;
   sp := 0;
   while (not EsFin()) do begin
       e := LeerTipo;
       sp := sp + e.sueldo ;
       cp := cp + 1 ;
   end;
   if(cp > 0)then prom:= sp/cp ;
   result := prom;
end;

function FEmpleados.getMaySueldo_AlPromedio: String;
 var e : Empleado;
    cad, cad2 : String;
    prom : Real;
    may :Integer;
begin
   Abrir();
   cad := ''; cad2 :='';
   may := 0;
   prom := self.getPromedioSueldo();
   self.Posicionar(1);
   while (not EsFin()) do begin
       e := LeerTipo;
       if (e.sueldo > prom ) then begin
         cad := cad + EmpleadoToStr(e);
       end;
       if (e.sueldo > may ) then begin
         may := e.sueldo;
         cad2 := 'EL EMPLEADO CON MAYOR SUELDO ES : ' + #10#13 +
                 EmpleadoToStr(e);
       end;
   end;
   Cerrar();
   result:= 'LISTA DE EMPLEADOS CON SUELDO MAYOR AL PROMEDIO : ' +cad +#10#13 + cad2;
end;

function FEmpleados.EmpleadoToStr(e: Empleado): String;
begin
    result := e.Nombre+'  ' + e.sexo+'  '+ e.cargo +'  '+ Inttostr(e.sueldo) + e.moneda + #10#13;
end;

end.

