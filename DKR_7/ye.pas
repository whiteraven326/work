uses GraphABC,Fr;
var x1, y1, x2, y2, x3, y3, l, t: integer;

procedure KeyDown(key: integer);
begin
  case key of
    VK_Up: begin y1 := y1 - 15; y2 := y2 - 15; y3 := y3 - 15 end;
    VK_Down: begin y1 := y1 + 15; y2 := y2 + 15; y3 := y3 + 15 end;
    VK_Left: begin x1 := x1 - 15; x2 := x2 - 15; x3 := x3 - 15 end;
    VK_Right: begin x1 := x1 + 15; x2 := x2 + 15; x3 := x3 + 15 end;
    VK_E: begin t += 1; if t=6 then t:=5; end;
    VK_Q: begin t -= 1; if t=-1 then t:=0; end;
    VK_W:
      begin
        x1 := Round(x1 * 1.1);
        x2 := Round(x2 * 1.1);
        x3 := Round(x3 * 1.1);
        y1 := Round(y1 * 1.1);
        y2 := Round(y2 * 1.1);
        y3 := Round(y3 * 1.1);
        l:=round(l*1.1)
      end;
      VK_S:
      begin
        x1 := Round(x1 / 1.1);
        x2 := Round(x2 / 1.1);
        x3 := Round(x3 / 1.1);
        y1 := Round(y1 / 1.1); 
        y2 := Round(y2 / 1.1);
        y3 := Round(y3 / 1.1);
        l:=round(l/1.1)
      end;
    end;
    Window.Clear;
    Draw(x1, y1, l, pi / 3, t);
    Draw(x2, y2, l, pi, t);
    Draw(x3, y3, l, -pi / 3, t);
    redraw;
    end;
begin
  SetWindowCaption('Фрактал: Снежинка Коха');
  SetWindowSize(850, 500);
  LockDrawing;
  x1:=210; x2:= 610; x3:=410;
  y1:=354; y2:=354; y3:=8;
  t:=0;
  l:=400;
  Draw(x1, y1, l, pi / 3, t);
  Draw(x2, y2, l, pi, t);
  Draw(x3, y3, l, -pi / 3, t);
  redraw;
  onKeyDown += KeyDown;
end.
