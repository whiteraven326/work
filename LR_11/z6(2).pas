program z6;
uses graphabc;
var i, x1, x2, y1, y2, n,j: integer;
   h, x,y: real;
begin 
  setwindowheight(500);
  setwindowwidth(500);  
  x1 := 100; y1 := 100;
  x2 := 400; y2 := 400;
  n := 7;
  rectangle (x1, y1, x2, y2);
  h := (x2 - x1) / (n + 1);
  x := x1 + h;
  y := y1 + h;
  for i:=0 to n do begin
   line(round(x), y1, round(x), y2);
    line(x1, round(x), x2, round(x)); // добавляем горизонтальные линии
    x := x1 + h;
     //y := y + h;
    // покрас клетки в шахматном порядке
    if (i mod 2 = 0) then begin
      for j := 1 to n+1 do begin
        if (j mod 2 = 0) then
          setbrushcolor(clWhite)
        else
          setbrushcolor(clBlack);
        rectangle(round(x - h), round(y - h), round(x), round(y));
        x := x + h;
        
        
      end;
    end
    else begin
      for j := 1 to n+1 do begin
        if (j mod 2 = 0) then
          setbrushcolor(clBlack)
        else
          setbrushcolor(clWhite);
        rectangle(round(x - h), round(y - h), round(x), round(y));
        x := x + h;
      
        
      
      end;
      
    end;
    y := y + h;
    x := x1 + h;
  end;
end.