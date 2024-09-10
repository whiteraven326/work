program z1;
const
n=20;
var a:array[1..n] of integer;
i:integer;
begin
  // Ввод элементов массива с клавиатуры
  for i := 1 to 20 do
  begin
    writeln('Введите элемент массива a[', i, ']: ');
    readln(a[i]);
  end;
  // Замена положительных элементов на 0 и отрицательных элементов на их квадрат
  for i := 1 to 20 do
  begin
    if a[i] > 0 then
      a[i] := 0
    else if a[i] < 0 then
      a[i] := a[i] * a[i];
  end;
  // Вывод измененного массива
  writeln('Измененный массив:');
  for i := 1 to 20 do
    write(a[i], ' ');
   readln;
end.