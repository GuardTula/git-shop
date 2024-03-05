//****************************************************************************//
//                              © Guard  2002-2014                            //
//****************************************************************************//
unit SmensReports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc,
  frxFIBComponents, Menus;

type
  TSmensRepFrm = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    PrintRepBtn: TBitBtn;
    LMDButton4: TBitBtn;
    LMDButton5: TBitBtn;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Edit1: TEdit;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel2: TBevel;
    ComboBox2: TComboBox;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    LMDButton1: TSpeedButton;
    LMDButton2: TSpeedButton;
    pFIBStoredProc1: TpFIBStoredProc;
    pFIBDataSet1: TpFIBDataSet;
    pFIBDataSet1MARKET_CODE: TFIBIntegerField;
    pFIBDataSet1SMENS_KOD: TFIBIntegerField;
    pFIBDataSet1AUTOR_KOD: TFIBIntegerField;
    pFIBDataSet1BEGIN_DATETIME: TFIBDateTimeField;
    pFIBDataSet1END_DATETIME: TFIBDateTimeField;
    pFIBDataSet1SHORT_NAME: TFIBStringField;
    pFIBDataSet1NAME: TFIBStringField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    SpeedButton1: TSpeedButton;
    StaticText2: TStaticText;
    BitBtn4: TBitBtn;
    PopupMenu2: TPopupMenu;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LMDButton1Click(Sender: TObject);
    procedure LMDButton2Click(Sender: TObject);
    procedure PrintRepBtnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure LMDButton4Click(Sender: TObject);
    procedure LMDButton5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure AddRepClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ChangeMarket;
  end;

var
  SmensRepFrm: TSmensRepFrm;
  MarketShow, MarketHide :TStringList;

implementation

uses ShopMain, MoveTovarShow, Spr, frxClass, DualList;

{$R *.dfm}

procedure TSmensRepFrm.FormCreate(Sender: TObject);
var NewItem: TMenuItem;
    sr: TSearchRec;
begin
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select GROUP_NAME from SPR_GROUP');
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

        DateTimePicker1.DateTime:= Now;
        DateTimePicker2.DateTime:= Now;
        DateTimePicker3.DateTime:= Now;
        DateTimePicker4.DateTime:= Now;


        if FindFirst(ReportsPath + 'SMENS_ADD\*.fr3', faAnyFile, sr) = 0 then
        begin
          repeat
            if (sr.Attr and fadirectory) <> sr.Attr then
            begin
              NewItem:= TMenuItem.Create(PopupMenu2);
              PopupMenu2.Items.Add(NewItem);
              NewItem.Caption:= Copy(sr.Name, 1, Length(sr.Name) - 4);
              NewItem.OnClick:= AddRepClick;
            end;
          until FindNext(sr) <> 0;
          FindClose(sr);
        end;

        MarketShow:= TStringList.Create;
        MarketHide:= TStringList.Create;
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_MARKET');
          Open;
          while not Eof do
          begin
            MarketShow.Add(ShopMainForm.pFIBService['SHORT_NAME']);
            Next;
          end;
          Close;
          if accessAllowed('OperNaklDel', User_ID) then DBGrid1.PopupMenu:= PopupMenu1;
        end;
        ChangeMarket;
end;

procedure TSmensRepFrm.LMDButton1Click(Sender: TObject);
begin
        if not VarIsNull(pFIBDataSet1['BEGIN_DATETIME'])then
        begin
          DateTimePicker1.DateTime:= pFIBDataSet1['BEGIN_DATETIME'];
          DateTimePicker3.DateTime:= pFIBDataSet1['BEGIN_DATETIME'];
        end;
end;

procedure TSmensRepFrm.LMDButton2Click(Sender: TObject);
begin
        if not VarIsNull(pFIBDataSet1['END_DATETIME'])then
        begin
          DateTimePicker2.DateTime:= pFIBDataSet1['END_DATETIME'];
          DateTimePicker4.DateTime:= pFIBDataSet1['END_DATETIME'];
        end
        else
        begin
          MessageDlg('Данная смена не завершена', mtWarning, [mbOK], 0);
          DateTimePicker2.DateTime:= Now;
          DateTimePicker4.DateTime:= Now;
        end;
