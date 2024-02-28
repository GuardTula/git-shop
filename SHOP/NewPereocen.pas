unit NewPereocen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TNewPereocenFrm = class(TForm)
    ComboBox1: TComboBox;
    Label7: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label8: TLabel;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    Label6: TLabel;
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewPereocenFrm: TNewPereocenFrm;

implementation

{$R *.dfm}

procedure TNewPereocenFrm.DateTimePicker1Change(Sender: TObject);
begin
      DateTimePicker2.DateTime:= DateTimePicker1.DateTime;
end;

end.
