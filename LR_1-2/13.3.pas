﻿program tyz;
var a,b,c,min:integer;
begin
  writeln('Введите три числа');
  readln(a,b,c);
  min:=a;
  if b< min then min:=b;
  if c< min then min:=c;
  writeln('Наименьшее число:',min);
end.