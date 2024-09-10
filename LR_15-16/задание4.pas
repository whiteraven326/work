program z4;

type
  NodePtr = ^Node;
  Node = record
    data: Integer;
    next: NodePtr;
  end;

function FindMaxElement(head: NodePtr): Integer;
var
  current: NodePtr;
  maxElement: Integer;
begin
  current := head;
  maxElement := head^.data;
  
  while current <> nil do
  begin
    if current^.data > maxElement then
      maxElement := current^.data;
      
    current := current^.next;
  end;
  
  FindMaxElement := maxElement;
end;

function FindMinElement(head: NodePtr): Integer;
var
  current: NodePtr;
  minElement: Integer;
begin
  current := head;
  minElement := head^.data;
  
  while current <> nil do
  begin
    if current^.data < minElement then
      minElement := current^.data;
      
    current := current^.next;
  end;
  
  FindMinElement := minElement;
end;

var
  head, current, newNode: NodePtr;
  i: Integer;
begin
  New(head);
  current := head;
  
  for i := 1 to 10 do
  begin
    New(newNode);
    newNode^.data := Random(100); 
    newNode^.next := nil;
    
    current^.next := newNode;
    current := newNode;
  end;
  
  current := head^.next;
  writeln('Список:');
  while current <> nil do
  begin
    write(current^.data, ' ');
    current := current^.next;
  end;
  writeln;
  
  writeln('Максимальный элемент: ', FindMaxElement(head^.next));
  writeln('Минимальный элемент: ', FindMinElement(head^.next));
end.