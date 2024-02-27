unit ClientAutoAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TClientAutoAddForm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientAutoAddForm: TClientAutoAddForm;

implementation

uses ShopMain;

{$R *.dfm}

procedure TClientAutoAddForm.BitBtn1Click(Sender: TObject);
var CurCard: String;
    i,j: Integer;
begin
  j:= 0;
  for i:= StrToInt(Edit1.Text) to StrToInt(Edit2.Text) do
  begin
    CurCard:= IntToStr(i);
    while Length(CurCard) < 9 do CurCard:= '0' + CurCard;
    ShopMainForm.pFIBDatabase1.Execute('insert into CLIENTS(NCARD, PRICE, FAMILIA, '
      + 'NAME, OTCHESTVO, PHONE, ADRES)values(''' + CurCard + ''',1,''ÍÎÂÀß'',''ÍÎÂÀß'',''ÍÎÂÀß'','
      + ''''','''')');
    Inc(j);
  end;
  MessageDlg('Äîáàâëåíî ' + IntToStr(j) + ' êàðò', mtInformation, [mbOK], 0);
end;

end.
