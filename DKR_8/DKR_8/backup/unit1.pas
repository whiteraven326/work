unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnClear: TButton;
    btnClose: TBitBtn;
    btnCalculate: TButton;
    cbxCalculationType: TComboBox;
    edtPrincipal: TEdit;
    edtRate: TEdit;
    edtTime: TEdit;
    Image1: TImage;
    Image2: TImage;
    LabelPrincipal: TLabel;
    LabelProcent: TLabel;
    LabelRate: TLabel;
    LabelTime: TLabel;
    memResult: TMemo;
    procedure btnCalculateClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cbxCalculationTypeChange(Sender: TObject);
    procedure edtPrincipalKeyPress(Sender: TObject; var Key: char);
    procedure edtRateKeyPress(Sender: TObject; var Key: char);
    procedure edtTimeKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnClearClick(Sender: TObject);
begin
edtPrincipal.Clear;
edtRate.Clear;
edtTime.Clear;
memResult.Clear
end;

procedure TForm1.btnCalculateClick(Sender: TObject);
const
  MaxResult = 1.1e38;
  MinResult = -1.1e38;
var
  Principal, Rate, Time, Result: Double;
begin
  if (edtPrincipal.Text = '') or (edtRate.Text = '') or (edtTime.Text = '') then
    begin
      ShowMessage('Нужно заполнить все поля');
    end
    else
begin
  try
    Principal := StrToFloat(edtPrincipal.Text);
    Rate := StrToFloat(edtRate.Text);
    Time := StrToFloat(edtTime.Text);


    case cbxCalculationType.ItemIndex of
      0: // Простые проценты
        begin
          Result := Principal+ (Principal * (Rate/100/ 12) * Time);
          memResult.Lines.Clear;
          if (Result <= MaxResult) and (Result >= MinResult) then
             memResult.Lines.Add('Итоговая сумма: ' + FormatFloat('0.00', Result))
          else
              ShowMessage('Переполнение числа');
        end;
      1: // Сложные проценты
        begin
          Result := Principal * Power((1+((Rate/100)/12)),Time);
          memResult.Lines.Clear;
          if (Result <= MaxResult) and (Result >= MinResult) then
             memResult.Lines.Add('Итоговая сумма: ' + FormatFloat('0.00', Result))
          else
              ShowMessage('Переполнение числа');
        end;
    end;
  except
    on E: Exception do
      ShowMessage('Ошибка: ' + E.Message);
  end;
end;

end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.cbxCalculationTypeChange(Sender: TObject);
begin
  case cbxCalculationType.ItemIndex of
    0: begin
         Image1.Visible := True;
         Image2.Visible := False;
       end;
    1: begin
         Image1.Visible := False;
         Image2.Visible := True;
       end;
  end;
end;



procedure TForm1.edtPrincipalKeyPress(Sender: TObject; var Key: char);
begin
     if not (Key in ['0'..'9', ',', '.', #8, #13, #27]) then
        Key := #0;
end;

procedure TForm1.edtRateKeyPress(Sender: TObject; var Key: char);
begin
    if not (Key in ['0'..'9', ',', '.', #8, #13, #27]) then
       Key := #0;
end;

procedure TForm1.edtTimeKeyPress(Sender: TObject; var Key: char);
begin
     if not (Key in ['0'..'9', ',', '.', #8, #13, #27]) then
        Key := #0;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  cbxCalculationType.Items.Add('Простые проценты');
  cbxCalculationType.Items.Add('Сложные проценты');
  cbxCalculationType.ItemIndex := 0;
  cbxCalculationType.OnChange := @cbxCalculationTypeChange;
  Image1.Picture.LoadFromFile('1.jpg');
  Image2.Picture.LoadFromFile('2.jpg');
   Image1.Visible := True;
   Image2.Visible := False;
end;


end.