end;

procedure TSmensRepFrm.PrintRepBtnClick(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
          with ShopMainForm.frxReport1 do
          begin
            LoadFromFile(ShopIni.ReadString('Reports', 'Sales001', ReportsPath + 'SmensSale001.fr3'));
            FIBQuery1:= FindObject('SmensRepQuery') as TfrxFIBQuery;

            with FIBQuery1 do
            begin
              SQL.Clear;
              SQL.Add('select 1 as IND, cast(P.ITEM as varchar(14))as ITEM, '
                  + 'cast(P.SALE_PRICE as float)as SALE_PRICE, cast(T.TOVAR_NAME as varchar(80)) as TOVAR_NAME,'
                  + ' cast(SUM(P.KOLVO) as float)as SKOLVO');
              SQL.Add('from POS_SALES P left join SPR_TOVAR T on P.ITEM = T.ITEM');
              SQL.Add('where SALE_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                    + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
              SQL.Add('and cast(P.NCARD as integer) =  0');
              if MarketHide.Count > 0 then
                SQL.Add('and MARKET_CODE in (' + GetMarketFltrStr(MarketShow) + ')');
              SQL.Add('group by P.ITEM, P.SALE_PRICE, T.TOVAR_NAME');
              SQL.Add('union');
              SQL.Add('select 2 as IND, cast(P.ITEM as varchar(14)), cast(P.SALE_PRICE as float)'
                + ', cast(T.TOVAR_NAME as varchar(80)), cast(SUM(P.KOLVO) as float)');
              SQL.Add('from POS_SALES P left join SPR_TOVAR T on P.ITEM = T.ITEM');
              SQL.Add('where SALE_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                    + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
              SQL.Add('and cast(P.NCARD as integer) =  -1');
              if MarketHide.Count > 0 then
                SQL.Add('and MARKET_CODE in (' + GetMarketFltrStr(MarketShow) + ')');
              SQL.Add('group by P.ITEM, P.SALE_PRICE, T.TOVAR_NAME');
              SQL.Add('union');
              SQL.Add('select 3 as IND, cast('''' as varchar(14)), cast(sum(P.SALE_PRICE) as float),'
                +' cast(P.NCARD as varchar(80)), cast(SUM(P.KOLVO) as float)');
              SQL.Add('from POS_SALES P');
              SQL.Add('where SALE_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                    + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
              SQL.Add('and cast(P.NCARD as integer) >  0');
              if MarketHide.Count > 0 then
                SQL.Add('and MARKET_CODE in (' + GetMarketFltrStr(MarketShow) + ')');
              SQL.Add('group by P.NCARD');
              SQL.Add('order by 1, 4, 2');
            end;
            Script.Variables['BEGD']:= DateTimeToStr(DateTimePicker1.DateTime);
            Script.Variables['ENDD']:= DateTimeToStr(DateTimePicker2.DateTime);
            Script.Variables['OBJNAME']:= StaticText2.Caption;
  //            Name:= 'Продажи';
            ShowReport;
        end;
end;

procedure TSmensRepFrm.SpeedButton1Click(Sender: TObject);
var i: Integer;
begin
        Application.CreateForm(TDualListDlg, DualListDlg);
        DualListDlg.Caption:= 'Выбор объектов для просмотра';
        DualListDlg.SrcList.Items:= MarketHide;
        DualListDlg.DstList.Items:= MarketShow;
        if DualListDlg.ShowModal = mrOK then
          if DualListDlg.DstList.Items.Count > 0 then
          begin
            MarketHide.Clear;
            for i:= 0 to DualListDlg.SrcList.Items.Count - 1 do
              MarketHide.Add(DualListDlg.SrcList.Items[i]);
            MarketShow.Clear;
            for i:= 0 to DualListDlg.DstList.Items.Count - 1 do
              MarketShow.Add(DualListDlg.DstList.Items[i]);
            if MarketHide.Count = 0 then
            begin
              StaticText2.Caption:= ' Все объекты';
            end
            else
            begin
              if MarketShow.Count = 1 then StaticText2.Caption:= MarketShow[0]
              else StaticText2.Caption:= ' Фильтр по ' + IntToStr(MarketShow.Count) + ' объектам';
            end;
          end
          else MessageDlg('Объекты не выбраны', mtWarning, [mbOK], 0);
        ChangeMarket;
        DualListDlg.Free;
end;

procedure TSmensRepFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key = VK_ESCAPE then Close;
end;

procedure TSmensRepFrm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  N1.Visible:= not VarIsNull(pFIBDataSet1['SMENS_KOD']);
end;

procedure TSmensRepFrm.DateTimePicker3Change(Sender: TObject);
begin
          DateTimePicker1.Time:= DateTimePicker3.Time;
end;

procedure TSmensRepFrm.DateTimePicker4Change(Sender: TObject);
begin
          DateTimePicker2.Time:= DateTimePicker4.Time;
end;

procedure TSmensRepFrm.LMDButton4Click(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
     BeginOst: Double;
     i: Integer;
begin
    BeginOst:= 0;

    pFIBStoredProc1.ParamByName('END_DATE').AsDateTime:= DateTimePicker1.DateTime;
    for i := 0 to MarketShow.Count - 1 do
    begin
      pFIBStoredProc1.ParamByName('MARKET_CODE').AsInteger:=  FindMarketCode(MarketShow[i]);
      pFIBStoredProc1.ExecProc;
      BeginOst:= BeginOst + pFIBStoredProc1.ParamByName('ALL_SUMM').AsCurrency;
    end;

    with ShopMainForm.frxReport1 do
    begin
      LoadFromFile(ShopIni.ReadString('Reports', 'TovarRep002', ReportsPath + 'TovarRep002.fr3'));
      FIBQuery1:= FindObject('SmensRepQuery') as TfrxFIBQuery;

      with FIBQuery1 do
      begin
        SQL.Clear; // Приходные документы
        SQL.Add('select 1 as KOD, DOC_DATE, SUM(DOC_SUM) DOC_SUM, DOC_NUMBER, DOC_TYPE from HDR_PRIHOD');
        SQL.Add('where DOC_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
              + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        if MarketHide.Count > 0 then
             SQL.Add('and MARKET_CODE in (' + GetMarketFltrStr(MarketShow) + ')');
        SQL.Add('group by DOC_DATE, DOC_NUMBER, DOC_TYPE');
    {********************************************************************************}

        SQL.Add('union'); // Расходные документы
        SQL.Add('select 2 as KOD, DOC_DATE, SUM(DOC_SUM), DOC_NUMBER, DOC_TYPE from HDR_RASHOD');
        SQL.Add('where DOC_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
              + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        if MarketHide.Count > 0 then
             SQL.Add('and MARKET_CODE in (' + GetMarketFltrStr(MarketShow) + ')');
        SQL.Add('group by DOC_DATE, DOC_TYPE, DOC_NUMBER');
    {********************************************************************************}

        SQL.Add('union'); // Продажи
        SQL.Add('select 3 as KOD, H.END_DATETIME as BEGIN_DATETIME, (OKR2(SUM(P.KOLVO*P.SALE_PRICE)'
                + '+ 2*SUM(P.KOLVO*P.SALE_PRICE*(CAST(P.NCARD as INTEGER))))'
                + '+ (select IIF(SUM(D.SALE_PRICE) is null, 0, SUM(D.SALE_PRICE))from POS_SALES D '
                + 'where H.SMENS_KOD = D.SMENS_KOD and CAST(D.NCARD as INTEGER) > 0)), 0, 0 '
                + 'from HDR_SMENS H left join POS_SALES P on H.SMENS_KOD = P.SMENS_KOD');
        SQL.Add('where H.BEGIN_DATETIME >= ''' + DateTimeToStr(DateTimePicker1.DateTime) + '''');
        SQL.Add('and H.END_DATETIME <= ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        SQL.Add('and CAST(P.NCARD as INTEGER) <= 0');
        if MarketHide.Count > 0 then
             SQL.Add('and H.MARKET_CODE in (' + GetMarketFltrStr(MarketShow) + ')');
        SQL.Add('group by H.SMENS_KOD, H.END_DATETIME');
    {********************************************************************************}

        SQL.Add('union'); // Возвраты
        SQL.Add('select 3 as KOD, H.END_DATETIME as BEGIN_DATETIME, SUM(OKR2(P.KOLVO * P.SALE_PRICE)), COUNT(*), 11 '
                + 'from HDR_SMENS H left join POS_SALES P on H.SMENS_KOD = P.SMENS_KOD');
        SQL.Add('where H.BEGIN_DATETIME >= ''' + DateTimeToStr(DateTimePicker1.DateTime) + '''');
        SQL.Add('and H.END_DATETIME <= ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        SQL.Add('and CAST(P.NCARD as INTEGER) = -1');
        if MarketHide.Count > 0 then
             SQL.Add('and H.MARKET_CODE in (' + GetMarketFltrStr(MarketShow) + ')');
        SQL.Add('group by H.SMENS_KOD, H.END_DATETIME');
    {********************************************************************************}

        SQL.Add('union'); // Скидки
        SQL.Add('select 4 as KOD, H.END_DATETIME as BEGIN_DATETIME, SUM(P.SALE_PRICE), COUNT(*), 10 '
                + 'from HDR_SMENS H left join POS_SALES P on H.SMENS_KOD = P.SMENS_KOD');
        SQL.Add('where H.BEGIN_DATETIME >= ''' + DateTimeToStr(DateTimePicker1.DateTime) + '''');
        SQL.Add('and H.END_DATETIME <= ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        SQL.Add('and CAST(P.NCARD as INTEGER) > 0');
        if MarketHide.Count > 0 then
             SQL.Add('and H.MARKET_CODE in (' + GetMarketFltrStr(MarketShow) + ')');
        SQL.Add('group by H.SMENS_KOD, H.END_DATETIME');
    {********************************************************************************}

        SQL.Add('union'); // Переоценки (наценка)
        SQL.Add('select 1, P_DATE, SUM(OKR2(KOLVO * (NEW_PRICE - OLD_PRICE))), 0, 12');
        SQL.Add('from PER_VIEW');
        SQL.Add('where NEW_PRICE > OLD_PRICE');
        SQL.Add('and P_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
              + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        if MarketHide.Count > 0 then
             SQL.Add('and MARKET_CODE in (' + GetMarketFltrStr(MarketShow) + ')');
        SQL.Add('and KOLVO > 0');
        SQL.Add('group by P_DATE');

        SQL.Add('union'); // Переоценки (уценка)
        SQL.Add('select 2, P_DATE, SUM(OKR2(KOLVO * (OLD_PRICE - NEW_PRICE))), 0, 12');
        SQL.Add('from PER_VIEW');
        SQL.Add('where NEW_PRICE < OLD_PRICE');
        SQL.Add('and P_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
              + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
        if MarketHide.Count > 0 then
             SQL.Add('and MARKET_CODE in (' + GetMarketFltrStr(MarketShow) + ')');
        SQL.Add('and KOLVO > 0');
        SQL.Add('group by P_DATE');
        SQL.Add('order by 1,2,5');
    {********************************************************************************}
      end;

      Script.Variables['BEGD']:= DateTimeToStr(DateTimePicker1.DateTime);
      Script.Variables['ENDD']:= DateTimeToStr(DateTimePicker2.DateTime);
      Script.Variables['OBJNAME']:= StaticText2.Caption;
      Script.Variables['BOST']:= BeginOst;
//      Title:= 'Товарный отчёт';
      ShowReport;
    end;
end;

procedure TSmensRepFrm.LMDButton5Click(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
        with ShopMainForm.frxReport1 do
        begin
          LoadFromFile(ShopIni.ReadString('Reports', 'Sales002', ReportsPath + 'SmensSale002.fr3'));
          FIBQuery1:= FindObject('SmensRepQuery') as TfrxFIBQuery;

          with FIBQuery1 do
          begin
            SQL.Clear;
            SQL.Add('select P.NCHECK, P.ITEM, T.TOVAR_NAME, P.SALE_PRICE, P.PAY_TYPE, SUM(P.KOLVO) AS KOLVO, P.SALE_DATE, P.NCARD');
            SQL.Add('from POS_SALES P left join SPR_TOVAR T on P.ITEM = T.ITEM');
            SQL.Add('where SALE_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                  + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
            if MarketHide.Count > 0 then
              SQL.Add('and MARKET_CODE in (' + GetMarketFltrStr(MarketShow) + ')');
            SQL.Add('group by P.NCHECK, P.SALE_DATE, P.ITEM, T.TOVAR_NAME, P.SALE_PRICE, P.SALE_DATE, P.NCARD, P.PAY_TYPE');
            SQL.Add('order by P.SALE_DATE, P.NCHECK,P.NCARD, P.ITEM');
          end;

          Script.Variables['BEGD']:= DateTimeToStr(DateTimePicker1.Date);
          Script.Variables['ENDD']:= DateTimeToStr(DateTimePicker2.Date);
          Script.Variables['OBJNAME']:= StaticText2.Caption;
//          Title:= 'Журнал продаж';
          ShowReport;
        end;
end;

procedure TSmensRepFrm.N1Click(Sender: TObject);
begin
  if MessageDlg('Удалить кассовую смену ?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
  begin
    ShopMainForm.pFIBDatabase1.Execute('delete from HDR_SMENS where SMENS_KOD = '
      + IntToStr(pFIBDataSet1['SMENS_KOD']));
    ShopMainForm.pFIBTransaction1.CommitRetaining;
    pFIBDataSet1.Refresh;  
  end;
end;

procedure TSmensRepFrm.Edit1Change(Sender: TObject);
begin
      BitBtn1.Enabled:= Edit1.Text <> '';
end;

procedure TSmensRepFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if not(Key in [#8, '0'..'9'])then Key:= #0;
end;

procedure TSmensRepFrm.BitBtn1Click(Sender: TObject);
begin
      Application.CreateForm(TMoveTovarShowFrm, MoveTovarShowFrm);
      MoveTovarShowFrm.Edit1.Text:= Edit1.Text;
      MoveTovarShowFrm.DateTimePicker1.DateTime:= DateTimePicker1.DateTime;
      MoveTovarShowFrm.DateTimePicker2.DateTime:= DateTimePicker2.DateTime;
      MoveTovarShowFrm.ComboBox1.ItemIndex:= 0;
      MoveTovarShowFrm.ShowModal;
      MoveTovarShowFrm.Free;
end;

procedure TSmensRepFrm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      case Key of
       VK_RETURN : BitBtn1.Click;
       VK_INSERT : Edit1.Text:= ChangeWithCat;
      end;
end;

procedure TSmensRepFrm.ComboBox1Change(Sender: TObject);
begin
    ChangeMarket;
end;

procedure TSmensRepFrm.ChangeMarket;
begin
    with pFIBDataSet1 do
    begin
      DisableControls;
      Close;
      if MarketHide.Count = 0 then SelectSQL[3]:= ''
      else SelectSQL[3]:= 'where S.MARKET_CODE in (' + GetMarketFltrStr(MarketShow) + ')';
      Open;
      Last;
      EnableControls;
    end;
end;

procedure TSmensRepFrm.BitBtn2Click(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
      with ShopMainForm.frxReport1 do
      begin
        LoadFromFile(ShopIni.ReadString('Reports', 'Sales003', ReportsPath + 'SmensSale003.fr3'));
        FIBQuery1:= FindObject('SmensRepQuery') as TfrxFIBQuery;

        with FIBQuery1 do
        begin
          SQL.Clear;
          SQL.Add('select P.ITEM, G.GROUP_NAME, T.TOVAR_NAME, '
             + 'SUM(P.KOLVO + 2*P.KOLVO*(CAST(P.NCARD as INTEGER)))SKOLVO,');
          if CheckBox1.Checked then SQL.Add('(P.COST_PRICE)SALE_PRICE')
          else SQL.Add('P.SALE_PRICE');
          SQL.Add('from POS_SALES P left join SPR_TOVAR T on P.ITEM = T.ITEM');
          SQL.Add('left join SPR_GROUP G on T.T_GROUP = G.T_GROUP');
          SQL.Add('where SALE_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
          if MarketHide.Count > 0 then
            SQL.Add('and MARKET_CODE in (' + GetMarketFltrStr(MarketShow) + ')');
          if ComboBox2.ItemIndex > 0 then
            SQL.Add('and T.T_GROUP = ' + IntToStr(FindGroupCode(ComboBox2.Text)));
          SQL.Add('and CAST(P.NCARD as INTEGER) <= 0');
          if CheckBox1.Checked then
            SQL.Add('group by G.GROUP_NAME, P.ITEM, P.COST_PRICE, T.TOVAR_NAME')
          else SQL.Add('group by G.GROUP_NAME, P.ITEM, P.SALE_PRICE, T.TOVAR_NAME');
          SQL.Add('order by G.GROUP_NAME');
        end;

        Script.Variables['BEGD']:= DateTimeToStr(DateTimePicker1.DateTime);
        Script.Variables['ENDD']:= DateTimeToStr(DateTimePicker2.DateTime);
        Script.Variables['OBJNAME']:= StaticText2.Caption;
//            Title:= 'Продажи по группам';
        ShowReport;
      end;
end;

procedure TSmensRepFrm.BitBtn3Click(Sender: TObject);
begin
  with ShopMainForm.frxReport1 do
  begin
    LoadFromFile(ShopIni.ReadString('Reports', 'Sales005', ReportsPath + 'SmensSale005.fr3'));
    Script.Variables['BEGD']:= DateTimeToStr(DateTimePicker1.DateTime);
    Script.Variables['ENDD']:= DateTimeToStr(DateTimePicker2.DateTime);
    Script.Variables['MARKET_ID']:= GetMarketFltrStr(MarketShow);//FindMarketCode(ComboBox1.Text);
    Script.Variables['OBJNAME']:= StaticText2.Caption;
    ShowReport;
  end;
end;

procedure TSmensRepFrm.BitBtn4Click(Sender: TObject);
begin
      PopupMenu2.Popup(SmensRepFrm.Left + BitBtn4.Left + 10,
          SmensRepFrm.Top + BitBtn4.Top + BitBtn4.Height + 20);
end;
procedure TSmensRepFrm.AddRepClick(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
  with ShopMainForm.frxReport1 do
  begin
    LoadFromFile(ReportsPath + 'SMENS_ADD\' + (Sender as TMenuItem).Caption + '.fr3');
    Script.Variables['BEGD']:= DateTimeToStr(DateTimePicker1.DateTime);
    Script.Variables['ENDD']:= DateTimeToStr(DateTimePicker2.DateTime);
    Script.Variables['OBJNAME']:= StaticText2.Caption;
    Script.Variables['MARKET_FILTER']:= GetMarketFltrStr(MarketShow);
    Script.Variables['T_GROUP']:= IntToStr(FindGroupCode(ComboBox2.Text));
    Script.Variables['MARKET_ID']:= GetMarketFltrStr(MarketShow);
    ShowReport;
  end;
end;
end.
