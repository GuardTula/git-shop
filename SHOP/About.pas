//****************************************************************************//
//                              © Guard  2002-2022                            //
//****************************************************************************//
unit About;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Registry, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Buttons;

type
  TAboutBox = class(TForm)
    Label8: TLabel;
    Label6: TLabel;
    Version: TLabel;
    Label7: TLabel;
    Image1: TImage;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
  end;

var
  AboutBox: TAboutBox;

implementation

uses ShopMain;


{$R *.DFM}

procedure TAboutBox.FormCreate(Sender: TObject);
begin
    Version.Caption:= GetFileVersion(ParamStr(0));
end;

procedure TAboutBox.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then AboutBox.ModalResult:= mrCancel;

end;

procedure TAboutBox.SpeedButton1Click(Sender: TObject);
begin
   AboutBox.ModalResult:= mrOk;
end;

end.

