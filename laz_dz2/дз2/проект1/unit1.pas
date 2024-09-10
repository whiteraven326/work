unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var a,b: integer;
  f:real;
begin
   a:=strtoint(edit1.text);
   b:=strtoint(edit2.text);
   f:=sqrt(pi/8)*sqrt(sqrt(a+b)/(sqr(a)+sqr(b)))-a*b*b*b;
   edit3.Text:=floattostr(f);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   edit1.Clear;
   edit2.Clear;
   edit3.Clear;
   edit1.SetFocus;
end;

end.

