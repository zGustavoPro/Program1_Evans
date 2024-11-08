unit Ttexto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,TCadena,Tconjunto;
type

  { PTexto }

  PTexto=class
    private
      nom:string;
      f:text;
      estado:integer;
      public
        constructor crear();
        procedure setnom(nomf:string);
        function getnom():string;
         procedure escribircar(car:char);
        function leercar():char;
        procedure escribirlinea(linea:string);
        function leerlinea():string;
        function esfin():boolean;
        procedure creararchivo();
        procedure abrir();
        procedure cerrar();
        function exitste():boolean;
     procedure crearTxT();
       procedure leerTxT();
     procedure Copiar(A: ptexto; nombre: String);
       procedure eliminarcopia();
       function CopiarInvertido():Ptexto;
        function GetLineaPos(n:integer):string;
      function GetCantLineas():integer;
      procedure renombrar(n:string);
        function Palabras(cad:string; n:integer):string;
         function palabrapos(cad:string; n:integer):integer;
          function LeerLineaPos(n:integer):string;
          function ContPalabras(cad:string):integer;
      procedure invertirpal();
       procedure leerNumReales(a:pTexto; nombre: String );
       {procedure informe (o:ptexto); }
       function tamano():Integer;
       function get(pos: integer): String;



  end;

implementation

{ PTexto }

constructor PTexto.crear;
begin
   nom:='Tex.txt';
   estado:=3;
end;

procedure PTexto.setnom(nomf: string);
begin
 nom:=nomf;
end;

function PTexto.getnom: string;
begin
  result:=nom;
end;

procedure PTexto.escribircar(car: char);
begin
  if (estado<>3)then   //estado abierto
 begin
   if (estado=1 )then //modo escritura
   write(f,car) else
     writeln('No se puedo escribir, TxT esta en modo escritura');
 end else
 begin
    writeln('el archivo txt esta cerrado');
 end;
end;

function PTexto.leercar: char;
var
  car:char;
begin
   if(estado<>3)then
   begin
    if (estado=0)then //modo lectura
    begin
     read(f,car);
     result:=car;
     end else result:=char(0); //null
   end else
     result:=char(0);

end;

procedure PTexto.escribirlinea(linea: string);
begin
  if (estado<>3)then
 begin
   if (estado=1 )then
   writeln(f,linea) else
     writeln('No se puedo escribir, TxT esta en modo lectura');
 end else
   writeln('el archivo txt se encuentra cerrado');
end;

function PTexto.leerlinea: string;
var
  linea:string;
begin
   if(estado<>3)then
   begin
    if (estado=0)then
    begin
     readln( f , linea );
     result:=linea;
     end else result:=char(0);
   end else
     result:=char(0);

end;

function PTexto.esfin: boolean;
begin
   if (estado<>3)then
   result:=eof( f )
   else
  result:=true;
end;

procedure PTexto.creararchivo;
begin
 if (estado=3)then  // 3 modo cerrado    1 modo escritura 0 modo lectura
 begin
   assign(f,nom);
   {$I-}
   rewrite(f);
    {$I+}
    if(IOResult<>0)then
    begin
     writeln('Error al crear txt');
     exit;
    end;
    estado:=1; //modo escritura
 end else
    writeln('el archivo TxT se encuentra abierto');
end;

procedure PTexto.abrir;
begin
 if (estado=3)then  // 3 modo cerrado    1 modo escritura 0 modo lectura
 begin
   assign(f,nom);
   {$I-}
   reset(f);
    {$I+}
    if(IOResult<>0)then
    begin
     writeln('Error al abrir archivo TxT');
     exit;
    end;
    estado:=0; //modo lectura
 end else
    writeln('el archivo TxT se encuentra abierto');
end;

procedure PTexto.cerrar;
 begin
    if (estado<>3)then
  begin
   close(f);
  end else
   writeln('el archivo ya se encuentra cerrado');
end;

function PTexto.exitste: boolean;
var
  s:string;
begin
 s:='copia.txt';
   Assign(f,s);
    {$I-}  Reset(f);  {$I+}  //abrir archivo
    if(IOResult<>0)then begin
      writeln('El archivo no existe');
      result:=false;
    end else begin
      cerrar();
      result:=true;
    end;
end;

