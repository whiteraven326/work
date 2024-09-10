﻿program z9;
const
n=20;
var a:array[1..n] of integer;
i,c,b:integer;
begin
  //Заполнение массива случайными числами
   randomize;
  for i:=1 to n do
    a[i]:=random(100)-50;
  // Вывод исходного массива
  writeln('Исходный массив:');
  for i:=1 to n do
    write(a[i],'');
  writeln;
  //Поиск первого положительного элемента
  b:=-1;
  for i:=1 to n do
  begin
    if a[i]>0 then
    begin
      b:=i;
      break
    end;
  end;
  //Удаление первого положительного элемента
  if b<>-1 then
  begin
    for i:=b to n-1 do
      a[i]:=a[i+1];
    a[n]:=0; //Обнуляем последний элемент
  end;
  // Поиск наименьшего элемента
  c:=1;
  for i:= 2 to n do
  begin
    if a[i]<a[c] then
      c:=i;
  end;
  // Удаление наименьшего элемента
  for i:=c to n-1 do
    a[i]:=a[i+1];
  a[n]:=0; //Обнуляем последний элемент
  // Вывод измененного массива
  writeln('Измененный массив:');
  for i:=1 to n-2 do
    write(a[i],'');
  writeln;
end.