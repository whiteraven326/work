program Alphabet;
type
  PNode = ^Node;
  Node = record
    word: string;
    count: integer;
    next: PNode;
  end;
function TakeWord(F: Text): string;// считывание одного слова из файла
var
  c: char;
begin
  Result := '';
  c := ' ';
  while not eof(F) and (c <= ' ') do 
    read(F, c);
  while not eof(F) and (c > ' ') do begin
    Result := Result + c;
    read(F, c);
  end;
end;
function CreateNode(NewWord: string): PNode;// создание узла списка
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.count := 1;
  NewNode^.next := nil;
  CreateNode := NewNode;
end;

function FindWord(Head: PNode; NewWord: string): PNode;//функция принимает слово в качестве параметра, 
//а возвращает адрес узла, который содержит искомое слово либо значение nil, если слово не найдено
var
  p: PNode;
begin
  p := Head^.next;
  while (p <> nil) and (NewWord <> p^.word) do
    p := p^.next;
  FindWord := p;
end;
function MakePlace(Head: PNode; NewWord: string): PNode;//функция для поиска "подходящего" места (на вход функции
//подается вставляемое слово, возращает же функция адрес узла, перед которым необходимо добавить слово)
var
  p: PNode;
begin
  p := Head;
  while (p^.next <> nil) and (NewWord > p^.next^.word) do
    p := p^.next;
  MakePlace := p;
end;

procedure AddBefore(var Head: PNode; p, NewNode: PNode);//добавить узел перед заданным
begin
  NewNode^.next := p^.next;
  p^.next := NewNode;
end;
var
  F: Text;
  Head, p, foundNode: PNode;
  NewNode: PNode;
  NewWord: string;
begin
  Assign(F, 'inputrr.txt');
  Reset(F);
  New(Head);
  Head^.next := nil;
  while not eof(F) do begin
    NewWord := TakeWord(F);
    if NewWord <> '' then begin
      p := MakePlace(Head, NewWord);
      foundNode := FindWord(Head, NewWord);
      if foundNode <> nil then
        foundNode^.count := foundNode^.count + 1
      else
        AddBefore(Head, p, CreateNode(NewWord));
    end;
  end;
  Close(F);
  p := Head^.next;
  while p <> nil do begin
    writeln(p^.word, ': ', p^.count);
    p := p^.next;
  end;
end.
