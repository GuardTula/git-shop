unit ZakazForPeriod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TZakazForPeriodForm = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    LabeledEdit1: TLabeledEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Bevel1: TBevel;
    procedure LabeledEdit1Change(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZakazForPeriodForm: TZakazForPeriodForm;

implementation

{$R *.dfm}

procedure TZakazForPeriodForm.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then CheckBox5.Checked:= False;
end;

procedure TZakazForPeriodForm.CheckBox5Click(Sender: TObject);
begin
  if CheckBox5.Checked then CheckBox4.Checked:= False;
end;

procedure TZakazForPeriodForm.LabeledEdit1Change(Sender: TObject);
begin
  BitBtn1.Enabled:= (StrToInt('0' +  LabeledEdit1.Text) > 0)and(DateTimePicker1.Date <= DateTimePicker2.Date);
end;

end.
