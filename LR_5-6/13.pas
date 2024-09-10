program z13;
const
n=20;
var a:array[1..n] of integer;
i,b,g,c: integer;
begin
  // Заполняем массив случайными числами
  randomize;
  for i := 1 to n do
    a[i] := random(100);
  // Находим наименьший и наибольший элементы массива
   b:= 1;//переменная для хранения наименьшего элемента массива
   g:= 1;//переменная для хранения наибольшего элемента массива
  for i := 2 to n do
  begin
    if a[i] < a[b] then
      b := i;
    if a[i] > a[g] then
      g := i;
  end;
  // Меняем местами наименьший и наибольший элементы
   c:= a[b];
  a[b] := a[g];
  a[g] := c;
  // Выводим получившийся массив
  for i := 1 to n do
    write(a[i], ' ');
  writeln;
end.
