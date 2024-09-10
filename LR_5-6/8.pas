program z8;
const
n = 10; // размер массива
var a: array[1..n] of integer; 
count: array[1..n] of integer; // массив для подсчета повторений
i, j, maxCount, maxNum: integer; 
begin
  // Заполняем массив случайными числами
  randomize;
  for i := 1 to n do
    a[i] := random(10) + 1; // генерируем числа от 1 до 10
    // Инициализируем массив для подсчета повторений
  for i := 1 to n do
    count[i] := 0;
    // Подсчитываем повторения
  for i := 1 to n do
    for j := 1 to n do
      if a[i] = a[j] then
        count[i] := count[i] + 1;
        // Находим наиболее часто повторяющееся число
  maxCount := 0;
  maxNum := 0;
  for i := 1 to n do
    if count[i] > maxCount then
    begin
      maxCount := count[i];
      maxNum := a[i];
    end;
  // Выводим результат
  WriteLn('Наиболее часто повторяющееся число: ', maxNum);
end.