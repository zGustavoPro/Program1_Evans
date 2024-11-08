unit TInteger;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,Dialogs,math;
const
  max=1024;
type

  { parcial1 }

  parcial1=class
    private
      x:array[1..max]of integer;
      dim:integer;
      public
        constructor crear();
        procedure setdim(n:integer);
        function getdim():integer;
        procedure setvalor(p,ele:integer);
        function getvalor(p:integer):integer;
     procedure binario(n:double);
     procedure ord_asc();//metodo de selecion ascendente
     procedure ord_desc();  //descendente
     Function inv(n:integer):integer;
     procedure invertir(n:integer);
     function num_lit(n:integer):String;
     procedure num_rom(n:integer);
     function num_octal(n:integer):string;
     function Frac_dec_bin (n:double):string; //0.23 a binario
       function Frac_dec_Octal (n:double):string;
       procedure dec_lit(n:float);
       procedure prim_cap(n:integer);
       function primo (n:integer):boolean;
       function capicua(n:integer):boolean;



  end;

implementation

{ parcial1 }

constructor parcial1.crear;
var
i:integer;
begin
   dim:=0;
 for i:=1 to max do
   x[i]:=0;
end;

procedure parcial1.setdim(n: integer);
begin
  dim:=n;
end;

function parcial1.getdim: integer;
begin
  result:=dim;
end;

procedure parcial1.setvalor(p, ele: integer);
begin
   if (p>=1) and (p<=dim) then
    x[p]:=ele
    else
    ShowMessage('posicion fuera de rango' );
end;

function parcial1.getvalor(p: integer): integer;
begin
    if (p>=1) and (p<=dim)then
    result:= x[p]
    else
    result:=-999;
end;


procedure parcial1.binario(n: double);
  var
 br, p, i:integer;  res: string;
  pdc, z:double; z2:string;
begin
   pdc:=0;
   z2:='';
  z:= n;
     pdc:=z-trunc(n);
     p:= trunc(n);
   res:='';
   while p > 0 do
    begin
     br :=  p mod 2 ;
     res:= IntToStr(br) + res;
     p:= p div 2 ;
    end;
     res:= res +'.';
        for i:= 1 to 5 do
        begin
         pdc:= pdc * 2 ;
         if pdc >= 1 then
         begin
          z2:= z2+'1';
          pdc:= pdc -1;
         end else
         begin
          z2:= z2 + '0';
         end;
        end;
      res:=res+z2;
      ShowMessage('el numero convertido a binario es:'+res);
end;

procedure parcial1.ord_asc;   // [3,2,1,5,4]
var
i,j,aux,min:integer;
begin
  for i:=1 to dim do
  begin
  min:=i;
  for j:=i+1 to dim do  begin
  if x[j]<x[min]then
  min:=j;
  end;
   aux:=x[i];
   x[i]:=x[min];
   x[min]:=aux;
  end;
end;

procedure parcial1.ord_desc;  //[3,2,1,5,4]
var
i,j,may,aux:integer;
begin
 for i:=1 to dim do
 begin
 may:=i;
 for j:=i+1 to dim do
 begin
   if x[j]>x[i] then
    may:=j
 end;
 aux:=x[i];
 x[i]:=x[may];
 x[may]:=aux;
end;
 end;

function parcial1.inv(n: integer):integer;
var
aux:integer;
begin
 aux:=0;
 while n <> 0 do
  begin
  aux:= (aux*10)+(n mod 10);
  n:=n div 10;
  end;
 result:=aux;
end;

procedure parcial1.invertir(n: integer);
var
c,elev:integer;
sw:boolean;
begin
 if n=0 then
 begin
    ShowMessage('el numero impar invertido es :'+IntToStr(0));
    exit;
 end;
 sw:=false;
 if n<0 then begin
 sw:=true;
 n:=n*-1;
 end;

 c:=trunc(math.log10(n)+1);
 elev:=trunc(math.power(10,trunc(c div 2)));
 if c mod 2 = 0 then
 begin
 n:=((n div elev)*elev)+inv(n mod elev);
 end else begin
 n:=(inv(n div elev)*elev)+ n mod elev; end;
  if sw then
 ShowMessage('el numero impar invertido es :'+IntToStr(n*-1))
  else
  ShowMessage('el numero impar invertido es :'+IntToStr(n));
  end;


function parcial1.num_lit(n:integer):String;
 var
 x1,unidades,decenas ,centenas ,millar:int64;
 t,z,res,res1,ss,sss:string;
