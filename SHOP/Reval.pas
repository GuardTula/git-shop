//****************************************************************************//
//                            © Guard  2003-2006                              //
//****************************************************************************//
unit Reval;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FIBDataSet, pFIBDataSet, frxFIBComponents;

type
  TRevalFrm = class(TForm)
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    ComboBox2: TComboBox;
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label1: TLabel;
    ComboBox3: TComboBox;
    DateTimePicker2: TDateTimePicker;
    Edit1: TEdit;
    DateTimePicker3: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    Label10: TLabel;
    Label11: TLabel;
    LMDButton2: TBitBtn;
    LMDButton1: TBitBtn;
    LMDButton3: TBitBtn;
    pFIBDataSet1: TpFIBDataSet;
    pFIBDataSet2: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure QueryUpd;
    procedure Query2Upd;
    procedure ComboBox1Change(Sender: TObject);
    procedure LMDButton1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox3Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LMDButton2Click(Sender: TObject);
    procedure LMDButton3Click(Sender: TObject);
    procedure pFIBDataSet1AfterOpen(DataSet: TDataSet);
    procedure pFIBDataSet2AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RevalFrm: TRevalFrm;

implementation

uses ShopMain;

{$R *.dfm}

procedure TRevalFrm.FormCreate(Sender: TObject);
begin
        DateTimePicker1.Date:= Date;
        DateTimePicker2.Date:= Date;
        DateTimePicker3.Date:= Date;
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_MARKET');
          Open;
          ComboBox2.Items.Clear;
          ComboBox2.Items.Add('!Все объекты');
          while not Eof do
          begin
            ComboBox2.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);
            Next;
          end;
          ComboBox2.ItemIndex:= 0;
          ComboBox3.Items:= ComboBox2.Items;
          ComboBox3.ItemIndex:= 0;
          Close;
        end;
        QueryUpd;
end;

