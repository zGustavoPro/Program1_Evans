unit TMatriz;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;

const
Max_Fil=2000;
Max_Col=2000;
type

{ Matriz }

 Matriz=class
  private
  x:array[1..Max_Fil,1..Max_Col] OF Integer;
   fils,cols:integer;
   public
   constructor crear();
   procedure setfils(f:integer);
   function getfils():integer;
    procedure setcols(c:integer);
   function getcols():integer;
   procedure setElem(f,c,ele:integer);
   function getElem(f,c:integer):integer;
   procedure Inter_ele(f1,c1,f2,c2:integer);
   //Parte Del PracticU5
   procedure suma_Matriz(M1,M2:Matriz);
   procedure mult_Matriz(M1,M2:Matriz);
   procedure TSI();
   procedure TSD();
   procedure TII();
   procedure TID();
   procedure DS();
   procedure DP();
   function sum_bloque(fa,fb,ca,cb:integer):integer;
   procedure prom_fil(f:integer);
   procedure prom_col(c:integer);
 function sum_colum(c:integer):integer;
 function sum_fil(f:integer):integer;
 function frecuencia(ele:integer):integer;
 procedure Rep_elemM();
 { procedure Vect_a_Matriz(n:Vector); }
 function FrecuTSI(ele:integer):integer;
 function FrecuTID(ele:integer):integer;
 Function Moda_TSI_TID():integer;
    //Parte De La AplicacionU5
    procedure M_Triangular();
    procedure Diag_prin();
    procedure diag_sec();
  procedure ord_matriz(); //ascendente
  procedure resta_matriz(M1,M2:Matriz);
  procedure inver_Mtriz();
  function Determinante2x2():integer;
  function Determinante3x3():integer;
  procedure copia(M1:Matriz);
  procedure copia_Nula(M2:Matriz; nf,nc:integer);
  procedure Transpuesta(var M2:Matriz);
  procedure tra();
  procedure Adjunta( M1:Matriz);
  end;

implementation

constructor Matriz.crear;
var
  f,c:integer;
begin
  fils:=0;
  cols:=0;
  for f:=1 to Max_fil do
for c:=1 to Max_Col do
x[f,c]:=0;
end;

procedure Matriz.setfils(f: integer);
begin
  if (f>=0) and (f<=Max_fil) then
  fils:=f else
  ShowMessage('Fuera De Rango');
end;

function Matriz.getfils: integer;
begin
  result:=fils;
end;

procedure Matriz.setcols(c: integer);
begin
  if (c>=0) and (c<=Max_fil) then
  cols:=c else
  ShowMessage('Fuera De Rango');

end;

function Matriz.getcols: integer;
begin
result:=cols;
end;

procedure Matriz.setElem(f, c, ele: integer);
begin
 if((f>=0) and (f<=fils))AND ((c>=0) and (c<=cols)) then
 x[f,c]:=ele else
 ShowMessage(' Posicion Fuera De Rango..... ');
end;

function Matriz.getElem(f, c: integer): integer;
begin
 if((f>=0) and (f<=fils))AND ((c>=0) and (c<=cols)) then
 result:=x[f,c] else
result:=-999;
end;

procedure Matriz.Inter_ele(f1, c1, f2, c2:integer);
var aux:integer;
begin
 if(f1>=1)and(f1<=fils)and
   (c1>=1)and (c1<=cols)and
   (f2>=1)and (f2<=fils)and
   (c2>=1)and(c2<=cols)then
  begin
  aux:=x[f1,c1];
  x[f1,c1]:=x[f2,c2];
  x[f2,c2]:=aux
  end
 else
 begin
   ShowMessage('Las Filas o Columnas estan fuera de rango..');
  end;
end;

procedure Matriz.suma_Matriz(M1, M2: Matriz);
var
f,c:integer;
begin
if (M1.getfils()=M2.getfils())AND(M1.getcols()=M2.getcols()) then
begin
        setfils(M1.getfils);
    setcols(M1.getcols);
   for f:=1 to getFils() do
   for c:=1 to getcols() do
   setelem( f,c,M1.getelem(f,c)+ M2.getElem(f,c));
   end else
    ShowMessage('Filas Y Columnas De La Matrizes No Pueden Ser Diferentes');
end;

