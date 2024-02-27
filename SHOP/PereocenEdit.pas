unit PereocenEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, ComCtrls, StdCtrls, Buttons,
  FIBDataSet, pFIBDataSet;

type
  TPereocenEditFrm = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label6: TLabel;
    Edit1: TEdit;
    Label7: TLabel;
    ComboBox3: TComboBox;
    Label8: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label9: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    pFIBDataSet1: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure QueryUpd;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PereocenEditFrm: TPereocenEditFrm;

implementation

uses ShopMain, NewPereocen;

{$R *.dfm}

procedure TPereocenEditFrm.FormCreate(Sender: TObject);
begin
        DateTimePicker1.Date:= Now;
        DateTimePicker4.Date:= Now;
        DateTimePicker2.Date:= Now;
        DateTimePicker3.Date:= Now;
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_MARKET');
          Open;
          ComboBox3.Items.Clear;
          ComboBox3.Items.Add('!Все объекты');
          while not Eof do
          begin
            ComboBox3.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);
            Next;
          end;
          ComboBox3.ItemIndex:= 0;
          Close;
        end;
        QueryUpd;
end;

procedure TPereocenEditFrm.QueryUpd;
var PSum,TSum: Double;
begin
        with pFIBDataSet1 do
        begin
          DisableControls;
          Close;
          SelectSQL.Clear;
          SelectSQL.Add('select p.*, m.short_name, t.tovar_name from price_change p');
          SelectSQL.Add('left join spr_market m on m.market_code = p.market_code');
          SelectSQL.Add('left join spr_tovar t on t.item = p.item');
          SelectSQL.Add('where p.p_date between ''' + DateTimeToStr(DateTimePicker2.DateTime)
                + ''' and ''' + DateTimeToStr(DateTimePicker3.DateTime) + '''');
          SelectSQL.Add('and p.kolvo > 0');
          if ComboBox3.ItemIndex > 0 then
               SelectSQL.Add('and P.market_code = ' + IntToStr(FindMarketCode(ComboBox3.Text)));
          if Edit1.Text <> '' then SelectSQL.Add('and p.item = ''' + Edit1.Text + '''');
          SelectSQL.Add('order by p.market_code, p.p_date');
          Open;
          PSum:= 0;
          if not VarIsNull(pFIBDataSet1['kolvo']) then
          begin
            while not Eof do
            begin
              TSum:= Abs(pFIBDataSet1['kolvo'] * (pFIBDataSet1['old_price'] - pFIBDataSet1['new_price']));
              PSum:= PSum + RoundEx(TSum);
              Next;
            end;
            First;
          end;
          EnableControls;
        end;
end;

procedure TPereocenEditFrm.DateTimePicker1Change(Sender: TObject);
begin
      DateTimePicker2.Time:= DateTimePicker1.Time;
end;

procedure TPereocenEditFrm.DateTimePicker4Change(Sender: TObject);
begin
      DateTimePicker3.Time:= DateTimePicker4.Time;
end;

procedure TPereocenEditFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
        if not(Key in ['0'..'9', #8])then Key:= #0;
end;

procedure TPereocenEditFrm.BitBtn1Click(Sender: TObject);
begin
        QueryUpd;
end;

procedure TPereocenEditFrm.BitBtn2Click(Sender: TObject);
begin
     if MessageDlg('Удалить переоценку для товара с кодом ' + pFIBDataSet1['ITEM'],
          mtConfirmation, [mbYes,mbNo], 0) = idYes then
      begin
        ShopMainForm.pFIBDatabase1.Execute('delete from price_change'
          + ' where market_code = ' + IntToStr(pFIBDataSet1['MARKET_CODE'])
          + ' and p_date = ''' + DateTimeToStr(pFIBDataSet1['P_DATE']) + ''''
          + ' and item = ''' + pFIBDataSet1['ITEM'] + '''');
        QueryUpd;
      end;
end;

procedure TPereocenEditFrm.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TNewPereocenFrm, NewPereocenFrm);
    NewPereocenFrm.Caption:= 'Редактирование переоценки';
    NewPereocenFrm.ComboBox1.Items:= ComboBox3.Items;
    NewPereocenFrm.ComboBox1.Items.Delete(0);
    NewPereocenFrm.ComboBox1.ItemIndex:= FindString(pFIBDataSet1['SHORT_NAME'], NewPereocenFrm.ComboBox1.Items);
    NewPereocenFrm.ComboBox1.Enabled:= False;
    NewPereocenFrm.DateTimePicker1.DateTime:= pFIBDataSet1['P_DATE'];
    NewPereocenFrm.DateTimePicker1.Enabled:= False;
    NewPereocenFrm.DateTimePicker2.DateTime:= pFIBDataSet1['P_DATE'];
    NewPereocenFrm.DateTimePicker2.Enabled:= False;
    NewPereocenFrm.Edit1.Text:= pFIBDataSet1['ITEM'];
    NewPereocenFrm.Edit1.Enabled:= False;
    NewPereocenFrm.ShowModal;
    NewPereocenFrm.Free;
end;

end.
