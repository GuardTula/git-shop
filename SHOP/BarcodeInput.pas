unit BarcodeInput;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TBarcodeInputForm = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    BarcodeEdit: TEdit;
    BitBtn1: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure BarcodeEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BarcodeInputForm: TBarcodeInputForm;
  BarcodeStr: String;

implementation

{$R *.dfm}

procedure TBarcodeInputForm.BarcodeEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN)and(BarcodeEdit.Text > '')then
        ModalResult:= mrOK;
end;

procedure TBarcodeInputForm.Timer1Timer(Sender: TObject);
begin
    BarcodeEdit.Text:= '';
end;

end.