procedure TRevalFrm.QueryUpd;
var PSum,TSum: Double;
begin
        with pFIBDataSet1 do
        begin
          DisableControls;
          Close;
          SelectSQL.Clear;
          SelectSQL.Add('select S.TOVAR_NAME, P.ITEM, P.KOLVO, P.OLD_PRICE, P.NEW_PRICE, U.unit_name');
          SelectSQL.Add('from PRICE_CHANGE P left join SPR_TOVAR S on S.ITEM = P.ITEM');
          SelectSQL.Add('left join SPR_UNITS U on U.UNIT_KOD = S.UNIT_KOD');
          SelectSQL.Add('where cast(P.P_DATE as date) = ''' + DateToStr(DateTimePicker1.Date) + '''');
          if ComboBox2.ItemIndex > 0 then
               SelectSQL.Add('and P.MARKET_CODE = ' + IntToStr(FindMarketCode(ComboBox2.Text)));
          if ComboBox1.ItemIndex = 0 then
                SelectSQL.Add('and P.OLD_PRICE > P.NEW_PRICE')
          else SelectSQL.Add('and P.OLD_PRICE < P.NEW_PRICE');
          SelectSQL.Add('and P.KOLVO > 0');
          Open;
          PSum:= 0;
          if not VarIsNull(pFIBDataSet1['KOLVO']) then
          begin
            while not Eof do
            begin
              TSum:= Abs(pFIBDataSet1['KOLVO'] * (pFIBDataSet1['OLD_PRICE'] - pFIBDataSet1['NEW_PRICE']));
              PSum:= PSum + RoundEx(TSum);
              Next;
            end;
            First;
          end;
          Label1.Caption:= FloatToStrF(PSum, ffCurrency, 16, 2);
          EnableControls;
        end;
end;

procedure TRevalFrm.Query2Upd;
var PSum,TSum: Double;
begin
        with pFIBDataSet2 do
        begin
          DisableControls;
          Close;
          SelectSQL.Clear;
          SelectSQL.Add('select S.TOVAR_NAME, P.ITEM, P.KOLVO, P.OLD_PRICE, P.NEW_PRICE,'
                + ' U.unit_name');
          SelectSQL.Add('from PRICE_CHANGE P left join SPR_TOVAR S on S.ITEM = P.ITEM');
          SelectSQL.Add('left join  SPR_UNITS U on U.UNIT_KOD = S.UNIT_KOD');
          SelectSQL.Add('where cast(P.P_DATE as date) between ''' + DateToStr(DateTimePicker2.Date)
                + ''' and ''' + DateToStr(DateTimePicker3.Date) + '''');
          if ComboBox3.ItemIndex > 0 then
               SelectSQL.Add('and P.MARKET_CODE = ' + IntToStr(FindMarketCode(ComboBox3.Text)));
          if Edit1.Text <> '' then SelectSQL.Add('and P.ITEM = ''' + Edit1.Text + '''');
          SelectSQL.Add('and P.KOLVO > 0');
          Open;
          PSum:= 0;
          if not VarIsNull(pFIBDataSet2['KOLVO']) then
          begin
            while not Eof do
            begin
              TSum:= pFIBDataSet2['KOLVO'] * (pFIBDataSet2['OLD_PRICE'] - pFIBDataSet2['NEW_PRICE']);
              PSum:= PSum + RoundEx(TSum);
              Next;
            end;
            First;
          end;
          Label11.Caption:= FloatToStrF(PSum, ffCurrency, 16, 2);
          EnableControls;
        end;
end;

procedure TRevalFrm.ComboBox1Change(Sender: TObject);
begin
        QueryUpd;
end;

procedure TRevalFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
        if not(Key in ['0'..'9', #8])then Key:= #0;
end;

procedure TRevalFrm.ComboBox3Change(Sender: TObject);
begin
        Query2Upd;
end;

procedure TRevalFrm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key = VK_RETURN then Query2Upd;
end;

procedure TRevalFrm.LMDButton1Click(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
      with ShopMainForm.frxReport1 do
      begin
        LoadFromFile(ShopIni.ReadString('Reports', 'Reval001', ReportsPath + 'Reval001.fr3'));
        FIBQuery1:= FindObject('FIBQuery1') as TfrxFIBQuery;
        FIBQuery1.SQL:= pFIBDataSet1.SelectSQL;
        Script.Variables['PDATE']:= DateToStr(DateTimePicker1.Date);
        Script.Variables['OBJNAME']:= ComboBox2.Text;
        ShowReport;
      end;
end;

procedure TRevalFrm.LMDButton2Click(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
      with ShopMainForm.frxReport1 do
      begin
        LoadFromFile(ShopIni.ReadString('Reports', 'Reval002', ReportsPath + 'Reval002.fr3'));
        FIBQuery1:= FindObject('FIBQuery1') as TfrxFIBQuery;
        FIBQuery1.SQL:= pFIBDataSet2.SelectSQL;
        Script.Variables['BDATE']:= DateTimeToStr(DateTimePicker2.DateTime);
        Script.Variables['EDATE']:= DateTimeToStr(DateTimePicker3.DateTime);
        if Edit1.Text = '' then Script.Variables['PITEM']:= 0
        else Script.Variables['PITEM']:= 1;
        Script.Variables['OBJNAME']:= ComboBox3.Text;
        ShowReport;
      end;
end;

procedure TRevalFrm.LMDButton3Click(Sender: TObject);
var SQLStr: String;
begin
  if  MessageDlg('Добавить просматриваемые товары в ценники',
            mtConfirmation, [mbYes,mbNo], 0) = idYes then
    begin
      SQLStr:= 'insert into CENNIK_PRN select distinct ITEM from PRICE_CHANGE'
      + ' where cast(P_DATE as date) = ''' + DateToStr(DateTimePicker1.Date) + ''' and KOLVO > 0';
      if ComboBox2.ItemIndex > 0 then
           SQLStr:= SQLStr + ' and MARKET_CODE = ' + IntToStr(FindMarketCode(ComboBox2.Text));
      if ComboBox1.ItemIndex = 0 then SQLStr:= SQLStr + ' and OLD_PRICE > NEW_PRICE'
      else SQLStr:= SQLStr + ' and OLD_PRICE < NEW_PRICE';
      ShopMainForm.pFIBDatabase1.Execute(SQLStr);
    end;
end;

procedure TRevalFrm.pFIBDataSet1AfterOpen(DataSet: TDataSet);
begin
      LMDButton1.Enabled:= not VarIsNull(pFIBDataSet1['ITEM']);
      LMDButton3.Enabled:= not VarIsNull(pFIBDataSet1['ITEM']);
      DBGrid1.Visible:= not VarIsNull(pFIBDataSet1['ITEM']);
      Label1.Visible:= not VarIsNull(pFIBDataSet1['ITEM']);
      Label2.Visible:= not VarIsNull(pFIBDataSet1['ITEM']);
end;

procedure TRevalFrm.pFIBDataSet2AfterOpen(DataSet: TDataSet);
begin
      LMDButton2.Enabled:= not VarIsNull(pFIBDataSet2['ITEM']);
      DBGrid2.Visible:= not VarIsNull(pFIBDataSet2['ITEM']);
      Label10.Visible:= not VarIsNull(pFIBDataSet2['ITEM']);
      Label11.Visible:= not VarIsNull(pFIBDataSet2['ITEM']);
end;

end.