procedure PTexto.crearTxT;
 begin
    nom:='Texto.txt';
   assign(f,nom);
   {$I-}
   rewrite(f);
    {$I+}
    if(IOResult<>0)then
    begin
      writeln('Error al crear txt');
     exit;
    end;
    writeln(f,'1122375');
    writeln(f,'juan perez');
    writeln(f,'Ingenieria ');
    close(f);
     writeln('Archivo txt creado');
end;

procedure PTexto.leerTxT;
  var
 cad:string;
begin
  nom:='texto.txt';
   assign(f,nom);
  writeln('abriendo archivo');
   {$I-}
   reset(f);
    {$I+}
    if(IOResult<>0)then
    begin
      writeln('Error al crear txt');
     exit;
    end;
    while(Not eof(f))do
  begin
    readln(f,cad);
    writeln(cad)
  end;
    close(f);
end;

procedure pTexto.Copiar(A: ptexto; nombre: String);
begin
 if(self.exitste())then begin
   abrir();
   A.setNom(nombre);
   A.crear();
   while(not esfin())do begin
     A.escribirLinea(leerLinea() );
   end;
   cerrar();
   A.cerrar();
 end;
end;

procedure PTexto.eliminarcopia;
begin
   if(exitste())then begin
    {$I-}
    Erase(f);
    {$I+}
 end;
end;

function PTexto.CopiarInvertido: Ptexto;
var cad:String;
     copia:Ptexto;
     linea,dim:integer;
begin
 dim:=self.GetCantLineas;

 copia:=Ptexto.crear();
 copia.SetNom('Copia.txt');
    copia.creararchivo();
    for linea:=dim downto 1 do begin
       cad:=self.GetLineaPos(linea);
       copia.escribirlinea(cad);
    end;
  copia.cerrar;

  result:=copia;

end;

function PTexto.GetLineaPos(n: integer): string;
  var a:integer;
     cad:string;
begin
 a:=0;
    self.abrir;
   while not esfin() do begin
      a:=a+1;

      if a=n then begin
        cad:=self.leerlinea();
      end else begin
         self.leerLinea();
      end;
   end;
   self.cerrar;

   result:=cad;
end;


function PTexto.GetCantLineas: integer;
var a:integer;
begin
 a:=0;
    self.abrir;
   while not esfin() do begin
      a:=a+1;
      self.leerLinea();
      end;
  self.cerrar;
   result:=a;
end;

procedure PTexto.renombrar(n: string);
 var a:shortstring;
begin
 {$I-}
  rename(f,n);
  self.Setnom(n);
 {$I+}
end;

function PTexto.Palabras(cad: string; n: integer): string;
 var a,t,posi:integer;
     copiar:boolean;
     r:string;
begin
 a:=1;
 t:=length(cad);
 copiar:=false;
 posi:=self.palabrapos(cad,n);

 for posi:=self.palabrapos(cad,n) to t do begin
   if cad[posi]=' ' then begin
      break;
   end;
   r:=r+cad[posi];
 end;
 result:=r;
end;

function PTexto.palabrapos(cad: string; n: integer): integer;
var pos,t,pal,posi:integer;
begin
  pos:=1;
 t:=length(cad);
 pal:=1;
 trim(cad);
  for posi:=1 to t do begin
    pos:=pos+1;

   if cad[posi]=' ' then begin
    pal:=pal+1;

    if pal=n then begin
     break;
    end;
  end;
end;
  if n=1 then begin
   pos:=1;
  end;
  result:=pos;
end;

function PTexto.LeerLineaPos(n: integer): string;
var a:integer;
     cad:string;
     aux:char;
begin
 a:=0;
    self.abrir();
   while not esfin() do begin
      a:=a+1;
      if a=n then begin
         while not self.esfin() do begin
          aux:=self.leercar();
          if aux=#13 then begin
           break;
          end;
          cad:=cad+aux;

         end;
         break;
      end else begin
         self.leerLinea;
      end;
   end;
  self.cerrar();
  result:=cad;
end;

function PTexto.ContPalabras(cad: string): integer;
var t,a,posi:integeR;
begin
 trim(cad);
 t:=length(cad);
 a:=1;
  for posi:=1 to t do begin
    if cad[posi]=' ' then begin
       a:=a+1;
    end;
  end;
  result:=a;
end;





