program z3;
uses GraphABC;
var x: integer;
begin
x:= 40;
  
repeat
SetWindowHeight(350);
 SetWindowWidth(700);
 setbrushcolor(clrandom);
circle(x,100,10);
x:= x + 40;  
 circle(x,100,10);   
until x>300                               
end.