procedure Matriz.mult_Matriz(M1, M2: Matriz);
var
f,c:integer;
k,sum:integer;
begin
if (M1.getcols()=M2.getfils())then
begin
   setfils(M1.GetFils);
   setcols(M2.getcols);

   for f:=1 to getfils() do
   for c:=1 to getcols() do   begin
    sum:=0;
    for k:=1 to M1.Getcols() do
       sum:=sum+M1.GetElem(f,k)*M2.getElem(k,c);
    setElem(f,c,sum);
    end;
   end else
   ShowMessage('columna De M1 Y Filas De M2 De La Matrizes No Pueden Ser Diferentes');
end;

procedure Matriz.TSI;
 var f,c,sum:integer;
 cad:string;
begin
cad:='';
  sum:=0;
   for f:=1 to fils-1 do
       for c:=1 to cols-f do begin
        cad:=cad+' '+IntToStr(x[f,c]);
         sum:=sum+x[f,c];
       end;
   ShowMessage('Los Elementos De La TSI Son ['+cad+']'+' y La Suma Es: '+IntToStr(sum));
end;

procedure Matriz.TSD;
 var
  f,c,sum:integer;
  cad:string;
begin
cad:='';
  sum:=0;
  for f:=1 to fils-1 do
    for c:=f+1 to cols do
    begin
       cad:=cad+' '+IntToStr(x[f,c]);
         sum:=sum+x[f,c];
    end;
   ShowMessage('Los Elementos De La TSD Son ['+cad+']'+' y La Suma Es: '+IntToStr(sum));
end;


procedure Matriz.TII;
 var
   f,c,sum:integer;
   cad:string;
 begin
   sum:=0;
   for f:=2 to fils do
     for c:=1 to f-1 do
     begin
        cad:=cad+' '+IntToStr(x[f,c]);
         sum:=sum+x[f,c];
   end;
   ShowMessage('Los Elementos De La TII Son ['+cad+']'+' y La Suma Es: '+IntToStr(sum));
 end;


procedure Matriz.TID;
 var
  t,f,c,sum:integer;
  cad:string;
begin
t:=2;
  sum:=0;
  cad:='';
  for f:=fils downto 2 do begin
     c:=cols;
    while c>=t do
    begin
     cad:=cad+' '+IntToStr(x[f,c]);
         sum:=sum+x[f,c];
         c:=c-1;
  end;
    t:=t+1;
  end;
   ShowMessage('Los Elementos De La TID Son ['+cad+']'+' y La Suma Es: '+IntToStr(sum));
end;

procedure Matriz.DS;
  var
    sum,f,c:integer;
     cad:string;
   begin
     sum:=0;
      cad:='';
      f:=0;
     for c:=getcols() Downto 1 do   begin
      f:=f+1;
     sum:=sum+x[f,c];
     cad:=cad+IntToStr(x[f,c])+',';
     end;
    ShowMessage('los elementos de la DS son :'+cad+'la suma es: '+IntToStr(sum));
   end;

procedure Matriz.DP;
var
    sum,f,c:integer;
     cad:string;
   begin
     sum:=0;
      cad:='';
     for f:=1 to getfils() do   begin
     c:=f;
     sum:=sum+x[f,c];
     cad:=cad+IntToStr(x[f,c])+',';
     end;
    ShowMessage('los elementos de la DP son :'+cad+'la suma es'+IntToStr(sum));
   end;

function Matriz.sum_bloque(fa, fb, ca, cb: integer): integer;
var f,c,sum:integer;
begin
 sum:=0;
  for f:=fa to fb do begin
      for c:=ca to cb do  begin
      sum:=sum+getElem(f,c);
      end;
  end;
  result:=sum;
end;

procedure Matriz.prom_fil(f: integer);
var
sum,c:integer;
res:real;
begin
 sum:=0;
 for c:=1 to cols do begin
 sum:=sum+x[f,c];
 end;
res:=sum / cols;
ShowMessage('Es Eromedio Es =>  '+ floatTostr(res));
end;

procedure Matriz.prom_col(c: integer);
var
sum,f:integer;
res:real;
begin
 sum:=0;
 for f:=1 to fils do begin
 sum:=sum+x[c,f];
 end;
res:=sum / fils;
ShowMessage('Es Eromedio Es =>  '+ floatTostr(res));
end;


function Matriz.sum_colum(c: integer): integer;
var
f,sum:integer;
begin
sum:=0;
  if (c>=1)and (c<=getcols()) then
  begin
  for f:=1 to getfils() do
  sum:=sum+getelem(f,c);
  end else
  begin
 result:=-9999;
  end;
  result:=sum;
