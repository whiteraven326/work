﻿program zadanie11;
var n, a: integer;
 i: byte;
begin
  write('Введите n! факториал: ');
  read(a);
  i := 1;
  n := 1;
  repeat
    begin
      n := n * i;
      inc(i); 
    end;
   until i > a;
  writeln(a, '! = ', n);
end.