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
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
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

procedure TForm1.Button2Click(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit1.SetFocus;
end;

procedure TForm1.Button1Click(Sender: TObject);
var S,a,d,S1: real;
begin
  S:=strtofloat(edit1.text);
  a:=sqrt(S);
  d:=sqrt(S*2);
  S1:=(pi*S)/2;
  edit2.text:= floattostr(a);
  edit3.text:= floattostr(d);
  edit4.text:= floattostr(S1);
end;

end.

