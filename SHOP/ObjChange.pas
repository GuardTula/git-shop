unit ObjChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TObjChangeForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ObjChangeForm: TObjChangeForm;

implementation

uses ShopMain;

{$R *.dfm}

procedure TObjChangeForm.FormCreate(Sender: TObject);
begin
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select * from SPR_MARKET order by SHORT_NAME');
      Open;
      ComboBox1.Items.Clear;
      ComboBox1.Items.Add('!Все объекты');
      while not Eof do
      begin
        ComboBox1.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);
        Next;
      end;
      Close;
      ComboBox1.ItemIndex:= 0;
    end;
end;

procedure TObjChangeForm.BitBtn1Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex > 0 then
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select * from SPR_MARKET where SHORT_NAME = ''' + ComboBox1.Text + '''');
      Open;
      ObjChangeForm.Tag:= ShopMainForm.pFIBService['MARKET_CODE'];
      Close;
    end;
end;

end.