begin
 t:='';
 x1:=trunc(n);
  millar:= trunc(x1 / 1000);
  centenas:= trunc((x1 mod 1000)/100);
  decenas:= trunc(((x1 mod 1000)mod 100)/10);
  unidades:= x1 mod 10;
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
      1: res1 := 'once';
      2:  res1:='doce';
        3: res1 := 'trece';
      4:  res1:='catorce';
      5: res1 := 'quince';
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
       res1:='treinta y ';

        4 :  if unidades=0 then

        res1:= 'cuarenta' else
       res1:='cuarenta y ';


         5:  if unidades=0 then

        res1:= 'cincuenta' else
       res1:='cincueta y ';

          6 :   if unidades=0 then

        res1:= 'sesenta' else
       res1:='sesenta y ';

            7:if unidades=0 then

        res1:= 'setenta' else
       res1:='setenta y ';

            8 :   if unidades=0 then

        res1:= 'ochenta' else
       res1:='ochenta y ';

              9:if unidades=0 then

        res1:= 'noventa' else
       res1:='noventa y ';

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
  ss:='nuevecientos' ;
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
//ShowMessage('el numero convertido a literal es'+ '=>'+sss+ss+res1+res);
t:=sss+ss+res1+res;
result:=t;
end;



procedure parcial1.num_rom(n: integer);
 var
x1,unidades,decenas,centenas ,millar:integer;
res:string;
begin
 x1:=n;
 res:='';

 if x1>3000 then
 begin
   ShowMessage ('numero fuera de rango de conversion'); exit;
 end;
 unidades := x1 mod 10; x1:= x1 div 10;
 decenas := x1 mod 10; x1:= x1 div 10;
 centenas := x1 mod 10; x1:= x1 div 10;
 millar:= x1 mod 10; x1:=x1 div 10;
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
 ShowMessage('El Numero Convertido A Romano Es'+'=>'+res);
end;

function parcial1.num_octal(n: integer): string;
 var a,po:integer; alm:string;
begin
 a:=n;
 alm:='';
 while a>0 do
 begin
 po:= a mod 8;
 alm:= IntToStr(po)+ alm;
 a:= a div 8;
 end;
 result:= alm;
end;

function parcial1.Frac_dec_bin(n: double): string;
  var
 br, p, i:integer;  res: string;    // entero a binario
  pdc, z:double; z2:string;
begin
   pdc:=0;
   z2:=''; // almacenar parte binaria de fraccion
  z:= n;
  //parte decimal pdc
     pdc:= z - trunc(n);
     p:= trunc(n);
   res:='';
   while p > 0 do
    begin
     br :=  p mod 2 ;
     res:= IntToStr(br) + res;
     p:= p div 2 ;
    end;
     res:= res +'.';
        for i:= 1 to 5 do
        begin
         pdc:= pdc * 2 ;
         if pdc >= 1 then
         begin
          z2:= z2+'1';
          pdc:= pdc -1;
         end else
         begin
          z2:= z2 + '0';
         end;
        end;
      result:=res+z2;
end;

function parcial1.Frac_dec_Octal(n: double): string;
var
  r, p_bin:string;
  c,c1, i,p_ent:integer;
   p_dec:double;
   p_oct:string;
begin
c1:=0;
  p_bin:='';
  p_oct:='';
  p_ent:= trunc (n);
  P_dec:=  n - p_ent;
  while p_ent > 0 do
  begin
     c1:=p_ent mod 8;
    p_bin :=IntToStr(c1 )+ p_bin ;
    p_ent:= p_ent div 8;
   end;
  r:= p_bin + '.';
  for i:= 1 to 5 do
    begin
    p_dec:=p_dec*8;
     c:= trunc(p_dec);
    p_oct:= p_oct+IntToStr(c) ;
    p_dec:= p_dec -c;
    end;
    result:=r+p_oct;

//result:=result+p_oct;
end;

procedure parcial1.dec_lit(n: float);
var
   x1:integer;
   x2:real;
   M:string;
begin
 M:='';
  x1:=trunc(n);
  x2:=n-x1;
  if  (n-trunc(n)<>0 ) then
  begin
  while frac(x2)>0 do
  begin
  x2:=x2*10;
  end;
  M:=num_lit(x1);
 M:=M+' coma '+num_lit(Trunc(x2));
 ShowMessage('el numero convertido a literal es => '+M);
   end else  begin
     M:=num_lit(x1);
     ShowMessage('el numero convertido a literal es => '+M);
   end;

end;

procedure parcial1.prim_cap(n: integer);
var
i:integer;
aux:String;
begin
 Aux:='';
  for i:=1 to n do
    begin
    if primo(i) and capicua(i) then begin
    if aux<>''then
       aux := aux + ',';
      aux := aux + IntToStr(i);
      end;
    end;
   if aux <> '' then
    ShowMessage('Los Numeros Primos Y Capicuas Son:' + #10#13 + aux)
  else
    ShowMessage('No hay Numeros Primos y Capicuas en el rango dado.');

end;

function parcial1.primo(n: integer): boolean;
var
i,c:integer;
begin
 c:=0;
 for i:=1 to n do begin
   if n mod i = 0 then
    c:=c+1;
 end;
  if c=2 then
  result:=true  else
  result:=false;
end;

function parcial1.capicua(n:integer): boolean;
begin
if n=inv(n) then
result:=true else
result:=false;
end;



end.

