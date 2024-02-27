//****************************************************************************//
//                            © Guard  2003-2022                              //
//****************************************************************************//
unit FTPFileLoad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ValEdit, Vcl.Buttons,
  Vcl.StdCtrls;

type
  TFTPFileLoadForm = class(TForm)
    ValueListEditor1: TValueListEditor;
    OKSpeedButton: TSpeedButton;
    CancelSpeedButton: TSpeedButton;
    procedure CancelSpeedButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OKSpeedButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTPFileLoadForm: TFTPFileLoadForm;

implementation

{$R *.dfm}

procedure TFTPFileLoadForm.CancelSpeedButtonClick(Sender: TObject);
begin
  FTPFileLoadForm.ModalResult:= mrCancel;
end;

procedure TFTPFileLoadForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
     VK_RETURN: OKSpeedButton.Click;
     VK_ESCAPE: CancelSpeedButton.Click;
    end;
end;

procedure TFTPFileLoadForm.OKSpeedButtonClick(Sender: TObject);
begin
  FTPFileLoadForm.ModalResult:= mrOK;
end;

end.
