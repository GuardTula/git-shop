//****************************************************************************//
//                              © Guard  2002-2020                            //
//****************************************************************************//
unit MoveTovarShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, frxFIBComponents;

type
  TMoveTovarShowFrm = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Edit1: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    BitBtn2: TBitBtn;
    procedure DateTimePicker3Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MoveTovarShowFrm: TMoveTovarShowFrm;

implementation

uses ShopMain, SmensReports, Spr;

{$R *.dfm}

procedure TMoveTovarShowFrm.BitBtn2Click(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
  DateTimePicker1.Time:= DateTimePicker3.Time;
  DateTimePicker2.Time:= DateTimePicker4.Time;
  if DateTimePicker2.DateTime < DateTimePicker1.DateTime then
    MessageDlg('Конечная дата меньше начальной', mtWarning, [mbOK], 0)
  else
    with ShopMainForm.frxReport1 do
    begin
      LoadFromFile(ReportsPath + 'TovarRep004.fr3');
      FIBQuery1:= FindObject('FIBQuery1') as TfrxFIBQuery;
      FIBQuery1.SQL.Clear;
      FIBQuery1.SQL.Add('select m.short_name,');
  // Продажи/Возвраты
      FIBQuery1.SQL.Add('(select SUM(P.KOLVO + 2*P.KOLVO*(CAST(P.NCARD as INTEGER)))SKOLVO');
      FIBQuery1.SQL.Add('from POS_SALES P where P.market_code = m.market_code');
      FIBQuery1.SQL.Add('and P.SALE_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
            + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
      FIBQuery1.SQL.Add('and P.ITEM = ''' + Edit1.Text + '''),');
  // Приходы
      FIBQuery1.SQL.Add('(select sum(ppos.kolvo) PKOLVO');
      FIBQuery1.SQL.Add('from pos_prihod ppos left join hdr_prihod ph on ph.kod = ppos.kod');
      FIBQuery1.SQL.Add('where ppos.market_code = m.market_code');
      FIBQuery1.SQL.Add('and ph.DOC_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
            + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
      FIBQuery1.SQL.Add('and ppos.ITEM = ''' + Edit1.Text + ''' and ph.doc_type = 1),');
  // Расходы
      FIBQuery1.SQL.Add('(select sum(rpos.kolvo) BKOLVO');
      FIBQuery1.SQL.Add('from pos_rashod rpos left join hdr_rashod rh on rh.kod = rpos.kod');
      FIBQuery1.SQL.Add('where rpos.market_code = m.market_code');
      FIBQuery1.SQL.Add('and rh.DOC_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
            + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
      FIBQuery1.SQL.Add('and rpos.ITEM = ''' + Edit1.Text + ''' and rh.doc_type = 2),');
  // Возвраты
      FIBQuery1.SQL.Add('(select sum(ppos.kolvo) RKOLVO');
      FIBQuery1.SQL.Add('from pos_prihod ppos left join hdr_prihod ph on ph.kod = ppos.kod');
      FIBQuery1.SQL.Add('where ppos.market_code = m.market_code');
      FIBQuery1.SQL.Add('and ph.DOC_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
            + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
      FIBQuery1.SQL.Add('and ppos.ITEM = ''' + Edit1.Text + ''' and ph.doc_type = 10)');

      FIBQuery1.SQL.Add('from spr_market m order by 1');

      Script.Variables['BEGD']:= DateTimeToStr(DateTimePicker1.DateTime);
      Script.Variables['ENDD']:= DateTimeToStr(DateTimePicker2.DateTime);
      Script.Variables['ITEM']:= Edit1.Text;
      Script.Variables['OBJNAME']:= ComboBox1.Text;
      ShowReport;
  //          MoveTovarShowFrm.Close;
    end;
end;

procedure TMoveTovarShowFrm.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex > 0 then
  begin
    BitBtn1.Width:= 194;
    BitBtn2.Visible:= False;
  end
  else
  begin
    BitBtn1.Width:= 96;
    BitBtn2.Visible:= True;
  end;

end;

procedure TMoveTovarShowFrm.DateTimePicker3Change(Sender: TObject);
begin
          DateTimePicker1.Time:= DateTimePicker3.Time;
end;

procedure TMoveTovarShowFrm.DateTimePicker4Change(Sender: TObject);
begin
          DateTimePicker2.Time:= DateTimePicker4.Time;
end;

procedure TMoveTovarShowFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if not(Key in [#8, '0'..'9'])then Key:= #0;
end;

procedure TMoveTovarShowFrm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if(Sender = Edit1)and(Key = VK_INSERT)and
       (not Assigned(SprFrm)or(not SprFrm.Visible))
         then Edit1.Text:= ChangeWithCat;
     if Key = VK_RETURN then SelectNext(Sender as TWinControl, true, true);
end;

procedure TMoveTovarShowFrm.Edit1Change(Sender: TObject);
begin
      BitBtn1.Enabled:= Edit1.Text <> '';
end;

procedure TMoveTovarShowFrm.BitBtn1Click(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
  DateTimePicker1.Time:= DateTimePicker3.Time;
  DateTimePicker2.Time:= DateTimePicker4.Time;
  if DateTimePicker2.DateTime < DateTimePicker1.DateTime then
    MessageDlg('Конечная дата меньше начальной', mtWarning, [mbOK], 0)
  else
    with ShopMainForm.frxReport1 do
    begin
      LoadFromFile(ReportsPath + 'TovarRep003.fr3');
      FIBQuery1:= FindObject('FIBQuery1') as TfrxFIBQuery;
      FIBQuery1.SQL.Clear;
  // Продажи/Возвраты
      FIBQuery1.SQL.Add('select cast(P.NCARD as INTEGER),cast(P.NCHECK as INTEGER),cast(P.SALE_DATE as TIMESTAMP), cast(P.SALE_PRICE as FLOAT),'
        + ' cast(P.KOLVO as FLOAT), cast(0 as FLOAT) as F_6, cast(M.SHORT_NAME as char(15)) as F_7');
      FIBQuery1.SQL.Add('from POS_SALES P left join SPR_MARKET M on P.MARKET_CODE = M.MARKET_CODE');
      FIBQuery1.SQL.Add('where P.SALE_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
            + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
      FIBQuery1.SQL.Add('and P.ITEM = ''' + Edit1.Text + '''');
      if ComboBox1.ItemIndex > 0 then
        FIBQuery1.SQL.Add('and P.MARKET_CODE = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
  // Приходы
      FIBQuery1.SQL.Add('union all');
      FIBQuery1.SQL.Add('select 1, cast(H.DOC_NUMBER as INTEGER), cast(H.DOC_DATE as TIMESTAMP), cast(P.PRICE as FLOAT), cast(P.KOLVO as FLOAT),'
        +' cast(H.DOC_TYPE as FLOAT), cast(M.SHORT_NAME as char(15)) as F_7');
      if ComboBox1.ItemIndex > 0 then
        FIBQuery1.SQL.Add('from POS_PRIHOD P left join HDR_PRIHOD H on P.KOD = H.KOD left join SPR_MARKET M on H.VENDOR_CODE = M.MARKET_CODE')
      else
        FIBQuery1.SQL.Add('from POS_PRIHOD P left join HDR_PRIHOD H on P.KOD = H.KOD left join SPR_MARKET M on P.MARKET_CODE = M.MARKET_CODE');
      FIBQuery1.SQL.Add('where H.DOC_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
            + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
      FIBQuery1.SQL.Add('and P.ITEM = ''' + Edit1.Text + '''');
      if ComboBox1.ItemIndex > 0 then
        FIBQuery1.SQL.Add('and P.MARKET_CODE = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
  // Расходы
      FIBQuery1.SQL.Add('union all');
      FIBQuery1.SQL.Add('select 2, cast(H.DOC_NUMBER as INTEGER), cast(H.DOC_DATE as TIMESTAMP), cast(P.PRICE as FLOAT), cast(P.KOLVO as FLOAT),'
        +' cast(H.DOC_TYPE as FLOAT), cast(M.SHORT_NAME as char(15)) as F_7');
      if ComboBox1.ItemIndex > 0 then
        FIBQuery1.SQL.Add('from POS_RASHOD P left join HDR_RASHOD H on P.KOD = H.KOD left join SPR_MARKET M on H.VENDOR_CODE = M.MARKET_CODE')
      else
        FIBQuery1.SQL.Add('from POS_RASHOD P left join HDR_RASHOD H on P.KOD = H.KOD left join SPR_MARKET M on P.MARKET_CODE = M.MARKET_CODE');
      FIBQuery1.SQL.Add('where H.DOC_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
            + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
      FIBQuery1.SQL.Add('and P.ITEM = ''' + Edit1.Text + '''');
  //          FIBQuery1.SQL.Add('and H.DOC_TYPE <> 12');
      if ComboBox1.ItemIndex > 0 then
        FIBQuery1.SQL.Add('and P.MARKET_CODE = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
  // Переоценки
      FIBQuery1.SQL.Add('union all');
      FIBQuery1.SQL.Add('select 3, cast(0 as INTEGER), cast(P.P_DATE as TIMESTAMP), cast(P.NEW_PRICE as FLOAT), cast(P.KOLVO as FLOAT),'
        +' cast(P.OLD_PRICE as FLOAT), cast(M.SHORT_NAME as char(15)) as F_7');
      FIBQuery1.SQL.Add('from PRICE_CHANGE P left join SPR_MARKET M on P.MARKET_CODE = M.MARKET_CODE');
      FIBQuery1.SQL.Add('where P.P_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
            + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
      FIBQuery1.SQL.Add('and P.ITEM = ''' + Edit1.Text + '''');
      FIBQuery1.SQL.Add('and P.KOLVO > 0');
      if ComboBox1.ItemIndex > 0 then
        FIBQuery1.SQL.Add('and P.MARKET_CODE = ' + IntToStr(FindMarketCode(ComboBox1.Text)));
      FIBQuery1.SQL.Add('order by 3, 1, 2');

      ShopMainForm.pGetTovarKolvoStoredProc.ParamByName('ITEM').AsString:= Edit1.Text;
      ShopMainForm.pGetTovarKolvoStoredProc.ParamByName('MARKET_CODE').AsInteger:= FindMarketCode(ComboBox1.Text);
      ShopMainForm.pGetTovarKolvoStoredProc.ParamByName('FOR_DATA').AsDateTime:= DateTimePicker1.DateTime;
      ShopMainForm.pGetTovarKolvoStoredProc.ExecProc;

      Script.Variables['BEGD']:= DateTimeToStr(DateTimePicker1.DateTime);
      Script.Variables['ENDD']:= DateTimeToStr(DateTimePicker2.DateTime);
      Script.Variables['ITEM']:= Edit1.Text;
      Script.Variables['OBJNAME']:= ComboBox1.Text;
      Script.Variables['KOLVO']:= ShopMainForm.pGetTovarKolvoStoredProc.ParamByName('ITEM_OST').AsFloat;
      ShowReport;
  //          MoveTovarShowFrm.Close;
    end;
end;

procedure TMoveTovarShowFrm.FormCreate(Sender: TObject);
begin

{  if CurrentMarketType <> 0 then
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select * from SPR_MARKET where MARKET_CODE = ' + IntToStr(CurrentMarketCode));
      Open;
      if not VarIsNull(ShopMainForm.pFIBService['SHORT_NAME'])then
        MoveTovarShowFrm.ComboBox1.ItemIndex:=
            FindString(ShopMainForm.pFIBService['SHORT_NAME'], MoveTovarShowFrm.ComboBox1.Items);
      Close;
    end;
}
end;

procedure TMoveTovarShowFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if Key = VK_ESCAPE then Close;
end;

procedure TMoveTovarShowFrm.FormShow(Sender: TObject);
begin
  MoveTovarShowFrm.ComboBox1Change(Sender);
end;

procedure TMoveTovarShowFrm.SpeedButton1Click(Sender: TObject);
begin
  MoveTovarShowFrm.DateTimePicker1.DateTime:= ShopIni.ReadDateTime('MoveTovar', 'MoveTovarBDATA',  Now - 30);
  MoveTovarShowFrm.DateTimePicker2.DateTime:= ShopIni.ReadDateTime('MoveTovar', 'MoveTovarBTIME', Now);
  MoveTovarShowFrm.DateTimePicker3.DateTime:= ShopIni.ReadDateTime('MoveTovar', 'MoveTovarEDATA', Now);
  MoveTovarShowFrm.DateTimePicker4.DateTime:= ShopIni.ReadDateTime('MoveTovar', 'MoveTovarETIME', Now);
end;

end.
