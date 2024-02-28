unit TovarGroupRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, frxFIBComponents;

type
  TTovarGroupRepFrm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ComboBox1: TComboBox;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TovarGroupRepFrm: TTovarGroupRepFrm;

implementation

uses ShopMain;

{$R *.dfm}

procedure TTovarGroupRepFrm.FormCreate(Sender: TObject);
begin
        DateTimePicker3.DateTime:= Now;
        DateTimePicker4.DateTime:= Now;
        DateTimePicker1.DateTime:= Now;
        DateTimePicker2.DateTime:= Now;
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

          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_GROUP');
          Open;
          ComboBox2.Items.Clear;
          ComboBox2.Items.Add('!Все группы');
          while not Eof do
          begin
            ComboBox2.Items.Add(ShopMainForm.pFIBService['GROUP_NAME']);
            Next;
          end;
          ComboBox2.ItemIndex:= 0;
          Close;
        end;
end;

procedure TTovarGroupRepFrm.DateTimePicker3Change(Sender: TObject);
begin
          DateTimePicker1.Time:= DateTimePicker3.Time;
end;

procedure TTovarGroupRepFrm.DateTimePicker4Change(Sender: TObject);
begin
          DateTimePicker2.Time:= DateTimePicker4.Time;
end;

procedure TTovarGroupRepFrm.BitBtn2Click(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
    with ShopMainForm.frxReport1 do
    begin
      Screen.Cursor:= crHourGlass;
      LoadFromFile(ShopIni.ReadString('Reports', 'TovarGroup001', ReportsPath + 'TovarGroup001.fr3'));
      FIBQuery1:= FindObject('FIBQuery1') as TfrxFIBQuery;
      with FIBQuery1 do
      begin
        SQL.Clear;
        SQL.Add('select p.item, t.tovar_name, v.vendor_name,'
              + ' sum(p.kolvo)kolvo, sum(p.kolvo * p.vend_price)Summ');
        SQL.Add('from hdr_prihod h left join pos_prihod p on p.kod = h.kod');
        SQL.Add('left join spr_tovar t on t.item = p.item');
        SQL.Add('left join spr_vendors v on h.vendor_code = v.vendor_code');
        SQL.Add('where h.doc_date between ''' + DateTimeToStr(DateTimePicker1.DateTime)
              + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and p.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        if ComboBox2.ItemIndex > 0 then
          SQL.Add('and t.t_group = ' + IntToStr(FindGroupCode(ComboBox2.Text)));
        SQL.Add('and h.doc_type = 1');
        SQL.Add('group by p.item, t.tovar_name, v.vendor_name');
        SQL.Add('order by v.vendor_name, p.item');
      end;
      Script.Variables['OBJNAME']:= ComboBox1.Text;
      Script.Variables['GROUPNAME']:= ComboBox2.Text;
      Script.Variables['BEGD']:= DateTimeToStr(DateTimePicker1.DateTime);
      Script.Variables['ENDD']:= DateTimeToStr(DateTimePicker2.DateTime);
      Screen.Cursor:= crDefault;
      ShowReport;
    end;
end;

procedure TTovarGroupRepFrm.BitBtn1Click(Sender: TObject);
var  FIBQuery2, FIBQuery3: TfrxFIBQuery;
begin
    Screen.Cursor:= crHourGlass;
    with ShopMainForm.frxReport1 do
    begin
      LoadFromFile(ShopIni.ReadString('Reports', 'Oborotka001', ReportsPath + 'Oborotka001.fr3'));
      FIBQuery3:= FindObject('FIBQuery3') as TfrxFIBQuery;
      with FIBQuery3 do
      begin
        SQL.Clear;
        SQL.Add('select t.item, t.tovar_name,');
        // Количество на начало периода
        SQL.Add('(null2zero((select sum(p.kolvo) ');
        SQL.Add('from pos_prihod p left join hdr_prihod h on p.kod = h.kod');
        SQL.Add('where h.doc_date < ''' + DateTimeToStr(DateTimePicker1.DateTime) + '''');
        SQL.Add('and p.item = t.item');
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and p.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        SQL.Add(')) - null2zero((select sum(ps.kolvo*(1 + 2*cast(ps.ncard as integer)))');
        SQL.Add('from pos_sales ps where ps.item = t.item');
        SQL.Add('and ps.sale_date < '''+ DateTimeToStr(DateTimePicker1.DateTime) + '''');
        SQL.Add('and cast(ps.ncard as integer) <= 0');
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and ps.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        SQL.Add(')) - null2zero((select sum(pr.kolvo)');
        SQL.Add('from pos_rashod pr left join hdr_rashod hr on pr.kod = hr.kod');
        SQL.Add('where hr.doc_date < ''' + DateTimeToStr(DateTimePicker1.DateTime) + '''');
        SQL.Add('and pr.item = t.item');
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and pr.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        SQL.Add(')))kolvo_begin,');
        // Сумма на начало периода
        SQL.Add('(null2zero((select sum(p.kolvo*p.price)');
        SQL.Add('from pos_prihod p left join hdr_prihod h on p.kod = h.kod');
        SQL.Add('where h.doc_date < ''' + DateTimeToStr(DateTimePicker1.DateTime) + '''');
        SQL.Add('and p.item = t.item');// and h.doc_type = 1
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and p.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        SQL.Add(')) - null2zero((select sum(ps.kolvo*ps.sale_price*(1 + 2*cast(ps.ncard as integer)))');
        SQL.Add('from pos_sales ps where ps.item = t.item');
        SQL.Add('and ps.sale_date < ''' + DateTimeToStr(DateTimePicker1.DateTime) + '''');
        SQL.Add('and cast(ps.ncard as integer) <= 0');
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and ps.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        SQL.Add(')) + (null2zero((select sum(pc.kolvo * (pc.new_price - pc.old_price))');
        SQL.Add('from pereocen pc where pc.item = t.item');
        SQL.Add('and pc.p_date <''' + DateTimeToStr(DateTimePicker1.DateTime) + '''');
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and pc.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        SQL.Add('))) - null2zero((select sum(pr.kolvo*pr.price)');
        SQL.Add('from pos_rashod pr left join hdr_rashod hr on pr.kod = hr.kod');
        SQL.Add('where hr.doc_date < ''' + DateTimeToStr(DateTimePicker1.DateTime) + '''');
        SQL.Add('and pr.item = t.item');
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and pr.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        SQL.Add(')))summ_begin,');
        // Количество прихода  за период
        SQL.Add('(null2zero((select sum(p.kolvo)');
        SQL.Add('from pos_prihod p left join hdr_prihod h on p.kod = h.kod');
        SQL.Add('where h.doc_date between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                  + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        SQL.Add('and p.item = t.item');// and h.doc_type = 1
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and p.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        SQL.Add(')))kolvo_prihod,');
        // Сумма прихода  за период
        SQL.Add('(null2zero((select sum(p.kolvo * p.price)');
        SQL.Add('from pos_prihod p left join hdr_prihod h on p.kod = h.kod');
        SQL.Add('where h.doc_date between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                  + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        SQL.Add('and p.item = t.item');// and h.doc_type = 1
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and p.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        SQL.Add(')))summ_prihod,');
        // Количество расхода  за период
        SQL.Add('(null2zero((select sum(pr.kolvo)');
        SQL.Add('from pos_rashod pr left join hdr_rashod hr on pr.kod = hr.kod');
        SQL.Add('where hr.doc_date between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                  + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        SQL.Add('and pr.item = t.item');
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and pr.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        SQL.Add(')))kolvo_rashod,');
        // Сумма расхода  за период
        SQL.Add('(null2zero((select sum(pr.kolvo * pr.price)');
        SQL.Add('from pos_rashod pr left join hdr_rashod hr on pr.kod = hr.kod');
        SQL.Add('where hr.doc_date between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                  + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        SQL.Add('and pr.item = t.item');
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and pr.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        SQL.Add(')))summ_rashod,');
        // Количество продаж  за период
        SQL.Add('(null2zero((select sum(ps.kolvo*(1 + 2*cast(ps.ncard as integer)))');
        SQL.Add('from pos_sales ps where ps.item = t.item');
        SQL.Add('and ps.sale_date between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                  + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        SQL.Add('and cast(ps.ncard as integer) <= 0');
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and ps.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        SQL.Add(')))kolvo_sales,');
        // Сумма продаж за период
        SQL.Add('(null2zero((select sum(ps.kolvo*ps.sale_price*(1 + 2*cast(ps.ncard as integer)))');
        SQL.Add('from pos_sales ps where ps.item = t.item');
        SQL.Add('and ps.sale_date between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                  + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        SQL.Add('and cast(ps.ncard as integer) <= 0');
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and ps.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        SQL.Add(')))summ_sales,');
        // Переоценки за период
        SQL.Add('(null2zero((select sum(pc.kolvo * (pc.new_price - pc.old_price))');
        SQL.Add('from pereocen pc where pc.item = t.item');
        SQL.Add('and pc.p_date between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and pc.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        SQL.Add(')))pereocenka');
        SQL.Add('from spr_tovar t');
        if ComboBox2.ItemIndex > 0 then
          SQL.Add('where t.t_group = ' + IntToStr(FindGroupCode(ComboBox2.Text)));
          SQL.Add('order by t.item');
      end;

      FIBQuery2:= FindObject('FIBQuery2') as TfrxFIBQuery;
      with FIBQuery2 do
      begin
        SQL.Clear;
        SQL.Add('select u.*');
        SQL.Add('from uchet u ');
        if ComboBox2.ItemIndex > 0 then
          SQL.Add('left join spr_tovar t on t.item = u.item');
        SQL.Add('where u.save_date between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        if ComboBox1.ItemIndex > 0 then
          SQL.Add('and u.market_code = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
        if ComboBox2.ItemIndex > 0 then
          SQL.Add('and t.t_group = ' + IntToStr(FindGroupCode(ComboBox2.Text)));
        SQL.Add('order by u.item');
      end;

//            Title:= 'Движение товаров';
      Script.Variables['OBJNAME']:= ComboBox1.Text;
      Script.Variables['GROUPNAME']:= ComboBox2.Text;
      Script.Variables['BEGD']:= DateTimeToStr(DateTimePicker1.DateTime);
      Script.Variables['ENDD']:= DateTimeToStr(DateTimePicker2.DateTime);
      Screen.Cursor:= crDefault;
      ShowReport;
    end;
end;
{   Accept:= (abs(IBQuery3['kolvo_begin']) + abs(IBQuery3['kolvo_prihod'])
           + abs(IBQuery3['kolvo_sales']) + abs(IBQuery3['kolvo_rashod'])) > 0;
}
end.
