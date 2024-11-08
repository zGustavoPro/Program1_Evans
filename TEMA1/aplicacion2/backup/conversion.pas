unit conversion;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,dialogs;
type

  { numeros }

  numeros=class
    private
      n:integer;
      public
      constructor crear();
      procedure setvalor(val:integer);
      function getvalor():integer;
      procedure invertir();
      procedure capicua();
      procedure par();
      procedure impar();
      procedure primo();
      function binario():string;
      function octal():string;
      function hexadecimal ():string;
      function baseN(base:integer):string ;
      function romano():string;
      function literal():string;

  end;

implementation

{ numeros }

constructor numeros.crear();
begin
  n:=0;
end;

procedure numeros.setvalor(val:integer);
begin
  n:=val;
end;

function numeros.getvalor(): integer;
begin
  result:=n;
end;

procedure numeros.invertir();
var dig,a,c:integer;  z:string;
begin
a:= n;
dig:=0;
while a <> 0 do
begin
c:= a mod 10;
dig:=(dig*10)+c;
a:=a div 10;
end;
z:= inttostr(dig);
ShowMessage(z);
end;

procedure numeros.capicua();
var dig,a,c:integer;
begin
a:=n;
c:=0;
while a<>0 do
begin
dig:=a mod 10;
 c:= (c*10)+ dig;
 a:= a div 10;
end;
if a= c then
begin
  ShowMessage('es capicua');
  end else
  ShowMessage('no es capicua');
end;

procedure numeros.par();
var a:integer;
begin
 a:=n;
 if (a mod 2)=0 then
 begin
   ShowMessage(' es par');
 end else
   ShowMessage('no es un numero par');

end;

procedure numeros.impar();
var a:integer;
begin
a:=n;
if (a mod 2)<> 0 then
begin
  ShowMessage('es un numero impar');
  end else
  ShowMessage('no es un numero impar');
end;

procedure numeros.primo();
var a,b,i,c:integer;
begin
  a:=n;
  c:=0;
  for i:=1 to a do
  begin
   if (a mod i)=0 then
   c:=c+1;
  end;
  if c=2 then
  ShowMessage(' es numero primo') else
    ShowMessage (' no es primo');
end;

function numeros.binario(): string;
var pb,a:integer; alm:string;
begin
a:=n;
alm:='';
while a>0 do
begin
pb:= a mod 2;
alm:= IntToStr(pb)+ alm;
a:=a div 2;
   end;
result:= alm;
end;

function numeros.octal(): string;
var a,po:integer; alm:string;
begin
 a:= n;
 alm:='';
 while a>0 do
 begin
 po:= a mod 8;
 alm:= IntToStr(po)+ alm;
 a:= a div 8;
 end;
 result:= alm;
end;

function numeros.hexadecimal(): string;
var
a:integer;
alm:string;
begin
 alm:='';
a:=n;
 alm:= IntTohex(a,0);
 result:= alm;
end;

function numeros.baseN(base:integer): string;
var
z,x,pb,po:integer; b:string; alm:string;
begin
 alm:='';
 z:=base;
 x:=n;
 b:='';
  if z= 2 then
  begin
  while x>0 do
begin
pb:= x mod 2;
alm:= IntToStr(pb)+ alm;
x:=x div 2;
   end;
  result:=alm;
  end else
   if z=8 then
   begin
      while x>0 do
 begin
 po:= x mod 8;
 alm:= IntToStr(po)+ alm;
 x:= x div 8;
 end;
   result:=alm;
   end else
   if z = 16 then
   begin
     alm:=inttoHex(x);;
     result:=alm;
   end else  begin
   ShowMessage ('por favor ingrese cualquiera de estas bases "2","8","16"');
   end;
end;

