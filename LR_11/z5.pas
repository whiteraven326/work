program z5;
uses graphabc;
var x, y, z,i  : integer;
begin 
  setwindowheight(900);
  setwindowwidth(960);  
  x := 55; y := 50;
  z := 10;
  for i:=1 to 10 do begin 
  x:= x + 70;
  y := y + 50;
  z := z + 10;  
  circle(x,y,z);
  setbrushcolor(clrandom);
end;
end.
