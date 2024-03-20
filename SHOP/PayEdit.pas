unit PayEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TPayEditFrm = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MoneyEdit1: TEdit;
    ComboBox2: TComboBox;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure MoneyEdit1Change(Sender: TObject);
    procedure DateTimePicker1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure MoneyEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PayEditFrm: TPayEditFrm;

implementation

uses ShopMain, Payment, MoveTovar;

{$R *.dfm}

procedure TPayEditFrm.FormCreate(Sender: TObject);
begin
      with ShopMainForm.pFIBService do
      begin
        SelectSQL.Clear;
        SelectSQL.Add('select * from SPR_PAYMENT_TYPE');
        Open;
        ComboBox1.Items.Clear;
        while not Eof do
        begin
          ComboBox1.Items.Add(ShopMainForm.pFIBService['PAYMENT_NAME']);
          Next;
        end;
        Close;
      end;
      if ComboBox1.Items.Count > 1 then
        ComboBox1.ItemIndex:= 1
      else
        ComboBox1.ItemIndex:= 0;
      DateTimePicker1.DateTime:= Now;
end;

procedure TPayEditFrm.MoneyEdit1Change(Sender: TObject);
begin
      BitBtn1.Enabled:= StrToFloat('0'+MoneyEdit1.Text) > 0;
end;

procedure TPayEditFrm.MoneyEdit1KeyPress(Sender: TObject; var Key: Char);
begin
     if not (Key in[#8,',','0'..'9'])then Key:= #0;
     if(Pos(',', (Sender as TEdit).Text) > 0)then
     begin
       if(Key = ',')then Key:= #0
       else if Key <> #8 then
         if((Sender as TEdit).SelStart >= Pos(',', (Sender as TEdit).Text))and
           (Length((Sender as TEdit).Text) - Pos(',', (Sender as TEdit).Text) >= 2)
         then Key:= #0;
     end;
end;

procedure TPayEditFrm.DateTimePicker1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = VK_RETURN then SelectNext(Sender as TWinControl, True, True);
end;

procedure TPayEditFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9', #8])then Key:= #0;
end;

end.
