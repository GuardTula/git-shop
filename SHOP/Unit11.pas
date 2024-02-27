//****************************************************************************//
//                             © Guard 1998-2020                              //
//****************************************************************************//
unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,  ExtCtrls,
  IniFiles, StdCtrls, Buttons, ComCtrls;

type
  TForm11 = class(TForm)
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
  SendStr: String;

implementation

uses ShopMain, Dialogs, Sale, Clients;

{$R *.DFM}

procedure TForm11.BitBtn2Click(Sender: TObject);
begin
    Application.CreateForm(TClientsFrm, ClientsFrm);
    ClientsFrm.Tag:= 1;
    ClientsFrm.Panel4.Visible:= False;
    ClientsFrm.ToolBar1.Visible:= False;
    ClientsFrm.EditBtn.OnClick:= nil;
    ClientsFrm.ActiveControl:= ClientsFrm.Edit1;
    if ClientsFrm.ShowModal = IDOK then
    begin
      CardNumber:= ClientsFrm.ClientsQuery['NCARD'];
      ClientsFrm.Free;
      ModalResult:= mrOK;
    end
    else ClientsFrm.Free;
end;

procedure TForm11.FormCreate(Sender: TObject);
begin
     SendStr:= '';
end;

procedure TForm11.Timer1Timer(Sender: TObject);
begin
     ProgressBar1.StepIt;
     SendStr:= '';
     if ProgressBar1.Position = ProgressBar1.Max then ModalResult:= idCancel;
end;

procedure TForm11.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key in ['0'..'9'] then
       SendStr:= SendStr + Key;
end;

procedure TForm11.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN)and(SendStr > '')then
      begin
        if Length(SendStr) > 9 then SendStr:= Copy(SendStr, Length(SendStr) - 8, 9);
        CardNumber:= SendStr;
        ModalResult:= mrOK;
      end;
end;

end.