end;

function Matriz.sum_fil(f: integer): integer;
   var
c,sum:integer;
begin
sum:=0;
  if (f>=1)and (f<=getfils()) then
  begin
  for c:=1 to getcols() do
  sum:=sum+getelem(f,c);
  end else
  begin
 result:=-9999;
  end;
  result:=sum;
end;

function Matriz.frecuencia(ele: integer): integer;
var f,c,sum:integer;
begin
 sum:=0;
  for f:=1 to fils do begin
      for c:=1 to cols do  begin
        if(x[f,c]=ele)then
        sum:=sum+1
      end;
  end;
  result:=sum;
end;

procedure Matriz.Rep_elemM;
   var f,c,i:integer;
        cad:String;
        b:boolean;
begin
 cad:=''; b:=true;
  for f:=1 to fils do begin
      for c:=1 to cols do  begin
         if(frecuencia(x[f,c])>1)then begin
             for i:=1 to Length(cad) do  begin
              if(cad[i]=inttostr(getElem(f,c)))then
                  b:=false;
             end;
           if(b)then
            cad:=cad+IntToStr(getElem(f,c))+' , ';
            b:=true;
         end;
      end;
  end;
ShowMessage(cad);
  end;

{procedure Matriz.Vect_a_Matriz(n:vector);
       var i :integer;
begin
 setfils(StrToInt(InputBox('Matriz','Filas:','3')));
 setcols(StrToInt(InputBox('Matriz','Columnas:','3')));
 for i:=0 to v.getdim()-1 do begin
     setElem((i div fils)+1,(i mod fils)+1,v.getElem(i+1));
 end;
end;
end; }

function Matriz.FrecuTSI(ele: integer): integer;
  var f1,c1,s:integer;
begin
    s:=0;
    for f1:=1 to (getfils()-1)do begin
       for c1:=1 to (getcols()-f1) DO begin
           if(x[f1,c1]=ele)then
             s:=s+1;
       end;
    end;
    Result:=s ;
end;

function Matriz.FrecuTID(ele: integer): integer;
 var f1,c1,s:integer;
begin
 s:=0;
   for f1:=2 to (fils)do begin
       for C1:=cols downto (cols+2-f1)do begin
        if(x[f1,c1]=ele)then
             s:=s+1;
   end;
       result:=s;
   end;
end;

function Matriz.Moda_TSI_TID: integer;
 var f1,c1,elemento,frecu:integer;
begin
  elemento:=0;  frecu:=0;
  for f1:=1 to (getfils()-1)do begin
       for c1:=1 to (getcols()-f1) DO begin
           if(FrecuTSI(x[f1,c1])>frecu)then
            begin
              frecu:=FrecuTSI(x[f1,c1]);
              elemento:=x[f1,c1];
            end;
       end;
    end;
  result:=elemento;
end;

procedure Matriz.M_Triangular;
begin

end;

procedure Matriz.Diag_prin;
   var
    sum,f,c:integer;
     cad:string;
   begin
     sum:=0;
      cad:='';
     for f:=1 to getfils() do   begin
     c:=f;
     sum:=sum+x[f,c];
     cad:=cad+IntToStr(x[f,c])+',';
     end;
    ShowMessage('los elementos de la DP son :[ '+cad+' ]la suma de la diagonal primcipal es '+IntToStr(sum));
   end;

procedure Matriz.diag_sec;
  var
    sum,f,c:integer;
     cad:string;
   begin
     sum:=0;
      cad:='';
      f:=0;
     for c:=getcols() Downto 1 do   begin
      f:=f+1;
     sum:=sum+x[f,c];
     cad:=cad+IntToStr(x[f,c])+',';
     end;
    ShowMessage('los elementos de la diagonal secundaria son :[ '+cad+']la suma de la diagonal Secundaria es'+IntToStr(sum));
   end;

procedure Matriz.ord_matriz;
   var f1,c1,f2,c2,i:integer;
   begin
     for f1:=1 to fils do begin
        for c1:=1 to cols do begin
           for f2:=f1 to fils do begin
              if(f1=f2)then  begin
               i:=c1
               end else begin
               i:=1;
               end;
              for c2:=i to cols do begin
                 if (x[f1,c1]) > (x[f2,c2]) then
                  inter_ele(f1,c1,f2,c2);
              end;
           end;
        end;
     end;
   end;

