program P1E21;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, TPracticoU21
  { you can add units after this };
          var
           pr1,sg2, n:integer;
begin
      pr:=-1;
      sg:=-1;

      readln(n);
      PracticoU21.pr_sg(n,pr1,sg2);
      writeln('mayor digito: ',pr1);
      writeln('segundo mayor digito: ',sg2);
      readln;
end.

