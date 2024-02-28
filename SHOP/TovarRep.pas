//****************************************************************************//
//                            © Guard  2003-2022                              //
//****************************************************************************//
unit TovarRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ComCtrls, Buttons, frxFIBComponents;

type
  TTovarRepFrm = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    LMDButton1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure LMDButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateTimePicker2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TovarRepFrm: TTovarRepFrm;

implementation

uses ShopMain;

{$R *.dfm}

procedure TTovarRepFrm.FormCreate(Sender: TObject);
begin
       DateTimePicker2.DateTime:= Now;
       DateTimePicker1.DateTime:= Now;
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_MARKET');
          Open;
          ComboBox1.Items.Clear;
          ComboBox1.Items.Add('!Все объекты');
          while not Eof do
          begin
            ComboBox1.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);
            Next;
          end;
          ComboBox1.ItemIndex:= 0;
          Close;
        end;
end;

procedure TTovarRepFrm.LMDButton1Click(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
      if (Sender as TComponent).Tag = 0 then
        with ShopMainForm.frxReport1 do
        begin
          LoadFromFile(ShopIni.ReadString('Reports', 'TovarRep001', ReportsPath + 'TovarRep001.fr3'));
          FIBQuery1:= FindObject('FIBQuery1') as TfrxFIBQuery;
          with FIBQuery1 do
          begin
            SQL.Clear;
            SQL.Add('select o.item, t.tovar_name, o.ostatok as it_kolvo, p.sale_price, u.unit_name, g.group_name,');
            SQL.Add('(select IIF(pc.new_price is null, 0, pc.new_price) from price_change pc where pc.item = t.item');
            if ComboBox1.ItemIndex > 0 then
              SQL.Add('and pc.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
            SQL.Add('and pc.p_date = (select max(p_date)from price_change');
            SQL.Add('where item = t.item');
            if ComboBox1.ItemIndex > 0 then
              SQL.Add('and market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
            SQL.Add('and p_date < ''' + DateTimeToStr(DateTimePicker1.DateTime) + '''))old_price');
            SQL.Add('from tovar2date(' + IntToStr(FindMarketCode(ComboBox1.Text))
                      + ', ''' + DateTimeToStr(DateTimePicker1.DateTime) + ''') o');
            SQL.Add('left join spr_tovar t on t.item = o.item');
            SQL.Add('left join prices p on p.item = o.item and p.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
            SQL.Add('left join spr_group g on g.t_group = t.t_group');
            SQL.Add('left join spr_units u on t.unit_kod = u.unit_kod');
            SQL.Add('order by g.group_name, t.tovar_name');
          end;
//            Title:= 'Товарный запас';
          Script.Variables['BEGD']:= DateTimeToStr(DateTimePicker1.DateTime);
          Script.Variables['OBJNAME']:= ComboBox1.Text;
          ShowReport;
        end
        else ModalResult:= idOK;
end;

procedure TTovarRepFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key = VK_ESCAPE then Close;
end;

procedure TTovarRepFrm.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if Key = VK_RETURN then LMDButton1.SetFocus;
end;

procedure TTovarRepFrm.DateTimePicker2Change(Sender: TObject);
begin
      DateTimePicker1.Time:= DateTimePicker2.Time;
end;

end.
