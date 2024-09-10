program z10;
const
n=20;
var a:array[1..n] of integer;
i,j:integer;
begin
  //Заполняем массив случайными числами
  randomize;
  for i:=1 to n do
    a[i]:=random(100)-50;//Генерируем числа от -50 до 49
  //Выводим исходный массив
  writeln('Исходный массив:');
  for i:=1 to n do
    write(a[i],'');
  //Удаляем отрицательные элементы
  j:=1;
  for i:=1 to n do
  begin
    if a[i]>=0 then
    begin
      a[j]:=a[i];
      j:=j+1;
    end;
  end;
  //Заполняем оставшиеся элементы нулями 
  for i:= j to n do
    a[i]:=0;
  //Выводим результат
  writeln;
  writeln('Массив после удаления отрицательных элементов:');
  for i:=1 to n do
    write(a[i],'');
  readln; 
end.