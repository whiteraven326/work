unit Edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TfEdit }

  TfEdit = class(TForm)
    bCancel: TBitBtn;
    bSave: TBitBtn;
    CBStyle: TComboBox;
    CBTehn: TComboBox;
    CBPlace: TComboBox;
    eYear: TEdit;
    eStoim: TEdit;
    eNameH: TEdit;
    eName: TEdit;
    nameK: TLabel;
    nameH: TLabel;
    Style: TLabel;
    Tehn: TLabel;
    Year: TLabel;
    Place: TLabel;
    stoim: TLabel;
    procedure eSizeKeyPress(Sender: TObject; var Key: char);
    procedure eStoimKeyPress(Sender: TObject; var Key: char);
    procedure eYearKeyPress(Sender: TObject; var Key: char);
  private

  public
    procedure FormShow(Sender: TObject);
  end;

var
  fEdit: TfEdit;

implementation

{$R *.lfm}

{ TfEdit }

procedure TfEdit.eYearKeyPress(Sender: TObject; var Key: char);
begin
      if not (Key in ['0'..'9', #8]) then Key := #0;
      if (Length(eYear.Text) >= 4) and (Key <> #8) then Key := #0;
end;



procedure TfEdit.eSizeKeyPress(Sender: TObject; var Key: char);
begin
      if not (Key in ['0'..'9', #8, '.', ',']) then Key := #0;
end;

procedure TfEdit.eStoimKeyPress(Sender: TObject; var Key: char);
var
  dotPos: Integer;
  commaPos: Integer;
begin
  if not (Key in ['0'..'9', #8, '.', ',']) then
    Key := #0;

  if Key = ',' then
    Key := '.';

  dotPos := Pos('.', eStoim.Text);
  commaPos := Pos(',', eStoim.Text);

  if ((dotPos > 0) or (commaPos > 0)) and (Key in ['.', ',']) then
    Key := #0;

  if (dotPos > 0) and (Length(eStoim.Text) - dotPos >= 2) and (Key <> #8) then
    Key := #0;
end;


procedure TfEdit.FormShow(Sender: TObject);
begin
  eName.SetFocus;
end;

end.

