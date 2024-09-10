uses crt;
const
MAX_SIZE = 3;
type
  PNode = ^Node;
  Node = record
    Data: Integer;
    Next: PNode;
    Prev: PNode;
  end;

  Deck = record
    data: array[0..MAX_SIZE] of Integer;
    size: Integer;
  end;

var
  d: Deck;
  Front, Rear: PNode;
  choice, memoryChoice: Integer;

procedure Init(var deck: Deck);
begin
  deck.size := 0;
end;

procedure Push(var deck: Deck; element: Integer);
begin
  if deck.size < MAX_SIZE then
  begin
    deck.data[deck.size] := element;
    inc(deck.size);
  end
  else
    writeln('Ошибка: ДЕК заполнен!');
end;

procedure InsertFirst(var deck: Deck; element: Integer);
var
  i: Integer;
begin
  if deck.size = MAX_SIZE then
    writeln('Дек переполнен!')
  else
  begin
    for i := deck.size - 1 downto 0 do
      deck.data[i + 1] := deck.data[i];
    deck.data[0] := element;
    inc(deck.size)
  end;
end;

procedure Pop(var deck: Deck);
begin
  if deck.size > 0 then
    dec(deck.size)
  else
    writeln('Ошибка: ДЕК пустой!');
end;

procedure DeleteFirst(var deck: Deck);
var
  i: Integer;
begin
  if deck.size = 0 then
    writeln('Дек пуст!')
  else
  begin
    for i := 0 to deck.size - 1 do
      deck.data[i] := deck.data[i + 1];
    deck.size := deck.size - 1;
  end;
end;

procedure Clear(var deck: Deck);
begin
  deck.size := 0;
  writeln('Дек очищен');
end;

procedure Print(const deck: Deck);
var
  i: Integer;
begin
  if deck.size <> 0 then
  begin
    write('ДЕК: ');
    for i := 0 to deck.size - 1 do
      write(deck.data[i], ' ');
    writeln
  end
  else
    writeln('ДЕК пуст!');
end;

procedure PushFrontDynamic(Data: Integer);
var
  newNode: PNode;
begin
  new(newNode);
  newNode^.Data := Data;
  newNode^.Prev := nil;
  newNode^.Next := Front;
  if Front <> nil then
    Front^.Prev := newNode;
  Front := newNode;
  if Rear = nil then
    Rear := newNode;
end;

procedure PopFrontDynamic;
var
  Temp: PNode;
begin
  if Front <> nil then
  begin
    Temp := Front;
    Front := Front^.Next;
    Dispose(Temp);
    if Front <> nil then
      Front^.Prev := nil
    else
      Rear := nil;
  end;
end;

procedure PushBackDynamic(Data: Integer);
var
  newNode: PNode;
begin
  new(newNode);
  newNode^.Data := Data;
  newNode^.Next := nil;
  newNode^.Prev := Rear;
  if Rear <> nil then
    Rear^.Next := newNode;
  Rear := newNode;
  if Front = nil then
    Front := newNode;
end;

procedure PopBackDynamic;
var
  Temp: PNode;
begin
  if Rear <> nil then
  begin
    Temp := Rear;
    Rear := Rear^.Prev;
    Dispose(Temp);
    if Rear <> nil then
      Rear^.Next := nil
    else
      Front := nil;
  end;
end;

procedure DisplayDeque;
var
  Current: PNode;
begin
  Current := Front;
  Write('Дек: ');
  while Current <> nil do
  begin
    write(Current^.Data, ' ');
    Current := Current^.Next;
  end;
  writeln;
end;

begin
  Init(d);
  Front := nil;
  Rear := nil;
  repeat
    writeln();
    writeln('1. Статическая память');
    writeln('2. Динамическая память');
    writeln('3. Выход');
    write('Выберите тип памяти: ');
    readln(memoryChoice);
    case memoryChoice of
      1:
        repeat
          writeln('1. Добавить элемент в конец');
          writeln('2. Добавить элемент в начало');
          writeln('3. Удалить последний элемент');
          writeln('4. Удалить первый элемент');
          writeln('5. Вывести ДЕК');
          writeln('6. Очистить ДЕК');
          writeln('7. Назад');
          write('Ваш выбор: ');
          readln(choice);
          case choice of
            1:
              begin
                write('Введите элемент для добавления: ');
                var element: Integer;
                readln(element);
                Push(d, element);
              end;
            2:
              begin
                write('Введите элемент для добавления: ');
                var element: Integer;
                readln(element);
                InsertFirst(d, element);
              end;
            3: Pop(d);
            4: DeleteFirst(d);
            5: Print(d);
            6: Clear(d);
          end;
        until choice = 7;
      2:
        repeat
          writeln('1. Добавить элемент в начало');
          writeln('2. Удалить первый элемент');
          writeln('3. Добавить элемент в конец');
          writeln('4. Удалить последний элемент');
          writeln('5. Вывести ДЕК');
          writeln('6. Назад');
          write('Ваш выбор: ');
          readln(choice);
          case choice of
            1:
              begin
                write('Введите данные: ');
                var Data: Integer;
                readln(Data);
                PushFrontDynamic(Data);
              end;
            2: PopFrontDynamic;
            3:
              begin
                write('Введите данные: ');
                var Data: Integer;
                readln(Data);
                PushBackDynamic(Data);
              end;
            4: PopBackDynamic;
            5: DisplayDeque;
          end;
        until choice = 6;
    end;
  until memoryChoice = 3;
end.




