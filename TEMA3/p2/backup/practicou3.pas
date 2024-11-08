unit PracticoU3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { TPracticoU3 }

  TPracticoU3=class
    private
    text1:string;
    text2:string;
    public
  constructor crear();
  procedure setText1(s:string);
  function getText1():string;
  procedure setText2(s:string);
  function getText2():string;
  procedure union();


  end;

implementation

{ TPracticoU3 }

constructor TPracticoU3.crear;
begin
  text1:='';
  text2:='';
end;

procedure TPracticoU3.setText1(s: string);
begin
 text1:=s;
end;

function TPracticoU3.getText1: string;
begin
  result:=text1;
end;

procedure TPracticoU3.setText2(s: string);
begin
 text2:=s;
end;

function TPracticoU3.getText2: string;
begin
 result:=text2;
end;

procedure TPracticoU3.union;
var
  union:string;
begin
 union:='';
 union:=text1+text2;
 writeln(union);
end;

end.