procedure PTexto.invertirpal;
var t:integer;
     cad:string;
     posi:integer;
     r:string;
     coso:integer;
     resultado:string;
begin
 resultado:='';
 t:=self.GetCantLineas;
       for posi:=1 to t do begin
          cad:=Self.LeerLineaPos(posi);
          r:='';
          for coso:=self.ContPalabras(cad) downto 1 do begin
             r:=r+palabras(cad,coso)+' ';
          end;
          resultado:=resultado+r+#13;
         Writeln(resultado);
       end;
     SELF.CREAR;
     self.EscribirLinea(resultado);
     Self.Cerrar
end;

procedure PTexto.leerNumReales(a: pTexto; nombre: String);
var i : Integer;
    pal : String;
    v :cadena;
begin
  if (self.exitste()) then begin
     a.setNom(nombre);
     abrir();
     a.crear();
     v :=cadena.crear();
     i:=1; pal:='';
     while (not esfin()) do begin
        v.AddPal(leerLinea());
        while (i <= v.getDim()) do begin
           v.leerNumReales(i, pal);
           if (pal <> '') then begin
             a.escribirLinea(pal);
           end;
        end;
        i := 1;
        v.setDim(0);
     end;
     a.cerrar();
     cerrar();
  end;
end;

{procedure PTexto.informe(o: ptexto);
 var n,i,lres,lres2,scarac,spal,maypal,mayterm:Integer;
    cad:cadena;
    smedia:REAL;
    cadenafil,linea,carac,pal,media,cantTerm:String;
    term:char;
begin
 n:=O.tamano();
 create();
 setNom('Informe.txt');
 crear(); //CREANDO
 escribirLinea('línea  tot.car.  tot.Palabras   long.media  term.1ªPal.   igualTermin. ');
 scarac:=0;  spal:=0;  mayterm:=0;  smedia:=0.0;  maypal:=0;  mayterm:=0;
 for i:=1 to n do begin
    cad:=cadena.crear();  //REINICIA LA CADENA
    cadenafil:=o.get(i);
    cad.AddPal(cadenafil);

    linea:=IntToStr(i);
    carac:=IntToStr(cad.cantidadchar());
    pal:=IntToStr(cad.CantPal());
    media:=FloatToStr(cad.LongMedia());
    SetLength(media,LastDelimiter(',',media)+2);
    term:=cad.Ppal_UltCaracter();          //letra con que termina la primera palabra
    cantTerm:=IntToStr(cad.cantpal_Fin(term));//número de palabras que terminan con esa letra.
    escribirLinea(linea+'          '+carac+'                 '+pal+'                  '+media+'                  '+term+'                   '+cantTerm);

    scarac:=scarac+cad.cantCaracteres();
    spal:=spal+cad.CantPal();
    smedia:=smedia+StrToFloat(media);
    if(cad.CantPal()>maypal)then begin
        maypal:=cad.CantPal();
        lres:=i;
    end;
    if(cad.cantpal_Fin(term)>mayterm)then begin
      mayterm:=cad.cantpal_Fin(term);
      lres2:=i;
    end;
 end;
 escribirLinea('Total : '+ IntToStr(n)+' Líneas, '+inttostr(scarac)+' caracteres y '+inTtostr(spal)+' palabras. Long Media palabra = '+FLOATToStr(smedia) );
 escribirLinea('linea con mas palabras : la n° '+inttostr(lres)+' con '+inttostr(maypal)+' palabras');
 escribirLinea('La Línea n° '+inttostr(lres2)+' tiene el mayor n° de palabras que terminan como la primera:  '+Inttostr(mayterm));
 cerrar();
end;  }

function PTexto.tamano: Integer;
var c:integer;
begin
 abrir();
 c:=0;
 while(not esfin())do begin
      leerLinea();
      c:=c+1;
 end;
 cerrar();
 result:=c;
end;
function pTexto.get(pos: integer): String;
var cad:String;
      i:Integer;
begin
 if(pos>0)and(pos<=tamano())then begin
 abrir();i:=0;
   while((not esfin())and(i<pos))do begin
       cad:=leerLinea();
       i:=i+1;
   end;
   cerrar();
   if(i=pos) then
     result:=cad;
 end else begin
 result:='No existe posicion  '+IntToStr(pos);
 end;
end;

end.

