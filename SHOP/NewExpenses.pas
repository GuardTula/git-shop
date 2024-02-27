unit NewExpenses;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TNewExpensesFrm = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewExpensesFrm: TNewExpensesFrm;

implementation

uses ShopMain;

{$R *.dfm}

procedure TNewExpensesFrm.FormCreate(Sender: TObject);
begin
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select distinct EXPENSES_TYPE from EXPENSES');
          Open;
          ComboBox1.Items.Clear;
          while not Eof do
          begin
            ComboBox1.Items.Add(ShopMainForm.pFIBService['EXPENSES_TYPE']);
            Next;
          end;
          Close;
        end;
        DateTimePicker1.Date:= Date;
end;

procedure TNewExpensesFrm.DateTimePicker1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = VK_RETURN then SelectNext(Sender as TWinControl, True, True);
end;

procedure TNewExpensesFrm.ComboBox1Change(Sender: TObject);
begin
      BitBtn1.Enabled:= (ComboBox1.Text <> '')and(Edit1.Text <> '')
                      and(StrToFloat('0' + Edit2.Text) > 0);
end;

procedure TNewExpensesFrm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
    if not(Key in ['0'..'9',',', #8])then Key:= #0;
    if(Key = ',')and(Pos(',', (Sender as TEdit).Text)> 0)then Key:= #0;
end;

end.
