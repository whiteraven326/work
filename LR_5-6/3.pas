program z3;
var a:array[1..20] of integer;
  i, max,maxPos,minPos,c: integer;
begin
  // Заполняем массив случайными числами из диапазона [-52, 65]
  randomize;
  for i := 1 to 20 do
    a[i] := random(118) - 52;
  // Находим наибольший элемент и его номер
  max := a[1];
  for i := 1 to 20 do
  begin
    if a[i] > max then
    begin
      max := a[i];
      maxPos := i;
    end;
  end;
  writeln('Наибольший элемент: ', max);
  writeln('Номер наибольшего элемента: ', maxPos);
  // Находим наименьший положительный элемент и его номер
  minPos := -1;
  for i := 1 to 20 do
  begin
    if (a[i] > 0) and ((minPos = -1) or (a[i] < a[minPos])) then
      minPos := i;
  end;
  writeln('Наименьший положительный элемент: ', a[minPos]);
  writeln('Номер наименьшего положительного элемента: ', minPos);

  // Находим номер последнего элемента, кратного 5
  c := -1;
  for i := 20 downto 1 do
  begin
    if a[i] mod 5 = 0 then
    begin
      c := i;
      break;
    end;
  end;
  writeln('Номер последнего элемента, кратного 5: ', c);
end.