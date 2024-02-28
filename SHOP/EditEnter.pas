//****************************************************************************//
//                            © Guard  2003-2023                              //
//****************************************************************************//
unit EditEnter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Vcl.ExtCtrls;

type
  TEditEnterForm = class(TForm)
    Label1: TLabel;
    CancelSpeedButton: TSpeedButton;
    OKSpeedButton: TSpeedButton;
    Edit1: TButtonedEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure CancelSpeedButtonClick(Sender: TObject);
    procedure OKSpeedButtonClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditEnterForm: TEditEnterForm;

implementation

{$R *.dfm}

procedure TEditEnterForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
     VK_RETURN: OKSpeedButton.Click;
     VK_ESCAPE: CancelSpeedButton.Click;
    end;
end;

procedure TEditEnterForm.OKSpeedButtonClick(Sender: TObject);
begin
  EditEnterForm.ModalResult:= mrOK;
end;

procedure TEditEnterForm.CancelSpeedButtonClick(Sender: TObject);
begin
  EditEnterForm.ModalResult:= mrCancel;
end;

procedure TEditEnterForm.Edit1Change(Sender: TObject);
begin
  OKSpeedButton.Enabled:= not(Edit1.Text = '');
end;

procedure TEditEnterForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if Edit1.Tag > 0 then
    begin
      if not(Key in [#8, '0'..'9', FormatSettings.DecimalSeparator])then Key:= #0;
      if(Key = FormatSettings.DecimalSeparator)and
        (Pos(FormatSettings.DecimalSeparator, (Sender as TButtonedEdit).Text) > 0)then Key:= #0;

      if Key <> '' then
      begin
         if Pos(',', (Sender as TButtonedEdit).Text) > 0 then
           if ((Length((Sender as TButtonedEdit).Text) - Pos(',', (Sender as TButtonedEdit).Text)) >= 3) and (Key <> #8) then
             Key := #0;
      end;
    end;
end;

end.
