unit TovarInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Vcl.ExtCtrls;

type
  TTovarInfoFrm = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Memo1: TMemo;
    Image1: TImage;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TovarInfoFrm: TTovarInfoFrm;

implementation

uses ShopMain, Spr;

{$R *.dfm}

procedure TTovarInfoFrm.BitBtn3Click(Sender: TObject);
begin
    if MessageDlg('Очистить информацию МЕСТО НА СКЛАДЕ ?',
        mtConfirmation, [mbYes,mbNo], 0) = IDYES then
      begin
         ShopMainForm.pFIBDatabase1.Execute('update TOVAR_ADD'
               + ' set SCLAD = '''' where ITEM = ''' + SprFrm.SprTovar['ITEM'] + '''');
         Edit1.Text:= '';
      end;
end;

procedure TTovarInfoFrm.Edit1Change(Sender: TObject);
begin
      BitBtn1.Enabled:= (Edit1.Text <> '') or(Memo1.Lines.Text <> '');
end;

end.
