program z1;

var
  inputFile, outputFile: Text;
  number: Integer;
  numbers: array of Integer;
  i: Integer;

begin
  Assign(inputFile, 'inp.txt');
  Reset(inputFile);

  // Считываем числа из файла в массив
  i := 0;
  while not Eof(inputFile) do
  begin
    Readln(inputFile, number);
    SetLength(numbers, i + 1);
    numbers[i] := number;
    i := i + 1;
  end;

  Close(inputFile);

  // Переворачиваем массив
  for i := 0 to ((Length(numbers) - 1) div 2) do
  begin
    number := numbers[i];
    numbers[i] := numbers[Length(numbers) - 1 - i];
    numbers[Length(numbers) - 1 - i] := number;
  end;

  Assign(outputFile, 'out.txt');
  Rewrite(outputFile);

  // Записываем массив в обратном порядке в файл
  for i := 0 to Length(numbers) - 1 do
  begin
    Writeln(outputFile, numbers[i]);
  end;

  Close(outputFile);
end.
