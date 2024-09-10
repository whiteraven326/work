﻿program z2;
var a:array[1..20] of integer;
  i, start, finish,g, b, sum: integer;
begin
  randomize;
  // Заполнение массива случайными числами из диапазона [-22, 93]
  for i := 1 to 20 do
    a[i] := random(116) - 22;
  // Вывод элементов массива
  writeln('Массив:');
  for i := 1 to 20 do
    write(a[i], ' ');
  writeln;
  // Подсчет количества четных элементов на нечетных позициях
  g:= 0;
  for i := 1 to 20 step 2 do
  begin
    if a[i] mod 2 = 0 then
      g:= g + 1;
  end;
  writeln('Количество четных элементов на нечетных позициях: ',g);
  // Вычисление произведения нечетных элементов массива
  b:= 1;
  for i := 1 to 20 do
  begin
    if a[i] mod 2 <> 0 then
      b:= b * a[i];
  end;
  writeln('Произведение нечетных элементов массива: ', b);
 // Ввод промежутка с клавиатуры
  writeln('Введите начало промежутка:');
  readln(start);
  writeln('Введите конец промежутка:');
  readln(finish);
  // Подсчет суммы элементов массива, принадлежащих заданному промежутку
  sum := 0;
  for i := 1 to 20 do
  begin
    if (a[i] >= start) and (a[i] <= finish) then
      sum := sum + a[i];
  end;
  writeln('Сумма элементов массива в заданном промежутке: ', sum);
end.
