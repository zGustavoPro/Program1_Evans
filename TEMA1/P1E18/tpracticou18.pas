unit TPracticoU18;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { PracticoU18 }

  PracticoU18 = class
public
 class  function romano(n:integer):string;
  end;

implementation

{ PracticoU18 }

 class function PracticoU18.romano(n: integer): string;
     var
       unidades,decenas,centenas,millar:integer;

begin
 result:='';
 unidades:= n mod 10; n:=n div 10;
 decenas:=n mod 10; n:= n div 10;
 centenas:=n mod 10 ; n:= n div 10;
 millar := n mod 10 ; n:= n div 10 ;
  case millar of
     1:  begin result:= result + 'M';  end;
     2: begin result:= result +'MM';  end;
     3: begin result:=result + 'MMM';   end;
  end;
  case centenas of
    1: begin  result:= result +'C';  end ;
     2: begin  result:= result+'CC';  end ;
      3: begin  result:= result+'CCC'; end ;
       4: begin  result:= result+'CD';  end ;
        5: begin  result:= result+'D';  end ;
       6: begin  result:= result+'DC';  end ;
      7: begin  result:= result+'DCC'; end ;
     8: begin  result:= result+'DCCC';  end ;
    9: begin  result:= result+'CM';  end ;
  end;

    case decenas of

   1: begin  result:= result +'X';  end ;
     2: begin  result:= result+'XX';  end ;
      3: begin  result:= result+'XXX'; end ;
       4: begin  result:= result+'XL';  end ;
        5: begin  result:= result+'L';  end ;
       6: begin  result:= result+'LX';  end ;
      7: begin  result:= result+'LXX'; end ;
     8: begin  result:= result+'LXXX';  end ;
    9: begin  result:= result+'XC';  end ;

    end;
    case unidades of

    1: begin  result:= result +'I';  end ;
     2: begin  result:= result+'II';  end ;
      3: begin  result:= result+'III'; end ;
       4: begin  result:= result+'IV';  end ;
        5: begin  result:= result+'V';  end ;
       6: begin  result:= result+'VI';  end ;
      7: begin  result:= result+'VII'; end ;
     8: begin  result:= result+'VIII';  end ;
    9: begin  result:= result+'IX';  end ;

    end;
     end;
end.