procedure Matriz.resta_matriz(M1, M2: Matriz);
   var
   f,c:integer;
   begin
   if (M1.getfils()=M2.getfils())AND(M1.getcols()=M2.getcols()) then
   begin
      setfils(M1.getfils);
       setcols(M1.getcols);
      for f:=1 to getFils() do
      for c:=1 to getcols() do
      setelem( f,c,M1.getelem(f,c)- M2.getElem(f,c));

      end else
       ShowMessage('Filas Y Columnas De La Matrizes No Pueden Ser Diferentes');
   end;

procedure Matriz.inver_Mtriz;
var
  i,j,aux:Integer;
begin
  for i:=1 to fils div 2 do
  begin
    for j:=1 to cols do
    begin
      aux:=x[i,j];
      x[i,j]:=x[fils-i+1,cols-j+1];
      x[fils-i+1,cols-j+1]:= aux;
    end;
  end;
end;

function Matriz.Determinante2x2: integer;
 var pos,neg,aux,i:integer;
begin
  pos:=1; neg:=1; aux:=1;
  if(getfils()=2) and (getcols()=2) then begin
     for i:=1 to getfils()do begin
        pos:=pos*getElem(i,i);
        neg:=neg*getElem(i,i+aux);
        aux:=-1;
     end;
  end else begin
   ShowMessage('Error inserte una matriz de 2x2');
  end;
  result:=pos-neg;
end;

function Matriz.Determinante3x3: integer;
var s:integer;
begin
   s:=0;
   if(getcols()=3)and(getfils()=3) then begin
        s:=(x[1,1])*(x[2,2])*(x[3,3]) +
           (x[1,2])*(x[2,3])*(x[3,1]) +
           (x[1,3])*(x[2,1])*(x[3,2]) -
           (x[3,1])*(x[2,2])*(x[1,3]) -
	   (x[2,1])*(x[1,2])*(x[3,3]) -
	   (x[1,1])*(x[3,2])*(x[2,3])
    end;
   result:=s;
end;

procedure Matriz.copia(M1: Matriz);
 var f1,c1:integer;
begin
 setfils(M1.getfils());  setcols(M1.getcols());
 for f1:=1 to (M1.getfils())do begin
     for c1:=1 to (M1.getcols()) do begin
       setElem(f1,c1,M1.getElem(f1,c1));
     end;
 end;
end;

procedure Matriz.copia_Nula(M2: Matriz; nf, nc: integer);
  var f1,c1,i:integer;
begin
   i:=0; setcols(M2.getcols()-1); setfils(M2.getfils()-1);
   for f1:=1 to (M2.getfils())do begin
     for c1:=1 to (M2.getcols()) do begin
         if(f1<>nf)and(c1<>nc)then begin
           setElem((i div fils)+1,(i mod fils)+1,M2.getElem(f1,c1));
           i:=i+1;
           end;
     end;
  end;
end;

procedure Matriz.Transpuesta( var M2:Matriz);
 var f1,c1:integer;
 begin
    M2.setcols(getfils());
    M2.setfils(getcols());
   for f1:=1 to (getfils())do begin
      for c1:=1 to (getcols()) do begin
        M2.setElem(c1,f1,getElem(f1,c1));
        //elem[c1,f1]:=m1.getElem(f1,c1);
      end;
   end;
   copia(M2);
 end;

procedure Matriz.tra;
 var f1,c1:integer;
    m:matriz;
begin
   m:=MAtriz.crear();
   m.setcols(getfils());
   m.setfils(getcols());
  for f1:=1 to (getfils())do begin
     for c1:=1 to (getcols()) do begin
       m.setElem(c1,f1,getElem(f1,c1));
       //elem[c1,f1]:=m1.getElem(f1,c1);
     end;
  end;
  copia(m);

end;
 procedure Matriz.Adjunta(m1: matriz);
 var m:matriz;
     f1,c1:integer;
begin
 m:=MAtriz.crear(); setfils(m1.getfils());  setcols(m1.getcols());
 for f1:=1 to (m1.getfils())do begin
     for c1:=1 to (m1.getcols()) do begin
          m.copia_nula(m1,f1,c1);//creo la matriz 2*2
          if((f1+c1)mod 2=0)then
           setElem(f1,c1,m.Determinante2x2())
          else
           setElem(f1,c1,-m.Determinante2x2());
     end;
 end;
 Tra();
end;

end.

