unit VendSumFact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TVendSummFactFrm = class(TForm)
    MoneyEdit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    procedure MoneyEdit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VendSummFactFrm: TVendSummFactFrm;

implementation

uses Sale;

{$R *.dfm}

procedure TVendSummFactFrm.MoneyEdit1Change(Sender: TObject);
begin
{       if VendSummFactFrm.Tag = 1 then
        if(StrToInt('0' + Edit1.Text) = 0)or(StrToInt('0' + Edit1.Text) > 99)then begin
          MessageDlg('Скидка должна быть больше 0% и меньше 100%', mtWarning, [mbOK], 0);
          Edit1.Text:= IntToStr(DiscontPercent);
          Edit1.SelectAll;
        end;}
        BitBtn1.Enabled:= ((MoneyEdit1.Text <> '')and MoneyEdit1.Visible)
                        or((Edit1.Text <> '')and Edit1.Visible);
end;

procedure TVendSummFactFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
     if not (Key in[#8, ',', '0'..'9'])then Key:= #0
     else
     begin
       if(Key = ',')and(VendSummFactFrm.Tag > 0)then Key:= #0;
       if(Pos(',', (Sender as TEdit).Text) > 0)then
       begin
         if(Key = ',')then Key:= #0
         else if Key <> #8 then
           if((Sender as TEdit).SelStart >= Pos(',', (Sender as TEdit).Text))and
             (Length((Sender as TEdit).Text) - Pos(',', (Sender as TEdit).Text) >= 2)
           then Key:= #0;
       end;
     end;
end;

end.