function numeros.romano(): string;
var
x,unidades,decenas,centenas ,millar:integer; res:string;
begin
 x:=n;
 res:='';

 if x>3000 then
 begin
   ShowMessage ('numero fuera de rango de conversion'); exit;
 end;
 unidades := x mod 10; x:= x div 10;
 decenas := x mod 10; x := x div 10;
 centenas := x mod 10; x:= x div 10;
 millar:= x mod 10; x:=x div 10;
 case millar of
 1: res:= res+'M';
 2: res:= res + 'MM';
 3: res := res + 'MMM';
 end;
 case centenas of
   1:  res:=res +'C';
    2:  res:=res +'CC';
     3:  res:=res +'CCC';
      4:  res:=res +'CD';
       5:  res:=res +'D';
        6:  res:=res +'DC';
        7 :  res:=res +'DCC';
         8 :  res:=res +'DCCC';
           9:  res:=res +'CM';
  end;
 case decenas of
     1:  res:=res +'X';
      2:  res:=res +'XX';
       3:  res:=res +'XXX';
       4 :  res:=res +'XL';
        5 :  res:=res +'L';
          6:  res:=res +'LX';
           7:  res:=res +'LXX';
            8:  res:=res +'LXXX';
             9:  res:=res +'XC';
  end;
 case unidades of
     1:  res:=res +'I';
      2:  res:=res +'II';
       3:  res:=res +'III';
        4:  res:=res +'IV';
        5 :  res:=res +'V';
         6 :  res:=res +'VI';
          7 :  res:=res +'VII';
           8 :  res:=res +'VIII';
             9:  res:=res +'IX';

 end;
 result:=res;
end;

function numeros.literal(): string;
var
x,unidades,decenas ,centenas ,millar:int64; z,res,res1,ss,sss:string;
begin
 x:=n;
 { unidades := x mod 10; x:= x div 10;
  decenas:= x mod 10; x:= x div 10;
  centenas:= x mod 10; x:= x div 10;
  millar:= x mod 10; x:= x div 10;   }
  millar:= trunc(x / 1000);
  centenas:= trunc((x mod 1000)/100);
  decenas:= trunc(((x mod 1000)mod 100)/10);
  unidades:= x mod 10;
  case  unidades of
 1:  res:='uno';
      2:  res:='dos';
       3:  res:='tres';
       4 :  res:='cuatro';
         5:  res:='cinco';
          6:  res:='seis';
          7 :  res:='siete';
           8 :  res:='ocho';
            9 :  res:='nueve';
  end;
 case decenas of
      1:  begin res1:='diez';
      case unidades of
      0: res1:= 'diez';
         //res1:='';
      1: res1 := 'once';
     // res1:='';
      2:  res1:='doce';
     // res1:='';
        3: res1 := 'trece';
       // res1:='';
      4:  res1:='catorce';
     // res1:='';
      5: res1 := 'quince';
    //  res1:='';
         else
           res1:='dieci';
           end;
      end;
       2:
       if unidades=0 then
        res1:= 'veinte'
        else
       res1:='veinti';

        3:  if unidades=0 then

        res1:= 'treinta' else
       res1:='treinta y';

        4 :  if unidades=0 then

        res1:= 'cuarenta' else
       res1:='cuarenta y';


         5:  if unidades=0 then

        res1:= 'cincuenta' else
       res1:='cincueta y';

          6 :   if unidades=0 then

        res1:= 'sesenta' else
       res1:='sesenta y';

            7:if unidades=0 then

        res1:= 'setenta' else
       res1:='setenta y';

            8 :   if unidades=0 then

        res1:= 'ochenta' else
       res1:='ochenta y';

              9:if unidades=0 then

        res1:= 'noventa' else
       res1:='noventa y';

           end;
case centenas of
  1:  if (unidades =0) and (decenas = 0) then
  ss:='cien' else
  ss:='ciento ';

   2:
    if (unidades =0) and (decenas = 0) then
  ss:='dosciento' else
  ss:='doscientos ';
    3:
     if (unidades =0) and (decenas = 0) then
  ss:='tresciento' else
  ss:='trescientos ' ;
     4:  if (unidades =0) and (decenas = 0) then
  ss:='cuatrociento' else
  ss:='cuatrocientos ';

      5:
       if (unidades =0) and (decenas = 0) then
  ss:='Quinientos' else
  ss:='Quinientos ' ;
       6:
        if (unidades =0) and (decenas = 0) then
  ss:='seiscientos' else
  ss:='seiscientos '  ;
        7:
         if (unidades =0) and (decenas = 0) then
  ss:='setencientos' else
  ss:='setecientos' ;
         8:
          if (unidades =0) and (decenas = 0) then
  ss:='ochocientos' else
  ss:='ochocientos ';
         9 :
          if (unidades =0) and (decenas = 0) then
  ss:='nuevecientos' else
  ss:='nuevecientos ' ;
end;
case millar of
1: sss:='mil';
 2 : sss:='dosmil';
3: sss:='tresmil';
4: sss:='cuatromil';
5: sss:='cincomil';
6: sss:='seis mil';
7: sss:='sietemil';
8: sss:='ochomil';
9: sss:='nuevemil';

end;
result:= sss+ss+res1+'y'+res;
end;
                 //terminado
end.

