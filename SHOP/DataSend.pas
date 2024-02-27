//****************************************************************************//
//                            © Guard  2003-2023                              //
//****************************************************************************//
unit DataSend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, StdCtrls, CheckLst, IniFiles, FIBQuery,
  pFIBQuery, FIBDataSet, pFIBDataSet, ExtCtrls, Buttons, DBClient, Provider,
  Grids, DBGrids, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, IdFTPCommon, IdFTPList,
  IdAllFTPListParsers, FIBDatabase, pFIBDatabase;

type
  TDataSendFrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    CheckListBox2: TCheckListBox;
    OpenDialog1: TOpenDialog;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    MarketComboBox: TComboBox;
    Label6: TLabel;
    Label5: TLabel;
    LMDButton1: TBitBtn;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    LMDButton3: TBitBtn;
    LMDButton4: TBitBtn;
    ComboBox1: TComboBox;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    CheckListBox1: TCheckListBox;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    SaveDialog1: TSaveDialog;
    Edit2: TEdit;
    Label12: TLabel;
    BitBtn2: TBitBtn;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    Label13: TLabel;
    Label14: TLabel;
    GroupComboBox: TComboBox;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    BitBtn3: TBitBtn;
    pFIBDataSet2: TpFIBDataSet;
    pFIBDataSet1: TpFIBDataSet;
    ComboBox3: TComboBox;
    pFIBQuery1: TpFIBQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    Panel2: TPanel;
    Memo2: TMemo;
    OpenFTPBitBtn: TBitBtn;
    TabSheet4: TTabSheet;
    Panel4: TPanel;
    CheckListBox3: TCheckListBox;
    BitBtn4: TBitBtn;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDataSet3: TpFIBDataSet;
    pFIBQuery2: TpFIBQuery;
    procedure LMDButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LMDFileOpenEdit1Change(Sender: TObject);
    procedure LMDButton3Click(Sender: TObject);
    procedure MarketComboBoxChange(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure LMDButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure DateTimePicker6Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure OpenFTPBitBtnClick(Sender: TObject);
    procedure OpenSendFile(SendFileName: String);
    procedure BitBtn4Click(Sender: TObject);
  private
    TransferrignData: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataSendFrm: TDataSendFrm;
  SndIni: TIniFile;
  DestObj: Integer;
  
function MakeDisk(const DirCnt: Integer = 0; const SHMess: Boolean = True): Integer;
function CheckFileNum2Disk(const FileName: String; const Drive: Byte = 1): Integer;

implementation

uses ShopMain, FTPFileLoad;

{$R *.dfm}

procedure TDataSendFrm.LMDButton1Click(Sender: TObject);
var LastTransmit: TDateTime;
    PCnt, RCnt, i,j: Integer;
    SendName, SQLStr: String;
    f: TextFile;
begin // XML версия
     try
       Screen.Cursor:= crHourGlass;
       LMDButton1.Enabled:= False;
       GroupBox2.Enabled:= False;
       GroupBox1.Enabled:= False;
       ProgressBar1.Visible:= True;
       for PCnt:= 0 to CheckListBox2.Count - 1 do CheckListBox2.Checked[PCnt] := False;
       LastTransmit:= DateTimePicker1.DateTime;
       DestObj:= FindMarketCode(MarketComboBox.Text);
       i:= 0;

       AssignFile(f, ExtractFilePath(ParamStr(0)) + 'transfer.log');
       Rewrite(f);
       DataSetProvider1.DataSet:= pFIBDataSet2;
{*********************************************************************************
                        Передача справочника пользователей
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from SPR_USERS');
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Spr_Users.xml', dfXML);
           Active:= False;
         end;
         Close;
         Writeln(f, 'Справочник пользователей');
       end;

       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from USER_SETINGS where AUTOR_KOD = -1 and SECTION = ''ACCESS''');
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'User_Access.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
         Writeln(f, 'Справочник прав пользователей');
       end;
{*********************************************************************************}

{*********************************************************************************
                        Передача справочника объектов
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from SPR_MARKET');
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Spr_Market.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
         Writeln(f, 'Справочник объектов');
       end;
{*********************************************************************************}

{*********************************************************************************
                        Передача справочника дисконтных карт
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from CLIENTS order by NCARD');
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Clients.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
         Writeln(f, 'Справочник дисконтных карт');
       end;
{*********************************************************************************}

{*********************************************************************************
                        Передача справочника групп учёта
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from SPR_ACOUNT');
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Spr_Acount.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
         Writeln(f, 'Справочник групп учета');
       end;
{*********************************************************************************}

{*********************************************************************************
                        Передача справочника групп товаров
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from SPR_GROUP');
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Spr_Group.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
         Writeln(f, 'Справочник групп товаров');
       end;
{*********************************************************************************}

{*********************************************************************************
                        Передача справочника поставщиков
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from SPR_VENDORS');
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Spr_Vendors.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
         Writeln(f, 'Справочник поставщиков');
       end;
{*********************************************************************************}

{*********************************************************************************
                        Передача справочника покупателей
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from SPR_BUYERS');
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Spr_Buyers.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
         Writeln(f, 'Справочник покупателей');
       end;
{*********************************************************************************}

{*********************************************************************************
                        Передача справочника ед.измерения
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from SPR_UNITS');
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Spr_Units.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
         Writeln(f, 'Справочник ед.измерения');
       end;
{*********************************************************************************}

{*********************************************************************************
                        Передача справочника товаров
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select T.ITEM, T.TOVAR_NAME, T.T_GROUP, T.LAST_UPD, T.KKM_SECT, T.VENDOR_CODE, '
         + 'T.AUTOR_KOD, T.REMARK, T.UNIT_KOD, T.ARTIKUL, T.PRODUCER, T.REMARK_1, T.VEND_ITEM, '
         + 'P.SALE_PRICE, P.PRICE_1, P.PRICE_1_TAG, P.PRICE_2, P.PRICE_2_TAG, P.PRICE_3, P.PRICE_3_TAG, '
         + 'P.PRICE_4, P.PRICE_4_TAG, P.PRICE_5, P.PRICE_5_TAG, P.PRICE_6, P.PRICE_6_TAG, P.PRICE_7, '
         + 'P.PRICE_7_TAG, P.PRICE_8, P.PRICE_8_TAG, P.PRICE_9, P.PRICE_9_TAG, P.VEND_PRICE, P.PRICE_TYPE, '
         + 'CP.CST_PRICE_1, CP.CST_PRICE_1_TAG, CP.CST_PRICE_1_TYPE, CP.CST_PRICE_2, CP.CST_PRICE_2_TAG, CP.CST_PRICE_2_TYPE, '
         + 'CP.CST_PRICE_3, CP.CST_PRICE_3_TAG, CP.CST_PRICE_3_TYPE '
         + 'from SPR_TOVAR T left join PRICES P on T.ITEM = P.ITEM and P.MARKET_CODE = ' + IntToStr(CurrentMarketCode)
         + ' left join CST_PRICES CP on T.ITEM = CP.ITEM ');
         case ComboBox3.ItemIndex of
           0: SelectSQL.Add('where T.LAST_UPD > ''' + DateTimeToStr(LastTransmit) + '''');
           1: SelectSQL.Add('where T.ITEM in (select distinct ITEM from TOVAR_OST)');
         end;
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Spr_Tovar.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
         Writeln(f, 'Справочник товаров + цены + доп.цены');
       end;
{*********************************************************************************}
{*********************************************************************************
                        Передача справочника норм наценки
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from SPR_CHARGE C');
         SelectSQL.Add('left join SPR_TOVAR T on C.ITEM = T.ITEM');
         case ComboBox3.ItemIndex of
           0: SelectSQL.Add('where T.LAST_UPD > ''' + DateTimeToStr(LastTransmit) + '''');
           1: SelectSQL.Add('where C.ITEM in (select distinct ITEM from TOVAR_OST)');
         end;
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Spr_Charge.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
         Writeln(f, 'Справочник норм наценки');
       end;
{*********************************************************************************}
{*********************************************************************************
                        Передача справочника норм остатков
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from SPR_NORM_OST');
//         SelectSQL.Add('where ITEM in (select ITEM from SPR_TOVAR where LAST_UPD > ''' + DateTimeToStr(LastTransmit) + ''')');
         if MarketComboBox.ItemIndex > 0 then
//           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
           SelectSQL.Add('where MARKET_CODE = ' + IntToStr(DestObj));
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Spr_Norm_Ost.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
         Writeln(f, 'Справочник норм остатков');
       end;
{*********************************************************************************}
{*********************************************************************************
                        Передача приходных накладных
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from HDR_PRIHOD');
         SelectSQL.Add('where LAST_UPD > ''' + DateTimeToStr(LastTransmit) + '''');
         if MarketComboBox.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Hdr_Prihod.xml', dfXML);
           Active:= False;
         end;
         Close;
         SelectSQL.Clear;
         SelectSQL.Add('select * from POS_PRIHOD');
         SelectSQL.Add('where KOD in (select KOD from HDR_PRIHOD where LAST_UPD > '''
           + DateTimeToStr(LastTransmit) + '''');
         if MarketComboBox.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         SelectSQL.Add(')');
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Pos_Prihod.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
       end;
{*********************************************************************************}
{*********************************************************************************
                        Передача расходных накладных
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from HDR_RASHOD');
         SelectSQL.Add('where LAST_UPD > ''' + DateTimeToStr(LastTransmit) + '''');
         if MarketComboBox.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         Open;
         Writeln(f, 'Расходные накладные');
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Hdr_Rashod.xml', dfXML);
           Active:= False;
         end;
         Close;
         SelectSQL.Clear;
         SelectSQL.Add('select * from POS_RASHOD');
         SelectSQL.Add('where KOD in (select KOD from HDR_RASHOD where LAST_UPD > '''
           + DateTimeToStr(LastTransmit) + '''');
         if MarketComboBox.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         SelectSQL.Add(')');
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Pos_Rashod.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
       end;
{*********************************************************************************}

{*********************************************************************************
                        Передача переоценок
*********************************************************************************}
     CheckListBox2.Selected[i]:= True;
     if CheckBox1.Checked then
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from PRICE_CHANGE');
         SelectSQL.Add('where P_DATE > ''' + DateTimeToStr(LastTransmit) + '''');
         if MarketComboBox.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Price_Change.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Writeln(f, 'Переоценки');
       end;
     Inc(i);
{*********************************************************************************}

{*********************************************************************************
                        Передача кассовых смен
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from HDR_SMENS');
         SelectSQL.Add('where END_DATETIME > ''' + DateTimeToStr(LastTransmit) + '''');
         if MarketComboBox.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         Open;
         Writeln(f, 'Кассовые смены');
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Hdr_Smens.xml', dfXML);
           Active:= False;
         end;
         Close;
         SelectSQL.Clear;
         SelectSQL.Add('select * from POS_SALES');
         SelectSQL.Add('where SMENS_KOD in ');
         SelectSQL.Add('(select SMENS_KOD from HDR_SMENS');
         SelectSQL.Add('where END_DATETIME > ''' + DateTimeToStr(LastTransmit) + '''');
         if MarketComboBox.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         SelectSQL.Add(')');
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Pos_Sales.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
       end;
{*********************************************************************************}

{*********************************************************************************
                               Передача учётов
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from UCHET');
         SelectSQL.Add('where SAVE_DATE > ''' + DateTimeToStr(LastTransmit) + '''');
         if MarketComboBox.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Uchet.xml', dfXML);
           Active:= False;
         end;
         Close;
         FormatSettings.DecimalSeparator:= TmpSep;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
       end;
{*********************************************************************************}

{*********************************************************************************
                               Передача справочника атрибутов
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from SPR_TOVAR_ATTR');
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Spr_Tovar_Attr.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
       end;
{*********************************************************************************}
{*********************************************************************************
                               Передача атрибутов товаров
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from TOVAR_ATR order by ATR_ID');
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Tovar_Atr.xml', dfXML);
           Active:= False;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
       end;
{*********************************************************************************}
{*********************************************************************************
                        Передача справочника остатков
*********************************************************************************}
// XML
       CheckListBox2.Selected[i]:= True;
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select * from TOVAR_OST');
         if CurrentMarketType <> 0 then
         begin
           if CurrentMarketType <> 0 then SelectSQL.Add('where MARKET_CODE = ' + IntToStr(DestObj));
         end
         else
           SelectSQL.Add('where MARKET_CODE <> ' + IntToStr(DestObj));
         Open;
         with ClientDataSet1 do
         begin
           Active:= True;
           SaveToFile(ExtractFilePath(ParamStr(0)) + 'Tovar_ost.xml', dfXML);
           Active:= False;
         end;
         Close;
       end;

// ВНЕШНЯЯ ТАБЛИЦА FIREBIRD
{         with ShopMainForm.pFIBDatabase1 do
         begin
           Execute('CREATE TABLE EXT_TOVAR_OST external file '''
             + ExtractFilePath(ParamStr(0)) + 'ext_ost.dat'''
             + '( MARKET_CODE INTEGER, ITEM VARCHAR(14), KOLVO DOUBLE PRECISION, DOC_DATE TIMESTAMP ,'
             + 'VEND_PRICE DOUBLE PRECISION, VENDOR_CODE INTEGER )');
           Execute('insert into EXT_TOVAR_OST select * from TOVAR_OST');
           Execute('drop table EXT_TOVAR_OST');
         end;}

// КЭШ FIBPlus
         pFIBQuery1.SQL.Add('select MARKET_CODE, ITEM, KOLVO, DOC_DATE, VEND_PRICE, '
           + 'VENDOR_CODE from TOVAR_OST');
         if CurrentMarketType <> 0 then
         begin
           if CurrentMarketType <> 0 then pFIBQuery1.SQL.Add('where MARKET_CODE = ' + IntToStr(DestObj));
         end
         else  pFIBQuery1.SQL.Add('where MARKET_CODE <> ' + IntToStr(DestObj));
         if not ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.StartTransaction;
         pFIBQuery1.BatchOutputRawFile(ExtractFilePath(ParamStr(0)) + 'Tovar_ost.fib');
         pFIBQuery1.Close;

         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
         CheckListBox2.Checked[i]:= True;
         Inc(i);
         Writeln(f, 'Остатки по объектам');
         ProgressBar1.Position:= ProgressBar1.Min;
{*********************************************************************************}

       CheckListBox2.Selected[CheckListBox2.Items.Count - 1]:= False;
       ProgressBar1.Visible:= False;
       CloseFile(f);
       SndIni:= TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'transfer.ini');
       SndIni.WriteInteger('Main', 'Market_Code', DestObj);
       SndIni.WriteInteger('Main', 'Autor_Kod', User_ID);
       SndIni.WriteDateTime('Main', 'SndDateTime', Now);
       SndIni.WriteDateTime('Main', 'BeginDateTime', DateTimePicker1.DateTime);
       SndIni.WriteBool('Main', 'Pereocen', CheckBox1.Checked);
       SndIni.UpdateFile;
       SndIni.Free;

       if DestObj = CurrentMarketCode then SendName:= 'r_'
       else SendName:= 's_';
       if BaseReadBool('TRANSMIT', 'ShortNameSend', True, -1) then   // ShopIni.ReadBool('Transmit', 'ShortNameSend', False)
       begin
         if MarketComboBox.ItemIndex > 0 then
           SendName:= SendName + IntToStr(DestObj) + '.zip'
         else SendName:= 'A_' + IntToStr(DestObj) + '.zip';
       end
       else
       begin
         if MarketComboBox.ItemIndex > 0 then
           SendName:= SendName + IntToStr(DestObj) + FormatDateTime('_yymmdd', Now) + '.zip'
         else SendName:= SendName + 'ALL' + FormatDateTime('_yymmdd', Now) + '.zip';
       end;
       SendName:= BaseReadString('TRANSMIT', 'SendPath', ExtractFilePath(ParamStr(0)) + 'Send\', -1) + SendName;

       // Упаковка базы для передачи  ZipForge
       with ShopMainForm.ZipForge1 do
       begin
         FileName:= SendName;
         OpenArchive(fmCreate);
         BaseDir:= ExtractFilePath(ParamStr(0));
         AddFiles(ExtractFilePath(ParamStr(0)) + 'transfer.ini');
         AddFiles(ExtractFilePath(ParamStr(0)) + 'transfer.log');
         AddFiles(ExtractFilePath(ParamStr(0)) + 'shop.err');
         AddFiles(ExtractFilePath(ParamStr(0)) + 'kkm_log.err');
         AddFiles(ExtractFilePath(ParamStr(0)) + 'shop.log');
         AddFiles(ExtractFilePath(ParamStr(0)) + '*.xml');
         AddFiles(ExtractFilePath(ParamStr(0)) + 'Tovar_ost.fib');
         CloseArchive();
       end;



       DelExists(ExtractFilePath(ParamStr(0)) + 'transfer.log');
       DelExists(ExtractFilePath(ParamStr(0)) + 'transfer.ini');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Clients.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Hdr_Prihod.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Hdr_Rashod.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Hdr_Smens.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Price_Change.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Pos_Prihod.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Pos_Rashod.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Pos_Sales.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Spr_Acount.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Spr_Buyers.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Spr_Charge.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Spr_Group.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Spr_Market.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Spr_Norm_Ost.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Spr_Tovar.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Spr_Units.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Spr_Users.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'User_Access.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Spr_Vendors.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Uchet.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Tovar_ost.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Tovar_ost.fib');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Spr_Tovar_Attr.xml');
       DelExists(ExtractFilePath(ParamStr(0)) + 'Tovar_Atr.xml');
       ShopIni.WriteDateTime('Transmit', IntToStr(DestObj) + 'LastDate', Now);
       BaseWriteDateTime('TRANSMIT', IntToStr(DestObj) + 'LastDate', Now, -1);


      // Копирование файла обмена на диск А:
       case ComboBox1.ItemIndex of
        0: begin
             i:= CheckFileNum2Disk(SendName);
             if i > 0 then
               if MakeDisk(i - 1) = 0 then
               begin
                 CopyFile(PChar(SendName), PChar('a:\' + SendName), False);
                 for j:= 1 to i - 1 do
                   CopyFile(PChar(SendName), PChar('a:\' + IntToStr(j) + '\' + SendName), False);
               end;
               MessageDlg('Данные для передачи скопированны на диск А:', mtInformation, [mbOK], 0);
           end;
        1: begin
             CopyFile(PChar(SendName),
               PChar(BaseReadString('TRANSMIT', 'MailBox' + IntToStr(DestObj),
                ShopIni.ReadString('Transmit', 'PenDrive', 'c:\'), -1) + SendName), False);
             MessageDlg('Данные для передачи скопированны в папку обмена', mtInformation, [mbOK], 0);
           end;
        2: MessageDlg('Файл для передачи сформирован и находится в директории:'+#13#10
                + '''' + BaseReadString('TRANSMIT', 'SendPath',
                  ExtractFilePath(ParamStr(0))+ 'Send', -1) + ''''
                , mtInformation, [mbOK], 0);
        3: begin // передаем на FTP
             with ShopMainForm.IdFTP1 do
             begin
               TransferType:= ftBinary;
               Connect;
               try
                ChangeDir(FTPSendDir);
                Put(SendName, ExtractFileName(SendName), False);
               finally
                Disconnect;
               end;
                MessageDlg('Данные для передачи скопированны в папку обмена FTP', mtInformation, [mbOK], 0);
             end;
           end;
       end;
       DateTimePicker1.DateTime:= Now;
       DateTimePicker2.DateTime:= Now;
       LMDButton1.Enabled:= True;
       GroupBox2.Enabled:= True;
       GroupBox1.Enabled:= True;
    finally
       Screen.Cursor:= crDefault;
       FormatSettings.DecimalSeparator:= TmpSep;
    end;
end;

procedure TDataSendFrm.FormCreate(Sender: TObject);
var j,i: Integer;
begin
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_MARKET');
          SelectSQL.Add('order by SHORT_NAME');
          Open;
          MarketComboBox.Items.Clear;
          MarketComboBox.Items.Add('!Все объекты');
          i:= 0;
          while not Eof do
          begin
            j:= MarketComboBox.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);
            if ShopMainForm.pFIBService['MARKET_CODE'] = CurrentMarketCode then
              i:= j;
            Next;
          end;
          Close;
          MarketComboBox.ItemIndex:= i;
          ComboBox2.Items:= MarketComboBox.Items;
          ComboBox2.ItemIndex:= i;
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_GROUP');
          SelectSQL.Add('order by GROUP_NAME');
          Open;
          GroupComboBox.Items.Clear;
          GroupComboBox.Items.Add('!Не использовать');
          while not Eof do
          begin
            GroupComboBox.Items.Add(ShopMainForm.pFIBService['GROUP_NAME']);
            Next;
          end;
          Close;
          GroupComboBox.ItemIndex:= 0;
          
          if CurrentMarketType = 2 then
          begin
            CheckBox1.Visible:= False;
            CheckBox1.Checked:= True;
            MarketComboBox.Visible:= False;
            ComboBox3.Visible:= False;
            Label6.Visible:= False;
            DateTimePicker1.DateTime:= ShopIni.ReadDateTime('Transmit', IntToStr(DestObj) + 'LastDate', Now);
            DateTimePicker2.DateTime:= DateTimePicker1.DateTime;
          end;
          MarketComboBoxChange(MarketComboBox);
        end;
        DateTimePicker4.DateTime:= Now;
        DateTimePicker6.DateTime:= Now;
        DateTimePicker3.DateTime:= Now;
        DateTimePicker5.DateTime:= Now;
        OpenDialog1.InitialDir:= ShopIni.ReadString('Transmit', 'LoadPath', ExtractFilePath(ParamStr(0))+ 'Send\');

        ComboBox1.ItemIndex:= ShopIni.ReadInteger('Transmit', 'Copy', 2);
        OpenFTPBitBtn.Visible:= ShopIni.ReadBool('Transmit', 'FTPEnable', False);
        if not OpenFTPBitBtn.Visible then
        begin
          if ComboBox1.ItemIndex = 3 then ComboBox1.ItemIndex:= 2;
          ComboBox1.Items.Delete(3);
          LMDButton4.Left:= OpenFTPBitBtn.Left;
          LMDButton4.Width:= LMDButton4.Width + OpenFTPBitBtn.Width;
        end;

end;

procedure TDataSendFrm.LMDFileOpenEdit1Change(Sender: TObject);
begin
        Panel2.Visible:= False;
        LMDButton3.Enabled:= False;
end;

procedure TDataSendFrm.LMDButton3Click(Sender: TObject);
var i,j,DocKod: Integer;
    notMainObj, DisplayProgress: Boolean;
    S: String;
    ProcTime: Longint;
begin  // Приём данных
       ProcTime:= GetTickCount;
       DisplayProgress:= True;
       i:= 0;
       for j:= 0 to CheckListBox2.Items.Count - 1 do
         CheckListBox2.Checked[j]:= False;
       CheckListBox2.MultiSelect:= False;
       Screen.Cursor:= crHourGlass;
       LMDButton3.Enabled:= False;
       GroupBox1.Enabled:= False;
       GroupBox2.Enabled:= False;
       notMainObj:= CurrentMarketType <> 0;
       DelExists(ExtractFilePath(ParamStr(0)) + 'recive.log');

       with ShopMainForm.pFIBDatabase1 do
       begin
         Execute('ALTER TRIGGER SPR_BUYERS_BI INACTIVE;');

         Execute('ALTER TRIGGER SPR_TOVAR_BI INACTIVE;');
         Execute('ALTER TRIGGER SPR_TOVAR_BU INACTIVE;');

         Execute('ALTER TRIGGER HDR_PRIHOD_BU INACTIVE;');
         Execute('ALTER TRIGGER HDR_PRIHOD_BI INACTIVE;');

         Execute('ALTER TRIGGER HDR_RASHOD_BU INACTIVE;');
         Execute('ALTER TRIGGER HDR_RASHOD_BI INACTIVE;');
//         Execute('ALTER TRIGGER POS_RASHOD_BI0 INACTIVE;');

         Execute('ALTER TRIGGER HDR_SMENS_BI INACTIVE;');
         Execute('ALTER TRIGGER SPR_TOVAR_ATTR_BI0 INACTIVE;');
//         Execute('ALTER TRIGGER POS_SALES_BI0 INACTIVE;');
         ShopMainForm.pFIBTransaction1.Commit;
         SprFrmFree;
       end;
       ProgressBar1.Visible:= True;

    try
{*********************************************************************************
                        Приём справочника пользователей
*********************************************************************************}
     CheckListBox2.Selected[i]:= True;
     if notMainObj then // Если объект НЕ ГЛАВНЫЙ обрабатываем справочник пользователей
       if FileExists(GetSYSTempPath + 'Spr_Users.xml') then
       begin
         with ClientDataSet1 do
         begin
           LoadFromFile(GetSYSTempPath + 'Spr_Users.xml');
           Open;
           ProgressBar1.Max:= RecordCount;
           ProgressBar1.Position:= ProgressBar1.Min;
           pFIBQuery1.SQL.Clear;
           pFIBQuery1.SQL.Add('update or insert into SPR_USERS(AUTOR_KOD, NAME, USR_PASSW, USR_ROLE, FR_PASSW)'
                   + 'values(:AUTOR_KOD, :NAME, :USR_PASSW, :USR_ROLE, :FR_PASSW) matching(AUTOR_KOD)');
           pFIBQuery1.Prepare;

           while not Eof do
           begin
             pFIBQuery1.ParamByName('AUTOR_KOD').AsInteger:= ClientDataSet1['AUTOR_KOD'];
             pFIBQuery1.ParamByName('NAME').AsString:= ClientDataSet1['NAME'];
             pFIBQuery1.ParamByName('USR_PASSW').AsString:= ClientDataSet1['USR_PASSW'];
             pFIBQuery1.ParamByName('USR_ROLE').AsInteger:= ClientDataSet1['USR_ROLE'];
             pFIBQuery1.ParamByName('FR_PASSW').AsInteger:= ClientDataSet1['FR_PASSW'];
             pFIBQuery1.ExecQuery;

             if DisplayProgress then
             begin
               ProgressBar1.StepIt;
               Application.ProcessMessages;
             end;
             Next;
           end;
           Close;

           CheckListBox2.State[i]:= cbChecked;
           SaveToLog('Принят ' + GetSYSTempPath + 'Spr_Users.xml', 'recive.log');
         end;
       end
       else
       begin
         SaveToLog('Не найден ' + GetSYSTempPath + 'Spr_Users.xml', 'recive.log');
         CheckListBox2.State[i]:= cbGrayed;
       end;

       if FileExists(GetSYSTempPath + 'User_Access.xml') then
       begin   // Обрабатываем справочник прав пользователей
         with ClientDataSet1 do
         begin
           LoadFromFile(GetSYSTempPath + 'User_Access.xml');
           Open;
           ProgressBar1.Max:= RecordCount;
           ProgressBar1.Position:= ProgressBar1.Min;
           pFIBQuery1.SQL.Clear;
           pFIBQuery1.SQL.Add('update or insert into USER_SETINGS(AUTOR_KOD, SECTION, KEY_NAME, KEY_VALUE)'
                   + 'values(:AUTOR_KOD, :SECTION, :KEY_NAME, :KEY_VALUE) matching(AUTOR_KOD, SECTION, KEY_NAME)');
           pFIBQuery1.Prepare;

           while not Eof do
           begin
             pFIBQuery1.ParamByName('AUTOR_KOD').AsInteger:= ClientDataSet1['AUTOR_KOD'];
             pFIBQuery1.ParamByName('SECTION').AsString:= ClientDataSet1['SECTION'];
             pFIBQuery1.ParamByName('KEY_NAME').AsString:= ClientDataSet1['KEY_NAME'];
             pFIBQuery1.ParamByName('KEY_VALUE').AsString:= ClientDataSet1['KEY_VALUE'];
             pFIBQuery1.ExecQuery;

             if DisplayProgress then
             begin
               ProgressBar1.StepIt;
               Application.ProcessMessages;
             end;
             Next;
           end;
           Close;

           CheckListBox2.State[i]:= cbChecked;
           SaveToLog('Принят ' + GetSYSTempPath + 'User_Access.xml', 'recive.log');
         end;
       end
       else
       begin
         SaveToLog('Не найден ' + GetSYSTempPath + 'User_Access.xml', 'recive.log');
         CheckListBox2.State[i]:= cbGrayed;
       end;

       Inc(i);
       Application.ProcessMessages;
       ProgressBar1.Visible:= True;
       ProgressBar1.Position:= ProgressBar1.Min;
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника объектов
*********************************************************************************}
     CheckListBox2.Selected[i]:= True;
     if notMainObj then // Если объект НЕ ГЛАВНЫЙ обрабатываем справочник
       if FileExists(GetSYSTempPath + 'Spr_Market.xml') then
       begin
         with ClientDataSet1 do
         begin
           LoadFromFile(GetSYSTempPath + 'Spr_Market.xml');
           Open;
           ProgressBar1.Max:= RecordCount;
           ProgressBar1.Position:= ProgressBar1.Min;
           pFIBQuery1.SQL.Clear;
           pFIBQuery1.SQL.Add('update or insert into SPR_MARKET(MARKET_CODE, SHORT_NAME, MARKET_NAME, '
                   + 'MARKET_ADR, MARKET_TYPE)values(:MARKET_CODE, :SHORT_NAME, :MARKET_NAME, '
                   + ':MARKET_ADR, :MARKET_TYPE) matching(MARKET_CODE)');
           pFIBQuery1.Prepare;
           while not Eof do
           begin
             pFIBQuery1.ParamByName('MARKET_CODE').AsInteger:= ClientDataSet1['MARKET_CODE'];
             pFIBQuery1.ParamByName('SHORT_NAME').AsString:= ClientDataSet1['SHORT_NAME'];
             pFIBQuery1.ParamByName('MARKET_NAME').AsString:= ClientDataSet1['MARKET_NAME'];
             pFIBQuery1.ParamByName('MARKET_ADR').AsString:= ClientDataSet1['MARKET_ADR'];
             pFIBQuery1.ParamByName('MARKET_TYPE').AsInteger:= ClientDataSet1['MARKET_TYPE'];
             pFIBQuery1.ExecQuery;
             if DisplayProgress then
             begin
               ProgressBar1.StepIt;
               Application.ProcessMessages;
             end;
             Next;
           end;
           Close;
           CheckListBox2.Checked[i]:= True;
         end;
       end
       else
       begin
         SaveToLog('Не найден ' + GetSYSTempPath + 'Spr_Market.xml', 'recive.log');
         CheckListBox2.State[i]:= cbGrayed;
       end;
       ProgressBar1.Position:= ProgressBar1.Min;
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       Application.ProcessMessages;
       Inc(i);
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника дисконтных карт
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       if FileExists(GetSYSTempPath + 'Clients.xml') then
         with ClientDataSet1 do
         begin
           LoadFromFile(GetSYSTempPath + 'Clients.xml');
           Open;
           ProgressBar1.Max:= RecordCount;
           ProgressBar1.Position:= ProgressBar1.Min;
             with ShopMainForm.pFIBService do
             begin
               SelectSQL.Clear;
               SelectSQL.Add('select NCARD from CLIENTS where NCARD = :NCARD');
               Prepare;
             end;
             pFIBQuery1.SQL.Clear;
             pFIBQuery1.SQL.Add('update or insert into CLIENTS(NCARD, PRICE, NAME, FAMILIA, OTCHESTVO, ADRES, PHONE)'
                     + 'values(:NCARD, :PRICE, :NAME, :FAMILIA, :OTCHESTVO, :ADRES, :PHONE) matching(NCARD)');
             pFIBQuery1.Prepare;
           if notMainObj then // Если объект НЕ ГЛАВНЫЙ обрабатываем весь справочник
           begin
             while not Eof do
             begin
               pFIBQuery1.ParamByName('NCARD').AsString:= ClientDataSet1['NCARD'];
               pFIBQuery1.ParamByName('PRICE').AsInteger:= ClientDataSet1['PRICE'];
               pFIBQuery1.ParamByName('NAME').AsString:= ClientDataSet1['NAME'];
               pFIBQuery1.ParamByName('FAMILIA').AsString:= ClientDataSet1['FAMILIA'];
               pFIBQuery1.ParamByName('OTCHESTVO').AsString:= ClientDataSet1['OTCHESTVO'];
               pFIBQuery1.ParamByName('ADRES').AsString:= ClientDataSet1['ADRES'];
               pFIBQuery1.ParamByName('PHONE').AsString:= ClientDataSet1['PHONE'];
               pFIBQuery1.ExecQuery;
               if DisplayProgress then
               begin
                 ProgressBar1.StepIt;
                 Application.ProcessMessages;
               end;
               Next;
             end;
           end
           else // Если объект ГЛАВНЫЙ добавляем новые
             while not Eof do
             begin
               ShopMainForm.pFIBService.ParamByName('NCARD').AsString:= ClientDataSet1['NCARD'];
               ShopMainForm.pFIBService.Open;
               if VarIsNull(ShopMainForm.pFIBService['NCARD'])then
               begin
                 pFIBQuery1.ParamByName('NCARD').AsString:= ClientDataSet1['NCARD'];
                 pFIBQuery1.ParamByName('PRICE').AsInteger:= ClientDataSet1['PRICE'];
                 pFIBQuery1.ParamByName('NAME').AsString:= ClientDataSet1['NAME'];
                 pFIBQuery1.ParamByName('FAMILIA').AsString:= ClientDataSet1['FAMILIA'];
                 pFIBQuery1.ParamByName('OTCHESTVO').AsString:= ClientDataSet1['OTCHESTVO'];
                 pFIBQuery1.ParamByName('ADRES').AsString:= ClientDataSet1['ADRES'];
                 pFIBQuery1.ParamByName('PHONE').AsString:= ClientDataSet1['PHONE'];
                 pFIBQuery1.ExecQuery;
               end;
               ShopMainForm.pFIBService.Close;
               if DisplayProgress then
               begin
                 ProgressBar1.StepIt;
                 Application.ProcessMessages;
               end;
               Next;
             end;
           Close;
           CheckListBox2.Checked[i]:= True;
         end
         else
         begin
           SaveToLog('Не найден ' + GetSYSTempPath + 'Clients.xml', 'recive.log');
           CheckListBox2.State[i]:= cbGrayed;
         end;
         Inc(i);
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника учётных групп
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Spr_Acount.xml');
         Open;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from SPR_ACOUNT');
             SelectSQL.Add('where KOD_ACOUNT = ' + IntToStr(ClientDataSet1['KOD_ACOUNT']));
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['KOD_ACOUNT'])then
             begin
               if notMainObj and
                  ((ShopMainForm.pFIBService['ACOUNT_NAME'] <> ClientDataSet1['ACOUNT_NAME'])or
                  (ShopMainForm.pFIBService['ACOUNT_TYPE'] <> ClientDataSet1['ACOUNT_TYPE']))then
                 ShopMainForm.pFIBDatabase1.Execute('update SPR_ACOUNT'
                   + ' set ACOUNT_NAME = ''' + ClientDataSet1['ACOUNT_NAME'] + ''','
                   + ' ACOUNT_TYPE = ' + IntToStr(ClientDataSet1['ACOUNT_TYPE'])
                   + ' where KOD_ACOUNT = ' + IntToStr(ClientDataSet1['KOD_ACOUNT']));
             end
             else
               ShopMainForm.pFIBDatabase1.Execute('insert into SPR_ACOUNT(KOD_ACOUNT, ACOUNT_NAME, ACOUNT_TYPE)'
                 + ' values(' + IntToStr(ClientDataSet1['KOD_ACOUNT']) + ', '''
                 + ClientDataSet1['ACOUNT_NAME'] + ''', ' + IntToStr(ClientDataSet1['ACOUNT_TYPE']) + ')');
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
       end;
       Inc(i);
       ProgressBar1.Position:= ProgressBar1.Min;
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       Application.ProcessMessages;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника групп товаров
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
{
         Execute('ALTER TRIGGER SPR_GROUP_BI INACTIVE;');
         Execute('ALTER TRIGGER SPR_GROUP_BU INACTIVE;');

         Execute('ALTER TRIGGER SPR_GROUP_BI ACTIVE;');
         Execute('ALTER TRIGGER SPR_GROUP_BU ACTIVE;');
}
         LoadFromFile(GetSYSTempPath + 'Spr_Group.xml');
         Open;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from SPR_GROUP');
             SelectSQL.Add('where T_GROUP = ' + IntToStr(ClientDataSet1['T_GROUP']));
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['T_GROUP'])then
             begin
               if notMainObj and
                  ((ShopMainForm.pFIBService['GROUP_NAME'] <> ClientDataSet1['GROUP_NAME'])or
                  (ShopMainForm.pFIBService['KOD_ACOUNT'] <> ClientDataSet1['KOD_ACOUNT'])or
                  (ShopMainForm.pFIBService['LAST_UPD'] <> ClientDataSet1['LAST_UPD']))then
                 ShopMainForm.pFIBDatabase1.Execute('update SPR_GROUP'
                   + ' set GROUP_NAME = ''' + ClientDataSet1['GROUP_NAME'] + ''','
                   + ' LAST_UPD = ''' + DateTimeToStr(ClientDataSet1['LAST_UPD']) + ''','
                   + ' KOD_ACOUNT = ' + IntToStr(ClientDataSet1['KOD_ACOUNT'])
                   + ' where T_GROUP = ' + IntToStr(ClientDataSet1['T_GROUP']));
             end
             else
               ShopMainForm.pFIBDatabase1.Execute('insert into SPR_GROUP(T_GROUP, GROUP_NAME,'
                 + ' LAST_UPD, KOD_ACOUNT)values(' + IntToStr(ClientDataSet1['T_GROUP']) + ', '''
                 + ClientDataSet1['GROUP_NAME'] + ''', ''' + DateTimeToStr(ClientDataSet1['LAST_UPD'])
                 + ''',' + IntToStr(ClientDataSet1['KOD_ACOUNT']) + ')');
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
       end;
       Inc(i);
       ProgressBar1.Position:= ProgressBar1.Min;
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       Application.ProcessMessages;
{*********************************************************************************}
{*********************************************************************************
                         Приём справочника поставщиков
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
      try
         ShopMainForm.pFIBDatabase1.Execute('ALTER TRIGGER SPR_VENDORS_BI INACTIVE;');

         LoadFromFile(GetSYSTempPath + 'Spr_Vendors.xml');
         Open;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from SPR_VENDORS');
             SelectSQL.Add('where VENDOR_CODE = ' + IntToStr(ClientDataSet1['VENDOR_CODE']));
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['VENDOR_CODE'])then
             begin
               if notMainObj and
                  ((ShopMainForm.pFIBService['VENDOR_NAME'] <> ClientDataSet1['VENDOR_NAME'])or
                  (ShopMainForm.pFIBService['NAME'] <> ClientDataSet1['NAME'])or
                  (ShopMainForm.pFIBService['PHONE'] <> ClientDataSet1['PHONE'])or
                  (ShopMainForm.pFIBService['INN'] <> ClientDataSet1['INN'])or
                  (ShopMainForm.pFIBService['OKOHX'] <> ClientDataSet1['OKOHX'])or
                  (ShopMainForm.pFIBService['OKPO'] <> ClientDataSet1['OKPO'])or
                  (ShopMainForm.pFIBService['ADRES'] <> ClientDataSet1['ADRES'])or
                  (ShopMainForm.pFIBService['KPP'] <> ClientDataSet1['KPP'])or
                  (ShopMainForm.pFIBService['REMARK'] <> ClientDataSet1['REMARK'])or
                  (ShopMainForm.pFIBService['BANK'] <> ClientDataSet1['BANK'])or
                  (ShopMainForm.pFIBService['KSCHET'] <> ClientDataSet1['KSCHET'])or
                  (ShopMainForm.pFIBService['RSCHET'] <> ClientDataSet1['RSCHET'])or
                  (ShopMainForm.pFIBService['BIK'] <> ClientDataSet1['BIK']))then
                 ShopMainForm.pFIBDatabase1.Execute('update SPR_VENDORS'
                   + ' set VENDOR_NAME = ''' + ClientDataSet1['VENDOR_NAME'] + ''','
                   + ' NAME = ''' + ClientDataSet1['NAME'] + ''','
                   + ' PHONE = ''' + ClientDataSet1['PHONE'] + ''','
                   + ' INN = ''' + ClientDataSet1['INN'] + ''','
                   + ' OKOHX = ''' + ClientDataSet1['OKOHX'] + ''','
                   + ' OKPO = ''' + ClientDataSet1['OKPO'] + ''','
                   + ' ADRES = ''' + ClientDataSet1['ADRES'] + ''','
                   + ' KPP = ''' + ClientDataSet1['KPP'] + ''','
                   + ' REMARK = ''' + ClientDataSet1['REMARK'] + ''','
                   + ' BANK = ''' + ClientDataSet1['BANK'] + ''','
                   + ' KSCHET = ''' + ClientDataSet1['KSCHET'] + ''','
                   + ' RSCHET = ''' + ClientDataSet1['RSCHET'] + ''','
                   + ' BIK = ''' + ClientDataSet1['BIK'] + ''''
                   + ' where VENDOR_CODE = ' + IntToStr(ClientDataSet1['VENDOR_CODE']));
             end
             else
               ShopMainForm.pFIBDatabase1.Execute('insert into SPR_VENDORS(VENDOR_CODE, VENDOR_NAME, NAME, '
                 + 'PHONE, INN, OKOHX, OKPO, ADRES, REMARK, BANK, KSCHET, RSCHET, BIK, KPP)'
                 + 'values(' + IntToStr(ClientDataSet1['VENDOR_CODE']) + ', '''
                 + ClientDataSet1['VENDOR_NAME'] + ''', ''' + ClientDataSet1['NAME'] + ''', '''
                 + ClientDataSet1['PHONE'] + ''', ''' + ClientDataSet1['INN'] + ''', '''
                 + ClientDataSet1['OKOHX'] + ''', ''' + ClientDataSet1['OKPO'] + ''', '''
                 + ClientDataSet1['ADRES'] + ''', ''' + ClientDataSet1['REMARK'] + ''', '''
                 + ClientDataSet1['BANK'] + ''', ''' + ClientDataSet1['KSCHET'] + ''', '''
                 + ClientDataSet1['RSCHET'] + ''', ''' + ClientDataSet1['BIK'] + ''', '''
                 + ClientDataSet1['KPP'] + ''')');
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
      finally
        ShopMainForm.pFIBDatabase1.Execute('ALTER TRIGGER SPR_VENDORS_BI ACTIVE;');
        if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
      end;
       end;
       Inc(i);
       ProgressBar1.Position:= ProgressBar1.Min;
       Application.ProcessMessages;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника покупателей
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Spr_Buyers.xml');
         Open;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from SPR_BUYERS');
             SelectSQL.Add('where BUYER_CODE = ' + IntToStr(ClientDataSet1['BUYER_CODE']));
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['BUYER_CODE'])then
             begin
               if notMainObj and
                  ((ShopMainForm.pFIBService['BUYER_NAME'] <> ClientDataSet1['BUYER_NAME'])or
                  (ShopMainForm.pFIBService['NAME'] <> ClientDataSet1['NAME'])or
                  (ShopMainForm.pFIBService['PHONE'] <> ClientDataSet1['PHONE'])or
                  (ShopMainForm.pFIBService['INN'] <> ClientDataSet1['INN'])or
                  (ShopMainForm.pFIBService['OKOHX'] <> ClientDataSet1['OKOHX'])or
                  (ShopMainForm.pFIBService['OKPO'] <> ClientDataSet1['OKPO'])or
                  (ShopMainForm.pFIBService['ADRES'] <> ClientDataSet1['ADRES'])or
                  (ShopMainForm.pFIBService['KPP'] <> ClientDataSet1['KPP'])or
                  (ShopMainForm.pFIBService['REMARK'] <> ClientDataSet1['REMARK'])or
                  (ShopMainForm.pFIBService['BANK'] <> ClientDataSet1['BANK'])or
                  (ShopMainForm.pFIBService['KSCHET'] <> ClientDataSet1['KSCHET'])or
                  (ShopMainForm.pFIBService['RSCHET'] <> ClientDataSet1['RSCHET'])or
                  (ShopMainForm.pFIBService['BIK'] <> ClientDataSet1['BIK']))then
                 ShopMainForm.pFIBDatabase1.Execute('update SPR_BUYERS'
                   + ' set BUYER_NAME = ''' + ClientDataSet1['BUYER_NAME'] + ''','
                   + ' NAME = ''' + ClientDataSet1['NAME'] + ''','
                   + ' PHONE = ''' + ClientDataSet1['PHONE'] + ''','
                   + ' INN = ''' + ClientDataSet1['INN'] + ''','
                   + ' OKOHX = ''' + ClientDataSet1['OKOHX'] + ''','
                   + ' OKPO = ''' + ClientDataSet1['OKPO'] + ''','
                   + ' ADRES = ''' + ClientDataSet1['ADRES'] + ''','
                   + ' KPP = ''' + ClientDataSet1['KPP'] + ''','
                   + ' REMARK = ''' + ClientDataSet1['REMARK'] + ''','
                   + ' BANK = ''' + ClientDataSet1['BANK'] + ''','
                   + ' KSCHET = ''' + ClientDataSet1['KSCHET'] + ''','
                   + ' RSCHET = ''' + ClientDataSet1['RSCHET'] + ''','
                   + ' BIK = ''' + ClientDataSet1['BIK'] + ''''
                   + ' where BUYER_CODE = ' + IntToStr(ClientDataSet1['BUYER_CODE']));
             end
             else
               ShopMainForm.pFIBDatabase1.Execute('insert into SPR_BUYERS(BUYER_CODE, BUYER_NAME, NAME, '
                 + 'PHONE, INN, OKOHX, OKPO, ADRES, REMARK, BANK, KSCHET, RSCHET, BIK, KPP)'
                 + 'values(' + IntToStr(ClientDataSet1['BUYER_CODE']) + ', '''
                 + ClientDataSet1['BUYER_NAME'] + ''', ''' + ClientDataSet1['NAME'] + ''', '''
                 + ClientDataSet1['PHONE'] + ''', ''' + ClientDataSet1['INN'] + ''', '''
                 + ClientDataSet1['OKOHX'] + ''', ''' + ClientDataSet1['OKPO'] + ''', '''
                 + ClientDataSet1['ADRES'] + ''', ''' + ClientDataSet1['REMARK'] + ''', '''
                 + ClientDataSet1['BANK'] + ''', ''' + ClientDataSet1['KSCHET'] + ''', '''
                 + ClientDataSet1['RSCHET'] + ''', ''' + ClientDataSet1['BIK'] + ''', '''
                 + ClientDataSet1['KPP'] + ''')');
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
       end;
       Inc(i);
       ProgressBar1.Position:= ProgressBar1.Min;
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       Application.ProcessMessages;
{*********************************************************************************}
{*********************************************************************************
                         Приём справочника ед.измерения
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Spr_Units.xml');
         Open;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from SPR_UNITS');
             SelectSQL.Add('where UNIT_KOD = ' + IntToStr(ClientDataSet1['UNIT_KOD']));
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['UNIT_KOD'])then
             begin
               if  notMainObj and
                  ((ShopMainForm.pFIBService['UNIT_INT'] <> ClientDataSet1['UNIT_INT'])or
                  (ShopMainForm.pFIBService['UNIT_NAME'] <> ClientDataSet1['UNIT_NAME']))then
                 ShopMainForm.pFIBDatabase1.Execute('update SPR_UNITS'
                   + ' set UNIT_NAME = ''' + ClientDataSet1['UNIT_NAME'] + ''','
                   + ' UNIT_INT = ' + IntToStr(ClientDataSet1['UNIT_INT'])
                   + ' where UNIT_KOD = ' + IntToStr(ClientDataSet1['UNIT_KOD']));
             end
             else
               ShopMainForm.pFIBDatabase1.Execute('insert into SPR_UNITS(UNIT_KOD, UNIT_NAME, UNIT_INT)'
                 + ' values(' + IntToStr(ClientDataSet1['UNIT_KOD']) + ', '''
                 + ClientDataSet1['UNIT_NAME'] + ''',' + IntToStr(ClientDataSet1['UNIT_INT']) + ')');
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
       end;
       Inc(i);
       ProgressBar1.Position:= ProgressBar1.Min;
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       Application.ProcessMessages;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника товаров
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Spr_Tovar.xml');
         Open;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         Label8.Caption:= '';
         Label8.Visible:= True;
         FormatSettings.DecimalSeparator:= '.';
         ShopMainForm.pFIBService.SelectSQL.Clear;
         ShopMainForm.pFIBService.SelectSQL.Add('select ITEM from SPR_TOVAR where ITEM = :ITEM');
         ShopMainForm.pFIBService.Prepare;
         while not Eof do
         begin
           Label8.Caption:= ClientDataSet1['ITEM'] + ' - ' + ClientDataSet1['TOVAR_NAME'];
           with ShopMainForm.pFIBService do
           begin
             ParamByName('ITEM').AsString:= ClientDataSet1['ITEM'];
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['ITEM'])then
             begin
               if notMainObj then
               begin
                 ShopMainForm.pFIBDatabase1.Execute('update SPR_TOVAR'
                   + ' set TOVAR_NAME = ''' + ClientDataSet1['TOVAR_NAME'] + ''','
                   + ' T_GROUP = ' + IntToStr(ClientDataSet1['T_GROUP']) + ','
                   + ' LAST_UPD = ''' + DateTimeToStr(ClientDataSet1['LAST_UPD']) + ''','
                   + ' KKM_SECT = ' + IntToStr(ClientDataSet1['KKM_SECT']) + ','
                   + ' VENDOR_CODE = ' + IntToStr(ClientDataSet1['VENDOR_CODE']) + ','
                   + ' AUTOR_KOD = ' + IntToStr(ClientDataSet1['AUTOR_KOD']) + ','
                   + ' REMARK = ''' + ClientDataSet1['REMARK'] + ''','
                   + ' REMARK_1 = ''' + ClientDataSet1['REMARK_1'] + ''','
                   + ' VEND_ITEM = ''' + ClientDataSet1['VEND_ITEM'] + ''','
                   + ' PRODUCER = ''' + ClientDataSet1['PRODUCER'] + ''','
                   + ' ARTIKUL = ''' + ClientDataSet1['ARTIKUL'] + ''','
                   + ' UNIT_KOD = ' + IntToStr(ClientDataSet1['UNIT_KOD'])
                   + ' where ITEM = ''' + ClientDataSet1['ITEM'] + '''');
//                   SaveToLog('SPR_TOVAR(update): ' + ClientDataSet1['ITEM'] + ' - ' + ClientDataSet1['TOVAR_NAME'], 'recive.log');

                   ShopMainForm.pFIBDatabase1.Execute('update PRICES set SALE_PRICE = '
                     + FloatToStr(ClientDataSet1['SALE_PRICE'])
                     + ',PRICE_1 = ' + FloatToStr(ClientDataSet1['PRICE_1'])
                     + ',PRICE_1_TAG = ' + IntToStr(ClientDataSet1['PRICE_1_TAG'])
                     + ',PRICE_2 = ' + FloatToStr(ClientDataSet1['PRICE_2'])
                     + ',PRICE_2_TAG = ' + IntToStr(ClientDataSet1['PRICE_2_TAG'])
                     + ',PRICE_3 = ' + FloatToStr(ClientDataSet1['PRICE_3'])
                     + ',PRICE_3_TAG = ' + IntToStr(ClientDataSet1['PRICE_3_TAG'])
                     + ',PRICE_4 = ' + FloatToStr(ClientDataSet1['PRICE_4'])
                     + ',PRICE_4_TAG = ' + IntToStr(ClientDataSet1['PRICE_4_TAG'])
                     + ',PRICE_5 = ' + FloatToStr(ClientDataSet1['PRICE_5'])
                     + ',PRICE_5_TAG = ' + IntToStr(ClientDataSet1['PRICE_5_TAG'])
                     + ',PRICE_6 = ' + FloatToStr(ClientDataSet1['PRICE_6'])
                     + ',PRICE_6_TAG = ' + IntToStr(ClientDataSet1['PRICE_6_TAG'])
                     + ',PRICE_7 = ' + FloatToStr(ClientDataSet1['PRICE_7'])
                     + ',PRICE_7_TAG = ' + IntToStr(ClientDataSet1['PRICE_7_TAG'])
                     + ',PRICE_8 = ' + FloatToStr(ClientDataSet1['PRICE_8'])
                     + ',PRICE_8_TAG = ' + IntToStr(ClientDataSet1['PRICE_8_TAG'])
                     + ',PRICE_9 = ' + FloatToStr(ClientDataSet1['PRICE_9'])
                     + ',PRICE_9_TAG = ' + IntToStr(ClientDataSet1['PRICE_9_TAG'])
                     + ',VEND_PRICE = ' + FloatToStr(ClientDataSet1['VEND_PRICE'])
                     + ',PRICE_TYPE = ''' + ClientDataSet1['PRICE_TYPE'] + ''''
                     + 'where ITEM = ''' + ClientDataSet1['ITEM'] + ''''
                     + 'and MARKET_CODE = ' + IntToStr(CurrentMarketCode));
{
                   if ClientDataSet1.FieldDefs.IndexOf('CST_PRICE_1') > -1 then
                   begin
                     // Прием дополнительных цен
                     if((not VarIsNull(ClientDataSet1['CST_PRICE_1']))or( not VarIsNull(ClientDataSet1['CST_PRICE_2']))
                       or( not VarIsNull(ClientDataSet1['CST_PRICE_3'])))then
                         ShopMainForm.pFIBDatabase1.Execute('update or insert into CST_PRICES(ITEM,'
                           + 'CST_PRICE_1, CST_PRICE_1_TAG, CST_PRICE_1_TYPE,'
                           + 'CST_PRICE_2, CST_PRICE_2_TAG, CST_PRICE_2_TYPE,'
                           + 'CST_PRICE_3, CST_PRICE_3_TAG, CST_PRICE_3_TYPE)'
                           + 'values('''  + ClientDataSet1['ITEM'] + ''', '
                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_1']), 'null', FloatToStr(ClientDataSet1['CST_PRICE_1'])) + ', '
                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_1_TAG']), 'null', IntToStr(ClientDataSet1['CST_PRICE_1_TAG'])) + ', '
                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_1_TYPE']), 'null', '''' + ClientDataSet1['CST_PRICE_1_TYPE'] + '''') + ', '

                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_2']), 'null', FloatToStr(ClientDataSet1['CST_PRICE_2'])) + ', '
                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_2_TAG']), 'null', IntToStr(ClientDataSet1['CST_PRICE_2_TAG'])) + ', '
                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_2_TYPE']), 'null', '''' + ClientDataSet1['CST_PRICE_2_TYPE'] + '''') + ', '

                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_3']), 'null', FloatToStr(ClientDataSet1['CST_PRICE_3'])) + ', '
                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_3_TAG']), 'null', IntToStr(ClientDataSet1['CST_PRICE_3_TAG'])) + ', '
                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_3_TYPE']), 'null', '''' + ClientDataSet1['CST_PRICE_3_TYPE'] + '''')
                           + ')matching(ITEM)');
                   end
                   else SaveToLog('SPR_TOVAR() дополнительные цены отсутствуют в файле обмена', 'recive.log');
}
               end
               else SaveToLog('SPR_TOVAR(not update): ' + ClientDataSet1['ITEM'] + ' - ' + ClientDataSet1['TOVAR_NAME'], 'recive.log');
             end
             else
             begin
               begin
                 ShopMainForm.pFIBDatabase1.Execute('insert into SPR_TOVAR(ITEM, TOVAR_NAME, T_GROUP,'
                   + ' LAST_UPD, KKM_SECT, VENDOR_CODE, AUTOR_KOD, '
                   + 'REMARK, UNIT_KOD, ARTIKUL, PRODUCER, REMARK_1, VEND_ITEM)'
                   + 'values(''' + ClientDataSet1['ITEM'] + ''', '''
                   + ClientDataSet1['TOVAR_NAME'] + ''', '
                   + IntToStr(ClientDataSet1['T_GROUP']) + ', '''
                   + DateTimeToStr(ClientDataSet1['LAST_UPD']) + ''', '
                   + IntToStr(ClientDataSet1['KKM_SECT']) + ', '
                   + IntToStr(ClientDataSet1['VENDOR_CODE']) + ', '
                   + IntToStr(ClientDataSet1['AUTOR_KOD']) + ', '''
                   + ClientDataSet1['REMARK'] + ''', '
                   + IntToStr(ClientDataSet1['UNIT_KOD']) + ', '''
                   + ClientDataSet1['ARTIKUL'] + ''', '''
                   + ClientDataSet1['PRODUCER'] + ''', '''
                   + ClientDataSet1['REMARK_1'] + ''', '''
                   + ClientDataSet1['VEND_ITEM'] + ''')');
                 SaveToLog('SPR_TOVAR(insert): ' + ClientDataSet1['ITEM'] + ' - ' + ClientDataSet1['TOVAR_NAME'], 'recive.log');

                 ShopMainForm.pFIBDatabase1.Execute('insert into PRICES(MARKET_CODE, ITEM, SALE_PRICE, '
                   + 'PRICE_1, PRICE_1_TAG, PRICE_2, PRICE_2_TAG, PRICE_3, PRICE_3_TAG, PRICE_4, '
                   + 'PRICE_4_TAG, PRICE_5, PRICE_5_TAG, PRICE_6, PRICE_6_TAG, PRICE_7, '
                   + 'PRICE_7_TAG, PRICE_8, PRICE_8_TAG, PRICE_9, PRICE_9_TAG, VEND_PRICE, PRICE_TYPE)'
                   + 'values(' + IntToStr(CurrentMarketCode) + ', '''
                   + ClientDataSet1['ITEM'] + ''', ' + FloatToStr(ClientDataSet1['SALE_PRICE']) + ','
                   + FloatToStr(ClientDataSet1['PRICE_1']) + ',' + IntToStr(ClientDataSet1['PRICE_1_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_2']) + ',' + IntToStr(ClientDataSet1['PRICE_2_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_3']) + ',' + IntToStr(ClientDataSet1['PRICE_3_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_4']) + ',' + IntToStr(ClientDataSet1['PRICE_4_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_5']) + ',' + IntToStr(ClientDataSet1['PRICE_5_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_6']) + ',' + IntToStr(ClientDataSet1['PRICE_6_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_7']) + ',' + IntToStr(ClientDataSet1['PRICE_7_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_8']) + ',' + IntToStr(ClientDataSet1['PRICE_8_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_9']) + ',' + IntToStr(ClientDataSet1['PRICE_9_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['VEND_PRICE']) + ',''' + ClientDataSet1['PRICE_TYPE']+ ''')');

                {
                 if ClientDataSet1.FieldDefs.IndexOf('CST_PRICE_1') > -1 then
                 begin
                   // Прием дополнительных цен
                   if((not VarIsNull(ClientDataSet1['CST_PRICE_1']))or( not VarIsNull(ClientDataSet1['CST_PRICE_2']))
                     or( not VarIsNull(ClientDataSet1['CST_PRICE_3'])))then
                       ShopMainForm.pFIBDatabase1.Execute('update or insert into CST_PRICES(ITEM,'
                         + 'CST_PRICE_1, CST_PRICE_1_TAG, CST_PRICE_1_TYPE,'
                         + 'CST_PRICE_2, CST_PRICE_2_TAG, CST_PRICE_2_TYPE,'
                         + 'CST_PRICE_3, CST_PRICE_3_TAG, CST_PRICE_3_TYPE)'
                         + 'values('''  + ClientDataSet1['ITEM'] + ''', '
                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_1']), 'null', FloatToStr(ClientDataSet1['CST_PRICE_1'])) + ', '
                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_1_TAG']), 'null', IntToStr(ClientDataSet1['CST_PRICE_1_TAG'])) + ', '
                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_1_TYPE']), 'null', '''' + ClientDataSet1['CST_PRICE_1_TYPE'] + '''') + ', '

                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_2']), 'null', FloatToStr(ClientDataSet1['CST_PRICE_2'])) + ', '
                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_2_TAG']), 'null', IntToStr(ClientDataSet1['CST_PRICE_2_TAG'])) + ', '
                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_2_TYPE']), 'null', '''' + ClientDataSet1['CST_PRICE_2_TYPE'] + '''') + ', '

                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_3']), 'null', FloatToStr(ClientDataSet1['CST_PRICE_3'])) + ', '
                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_3_TAG']), 'null', IntToStr(ClientDataSet1['CST_PRICE_3_TAG'])) + ', '
                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_3_TYPE']), 'null', '''' + ClientDataSet1['CST_PRICE_3_TYPE'] + '''')
                         + ')matching(ITEM)');
                 end
                 else SaveToLog('SPR_TOVAR() дополнительные цены отсутствуют в файле обмена', 'recive.log');
                 }
               end;
             end;
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         FormatSettings.DecimalSeparator:= TmpSep;
         Label8.Visible:= False;
         Close;
         Inc(i);
         CheckListBox2.Checked[i]:= True;
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       end;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника норм наценок
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Spr_Charge.xml');
         Open;
         ProgressBar1.Position:= ProgressBar1.Min;
         ProgressBar1.Max:= RecordCount;
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from SPR_CHARGE');
             SelectSQL.Add('where ITEM = ''' + ClientDataSet1['ITEM'] + '''');
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['ITEM'])then
             begin
               if notMainObj and
                  (ShopMainForm.pFIBService['EXTRA_CHARGE'] <> ClientDataSet1['EXTRA_CHARGE'])then
                 ShopMainForm.pFIBDatabase1.Execute('update SPR_CHARGE'
                   + ' set EXTRA_CHARGE = ' + IntToStr(ClientDataSet1['EXTRA_CHARGE'])
                   + ' where ITEM = ''' + ClientDataSet1['ITEM'] + '''');
             end
             else
               ShopMainForm.pFIBDatabase1.Execute('insert into SPR_CHARGE(EXTRA_CHARGE, ITEM)'
                 + ' values(' + IntToStr(ClientDataSet1['EXTRA_CHARGE']) + ', ''' + ClientDataSet1['ITEM'] + ''')');
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         Close;
         Inc(i);
         CheckListBox2.Checked[i]:= True;
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       end;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника норм остатков
*********************************************************************************}
      CheckListBox2.Selected[i]:= True;
      if notMainObj then
       with ClientDataSet1 do
       begin
         ShopMainForm.pFIBDatabase1.Execute('ALTER TRIGGER SPR_NORM_OST_AIU0 INACTIVE;');
         LoadFromFile(GetSYSTempPath + 'Spr_Norm_Ost.xml');
         Open;  // Если НЕ ГЛАВНЫЙ объект  фильтруем для текущего объекта
         ClientDataSet1.Filter:= 'MARKET_CODE = ' + IntToStr(CurrentMarketCode);
         ClientDataSet1.Filtered:= True;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         pFIBQuery1.SQL.Clear;
         pFIBQuery1.SQL.Add('update or insert into SPR_NORM_OST(ITEM, MARKET_CODE, NORM_OST, MIN_OST)'
                 + ' values(:ITEM, :MARKET_CODE, :NORM_OST, :MIN_OST) matching(ITEM, MARKET_CODE)');
         pFIBQuery1.Prepare;
         First;
         while not Eof do
         begin
           pFIBQuery1.ParamByName('ITEM').AsString:= ClientDataSet1['ITEM'];
           pFIBQuery1.ParamByName('MARKET_CODE').AsInteger:= ClientDataSet1['MARKET_CODE'];
           pFIBQuery1.ParamByName('NORM_OST').AsFloat:= ClientDataSet1['NORM_OST'];
           pFIBQuery1.ParamByName('MIN_OST').AsFloat:= ClientDataSet1['MIN_OST'];
           pFIBQuery1.ExecQuery; // Добавляем-обновляем справочник норм остатков
           ProgressBar1.StepIt;
           Application.ProcessMessages;
           Next;
         end;

         with ShopMainForm.pFIBService do
         begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add('select count(*) as CNT from SPR_NORM_OST where MARKET_CODE = ' + IntToStr(CurrentMarketCode));
           Open;
           ProgressBar1.Max:= ShopMainForm.pFIBService['CNT'];
           ProgressBar1.Position:= ProgressBar1.Min;
           Close;
           SelectSQL.Clear; // Выбираем нормы остатков из базы
           SelectSQL.Add('select ITEM from SPR_NORM_OST where MARKET_CODE = ' + IntToStr(CurrentMarketCode));
           Open;
           while not Eof do
           begin  // Удаляем из справочника нормы остатков товаров, которых нет в файле обмена
             if not ClientDataSet1.Locate('ITEM', ShopMainForm.pFIBService.FieldByName('ITEM').AsString, [])then
               ExecSQLStr('delete from SPR_NORM_OST where ITEM = ''' + ShopMainForm.pFIBService.FieldByName('ITEM').AsString +
                 ''' and MARKET_CODE = ' + IntToStr(CurrentMarketCode));
             ProgressBar1.StepIt;
             Application.ProcessMessages;
             Next;
           end;
           Close;
         end;
         Close;
         ClientDataSet1.Filtered:= False;
         ClientDataSet1.Filter:= '';

         ProgressBar1.Position:= ProgressBar1.Min;
         ShopMainForm.pFIBDatabase1.Execute('ALTER TRIGGER SPR_NORM_OST_AIU0 ACTIVE;');
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       end;
       Inc(i);
       CheckListBox2.Checked[i]:= True;
       Application.ProcessMessages;
{*********************************************************************************}
{*********************************************************************************
                        Приём приходных накладных
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Hdr_Prihod.xml');
         if notMainObj then // Если НЕ ГЛАВНЫЙ объект  фильтруем для текущего объекта
           begin
             ClientDataSet1.Filter:= 'MARKET_CODE = ' + IntToStr(CurrentMarketCode);
             ClientDataSet1.Filtered:= True;
           end;

         ClientDataSet2.LoadFromFile(GetSYSTempPath + 'Pos_Prihod.xml');
         Open;
         ClientDataSet2.Open; // Открываем позиции док-та
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         FormatSettings.DecimalSeparator:= '.';
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from HDR_PRIHOD');
             SelectSQL.Add('where MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
             SelectSQL.Add('and DOC_NUMBER = ' + IntToStr(ClientDataSet1['DOC_NUMBER']));
             SelectSQL.Add('and DOC_TYPE = ' + IntToStr(ClientDataSet1['DOC_TYPE']));
             Open;
             Label8.Visible:= True;
             Label8.Caption:= 'Док-т № ' + IntToStr(ClientDataSet1['DOC_NUMBER']);
             if not VarIsNull(ShopMainForm.pFIBService['KOD'])then
             begin
               if not notMainObj then DocKod:= -1 // Док-т найден и главный объект
               else
               begin
                 DocKod:= ShopMainForm.pFIBService['KOD'];
                   // Удаляем старые позиции док-та
                 ShopMainForm.pFIBDatabase1.Execute('delete from POS_PRIHOD where KOD = ' + IntToStr(DocKod));
                   // Изменяем заголовок док-та
                 ShopMainForm.pFIBDatabase1.Execute('update HDR_PRIHOD'
                   + ' set DOC_DATE = ''' + DateTimeToStr(ClientDataSet1['DOC_DATE']) + ''','
                   + ' VENDOR_CODE = ' + IntToStr(ClientDataSet1['VENDOR_CODE']) + ','
                   + ' DOC_SUM = 0, VEND_SUM = 0,'
                   + ' AUTOR_KOD = ' + IntToStr(ClientDataSet1['AUTOR_KOD']) + ','
                   + ' LAST_UPD = ''' + DateTimeToStr(ClientDataSet1['LAST_UPD']) + ''''
                   + ' where KOD = ' + IntToStr(DocKod));
               end;
             end
             else
             begin
               // Если док-т не найден добавляем новый заголовок
               ShopMainForm.pFIBDatabase1.Execute('insert into HDR_PRIHOD(MARKET_CODE, DOC_DATE, DOC_NUMBER, '
                 + 'VENDOR_CODE, DOC_TYPE, AUTOR_KOD, LAST_UPD, VEND_SUM, DOC_SUM)'
                 + ' values(' + IntToStr(ClientDataSet1['MARKET_CODE']) + ', '''
                 + DateTimeToStr(ClientDataSet1['DOC_DATE']) + ''', '
                 + IntToStr(ClientDataSet1['DOC_NUMBER']) + ', '
                 + IntToStr(ClientDataSet1['VENDOR_CODE']) + ', '
                 + IntToStr(ClientDataSet1['DOC_TYPE']) + ', '
                 + IntToStr(ClientDataSet1['AUTOR_KOD']) + ', '''
                 + DateTimeToStr(ClientDataSet1['LAST_UPD']) + ''', 0, 0)');
               Close;
               SelectSQL.Clear;// Получаем код зарегистрированного док-та
               SelectSQL.Add('select * from HDR_PRIHOD');
               SelectSQL.Add('where MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
               SelectSQL.Add('and DOC_NUMBER = ' + IntToStr(ClientDataSet1['DOC_NUMBER']));
               SelectSQL.Add('and DOC_TYPE = ' + IntToStr(ClientDataSet1['DOC_TYPE']));
               Open;
               DocKod:= ShopMainForm.pFIBService['KOD'];
             end;
             Close;

             if DocKod <> -1 then // Док-т найден и главный объект
             begin
               ClientDataSet2.Filter:= 'KOD = ' + IntToStr(ClientDataSet1['KOD']);
               ClientDataSet2.Filtered:= True;
               while not ClientDataSet2.Eof do
               begin
                   // Добавляем позиции док-та
                 ShopMainForm.pFIBDatabase1.Execute('insert into POS_PRIHOD(KOD, ITEM, '
                   + 'KOLVO, PRICE, VEND_PRICE, MARKET_CODE, VENDOR_CODE)'
                   + ' values(' + IntToStr(DocKod) + ', ''' + ClientDataSet2['ITEM'] + ''', '
                   + FloatToStr(ClientDataSet2['KOLVO']) + ', ' + FloatToStr(ClientDataSet2['PRICE']) + ', '
                   + FloatToStr(ClientDataSet2['VEND_PRICE']) + ', ' + IntToStr(ClientDataSet2['MARKET_CODE']) + ', '
                   + IntToStr(ClientDataSet2['VENDOR_CODE']) + ')');
//                 SaveToLog('POS_PRIHOD(insert): ' + ClientDataSet2['ITEM'], 'recive.log');
                 ClientDataSet2.Next;
                 Application.ProcessMessages;
               end;
             end;

           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;


         ClientDataSet2.Filtered:= False;
         ClientDataSet2.Filter:= '';
         ClientDataSet2.Close;
         FormatSettings.DecimalSeparator:= TmpSep;

         Close;
         ClientDataSet1.Filtered:= False;
         ClientDataSet1.Filter:= '';

         Label8.Visible:= False;
         Inc(i);
         CheckListBox2.Checked[i]:= True;
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       end;
{*********************************************************************************}
{*********************************************************************************
                        Приём расходных накладных
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Hdr_Rashod.xml');
         if notMainObj then // Если НЕ ГЛАВНЫЙ объект  фильтруем для текущего объекта
           begin
             ClientDataSet1.Filter:= 'MARKET_CODE = ' + IntToStr(CurrentMarketCode);
             ClientDataSet1.Filtered:= True;
           end;

         ClientDataSet2.LoadFromFile(GetSYSTempPath + 'Pos_Rashod.xml');
         Open;
         ClientDataSet2.Open; // Открываем позиции док-та
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         FormatSettings.DecimalSeparator:= '.';
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from HDR_RASHOD');
             SelectSQL.Add('where MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
             SelectSQL.Add('and DOC_NUMBER = ' + IntToStr(ClientDataSet1['DOC_NUMBER']));
             SelectSQL.Add('and DOC_TYPE = ' + IntToStr(ClientDataSet1['DOC_TYPE']));
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['KOD'])then
             begin
               if not notMainObj then DocKod:= -1 // Док-т найден и главный объект
               else
               begin
                 DocKod:= ShopMainForm.pFIBService['KOD'];
                 // Удаляем старые позиции док-та
                 ShopMainForm.pFIBDatabase1.Execute('delete from POS_RASHOD where KOD = ' + IntToStr(DocKod));
                 // Изменяем заголовок док-та
                 ShopMainForm.pFIBDatabase1.Execute('update HDR_RASHOD'
                   + ' set DOC_DATE = ''' + DateTimeToStr(ClientDataSet1['DOC_DATE']) + ''','
                   + ' VENDOR_CODE = ' + IntToStr(ClientDataSet1['VENDOR_CODE'])
                   + ',DOC_SUM = 0, VEND_SUM = 0,'
                   + ' AUTOR_KOD = ' + IntToStr(ClientDataSet1['AUTOR_KOD'])
                   + ',LAST_UPD = ''' + DateTimeToStr(ClientDataSet1['LAST_UPD']) + ''''
                   + ' where KOD = ' + IntToStr(DocKod));
               end;
             end
             else
             begin
               // Если док-т не найден добавляем новый заголовок
               ShopMainForm.pFIBDatabase1.Execute('insert into HDR_RASHOD(MARKET_CODE, DOC_DATE, DOC_NUMBER, '
                 + 'VENDOR_CODE, DOC_TYPE, AUTOR_KOD, LAST_UPD, VEND_SUM, DOC_SUM)'
                 + ' values(' + IntToStr(ClientDataSet1['MARKET_CODE']) + ', '''
                 + DateTimeToStr(ClientDataSet1['DOC_DATE']) + ''', '
                 + IntToStr(ClientDataSet1['DOC_NUMBER']) + ', '
                 + IntToStr(ClientDataSet1['VENDOR_CODE']) + ', '
                 + IntToStr(ClientDataSet1['DOC_TYPE']) + ', '
                 + IntToStr(ClientDataSet1['AUTOR_KOD']) + ', '''
                 + DateTimeToStr(ClientDataSet1['LAST_UPD']) + ''', 0, 0)');
               Close;
               SelectSQL.Clear;// Получаем код зарегистрированного док-та
               SelectSQL.Add('select * from HDR_RASHOD');
               SelectSQL.Add('where MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
               SelectSQL.Add('and DOC_NUMBER = ' + IntToStr(ClientDataSet1['DOC_NUMBER']));
               SelectSQL.Add('and DOC_TYPE = ' + IntToStr(ClientDataSet1['DOC_TYPE']));
               Open;
               DocKod:= ShopMainForm.pFIBService['KOD'];
             end;
             Close;

             if DocKod <> -1 then // Док-т найден и главный объект
             begin
               ClientDataSet2.Filter:= 'KOD = ' + IntToStr(ClientDataSet1['KOD']);
               ClientDataSet2.Filtered:= True;
               while not ClientDataSet2.Eof do
               begin
                 // Добавляем позиции док-та
                 ShopMainForm.pFIBDatabase1.Execute('insert into POS_RASHOD(KOD, ITEM, KOLVO, PRICE, VEND_PRICE,'
                   + ' MARKET_CODE, VENDOR_CODE) values(' + IntToStr(DocKod) + ', ''' + ClientDataSet2['ITEM'] + ''', '
                   + FloatToStr(ClientDataSet2['KOLVO']) + ', ' + FloatToStr(ClientDataSet2['PRICE']) + ', '
                   + FloatToStr(ClientDataSet2['VEND_PRICE']) + ', ' + IntToStr(ClientDataSet2['MARKET_CODE']) + ','
                   + IntToStr(ClientDataSet2['VENDOR_CODE']) + ')');
                 ClientDataSet2.Next;
                 Application.ProcessMessages;
               end;
             end;

           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         ClientDataSet2.Close;
         ClientDataSet2.Filter:= '';
         ClientDataSet2.Filtered:= False;
         FormatSettings.DecimalSeparator:= TmpSep;

         Close;
         ClientDataSet1.Filtered:= False;
         ClientDataSet1.Filter:= '';

         Inc(i);
         CheckListBox2.Checked[i]:= True;
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       end;
{*********************************************************************************}
{*********************************************************************************
                        Приём переоценок
*********************************************************************************}
      CheckListBox2.Selected[i]:= True;
      SndIni:= TIniFile.Create(GetSYSTempPath + 'transfer.ini');
      if SndIni.ReadBool('Main', 'Pereocen', False) then
       with ClientDataSet1 do
       begin
         if notMainObj then
           begin
             S:= 'delete from PRICE_CHANGE '
               + 'where P_DATE between ''' + SndIni.ReadString('Main', 'BeginDateTime', 'now')
               + ''' and ''' + SndIni.ReadString('Main', 'SndDateTime', 'now') + '''';
             if SndIni.ReadInteger('Main', 'Market_Code', CurrentMarketCode) > -1 then
               S:= S + 'and MARKET_CODE = '
                  + SndIni.ReadString('Main', 'Market_Code', IntToStr(CurrentMarketCode));
             ShopMainForm.pFIBDatabase1.Execute(S);
           end;
         LoadFromFile(GetSYSTempPath + 'Price_Change.xml');
           if notMainObj then // Если НЕ ГЛАВНЫЙ объект  фильтруем для текущего объекта
             begin
               ClientDataSet1.Filter:= 'MARKET_CODE = ' + IntToStr(CurrentMarketCode);
               ClientDataSet1.Filtered:= True;
             end;

         Open;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         FormatSettings.DecimalSeparator:= '.';
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from PRICE_CHANGE');
             SelectSQL.Add('where P_DATE = ''' + DateTimeToStr(ClientDataSet1['P_DATE']) + '''');
             SelectSQL.Add('and ITEM = ''' + ClientDataSet1['ITEM'] + '''');
             SelectSQL.Add('and MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
             Open;
             if VarIsNull(ShopMainForm.pFIBService['ITEM'])then
               ShopMainForm.pFIBDatabase1.Execute('insert into PRICE_CHANGE(MARKET_CODE, P_DATE, ITEM, '
                 + 'KOLVO, OLD_PRICE, NEW_PRICE)'
                 + ' values(' + IntToStr(ClientDataSet1['MARKET_CODE']) + ', '''
                 + DateTimeToStr(ClientDataSet1['P_DATE']) + ''', ''' + ClientDataSet1['ITEM'] + ''', '
                 + FloatToStr(ClientDataSet1['KOLVO']) + ', ' + FloatToStr(ClientDataSet1['OLD_PRICE']) + ', '
                 + FloatToStr(ClientDataSet1['NEW_PRICE']) + ')')
             else
               ShopMainForm.pFIBDatabase1.Execute('update PRICE_CHANGE'
                 + ' set KOLVO = ' + FloatToStr(ClientDataSet1['KOLVO'])
                 + ', OLD_PRICE = ' + FloatToStr(ClientDataSet1['OLD_PRICE'])
                 + ', NEW_PRICE = ' + FloatToStr(ClientDataSet1['NEW_PRICE'])
                 + ' where P_DATE = ''' + DateTimeToStr(ClientDataSet1['P_DATE']) + ''''
                 + ' and ITEM = ''' + ClientDataSet1['ITEM'] + ''''
                 + ' and MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         FormatSettings.DecimalSeparator:= TmpSep;

         Close;
         ClientDataSet1.Filtered:= False;
         ClientDataSet1.Filter:= '';

         Inc(i);
         CheckListBox2.Checked[i]:= True;
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
       end
       else Inc(i);
       SndIni.Free;
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
{*********************************************************************************}
{*********************************************************************************
                        Приём кассовых смен
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Hdr_Smens.xml');
         if notMainObj then // Если НЕ ГЛАВНЫЙ объект  фильтруем для текущего объекта
           begin
             ClientDataSet1.Filter:= 'MARKET_CODE = ' + IntToStr(CurrentMarketCode);
             ClientDataSet1.Filtered:= True;
           end;

         ClientDataSet2.LoadFromFile(GetSYSTempPath + 'Pos_Sales.xml');
         Open;
         ClientDataSet2.Open;  // Открываем позиции смены
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         FormatSettings.DecimalSeparator:= '.';
         while not ClientDataSet1.Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from HDR_SMENS');
             SelectSQL.Add('where MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
//             SelectSQL.Add('and BEGIN_DATETIME = ''' + DateTimeToStr(ClientDataSet1['BEGIN_DATETIME']) + '''');
             SelectSQL.Add('and END_DATETIME = ''' + DateTimeToStr(ClientDataSet1['END_DATETIME']) + '''');
             Open;// Проверяем наличие данного заголовка
             Label8.Visible:= True;
             Label8.Caption:= 'Смена № ' + IntToStr(ClientDataSet1['SMENS_KOD']);
             if not VarIsNull(ShopMainForm.pFIBService['SMENS_KOD'])then
             begin
               if not notMainObj then DocKod:= -1
               else
               begin
                 DocKod:= ShopMainForm.pFIBService['SMENS_KOD'];
                 // Удаляем старые позиции смены
                 ShopMainForm.pFIBDatabase1.Execute('delete from POS_SALES where SMENS_KOD = ' + IntToStr(DocKod));
               end;
             end
             else
             begin
               // Добавляем новый заголовок кассовой смены
               ShopMainForm.pFIBDatabase1.Execute('insert into HDR_SMENS(MARKET_CODE, AUTOR_KOD, BEGIN_DATETIME, '
                 + 'END_DATETIME) values(' + IntToStr(ClientDataSet1['MARKET_CODE']) + ', '
                 + IntToStr(ClientDataSet1['AUTOR_KOD']) + ', '''
                 + DateTimeToStr(ClientDataSet1['BEGIN_DATETIME']) + ''', '''
                 + DateTimeToStr(ClientDataSet1['END_DATETIME']) + ''')');
               Close;
               SelectSQL.Clear;// Получаем код зарегистрированной смены
               SelectSQL.Add('select * from HDR_SMENS');
               SelectSQL.Add('where MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
//               SelectSQL.Add('and BEGIN_DATETIME = ''' + DateTimeToStr(ClientDataSet1['BEGIN_DATETIME']) + '''');
               SelectSQL.Add('and END_DATETIME = ''' + DateTimeToStr(ClientDataSet1['END_DATETIME']) + '''');
               Open;
               DocKod:= ShopMainForm.pFIBService['SMENS_KOD'];
             end;
             Close;

             if DocKod <> -1 then
             begin
               ClientDataSet2.Filter:= 'SMENS_KOD = ' + IntToStr(ClientDataSet1['SMENS_KOD']);
               ClientDataSet2.Filtered:= True;
               while not ClientDataSet2.Eof do
               begin
                 // Добавляем позиции смены
                 ShopMainForm.pFIBDatabase1.Execute('insert into POS_SALES(MARKET_CODE, NCHECK, SMENS_KOD, SALE_DATE, '
                   + 'ITEM, KOLVO, SALE_PRICE, NCARD, AUTOR_KOD, COST_PRICE, VEND_PRICE, VENDOR_CODE, PAY_TYPE)'
                   + ' values(' + IntToStr(ClientDataSet2['MARKET_CODE']) + ', '
                   + IntToStr(ClientDataSet2['NCHECK']) + ', ' + IntToStr(DocKod) + ', '''
                   + DateTimeToStr(ClientDataSet2['SALE_DATE']) + ''', '''
                   + ClientDataSet2['ITEM'] + ''', '
                   + FloatToStr(ClientDataSet2['KOLVO']) + ', '
                   + FloatToStr(ClientDataSet2['SALE_PRICE']) + ', '''
                   + ClientDataSet2['NCARD'] + ''', '
                   + IntToStr(ClientDataSet2['AUTOR_KOD']) + ', '
                   + FloatToStr(ClientDataSet2['COST_PRICE']) + ','
                   + FloatToStr(ClientDataSet2['VEND_PRICE']) + ','
                   + IntToStr(ClientDataSet2['VENDOR_CODE']) + ','
                   + IntToStr(ClientDataSet2['PAY_TYPE']) + ')');

                 ClientDataSet2.Next;
                 Application.ProcessMessages;
               end;
             end;

             if DisplayProgress then
             begin
               ProgressBar1.StepIt;
               Application.ProcessMessages;
             end;
           end;
           Next;
         end;
         ClientDataSet2.Close;
         ClientDataSet2.Filter:= '';
         ClientDataSet2.Filtered:= False;
         FormatSettings.DecimalSeparator:= TmpSep;
         Close;
         ClientDataSet1.Filtered:= False;
         ClientDataSet1.Filter:= '';

         Label8.Visible:= False;
         Inc(i);
         CheckListBox2.Checked[i]:= True;
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       end;
{*********************************************************************************}
{*********************************************************************************
                              Приём учётов
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Uchet.xml');
         if notMainObj then // Если НЕ ГЛАВНЫЙ объект  фильтруем для текущего объекта
           begin
             ClientDataSet1.Filter:= 'MARKET_CODE = ' + IntToStr(CurrentMarketCode);
             ClientDataSet1.Filtered:= True;
           end;
         Open;
         ProgressBar1.Position:= ProgressBar1.Min;
         ProgressBar1.Max:= RecordCount;
         while not Eof do
         begin
           // Удаляем старые позиции учёта
           ShopMainForm.pFIBDatabase1.Execute('delete from UCHET where UCHET_NUM = '
             + IntToStr(ClientDataSet1['UCHET_NUM'])
             + ' and MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
           Next;
         end;
         FormatSettings.DecimalSeparator:= '.';
         while not Eof do
         begin
           // Добавляем новые позиции учёта
           ShopMainForm.pFIBDatabase1.Execute('insert into UCHET(MARKET_CODE, ITEM, UCHET_NUM, ACOUNT_KOLVO,'
             + ' COUNT_KOLVO, SALE_PRICE, TOVAR_NAME, SAVE_DATE, VEND_PRICE)'
             + ' values(' + IntToStr(ClientDataSet1['MARKET_CODE']) + ', '''
             + ClientDataSet1['ITEM'] + ''', '
             + IntToStr(ClientDataSet1['UCHET_NUM']) + ', '
             + FloatToStr(ClientDataSet1['ACOUNT_KOLVO']) + ', '
             + FloatToStr(ClientDataSet1['COUNT_KOLVO']) + ', '
             + FloatToStr(ClientDataSet1['SALE_PRICE']) + ', '''
             + ClientDataSet1['TOVAR_NAME'] + ''', '''
             + DateTimeToStr(ClientDataSet1['SAVE_DATE']) + ''', '
             + FloatToStr(ClientDataSet1['VEND_PRICE']) + ')');
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
           Application.ProcessMessages;
         end;
         FormatSettings.DecimalSeparator:= TmpSep;
         Close;
         ClientDataSet1.Filtered:= False;
         ClientDataSet1.Filter:= '';

         Inc(i);
         CheckListBox2.Checked[i]:= True;
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       end;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника атрибутов
*********************************************************************************}
     CheckListBox2.Selected[i]:= True;
     if notMainObj then
     begin
       if FileExists(GetSYSTempPath + 'Spr_Tovar_Attr.xml') then
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Spr_Tovar_Attr.xml');
         Open;

         with ShopMainForm.pFIBService do
         begin // Удаляем из справочника атрибуты, которых нет в файле обмена
           SelectSQL.Clear;
           SelectSQL.Add('select * from SPR_TOVAR_ATTR');
           Open;
           ProgressBar1.Position:= ProgressBar1.Min;
           ProgressBar1.Max:= ShopMainForm.pFIBService.RecordCount;
           while not Eof do
           begin
             if not ClientDataSet1.Locate('ATR_ID', ShopMainForm.pFIBService['ATR_ID'],[]) then
               begin
                 ShopMainForm.pFIBDatabase1.Execute('delete from TOVAR_ATTR where ATR_ID = '
                    + IntToStr(ShopMainForm.pFIBService['ATR_ID']));
                 ShopMainForm.pFIBDatabase1.Execute('delete from SPR_TOVAR_ATTR where ATR_ID = '
                    + IntToStr(ShopMainForm.pFIBService['ATR_ID']));
                 SaveToLog('SPR_TOVAR_ATTR(лишний атрибут в справочнике): ' + IntToStr(ShopMainForm.pFIBService['ATR_ID']) + ' - ' + ShopMainForm.pFIBService['ATR_NAME'], 'recive.log');
               end;
             Next;
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Close;
         end;

         ProgressBar1.Position:= ProgressBar1.Min;
         ProgressBar1.Max:= RecordCount;
         First;
         pFIBQuery1.SQL.Clear;
         pFIBQuery1.SQL.Add('update or insert into SPR_TOVAR_ATTR(ATR_ID, ATR_NAME)'
                 + ' values(:ATR_ID, :ATR_NAME) matching(ATR_ID)');
         pFIBQuery1.Prepare;
         while not Eof do
         begin
           pFIBQuery1.ParamByName('ATR_ID').AsInteger:= ClientDataSet1['ATR_ID'];
           pFIBQuery1.ParamByName('ATR_NAME').AsString:= ClientDataSet1['ATR_NAME'];
           pFIBQuery1.ExecQuery; // Добавляем-обновляем справочник атрибутов
           ProgressBar1.StepIt;
           Application.ProcessMessages;
           Next;
         end;
         Close;

         CheckListBox2.Checked[i]:= True;
       end
       else
       begin
         SaveToLog('Не найден ' + GetSYSTempPath + 'Spr_Tovar_Attr.xml', 'recive.log');
         CheckListBox2.State[i]:= cbGrayed;
       end;
     end;
     Inc(i);
     Application.ProcessMessages;
     ProgressBar1.Position:= ProgressBar1.Min;
     if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
{*********************************************************************************}

{*********************************************************************************
                        Приём атрибутов товаров
*********************************************************************************}
     CheckListBox2.Selected[i]:= True;
     if notMainObj then
     begin
       if FileExists(GetSYSTempPath + 'Tovar_Atr.xml') then
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Tovar_Atr.xml');
         Open;

         with ShopMainForm.pFIBService do
         begin // Удаляем из справочника атрибутов товаров, которых нет в файле обмена
           SelectSQL.Clear;
           SelectSQL.Add('select count(*) as ATR_COUNT from TOVAR_ATR');
           Open;
           ProgressBar1.Max:= ShopMainForm.pFIBService['ATR_COUNT'];

           Close;
           SelectSQL.Clear;
           SelectSQL.Add('select ATR_ID, ITEM from TOVAR_ATR order by ATR_ID');
           Open;

           var cur_id: Integer;
           ClientDataSet1.Filtered:= True;
           cur_id:= -1;
           ProgressBar1.Position:= ProgressBar1.Min;
           while not Eof do
           begin
             if (cur_id <> ShopMainForm.pFIBService['ATR_ID']) then
             begin
               ClientDataSet1.Filter:= 'ATR_ID = ' + IntToStr(ShopMainForm.pFIBService['ATR_ID']);
               cur_id:= ShopMainForm.pFIBService['ATR_ID'];
             end;

             if not ClientDataSet1.Locate('ITEM', ShopMainForm.pFIBService.FieldByName('ITEM').AsString,[])then
               begin
                 ShopMainForm.pFIBDatabase1.Execute('delete from TOVAR_ATR where ATR_ID = '
                    + IntToStr(ShopMainForm.pFIBService['ATR_ID']) + ' and ITEM = ''' + ShopMainForm.pFIBService['ITEM'] + '''');
                 SaveToLog('SPR_TOVAR_ATTR(лишний атрибут для товара): ' + ShopMainForm.pFIBService['ITEM'] + ' - ' + IntToStr(ShopMainForm.pFIBService['ATR_ID']), 'recive.log');
               end;
{
          SelectSQL.Add('select * from TOVAR_ATR');
           Open;
           ProgressBar1.Position:= ProgressBar1.Min;
           while not Eof do
           begin
             if not ClientDataSet1.Locate('ATR_ID;ITEM', VarArrayOf([ShopMainForm.pFIBService.FieldByName('ATR_ID').AsInteger,
                  ShopMainForm.pFIBService.FieldByName('ITEM').AsString]),[])then
               begin
                 ShopMainForm.pFIBDatabase1.Execute('delete from TOVAR_ATR where ATR_ID = '
                    + IntToStr(ShopMainForm.pFIBService['ATR_ID']) + ' and ITEM = ''' + ShopMainForm.pFIBService['ITEM'] + '''');
                 SaveToLog('SPR_TOVAR_ATTR(лишний атрибут для товара): ' + ShopMainForm.pFIBService['ITEM'] + ' - ' + IntToStr(ShopMainForm.pFIBService['ATR_ID']), 'recive.log');
               end;
   }
             Next;
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Close;
           ClientDataSet1.Filtered:= False;
           ClientDataSet1.Filter:= '';
         end;

         First;
         ProgressBar1.Position:= ProgressBar1.Min;
         ProgressBar1.Max:= RecordCount;
         pFIBQuery1.SQL.Clear;
         pFIBQuery1.SQL.Add('update or insert into TOVAR_ATR(ATR_ID, ITEM)'
                 + ' values(:ATR_ID, :ITEM) matching(ATR_ID, ITEM)');
         pFIBQuery1.Prepare;
         while not Eof do
         begin
           pFIBQuery1.ParamByName('ATR_ID').AsInteger:= ClientDataSet1['ATR_ID'];
           pFIBQuery1.ParamByName('ITEM').AsString:= ClientDataSet1['ITEM'];
           pFIBQuery1.ExecQuery; // Добавляем атрибуты
           ProgressBar1.StepIt;
           Application.ProcessMessages;
           Next;
         end;
         Close;

         CheckListBox2.Checked[i]:= True;
       end
       else
       begin
         SaveToLog('Не найден ' + GetSYSTempPath + 'Tovar_Atr.xml', 'recive.log');
         CheckListBox2.State[i]:= cbGrayed;
       end;
     end;
     Inc(i);
     Application.ProcessMessages;
     ProgressBar1.Position:= ProgressBar1.Min;
     if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
{*********************************************************************************}

{*********************************************************************************
                              Приём остатков товаров
*********************************************************************************}
     CheckListBox2.Selected[i]:= True;
     if notMainObj then
     begin
       // Удаляем старые позиции
       ShopMainForm.pFIBDatabase1.Execute('delete from TOVAR_OST'
         + ' where MARKET_CODE <> ' + IntToStr(CurrentMarketCode));
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       pFIBQuery1.Close;
       pFIBQuery1.SQL.Clear;

       // Если есть .xml файл разбираем его
       if FileExists(GetSYSTempPath + 'Tovar_ost.xml') then
       begin
         with ClientDataSet1 do
         begin
           LoadFromFile(GetSYSTempPath + 'Tovar_ost.xml');
           Filter:= 'MARKET_CODE <> ' + IntToStr(CurrentMarketCode);
           Filtered:= True;
           Open;
           ProgressBar1.Max:= RecordCount;
           ProgressBar1.Position:= ProgressBar1.Min;

           pFIBQuery1.SQL.Add('insert into TOVAR_OST(MARKET_CODE, ITEM, '
             + 'KOLVO, DOC_DATE, VEND_PRICE, VENDOR_CODE)values(:MARKET_CODE, :ITEM, '
             + ':KOLVO, :DOC_DATE, :VEND_PRICE, :VENDOR_CODE)');
           pFIBQuery1.Prepare;

           while not Eof do
           begin  // Добавляем новые позиции
             pFIBQuery1.ParamByName('MARKET_CODE').AsInteger:= ClientDataSet1['MARKET_CODE'];
             pFIBQuery1.ParamByName('ITEM').AsString:= ClientDataSet1['ITEM'];
             pFIBQuery1.ParamByName('KOLVO').AsFloat:= ClientDataSet1['KOLVO'];
             pFIBQuery1.ParamByName('DOC_DATE').AsDateTime:= ClientDataSet1['DOC_DATE'];
             pFIBQuery1.ParamByName('VEND_PRICE').AsFloat:= ClientDataSet1['VEND_PRICE'];
             pFIBQuery1.ParamByName('VENDOR_CODE').AsInteger:= ClientDataSet1['VENDOR_CODE'];
             pFIBQuery1.ExecQuery;

             ProgressBar1.StepIt;
             Application.ProcessMessages;
             Next;
           end;
           Close;
           Filter:= '';
           Filtered:= False;
         end
       end
       else
       begin //  Если нет .xml файла принимаем из кэша fib
         pFIBQuery1.SQL.Add('insert into TOVAR_OST(MARKET_CODE, ITEM, '
           + 'KOLVO, DOC_DATE, VEND_PRICE, VENDOR_CODE)values(:MARKET_CODE, :ITEM, '
           + ':KOLVO, :DOC_DATE, :VEND_PRICE, :VENDOR_CODE)');
         if not ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.StartTransaction;
         pFIBQuery1.BatchInputRawFile(GetSYSTempPath + 'Tovar_ost.fib');
       end;

       CheckListBox2.Checked[i]:= True;
     end;
     Inc(i);
     ProgressBar1.Position:= ProgressBar1.Min;
     if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
{*********************************************************************************}


    finally
       CheckListBox2.Selected[CheckListBox2.Items.Count - 1]:= False;
       FormatSettings.DecimalSeparator:= TmpSep;
       with ShopMainForm.pFIBDatabase1 do
       begin

         Execute('ALTER TRIGGER SPR_VENDORS_BI ACTIVE;');
         Execute('ALTER TRIGGER SPR_BUYERS_BI ACTIVE;');

         Execute('ALTER TRIGGER SPR_TOVAR_BI ACTIVE;');
         Execute('ALTER TRIGGER SPR_TOVAR_BU ACTIVE;');

         Execute('ALTER TRIGGER HDR_PRIHOD_BU ACTIVE;');
         Execute('ALTER TRIGGER HDR_PRIHOD_BI ACTIVE;');

         Execute('ALTER TRIGGER HDR_RASHOD_BU ACTIVE;');
         Execute('ALTER TRIGGER HDR_RASHOD_BI ACTIVE;');
//         Execute('ALTER TRIGGER POS_RASHOD_BI0 ACTIVE;');

         Execute('ALTER TRIGGER HDR_SMENS_BI ACTIVE;');
         Execute('ALTER TRIGGER SPR_TOVAR_ATTR_BI0 ACTIVE;');

//         Execute('ALTER TRIGGER POS_SALES_BI0 ACTIVE;');
         if ShopMainForm.pFIBTransaction1.Active then
         begin
           ShopMainForm.pFIBTransaction1.Commit;
           SprFrmFree;
         end;
       end;
       ProgressBar1.Visible:= False;
       GroupBox1.Enabled:= True;
       GroupBox2.Enabled:= True;
       DelExists(GetSYSTempPath + 'transfer.ini');
       DelExists(GetSYSTempPath + 'kkm_log.err');
       DelExists(GetSYSTempPath + 'shop.err');
       DelExists(GetSYSTempPath + 'shop.log');
       DelExists(GetSYSTempPath + 'transfer.log');
       DelExists(GetSYSTempPath + 'Clients.xml');
       DelExists(GetSYSTempPath + 'Hdr_Prihod.xml');
       DelExists(GetSYSTempPath + 'Hdr_Rashod.xml');
       DelExists(GetSYSTempPath + 'Hdr_Smens.xml');
       DelExists(GetSYSTempPath + 'Price_Change.xml');
       DelExists(GetSYSTempPath + 'Pos_Prihod.xml');
       DelExists(GetSYSTempPath + 'Pos_Rashod.xml');
       DelExists(GetSYSTempPath + 'Pos_Sales.xml');
       DelExists(GetSYSTempPath + 'Spr_Acount.xml');
       DelExists(GetSYSTempPath + 'Spr_Buyers.xml');
       DelExists(GetSYSTempPath + 'Spr_Charge.xml');
       DelExists(GetSYSTempPath + 'Spr_Group.xml');
       DelExists(GetSYSTempPath + 'Spr_Market.xml');
       DelExists(GetSYSTempPath + 'Spr_Norm_Ost.xml');
       DelExists(GetSYSTempPath + 'Spr_Tovar.xml');
       DelExists(GetSYSTempPath + 'Spr_Vendors.xml');
       DelExists(GetSYSTempPath + 'Spr_Units.xml');
       DelExists(GetSYSTempPath + 'Spr_Users.xml');
       DelExists(GetSYSTempPath + 'Spr_Tovar_Attr.xml');
       DelExists(GetSYSTempPath + 'Tovar_Atr.xml');
       DelExists(GetSYSTempPath + 'Uchet.xml');
       DelExists(GetSYSTempPath + 'Tovar_ost.fib');

       CopyFile(PChar(Edit1.Text), PChar(ExtractFilePath(ParamStr(0)) + 'RECEIVE\' + ExtractFileName(Edit1.Text)), False);
       Screen.Cursor:= crDefault;
    end;

    SaveToLog('Загрузка данных из файла: ' + Edit1.Text + ' ('
    + FloatToStrF((GetTickCount - ProcTime)/60000, ffFixed, 16, 0)  + ' мин)', 'shop.log');
    MessageDlg('Данные успешно приняты (Время работы: ' + FloatToStrF((GetTickCount - ProcTime)/60000, ffFixed, 16, 0)
     + ' мин)', mtInformation, [mbOK], 0);
end;

procedure TDataSendFrm.MarketComboBoxChange(Sender: TObject);
begin
        DestObj:= FindMarketCode(MarketComboBox.Text);
        DateTimePicker1.DateTime:= BaseReadDateTime('TRANSMIT', IntToStr(DestObj) + 'LastDate', Now, -1);
        //ShopIni.ReadDateTime('Transmit', IntToStr(DestObj) + 'LastDate', Now);
        DateTimePicker2.DateTime:= DateTimePicker1.DateTime;
end;

procedure TDataSendFrm.OpenFTPBitBtnClick(Sender: TObject);
var LS: TStringList;
    i: Integer;
    FTPFile: String;
begin
   Application.CreateForm(TFTPFileLoadForm, FTPFileLoadForm);

   with ShopMainForm.IdFTP1 do
   begin
{
     Username:= FTPUsername;
     Password:= FTPPassword;
     Host:= FTPHost;
     Passive:= True;
}
     TransferType:= ftASCII;

     LS:= TStringList.Create;
     FTPFile:= '';
     Connect;
     try
      ChangeDir(FTPSendDir);
      ShopMainForm.IdFTP1.List(LS, '*.zip', True);
      for i:= 0 to ShopMainForm.IdFTP1.DirectoryListing.Count-1 do
        FTPFileLoadForm.ValueListEditor1.InsertRow(ShopMainForm.IdFTP1.DirectoryListing.Items[i].FileName,
          FormatDateTime('dd/mm/yyyy hh:mm', ShopMainForm.IdFTP1.DirectoryListing.Items[i].ModifiedDate), True);

      if FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row] = '' then
        MessageDlg('Нет файлов в папке обмена FTP', mtWarning, [mbOK], 0)
      else
        if FTPFileLoadForm.ShowModal = mrOK then
        begin
          FTPFile:= BaseReadString('TRANSMIT', 'SendPath', ExtractFilePath(ParamStr(0))+ 'Send\', -1) + FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row];
          ShopMainForm.IdFTP1.TransferType:= ftBinary;
          ShopMainForm.idFTP1.Get(FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row], FTPFile, True);
        end;

     finally
      Disconnect;
      LS.Free;
      FTPFileLoadForm.Free;
     end;
   end;
   if FTPFile <> '' then
   begin
     Edit1.Text:= FTPFile;
     OpenSendFile(FTPFile);
   end;
end;

procedure TDataSendFrm.DateTimePicker2Change(Sender: TObject);
begin
         DateTimePicker1.Time:= DateTimePicker2.Time;
end;

procedure TDataSendFrm.OpenSendFile(SendFileName: String);
var TmpPath: String;
begin
        if FileExists(SendFileName)then
        begin
          Memo2.Visible:= False;
          Memo2.Lines.Clear;
          Edit1.Text:= SendFileName;
          TmpPath:= GetSYSTempPath;
//          TmpPath:= ExtractFilePath(ParamStr(0)) + 'Temp\';
          with ShopMainForm.ZipForge1 do
          begin
            FileName:= SendFileName;
            BaseDir:= TmpPath;
            OpenArchive(fmOpenRead);
          try
            begin
              ExtractFiles('*.*');
              SaveToLog('Распаковка архива', 'recive.log');
              CloseArchive();

              SndIni:= TIniFile.Create(TmpPath + 'transfer.ini');
              SaveToLog('Подключение к transfer.ini', 'recive.log');
              with ClientDataSet1 do
              begin
                if SndIni.ReadInteger('Main', 'Market_Code', CurrentMarketCode) > -1 then
                begin
                  LoadFromFile(TmpPath + 'Spr_Market.xml');
                  Open;
                  SaveToLog('Открытие Spr_Market.xml', 'recive.log');
                  Locate('MARKET_CODE', SndIni.ReadString('Main', 'Market_Code', IntToStr(CurrentMarketCode)), []);
                  Memo2.Lines.Add('Объект : "' + ClientDataSet1['SHORT_NAME'] + '"');
                  Close;
                end
                else Memo2.Lines.Add('Объект : "По всем объектам"');
                LoadFromFile(TmpPath + 'Spr_Users.xml');
                Open;
                Locate('AUTOR_KOD', SndIni.ReadString('Main', 'Autor_Kod', IntToStr(User_ID)), []);
                Open;
                Memo2.Lines.Add('Пользователь : "' + TrimRight(ClientDataSet1['NAME']) + '"');
                Close;
              end;

              Memo2.Lines.Add('Начальная дата : "' + SndIni.ReadString('Main', 'BeginDateTime', 'Неуказана') + '"');
              Memo2.Lines.Add('Дата создания : "' + SndIni.ReadString('Main', 'SndDateTime', 'Неуказана') + '"');
              if SndIni.ReadBool('Main', 'Pereocen', False) then Memo2.Lines.Add('Переоценки : да')
              else Memo2.Lines.Add('Переоценки : нет');
              SndIni.Free;
              Memo2.Visible:= True;
              if FileExists(TmpPath + 'transfer.log')then
                Memo1.Lines.LoadFromFile(TmpPath + 'transfer.log');
              LMDButton3.Enabled:= True;
              LMDButton3.SetFocus;
            end;
        except
        on E: Exception do
          MessageDlg('Ошибка при распаковке архива', mtWarning, [mbOK], 0);
        end;

          end;
        end
        else MessageDlg('Указанный файл не существует', mtError, [mbOK], 0);
end;

procedure TDataSendFrm.LMDButton4Click(Sender: TObject);
begin
      OpenDialog1.Filter:= 'Файлы обмена|*_*.zip';
      OpenDialog1.Title:= 'Файлы обмена';
      if OpenDialog1.Execute then OpenSendFile(OpenDialog1.FileName);
// Информация о файле обмена
end;

function MakeDisk(const DirCnt: Integer = 0; const SHMess: Boolean = True): Integer;
var sr: TSearchRec;
     i: Integer;
begin
     if SHMess then  MessageDlg('Вставьте диск в дисковод А: и нажмите ENTER'
        +#13#10+'                         ВНИМАНИЕ !!! '
        +#13#10+'       Все данные на диске будут уничтожены',
        mtInformation, [mbOK], 0);
       if FindFirst('a:\*.*', faAnyFile, sr) = 0 then
       begin
         repeat
           WinErase(Application.Handle, 'a:\' + sr.Name, False, False);
         until FindNext(sr) <> 0;
         FindClose(sr);
       end;
{-I}
       for i:= 1 to DirCnt do MkDir('a:\' + IntToStr(i));
{+I}
       Result:= IOResult;
end;

function CheckFileNum2Disk(const FileName: String; const Drive: Byte = 1): Integer;
var FName: file of Byte;
begin
        AssignFile(FName, FileName);
        Reset(FName);
        Result:= DiskSize(1) div FileSize(FName);
        CloseFile(FName);
end;

procedure TDataSendFrm.ComboBox1Change(Sender: TObject);
begin
       ShopIni.WriteInteger('Transmit', 'Copy', ComboBox1.ItemIndex);
end;

procedure TDataSendFrm.BitBtn1Click(Sender: TObject);
var LastTransmit,EndDate: TDateTime;
    PCnt, i, Gr, j{, RCnt}: Integer;
    SendName: String;
    f: TextFile;
    TmpDSep: Char;
begin   // Обмен с 1С бухгалтерией
     if Edit2.Text <> '' then
     begin
       AssignFile(f, Edit2.Text);
       Rewrite(f);
       Screen.Cursor:= crHourGlass;
       GroupBox2.Enabled:= False;
       DestObj:= FindMarketCode(ComboBox2.Text);
       ProgressBar1.Visible:= True;
       for PCnt:= 0 to CheckListBox1.Count - 1 do CheckListBox1.Checked[PCnt] := False;
       LastTransmit:= DateTimePicker3.DateTime;
       EndDate:= DateTimePicker5.DateTime;
       TmpDSep:= FormatSettings.DecimalSeparator;
       FormatSettings.DecimalSeparator:= '.';
       i:= -1;
       Writeln(f, '"' + ComboBox2.Text + '" с ' + FormatDateTime('dd/mm/yy', LastTransmit)
         + ' по ' + FormatDateTime('dd/mm/yy', EndDate));
       if GroupComboBox.ItemIndex > 0 then
         with ShopMainForm.pFIBService do
         begin
           SelectSQL.Clear;
           SelectSQL.Add('select * from SPR_GROUP where GROUP_NAME = ''' + GroupComboBox.Text + '''');
           Open;
           if not VarIsNull(ShopMainForm.pFIBService['T_GROUP']) then
             Gr:= ShopMainForm.pFIBService['T_GROUP'];
           Close;
         end
         else Gr:= 0;
{*********************************************************************************
                          Передача справочника пользователей
*********************************************************************************
       with IBQuery2 do
       begin
         SQL.Clear;
         SQL.Add('select count(*) as CNT from SPR_USERS');
         Open;
         ProgressBar1.Max:= IBQuery2['CNT'];
         ProgressBar1.Position:= ProgressBar1.Min;
         Close;
         SQL.Clear;
         SQL.Add('select * from SPR_USERS');
         Open;
         Writeln(f, 'ШапкаПользователи' + #9 + 'Код' + #9 + 'Имя' + #9 + 'Пароль'
              + #9 + 'Роль' + #9 + 'Пароль_ККМ');
         while not Eof do
         begin
           Writeln(f, 'Таблица' + #9 + IntToStr(IBQuery2['AUTOR_KOD']) + #9
              + IBQuery2['NAME'] + #9 + IBQuery2['USR_PASSW'] + #9
              + IntToStr(IBQuery2['USR_ROLE']) + #9 + IntToStr(IBQuery2['FR_PASSW']));
           if DisplayProgress then ProgressBar1.StepIt;
           Next;
           Application.ProcessMessages;
         end;
         Close;
         Inc(i);
         CheckListBox1.Checked[i]:= True;
         ProgressBar1.Position:= ProgressBar1.Min;
       end;
{*********************************************************************************}

{*********************************************************************************
                          Передача справочника объектов
*********************************************************************************
       with IBQuery2 do
       begin
         SQL.Clear;
         SQL.Add('select count(*) as CNT from SPR_MARKET');
         Open;
         ProgressBar1.Max:= IBQuery2['CNT'];
         ProgressBar1.Position:= ProgressBar1.Min;
         Close;
         SQL.Clear;
         SQL.Add('select * from SPR_MARKET');
         Open;
         Writeln(f, 'ШапкаОбъекты' + #9 + 'Код' + #9 + 'Сокр.название' + #9 + 'Название'
             + #9 + 'Адрес' + #9 + 'Тип объекта');
         while not Eof do
         begin
           Writeln(f, 'Таблица' + #9 + IntToStr(IBQuery2['MARKET_CODE']) + #9
               + IBQuery2['SHORT_NAME'] + #9 + IBQuery2['MARKET_NAME'] + #9
               + IBQuery2['MARKET_ADR'] + #9 + IntToStr(IBQuery2['MARKET_TYPE']));
           if DisplayProgress then ProgressBar1.StepIt;
           Next;
           Application.ProcessMessages;
         end;
         Close;
         Inc(i);
         CheckListBox1.Checked[i]:= True;
         ProgressBar1.Position:= ProgressBar1.Min;
       end;
{*********************************************************************************}

{*********************************************************************************
                          Передача справочника групп учёта
*********************************************************************************
       with IBQuery2 do
       begin
         SQL.Clear;
         SQL.Add('select count(*) as CNT from SPR_ACOUNT');
         Open;
         ProgressBar1.Max:= IBQuery2['CNT'];
         ProgressBar1.Position:= ProgressBar1.Min;
         Close;
         SQL.Clear;
         SQL.Add('select * from SPR_ACOUNT');
         Open;
         Writeln(f, 'ШапкаУчётныеГруппы' + #9 + 'Код' + #9 + 'Название');
         while not Eof do
         begin
           Writeln(f, 'Таблица' + #9 + IntToStr(IBQuery2['KOD_ACOUNT']) + #9
              + IBQuery2['ACOUNT_NAME']);
           if DisplayProgress then ProgressBar1.StepIt;
           Next;
           Application.ProcessMessages;
         end;
         Close;
         Inc(i);
         CheckListBox1.Checked[i]:= True;
         ProgressBar1.Position:= ProgressBar1.Min;
       end;
{*********************************************************************************}

{*********************************************************************************
                          Передача справочника групп товаров
*********************************************************************************
       with IBQuery2 do
       begin
         SQL.Clear;
         SQL.Add('select count(*) as CNT from SPR_GROUP');
         Open;
         ProgressBar1.Max:= IBQuery2['CNT'];
         ProgressBar1.Position:= ProgressBar1.Min;
         Close;
         SQL.Clear;
         SQL.Add('select * from SPR_GROUP');
         Open;
         Writeln( f, 'ШапкаГруппыТоваров' + #9 + 'Код' + #9 + 'Название'
             + #9 + 'Посл.именение' + #9 + 'Код учёта');
         while not Eof do
         begin
           Writeln( f, 'Таблица' + #9 + IntToStr(IBQuery2['T_GROUP'])
              + #9 + IBQuery2['GROUP_NAME'] + #9 + DateTimeToStr(IBQuery2['LAST_UPD'])
               + #9 + IntToStr(IBQuery2['KOD_ACOUNT']));
           if DisplayProgress then ProgressBar1.StepIt;
           Next;
           Application.ProcessMessages;
         end;
         Close;
         Inc(i);
         CheckListBox1.Checked[i]:= True;
         ProgressBar1.Position:= ProgressBar1.Min;
       end;
{*********************************************************************************}

{*********************************************************************************
                          Передача справочника поставщиков
*********************************************************************************
       with IBQuery2 do
       begin
         SQL.Clear;
         SQL.Add('select count(*) as CNT from SPR_VENDORS');
         Open;
         ProgressBar1.Max:= IBQuery2['CNT'];
         ProgressBar1.Position:= ProgressBar1.Min;
         Close;
         SQL.Clear;
         SQL.Add('select * from SPR_VENDORS');
         Open;
         Writeln(f, 'ШапкаПоставщики' + #9 + 'Код' + #9 + 'Сокр.название' + #9 + 'Название'
             + #9 + 'Телефон' + #9 + 'ИНН' + #9 + 'ОКНХ' + #9 + 'ОКПО' + #9 + 'Адрес'
              + #9 + 'Примечание');
         while not Eof do
         begin
           Writeln(f, 'Таблица'  + #9 + IntToStr(IBQuery2['VENDOR_CODE'])
              + #9 + IBQuery2['VENDOR_NAME'] + #9 + IBQuery2['NAME']
              + #9 + IBQuery2['PHONE'] + #9 + IBQuery2['INN'] + #9 + IBQuery2['OKOHX']
              + #9 + IBQuery2['OKPO'] + #9 + IBQuery2['ADRES'] + #9 + IBQuery2['REMARK']);
           if DisplayProgress then ProgressBar1.StepIt;
           Next;
           Application.ProcessMessages;
         end;
         Close;
         Inc(i);
         CheckListBox1.Checked[i]:= True;
         ProgressBar1.Position:= ProgressBar1.Min;
       end;
{*********************************************************************************}

{*********************************************************************************
                          Передача справочника покупателей
*********************************************************************************
       with IBQuery2 do
       begin
         SQL.Clear;
         SQL.Add('select count(*) as CNT from SPR_BUYERS');
         Open;
         ProgressBar1.Max:= IBQuery2['CNT'];
         ProgressBar1.Position:= ProgressBar1.Min;
         Close;
         SQL.Clear;
         SQL.Add('select * from SPR_BUYERS');
         Open;
         Writeln(f, 'ШапкаПокупатели' + #9 + 'Код' + #9 + 'Сокр.название' + #9 + 'Название'
             + #9 + 'Телефон' + #9 + 'ИНН' + #9 + 'ОКНХ' + #9 + 'ОКПО' + #9 + 'Адрес'
              + #9 + 'Примечание');
         while not Eof do
         begin
           Writeln(f, 'Таблица'  + #9 + IntToStr(IBQuery2['BUYER_CODE'])
              + #9 + IBQuery2['BUYER_NAME'] + #9 + IBQuery2['NAME']
              + #9 + IBQuery2['PHONE'] + #9 + IBQuery2['INN'] + #9 + IBQuery2['OKOHX']
              + #9 + IBQuery2['OKPO'] + #9 + IBQuery2['ADRES'] + #9 + IBQuery2['REMARK']);
           if DisplayProgress then ProgressBar1.StepIt;
           Next;
           Application.ProcessMessages;
         end;
         Close;
         Inc(i);
         CheckListBox1.Checked[i]:= True;
         ProgressBar1.Position:= ProgressBar1.Min;
       end;
{*********************************************************************************}

{*********************************************************************************
                          Передача справочника ед.измерения
*********************************************************************************
       with IBQuery2 do
       begin
         SQL.Clear;
         SQL.Add('select count(*) as CNT from SPR_UNITS');
         Open;
         ProgressBar1.Max:= IBQuery2['CNT'];
         ProgressBar1.Position:= ProgressBar1.Min;
         Close;
         SQL.Clear;
         SQL.Add('select * from SPR_UNITS');
         Open;
         Writeln(f, 'ШапкаЕд.Измерения' + #9 + 'Код' + #9 + 'Название' + #9 + 'ПризнакЦелого');
         while not Eof do
         begin
           Writeln(f, 'Таблица' + #9 + IntToStr(IBQuery2['UNIT_KOD'])
              + #9 + IBQuery2['UNIT_NAME'] + #9 + IntToStr(IBQuery2['UNIT_INT']));
           if DisplayProgress then ProgressBar1.StepIt;
           Next;
           Application.ProcessMessages;
         end;
         Close;
         Inc(i);
         CheckListBox1.Checked[i]:= True;
         ProgressBar1.Position:= ProgressBar1.Min;
       end;
{*********************************************************************************}

{*********************************************************************************
                          Передача справочника товаров
*********************************************************************************
       with IBQuery2 do
       begin  
         SQL.Clear;
         SQL.Add('select count(*) as CNT from SPR_TOVAR where SALE_PRICE > 0');
         Open;
         ProgressBar1.Max:= IBQuery2['CNT'];
         ProgressBar1.Position:= ProgressBar1.Min;
         Close;
         SQL.Clear;
         SQL.Add('select * from SPR_TOVAR');
         Open;
         Writeln(f, 'ШапкаТовары' + #9 + 'Код' + #9 + 'Название' + #9 + 'Группа'
           + #9 + 'Цена продажи' + #9 + 'Цена поставщика' + #9 + 'Посл.изменение'
           + #9 + 'Секция ККМ' + #9 + 'Код поставщика' + #9 + 'Поставщик'
           + #9 + 'Код пользователя' + #9 + 'Пользователь' + #9 + 'Примечание'
           + #9 + 'Код ед.измерения' + #9 + 'Ед.измерения' + #9 + 'Артикул'
           + #9 + 'Производитель' + #9 + 'Примечание1' + #9 + 'Код закупки');
         while not Eof do
         begin
           Writeln(f, 'Таблица' + #9 + IBQuery2['ITEM'] + #9 + IBQuery2['TOVAR_NAME']
             + #9 + IntToStr(IBQuery2['T_GROUP']) + #9 + FloatToStr(IBQuery2['SALE_PRICE'])
             + #9 + FloatToStr(IBQuery2['VEND_PRICE']) + #9 + DateTimeToStr(IBQuery2['LAST_UPD'])
             + #9 + IntToStr(IBQuery2['KKM_SECT']) + #9 + IntToStr(IBQuery2['VENDOR_CODE'])
             + #9 + FindVendor(IBQuery2['VENDOR_CODE']) + #9 + IntToStr(IBQuery2['AUTOR_KOD'])
             + #9 + FindUser(IBQuery2['AUTOR_KOD']) + #9 + IBQuery2['REMARK']
             + #9 + IntToStr(IBQuery2['UNIT_KOD']) + #9 + FindUnit(IBQuery2['UNIT_KOD'])
             + #9 + IBQuery2['ARTIKUL'] + #9 + IBQuery2['PRODUCER']
             + #9 + IBQuery2['REMARK_1'] + #9 + IBQuery2['VEND_ITEM']);
           if DisplayProgress then ProgressBar1.StepIt;
           Next;
           Application.ProcessMessages;
         end;
         Close;
         Inc(i);
         CheckListBox1.Checked[i]:= True;
         ProgressBar1.Position:= ProgressBar1.Min;
       end;
{*********************************************************************************}
{*********************************************************************************
                          Передача справочника норм наценки
*********************************************************************************
       with IBQuery2 do
       begin
         SQL.Clear;
         SQL.Add('select count(*) as CNT from SPR_CHARGE');
         SQL.Add('where ITEM in (select ITEM from SPR_TOVAR where SALE_PRICE > 0)');
         Open;
         ProgressBar1.Max:= IBQuery2['CNT'];
         ProgressBar1.Position:= ProgressBar1.Min;
         Close;
         SQL.Clear;
         SQL.Add('select * from SPR_CHARGE');
         Open;
         Writeln(f, 'ШапкаНаценка' + #9 + 'Код товара' + #9 + 'Наценка');
         while not Eof do
         begin
           Writeln(f, 'Таблица' + #9 + IBQuery2['ITEM']
             + #9 + IntToStr(IBQuery2['EXTRA_CHARGE']));
           if DisplayProgress then ProgressBar1.StepIt;
           Next;
           Application.ProcessMessages;
         end;
         Close;
         Inc(i);
         CheckListBox1.Checked[i]:= True;
         ProgressBar1.Position:= ProgressBar1.Min;
       end;
{*********************************************************************************}
         i:= 8; //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
{*********************************************************************************
                          Передача приходных накладных
*********************************************************************************}
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select count(*) as CNT from HDR_PRIHOD');
         SelectSQL.Add('where LAST_UPD > ''' + DateTimeToStr(LastTransmit) + '''');
         SelectSQL.Add('and LAST_UPD <= ''' + DateTimeToStr(EndDate) + '''');
         if ComboBox2.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         Open;
         ProgressBar1.Max:= pFIBDataSet2['CNT'];
         ProgressBar1.Position:= ProgressBar1.Min;
         Close;
         SelectSQL.Clear;
         SelectSQL.Add('select * from HDR_PRIHOD');
         SelectSQL.Add('where LAST_UPD > ''' + DateTimeToStr(LastTransmit) + '''');
         SelectSQL.Add('and LAST_UPD <= ''' + DateTimeToStr(EndDate) + '''');
         if ComboBox2.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         Open;
         while not Eof do
         begin
           case pFIBDataSet2['DOC_TYPE'] of
{1 - Приходная накладная, 2 - Расходная накладная, 3- Переброска расход,
4 - Пересортица, 5 - Списание недостачи, 6 - Оприходование, 7 - Переброска приход,
8 - Возврат поставщику, 9 - Списание, 10 - Возврат от покупателя, 11 - Продажа,
12 - Резерв }
             1: SendName:= 'ШапкаПриход';
             4: SendName:= 'ШапкаПересортица';
             6: SendName:= 'ШапкаОприходывание';
             7: SendName:= 'ШапкаПереброскаПриход';
            10: SendName:= 'ШапкаВозвратПокупателя';
           end;

           pFIBDataSet1.SelectSQL.Clear;
           pFIBDataSet1.SelectSQL.Add('select P.*, T.TOVAR_NAME, T.UNIT_KOD, T.T_GROUP, G.GROUP_NAME');
           pFIBDataSet1.SelectSQL.Add('from POS_PRIHOD P left join SPR_TOVAR T on P.ITEM = T.ITEM');
           pFIBDataSet1.SelectSQL.Add('left join SPR_GROUP G on T.T_GROUP = G.T_GROUP');
           pFIBDataSet1.SelectSQL.Add('where KOD = ' + IntToStr(pFIBDataSet2['KOD']));
           pFIBDataSet1.Open;
           if(GroupComboBox.ItemIndex > 0)and(pFIBDataSet1['T_GROUP'] = Gr)then
             Writeln(f, SendName
               + #9 + FindMarket(pFIBDataSet2['MARKET_CODE'])
               + #9 + FormatDateTime('dd/mm/yy', pFIBDataSet2['DOC_DATE'])
               + #9'М-' + IntToStr(pFIBDataSet2['DOC_NUMBER'])
               + #9 + FindVendor(pFIBDataSet2['VENDOR_CODE'])
               + #9 + FindUser(pFIBDataSet2['AUTOR_KOD'])
               + #9 + FloatToStr(pFIBDataSet2['VEND_SUM'])
               + #9 + FloatToStr(pFIBDataSet2['DOC_SUM']) + #9)
           else
             Writeln(f, SendName {+ #9 + IntToStr(pFIBDataSet2['MARKET_CODE'])}
               + #9 + FindMarket(pFIBDataSet2['MARKET_CODE'])
               + #9 + FormatDateTime('dd/mm/yy', pFIBDataSet2['DOC_DATE'])
               + #9 + IntToStr(pFIBDataSet2['DOC_NUMBER'])
  //             + #9 + IntToStr(pFIBDataSet2['VENDOR_CODE'])
               + #9 + FindVendor(pFIBDataSet2['VENDOR_CODE'])
  //             + #9 + IntToStr(pFIBDataSet2['DOC_TYPE'])
  //             + #9 + IntToStr(pFIBDataSet2['AUTOR_KOD'])
               + #9 + FindUser(pFIBDataSet2['AUTOR_KOD'])
  //             + #9 + DateTimeToStr(pFIBDataSet2['LAST_UPD'])
               + #9 + FloatToStr(pFIBDataSet2['VEND_SUM'])
               + #9 + FloatToStr(pFIBDataSet2['DOC_SUM']) + #9);
  //             + #9 + IntToStr(pFIBDataSet2['KOD'])

           case pFIBDataSet2['DOC_TYPE'] of
{1 - Приходная накладная, 2 - Расходная накладная, 3- Переброска расход,
4 - Пересортица, 5 - Списание недостачи, 6 - Оприходование, 7 - Переброска приход,
8 - Возврат поставщику, 9 - Списание, 10 - Возврат от покупателя, 11 - Продажа,
12 - Резерв }
             1: SendName:= 'ТаблицаПриход';
             4: SendName:= 'ТаблицаПересортица';
             6: SendName:= 'ТаблицаОприходывание';
             7: SendName:= 'ТаблицаПереброскаПриход';
            10: SendName:= 'ТаблицаВозвратПокупателя';
           end;
           while not pFIBDataSet1.Eof do
           begin
             Writeln(f, SendName + #9 + pFIBDataSet1['ITEM']
               + #9 + pFIBDataSet1['TOVAR_NAME']
               + #9 + FloatToStr(pFIBDataSet1['KOLVO'])
               + #9 + FindUnit(pFIBDataSet1['UNIT_KOD'])
               + #9 + FloatToStr(pFIBDataSet1['PRICE'])
               + #9 + FloatToStr(pFIBDataSet1['VEND_PRICE'])
               + #9 + IntToStr(pFIBDataSet1['T_GROUP']) + 'Г'
               + #9 + pFIBDataSet1['GROUP_NAME'] + #9);
//               + #9 + IntToStr(pFIBDataSet1['MARKET_CODE'])
//               + #9 + FindMarket(pFIBDataSet1['MARKET_CODE'])
             pFIBDataSet1.Next;
           end;
           pFIBDataSet1.Close;

           ProgressBar1.StepIt;
           Application.ProcessMessages;
           Next;
         end;
         Close;
         Inc(i);
         CheckListBox1.Checked[i]:= True;
         ProgressBar1.Position:= ProgressBar1.Min;
       end;
{*********************************************************************************}
{*********************************************************************************
                          Передача расходных накладных
*********************************************************************************}
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select count(*) as CNT from HDR_RASHOD');
         SelectSQL.Add('where LAST_UPD > ''' + DateTimeToStr(LastTransmit) + '''');
         SelectSQL.Add('and LAST_UPD <= ''' + DateTimeToStr(EndDate) + '''');
         if MarketComboBox.ItemIndex > 0 then
            SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         Open;
         ProgressBar1.Max:= pFIBDataSet2['CNT'];
         ProgressBar1.Position:= ProgressBar1.Min;
         Close;
         SelectSQL.Clear;
         SelectSQL.Add('select * from HDR_RASHOD');
         SelectSQL.Add('where LAST_UPD > ''' + DateTimeToStr(LastTransmit) + '''');
         SelectSQL.Add('and LAST_UPD <= ''' + DateTimeToStr(EndDate) + '''');
         if ComboBox2.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         Open;
         while not Eof do
         begin
           case pFIBDataSet2['DOC_TYPE'] of
{1 - Приходная накладная, 2 - Расходная накладная, 3- Переброска расход,
4 - Пересортица, 5 - Списание недостачи, 6 - Оприходование, 7 - Переброска приход,
8 - Возврат поставщику, 9 - Списание, 10 - Возврат от покупателя, 11 - Продажа,
12 - Резерв }
             2: SendName:= 'ШапкаРасход';
             3: SendName:= 'ШапкаПереброскаРасход';
             4: SendName:= 'ШапкаПересортица';
             5: SendName:= 'ШапкаСписаниеНедостачи';
             8: SendName:= 'ШапкаВозвратПоставщику';
             9: SendName:= 'ШапкаСписание';
            11: SendName:= 'ШапкаПродажа';
            12: SendName:= 'ШапкаРезерв';
           end;

           pFIBDataSet1.SelectSQL.Clear;
           pFIBDataSet1.SelectSQL.Add('select P.*, T.TOVAR_NAME, T.UNIT_KOD, T.T_GROUP, G.GROUP_NAME');
           pFIBDataSet1.SelectSQL.Add('from POS_RASHOD P left join SPR_TOVAR T on P.ITEM = T.ITEM');
           pFIBDataSet1.SelectSQL.Add('left join SPR_GROUP G on T.T_GROUP = G.T_GROUP');
           pFIBDataSet1.SelectSQL.Add('where P.KOD = ' + IntToStr(pFIBDataSet2['KOD']));
           pFIBDataSet1.Open;
           if(GroupComboBox.ItemIndex > 0)and(pFIBDataSet1['T_GROUP'] = Gr)then
             Writeln(f, SendName {+ #9 + IntToStr(pFIBDataSet2['MARKET_CODE'])}
               + #9 + FindMarket(pFIBDataSet2['MARKET_CODE'])
               + #9 + FormatDateTime('dd/mm/yy', pFIBDataSet2['DOC_DATE'])
               + #9'М-' + IntToStr(pFIBDataSet2['DOC_NUMBER'])
  //             + #9 + IntToStr(pFIBDataSet2['VENDOR_CODE'])
               + #9 + FindVendor(pFIBDataSet2['VENDOR_CODE'])
  //             + #9 + IntToStr(pFIBDataSet2['DOC_TYPE'])
  //             + #9 + IntToStr(pFIBDataSet2['AUTOR_KOD'])
               + #9 + FindUser(pFIBDataSet2['AUTOR_KOD'])
  //             + #9 + DateTimeToStr(pFIBDataSet2['LAST_UPD'])
               + #9 + FloatToStr(pFIBDataSet2['VEND_SUM'])
               + #9 + FloatToStr(pFIBDataSet2['DOC_SUM']) + #9)
  //             + #9 + IntToStr(pFIBDataSet2['KOD'])
           else
             Writeln(f, SendName {+ #9 + IntToStr(pFIBDataSet2['MARKET_CODE'])}
               + #9 + FindMarket(pFIBDataSet2['MARKET_CODE'])
               + #9 + FormatDateTime('dd/mm/yy', pFIBDataSet2['DOC_DATE'])
               + #9 + IntToStr(pFIBDataSet2['DOC_NUMBER'])
  //             + #9 + IntToStr(pFIBDataSet2['VENDOR_CODE'])
               + #9 + FindVendor(pFIBDataSet2['VENDOR_CODE'])
  //             + #9 + IntToStr(pFIBDataSet2['DOC_TYPE'])
  //             + #9 + IntToStr(pFIBDataSet2['AUTOR_KOD'])
               + #9 + FindUser(pFIBDataSet2['AUTOR_KOD'])
  //             + #9 + DateTimeToStr(pFIBDataSet2['LAST_UPD'])
               + #9 + FloatToStr(pFIBDataSet2['VEND_SUM'])
               + #9 + FloatToStr(pFIBDataSet2['DOC_SUM']) + #9);
  //             + #9 + IntToStr(pFIBDataSet2['KOD'])

           case pFIBDataSet2['DOC_TYPE'] of
{1 - Приходная накладная, 2 - Расходная накладная, 3- Переброска расход,
4 - Пересортица, 5 - Списание недостачи, 6 - Оприходование, 7 - Переброска приход,
8 - Возврат поставщику, 9 - Списание}
             2: SendName:= 'ТаблицаРасход';
             3: SendName:= 'ТаблицаПереброскаРасход';
             4: SendName:= 'ТаблицаПересортица';
             5: SendName:= 'ТаблицаСписаниеНедостачи';
             8: SendName:= 'ТаблицаВозвратПоставщику';
             9: SendName:= 'ТаблицаСписание';
            11: SendName:= 'ТаблицаПродажа';
            12: SendName:= 'ТаблицаРезерв';
           end;
           while not pFIBDataSet1.Eof do
           begin
             Writeln(f, SendName + #9 + pFIBDataSet1['ITEM']
               + #9 + pFIBDataSet1['TOVAR_NAME']
               + #9 + FloatToStr(pFIBDataSet1['KOLVO'])
               + #9 + FindUnit(pFIBDataSet1['UNIT_KOD'])
               + #9 + FloatToStr(pFIBDataSet1['PRICE'])
               + #9 + FloatToStr(pFIBDataSet1['VEND_PRICE'])
               + #9 + IntToStr(pFIBDataSet1['T_GROUP'])
               + 'Г'#9 + pFIBDataSet1['GROUP_NAME'] + #9);
             pFIBDataSet1.Next;
           end;
           pFIBDataSet1.Close;

           ProgressBar1.StepIt;
           Next;
           Application.ProcessMessages;
         end;
         Close;
         Inc(i);
         CheckListBox1.Checked[i]:= True;
         ProgressBar1.Position:= ProgressBar1.Min;
       end;
{*********************************************************************************}

{*********************************************************************************
                          Передача переоценок
*********************************************************************************}
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select count(*) as CNT from PRICE_CHANGE');
         SelectSQL.Add('where P_DATE > ''' + DateTimeToStr(LastTransmit) + '''');
         SelectSQL.Add('and P_DATE <= ''' + DateTimeToStr(EndDate) + '''');
         if ComboBox2.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         Open;
         ProgressBar1.Max:= pFIBDataSet2['CNT'];
         ProgressBar1.Position:= ProgressBar1.Min;
         Close;
         SelectSQL.Clear;
         SelectSQL.Add('select P.*, T.TOVAR_NAME, T.UNIT_KOD, T.T_GROUP, G.GROUP_NAME');
         SelectSQL.Add('from PRICE_CHANGE P left join SPR_TOVAR T on T.ITEM = P.ITEM');
         SelectSQL.Add('left join SPR_GROUP G on G.T_GROUP = T.T_GROUP');
         SelectSQL.Add('where P_DATE > ''' + DateTimeToStr(LastTransmit) + '''');
         SelectSQL.Add('and P_DATE <= ''' + DateTimeToStr(EndDate) + '''');
         if ComboBox2.ItemIndex > 0 then
           SelectSQL.Add('and P.MARKET_CODE = ' + IntToStr(DestObj));
         Open;
//         if ProgressBar1.Max > 0 then
//           Writeln(f, 'ШапкаПереоценки');
         while not Eof do
         begin
           Writeln(f, 'ТаблицаПереоценки',
//             + #9 + IntToStr(pFIBDataSet2['MARKET_CODE'])
//             + #9 + FindMarket(pFIBDataSet2['MARKET_CODE'])
               pFIBDataSet2['ITEM']
             + #9 + pFIBDataSet2['TOVAR_NAME']
             + #9 + FloatToStr(pFIBDataSet2['KOLVO'])
             + #9 + FormatDateTime('dd/mm/yy', pFIBDataSet2['P_DATE'])
             + #9 + FloatToStr(pFIBDataSet2['OLD_PRICE'])
             + #9 + FloatToStr(pFIBDataSet2['NEW_PRICE'])
             + #9 + FindUnit(pFIBDataSet2['UNIT_KOD'])
             + #9 + IntToStr(pFIBDataSet2['T_GROUP']) + 'Г'
             + #9 + pFIBDataSet2['GROUP_NAME'] + #9);
           ProgressBar1.StepIt;
           Next;
           Application.ProcessMessages;
         end;
         Close;
         Inc(i);
         CheckListBox1.Checked[i]:= True;
         ProgressBar1.Position:= ProgressBar1.Min;
       end;
{*********************************************************************************}
{*********************************************************************************
                          Передача кассовых смен
*********************************************************************************}
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select count(*) as CNT from HDR_SMENS');
         SelectSQL.Add('where END_DATETIME > ''' + DateTimeToStr(LastTransmit) + '''');
         SelectSQL.Add('and END_DATETIME <= ''' + DateTimeToStr(EndDate) + '''');
         if ComboBox2.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         Open;
         ProgressBar1.Max:= pFIBDataSet2['CNT'];
         ProgressBar1.Position:= ProgressBar1.Min;
         Close;
         SelectSQL.Clear;
         SelectSQL.Add('select * from HDR_SMENS');
         SelectSQL.Add('where END_DATETIME > ''' + DateTimeToStr(LastTransmit) + '''');
         SelectSQL.Add('and END_DATETIME <= ''' + DateTimeToStr(EndDate) + '''');
         if ComboBox2.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         Open;
         j:= 0;
         while not Eof do
         begin  // Передача заголовков кассовых смен
           pFIBDataSet1.SelectSQL.Clear;   // Передача строк кассовых смен
           pFIBDataSet1.SelectSQL.Add('select P.ITEM, T.TOVAR_NAME, T.UNIT_KOD, P.SALE_PRICE, P.COST_PRICE, T.T_GROUP, G.GROUP_NAME,'
              + 'SUM(P.KOLVO*(1 + 2*(CAST(P.NCARD as INTEGER))))KOLVO');
           pFIBDataSet1.SelectSQL.Add('from POS_SALES P left join SPR_TOVAR T on P.ITEM = T.ITEM');
           pFIBDataSet1.SelectSQL.Add('left join SPR_GROUP G on G.T_GROUP = T.T_GROUP');
           pFIBDataSet1.SelectSQL.Add('where P.SMENS_KOD = ' + IntToStr(pFIBDataSet2['SMENS_KOD']));
           pFIBDataSet1.SelectSQL.Add('and CAST(P.NCARD as INTEGER) <= 0');

           if GroupComboBox.ItemIndex > 0 then
             if j = 0 then pFIBDataSet1.SelectSQL.Add('and not (T.T_GROUP = ' + IntToStr(Gr) + ')')
             else pFIBDataSet1.SelectSQL.Add('and T.T_GROUP = ' + IntToStr(Gr));

           pFIBDataSet1.SelectSQL.Add('group by P.ITEM, T.TOVAR_NAME, T.UNIT_KOD, P.SALE_PRICE, P.COST_PRICE, T.T_GROUP, G.GROUP_NAME');
           pFIBDataSet1.SelectSQL.Add('order by T.TOVAR_NAME');
           pFIBDataSet1.Open;
           if not VarIsNull(pFIBDataSet1['ITEM']) then
             if j = 0 then
               Writeln(f, 'ШапкаКассовыеСмены'
                 + #9 + FindMarket(pFIBDataSet2['MARKET_CODE'])
                 + #9 + FormatDateTime('dd/mm/yy', pFIBDataSet2['END_DATETIME'])
                 + #9 + IntToStr(pFIBDataSet2['SMENS_KOD']) + #9)
             else
               Writeln(f, 'ШапкаКассовыеСмены'
                 + #9 + FindMarket(pFIBDataSet2['MARKET_CODE'])
                 + #9 + FormatDateTime('dd/mm/yy', pFIBDataSet2['END_DATETIME'])
                 + #9'М-' + IntToStr(pFIBDataSet2['SMENS_KOD']) + #9);

           while not pFIBDataSet1.Eof do
           begin
             if pFIBDataSet1['KOLVO'] <> 0 then
               Writeln(f, 'ТаблицаКассовыеСмены'
                 + #9 + pFIBDataSet1['ITEM']
                 + #9 + pFIBDataSet1['TOVAR_NAME']
                 + #9 + FloatToStr(pFIBDataSet1['KOLVO'])
                 + #9 + FindUnit(pFIBDataSet1['UNIT_KOD'])
                 + #9 + FloatToStr(pFIBDataSet1['SALE_PRICE'])
                 + #9 + FloatToStr(pFIBDataSet1['COST_PRICE'])
                 + #9 + IntToStr(pFIBDataSet1['T_GROUP'])
                 + 'Г'#9 + pFIBDataSet1['GROUP_NAME'] + #9);
             pFIBDataSet1.Next;
           end;
           pFIBDataSet1.Close;
           if j = 0 then
           begin
             pFIBDataSet1.SelectSQL.Clear;
             pFIBDataSet1.SelectSQL.Add('select IIF(sum(SALE_PRICE) is null, 0, sum(SALE_PRICE)) as DISKONT from POS_SALES');
             pFIBDataSet1.SelectSQL.Add('where SMENS_KOD = ' + IntToStr(pFIBDataSet2['SMENS_KOD']));
             pFIBDataSet1.SelectSQL.Add('and cast(NCARD as integer) > 0');
             pFIBDataSet1.Open;
             if pFIBDataSet1['DISKONT'] > 0 then
               Writeln(f, 'ТаблицаКассовыеСмены'#9'Скидка'#9
                 + FloatToStr(pFIBDataSet1['DISKONT']) + #9);
             pFIBDataSet1.Close;
           end;

           if(GroupComboBox.ItemIndex = 0)or(j = 1)then
           begin
             ProgressBar1.StepIt;
             Next;
             j:= 0;
           end
           else j:= 1;

           Application.ProcessMessages;
         end;
         Close;
         Inc(i);
         CheckListBox1.Checked[i]:= True;
         ProgressBar1.Position:= ProgressBar1.Min;
       end;
{*********************************************************************************}

{*********************************************************************************
                               Передача учётов
*********************************************************************************}
       with pFIBDataSet2 do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select count(*) as CNT from UCHET');
         SelectSQL.Add('where SAVE_DATE > ''' + DateTimeToStr(LastTransmit) + '''');
         SelectSQL.Add('and SAVE_DATE <= ''' + DateTimeToStr(EndDate) + '''');
         if ComboBox2.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToSTR(DestObj));
         Open;
         ProgressBar1.Max:= pFIBDataSet2['CNT'];
         ProgressBar1.Position:= ProgressBar1.Min;
         Close;
         SelectSQL.Clear;
         SelectSQL.Add('select * from UCHET');
         SelectSQL.Add('where SAVE_DATE > ''' + DateTimeToStr(LastTransmit) + '''');
         SelectSQL.Add('and SAVE_DATE <= ''' + DateTimeToStr(EndDate) + '''');
         if ComboBox2.ItemIndex > 0 then
           SelectSQL.Add('and MARKET_CODE = ' + IntToStr(DestObj));
         Open;
         if ProgressBar1.Max > 0 then
           Writeln(f, 'ШапкаУчет' + #9 + FindMarket(pFIBDataSet2['MARKET_CODE'])
             + #9 + IntToStr(pFIBDataSet2['UCHET_NUM'])
             + #9 + FormatDateTime('dd/mm/yy', pFIBDataSet2['SAVE_DATE']));
         while not Eof do
         begin
           Writeln(f, 'ТаблицаУчет'
//             + #9 + IntToStr(pFIBDataSet2['MARKET_CODE'])
//             + #9 + FindMarket(pFIBDataSet2['MARKET_CODE'])
             + #9 + pFIBDataSet2['ITEM']
             + #9 + pFIBDataSet2['TOVAR_NAME']
//             + #9 + IntToStr(pFIBDataSet2['UCHET_NUM'])
             + #9 + FloatToStr(pFIBDataSet2['ACOUNT_KOLVO'])
             + #9 + FloatToStr(pFIBDataSet2['COUNT_KOLVO'])
             + #9 + FloatToStr(pFIBDataSet2['SALE_PRICE']) + #9);
//             + #9 + FormatDateTime('dd/mm/yy', pFIBDataSet2['SAVE_DATE'])
           ProgressBar1.StepIt;
           Application.ProcessMessages;
           Next;
         end;
         Close;
         Inc(i);
         CheckListBox1.Checked[i]:= True;
         ProgressBar1.Position:= ProgressBar1.Min;
       end;
{*********************************************************************************}
       ProgressBar1.Visible:= False;
       CloseFile(f);
       FormatSettings.DecimalSeparator:= TmpDSep;
       DateTimePicker3.DateTime:= Now;
       DateTimePicker4.DateTime:= Now;
       BitBtn1.Enabled:= True;
       GroupBox2.Enabled:= True;
       Screen.Cursor:= crDefault;
       MessageDlg('Передача завершена', mtInformation, [mbOK], 0);
     end
     else MessageDlg('Не задан файл обмена', mtWarning, [mbOK], 0);
end;

procedure TDataSendFrm.BitBtn2Click(Sender: TObject);
begin
      SaveDialog1.Filter:= 'Файл обмена c 1C|*.txt';
      SaveDialog1.Title:= 'Файл обмена c 1C';
      SaveDialog1.DefaultExt:= 'txt';
      if SaveDialog1.Execute then Edit2.Text:= SaveDialog1.FileName;
end;

procedure TDataSendFrm.DateTimePicker4Change(Sender: TObject);
begin
      DateTimePicker3.Time:= DateTimePicker4.Time;
end;

procedure TDataSendFrm.DateTimePicker6Change(Sender: TObject);
begin
      DateTimePicker5.Time:= DateTimePicker6.Time;
end;

procedure TDataSendFrm.BitBtn3Click(Sender: TObject);
begin
      PageControl1.ActivePage:= TabSheet1;
      TabSheet3.TabVisible:= False;
end;

procedure TDataSendFrm.BitBtn4Click(Sender: TObject);
var i,j,DocKod: Integer;
    notMainObj, DisplayProgress: Boolean;
    S: String;
    ProcTime: Longint;
begin  // Приём данных
       ProcTime:= GetTickCount;
       DisplayProgress:= True;
       i:= 0;
       for j:= 0 to CheckListBox2.Items.Count - 1 do
         CheckListBox2.Checked[j]:= False;
       CheckListBox2.MultiSelect:= False;
       Screen.Cursor:= crHourGlass;
       LMDButton3.Enabled:= False;
       GroupBox1.Enabled:= False;
       GroupBox2.Enabled:= False;
       notMainObj:= CurrentMarketType <> 0;
       DelExists(ExtractFilePath(ParamStr(0)) + 'recive.log');

       with ShopMainForm.pFIBDatabase1 do
       begin
         Execute('ALTER TRIGGER SPR_BUYERS_BI INACTIVE;');

         Execute('ALTER TRIGGER SPR_TOVAR_BI INACTIVE;');
         Execute('ALTER TRIGGER SPR_TOVAR_BU INACTIVE;');

         Execute('ALTER TRIGGER HDR_PRIHOD_BU INACTIVE;');
         Execute('ALTER TRIGGER HDR_PRIHOD_BI INACTIVE;');

         Execute('ALTER TRIGGER HDR_RASHOD_BU INACTIVE;');
         Execute('ALTER TRIGGER HDR_RASHOD_BI INACTIVE;');
//         Execute('ALTER TRIGGER POS_RASHOD_BI0 INACTIVE;');

         Execute('ALTER TRIGGER HDR_SMENS_BI INACTIVE;');
         Execute('ALTER TRIGGER SPR_TOVAR_ATTR_BI0 INACTIVE;');
//         Execute('ALTER TRIGGER POS_SALES_BI0 INACTIVE;');
         ShopMainForm.pFIBTransaction1.Commit;
         SprFrmFree;
       end;
       ProgressBar1.Visible:= True;

    try
{*********************************************************************************
                        Приём справочника пользователей
*********************************************************************************}
     CheckListBox2.Selected[i]:= True;
     if notMainObj then // Если объект НЕ ГЛАВНЫЙ обрабатываем справочник пользователей
       if FileExists(GetSYSTempPath + 'Spr_Users.xml') then
       begin
         with ClientDataSet1 do
         begin
           LoadFromFile(GetSYSTempPath + 'Spr_Users.xml');
           Open;
           ProgressBar1.Max:= RecordCount;
           ProgressBar1.Position:= ProgressBar1.Min;
           pFIBQuery1.SQL.Clear;
           pFIBQuery1.SQL.Add('update or insert into SPR_USERS(AUTOR_KOD, NAME, USR_PASSW, USR_ROLE, FR_PASSW)'
                   + 'values(:AUTOR_KOD, :NAME, :USR_PASSW, :USR_ROLE, :FR_PASSW) matching(AUTOR_KOD)');
           pFIBQuery1.Prepare;

           while not Eof do
           begin
             pFIBQuery1.ParamByName('AUTOR_KOD').AsInteger:= ClientDataSet1['AUTOR_KOD'];
             pFIBQuery1.ParamByName('NAME').AsString:= ClientDataSet1['NAME'];
             pFIBQuery1.ParamByName('USR_PASSW').AsString:= ClientDataSet1['USR_PASSW'];
             pFIBQuery1.ParamByName('USR_ROLE').AsInteger:= ClientDataSet1['USR_ROLE'];
             pFIBQuery1.ParamByName('FR_PASSW').AsInteger:= ClientDataSet1['FR_PASSW'];
             pFIBQuery1.ExecQuery;

             if DisplayProgress then
             begin
               ProgressBar1.StepIt;
               Application.ProcessMessages;
             end;
             Next;
           end;
           Close;

           CheckListBox2.State[i]:= cbChecked;
           SaveToLog('Принят ' + GetSYSTempPath + 'Spr_Users.xml', 'recive.log');
         end;
       end
       else
       begin
         SaveToLog('Не найден ' + GetSYSTempPath + 'Spr_Users.xml', 'recive.log');
         CheckListBox2.State[i]:= cbGrayed;
       end;

       if FileExists(GetSYSTempPath + 'User_Access.xml') then
       begin   // Обрабатываем справочник прав пользователей
         with ClientDataSet1 do
         begin
           LoadFromFile(GetSYSTempPath + 'User_Access.xml');
           Open;
           ProgressBar1.Max:= RecordCount;
           ProgressBar1.Position:= ProgressBar1.Min;
           pFIBQuery1.SQL.Clear;
           pFIBQuery1.SQL.Add('update or insert into USER_SETINGS(AUTOR_KOD, SECTION, KEY_NAME, KEY_VALUE)'
                   + 'values(:AUTOR_KOD, :SECTION, :KEY_NAME, :KEY_VALUE) matching(AUTOR_KOD, SECTION, KEY_NAME)');
           pFIBQuery1.Prepare;

           while not Eof do
           begin
             pFIBQuery1.ParamByName('AUTOR_KOD').AsInteger:= ClientDataSet1['AUTOR_KOD'];
             pFIBQuery1.ParamByName('SECTION').AsString:= ClientDataSet1['SECTION'];
             pFIBQuery1.ParamByName('KEY_NAME').AsString:= ClientDataSet1['KEY_NAME'];
             pFIBQuery1.ParamByName('KEY_VALUE').AsString:= ClientDataSet1['KEY_VALUE'];
             pFIBQuery1.ExecQuery;

             if DisplayProgress then
             begin
               ProgressBar1.StepIt;
               Application.ProcessMessages;
             end;
             Next;
           end;
           Close;

           CheckListBox2.State[i]:= cbChecked;
           SaveToLog('Принят ' + GetSYSTempPath + 'User_Access.xml', 'recive.log');
         end;
       end
       else
       begin
         SaveToLog('Не найден ' + GetSYSTempPath + 'User_Access.xml', 'recive.log');
         CheckListBox2.State[i]:= cbGrayed;
       end;

       Inc(i);
       Application.ProcessMessages;
       ProgressBar1.Visible:= True;
       ProgressBar1.Position:= ProgressBar1.Min;
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника объектов
*********************************************************************************}
     CheckListBox2.Selected[i]:= True;
     if notMainObj then // Если объект НЕ ГЛАВНЫЙ обрабатываем справочник
       if FileExists(GetSYSTempPath + 'Spr_Market.xml') then
       begin
         with ClientDataSet1 do
         begin
           LoadFromFile(GetSYSTempPath + 'Spr_Market.xml');
           Open;
           ProgressBar1.Max:= RecordCount;
           ProgressBar1.Position:= ProgressBar1.Min;
           pFIBQuery1.SQL.Clear;
           pFIBQuery1.SQL.Add('update or insert into SPR_MARKET(MARKET_CODE, SHORT_NAME, MARKET_NAME, '
                   + 'MARKET_ADR, MARKET_TYPE)values(:MARKET_CODE, :SHORT_NAME, :MARKET_NAME, '
                   + ':MARKET_ADR, :MARKET_TYPE) matching(MARKET_CODE)');
           pFIBQuery1.Prepare;
           while not Eof do
           begin
             pFIBQuery1.ParamByName('MARKET_CODE').AsInteger:= ClientDataSet1['MARKET_CODE'];
             pFIBQuery1.ParamByName('SHORT_NAME').AsString:= ClientDataSet1['SHORT_NAME'];
             pFIBQuery1.ParamByName('MARKET_NAME').AsString:= ClientDataSet1['MARKET_NAME'];
             pFIBQuery1.ParamByName('MARKET_ADR').AsString:= ClientDataSet1['MARKET_ADR'];
             pFIBQuery1.ParamByName('MARKET_TYPE').AsInteger:= ClientDataSet1['MARKET_TYPE'];
             pFIBQuery1.ExecQuery;
             if DisplayProgress then
             begin
               ProgressBar1.StepIt;
               Application.ProcessMessages;
             end;
             Next;
           end;
           Close;
           CheckListBox2.Checked[i]:= True;
         end;
       end
       else
       begin
         SaveToLog('Не найден ' + GetSYSTempPath + 'Spr_Market.xml', 'recive.log');
         CheckListBox2.State[i]:= cbGrayed;
       end;
       ProgressBar1.Position:= ProgressBar1.Min;
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       Application.ProcessMessages;
       Inc(i);
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника дисконтных карт
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       if FileExists(GetSYSTempPath + 'Clients.xml') then
         with ClientDataSet1 do
         begin
           LoadFromFile(GetSYSTempPath + 'Clients.xml');
           Open;
           ProgressBar1.Max:= RecordCount;
           ProgressBar1.Position:= ProgressBar1.Min;
             with ShopMainForm.pFIBService do
             begin
               SelectSQL.Clear;
               SelectSQL.Add('select NCARD from CLIENTS where NCARD = :NCARD');
               Prepare;
             end;
             pFIBQuery1.SQL.Clear;
             pFIBQuery1.SQL.Add('update or insert into CLIENTS(NCARD, PRICE, NAME, FAMILIA, OTCHESTVO, ADRES, PHONE)'
                     + 'values(:NCARD, :PRICE, :NAME, :FAMILIA, :OTCHESTVO, :ADRES, :PHONE) matching(NCARD)');
             pFIBQuery1.Prepare;
           if notMainObj then // Если объект НЕ ГЛАВНЫЙ обрабатываем весь справочник
           begin
             while not Eof do
             begin
               pFIBQuery1.ParamByName('NCARD').AsString:= ClientDataSet1['NCARD'];
               pFIBQuery1.ParamByName('PRICE').AsInteger:= ClientDataSet1['PRICE'];
               pFIBQuery1.ParamByName('NAME').AsString:= ClientDataSet1['NAME'];
               pFIBQuery1.ParamByName('FAMILIA').AsString:= ClientDataSet1['FAMILIA'];
               pFIBQuery1.ParamByName('OTCHESTVO').AsString:= ClientDataSet1['OTCHESTVO'];
               pFIBQuery1.ParamByName('ADRES').AsString:= ClientDataSet1['ADRES'];
               pFIBQuery1.ParamByName('PHONE').AsString:= ClientDataSet1['PHONE'];
               pFIBQuery1.ExecQuery;
               if DisplayProgress then
               begin
                 ProgressBar1.StepIt;
                 Application.ProcessMessages;
               end;
               Next;
             end;
           end
           else // Если объект ГЛАВНЫЙ добавляем новые
             while not Eof do
             begin
               ShopMainForm.pFIBService.ParamByName('NCARD').AsString:= ClientDataSet1['NCARD'];
               ShopMainForm.pFIBService.Open;
               if VarIsNull(ShopMainForm.pFIBService['NCARD'])then
               begin
                 pFIBQuery1.ParamByName('NCARD').AsString:= ClientDataSet1['NCARD'];
                 pFIBQuery1.ParamByName('PRICE').AsInteger:= ClientDataSet1['PRICE'];
                 pFIBQuery1.ParamByName('NAME').AsString:= ClientDataSet1['NAME'];
                 pFIBQuery1.ParamByName('FAMILIA').AsString:= ClientDataSet1['FAMILIA'];
                 pFIBQuery1.ParamByName('OTCHESTVO').AsString:= ClientDataSet1['OTCHESTVO'];
                 pFIBQuery1.ParamByName('ADRES').AsString:= ClientDataSet1['ADRES'];
                 pFIBQuery1.ParamByName('PHONE').AsString:= ClientDataSet1['PHONE'];
                 pFIBQuery1.ExecQuery;
               end;
               ShopMainForm.pFIBService.Close;
               if DisplayProgress then
               begin
                 ProgressBar1.StepIt;
                 Application.ProcessMessages;
               end;
               Next;
             end;
           Close;
           CheckListBox2.Checked[i]:= True;
         end
         else
         begin
           SaveToLog('Не найден ' + GetSYSTempPath + 'Clients.xml', 'recive.log');
           CheckListBox2.State[i]:= cbGrayed;
         end;
         Inc(i);
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника учётных групп
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Spr_Acount.xml');
         Open;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from SPR_ACOUNT');
             SelectSQL.Add('where KOD_ACOUNT = ' + IntToStr(ClientDataSet1['KOD_ACOUNT']));
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['KOD_ACOUNT'])then
             begin
               if notMainObj and
                  ((ShopMainForm.pFIBService['ACOUNT_NAME'] <> ClientDataSet1['ACOUNT_NAME'])or
                  (ShopMainForm.pFIBService['ACOUNT_TYPE'] <> ClientDataSet1['ACOUNT_TYPE']))then
                 ShopMainForm.pFIBDatabase1.Execute('update SPR_ACOUNT'
                   + ' set ACOUNT_NAME = ''' + ClientDataSet1['ACOUNT_NAME'] + ''','
                   + ' ACOUNT_TYPE = ' + IntToStr(ClientDataSet1['ACOUNT_TYPE'])
                   + ' where KOD_ACOUNT = ' + IntToStr(ClientDataSet1['KOD_ACOUNT']));
             end
             else
               ShopMainForm.pFIBDatabase1.Execute('insert into SPR_ACOUNT(KOD_ACOUNT, ACOUNT_NAME, ACOUNT_TYPE)'
                 + ' values(' + IntToStr(ClientDataSet1['KOD_ACOUNT']) + ', '''
                 + ClientDataSet1['ACOUNT_NAME'] + ''', ' + IntToStr(ClientDataSet1['ACOUNT_TYPE']) + ')');
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
       end;
       Inc(i);
       ProgressBar1.Position:= ProgressBar1.Min;
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       Application.ProcessMessages;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника групп товаров
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
{
         Execute('ALTER TRIGGER SPR_GROUP_BI INACTIVE;');
         Execute('ALTER TRIGGER SPR_GROUP_BU INACTIVE;');

         Execute('ALTER TRIGGER SPR_GROUP_BI ACTIVE;');
         Execute('ALTER TRIGGER SPR_GROUP_BU ACTIVE;');
}
         LoadFromFile(GetSYSTempPath + 'Spr_Group.xml');
         Open;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from SPR_GROUP');
             SelectSQL.Add('where T_GROUP = ' + IntToStr(ClientDataSet1['T_GROUP']));
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['T_GROUP'])then
             begin
               if notMainObj and
                  ((ShopMainForm.pFIBService['GROUP_NAME'] <> ClientDataSet1['GROUP_NAME'])or
                  (ShopMainForm.pFIBService['KOD_ACOUNT'] <> ClientDataSet1['KOD_ACOUNT'])or
                  (ShopMainForm.pFIBService['LAST_UPD'] <> ClientDataSet1['LAST_UPD']))then
                 ShopMainForm.pFIBDatabase1.Execute('update SPR_GROUP'
                   + ' set GROUP_NAME = ''' + ClientDataSet1['GROUP_NAME'] + ''','
                   + ' LAST_UPD = ''' + DateTimeToStr(ClientDataSet1['LAST_UPD']) + ''','
                   + ' KOD_ACOUNT = ' + IntToStr(ClientDataSet1['KOD_ACOUNT'])
                   + ' where T_GROUP = ' + IntToStr(ClientDataSet1['T_GROUP']));
             end
             else
               ShopMainForm.pFIBDatabase1.Execute('insert into SPR_GROUP(T_GROUP, GROUP_NAME,'
                 + ' LAST_UPD, KOD_ACOUNT)values(' + IntToStr(ClientDataSet1['T_GROUP']) + ', '''
                 + ClientDataSet1['GROUP_NAME'] + ''', ''' + DateTimeToStr(ClientDataSet1['LAST_UPD'])
                 + ''',' + IntToStr(ClientDataSet1['KOD_ACOUNT']) + ')');
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
       end;
       Inc(i);
       ProgressBar1.Position:= ProgressBar1.Min;
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       Application.ProcessMessages;
{*********************************************************************************}
{*********************************************************************************
                         Приём справочника поставщиков
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
      try
         ShopMainForm.pFIBDatabase1.Execute('ALTER TRIGGER SPR_VENDORS_BI INACTIVE;');

         LoadFromFile(GetSYSTempPath + 'Spr_Vendors.xml');
         Open;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from SPR_VENDORS');
             SelectSQL.Add('where VENDOR_CODE = ' + IntToStr(ClientDataSet1['VENDOR_CODE']));
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['VENDOR_CODE'])then
             begin
               if notMainObj and
                  ((ShopMainForm.pFIBService['VENDOR_NAME'] <> ClientDataSet1['VENDOR_NAME'])or
                  (ShopMainForm.pFIBService['NAME'] <> ClientDataSet1['NAME'])or
                  (ShopMainForm.pFIBService['PHONE'] <> ClientDataSet1['PHONE'])or
                  (ShopMainForm.pFIBService['INN'] <> ClientDataSet1['INN'])or
                  (ShopMainForm.pFIBService['OKOHX'] <> ClientDataSet1['OKOHX'])or
                  (ShopMainForm.pFIBService['OKPO'] <> ClientDataSet1['OKPO'])or
                  (ShopMainForm.pFIBService['ADRES'] <> ClientDataSet1['ADRES'])or
                  (ShopMainForm.pFIBService['KPP'] <> ClientDataSet1['KPP'])or
                  (ShopMainForm.pFIBService['REMARK'] <> ClientDataSet1['REMARK'])or
                  (ShopMainForm.pFIBService['BANK'] <> ClientDataSet1['BANK'])or
                  (ShopMainForm.pFIBService['KSCHET'] <> ClientDataSet1['KSCHET'])or
                  (ShopMainForm.pFIBService['RSCHET'] <> ClientDataSet1['RSCHET'])or
                  (ShopMainForm.pFIBService['BIK'] <> ClientDataSet1['BIK']))then
                 ShopMainForm.pFIBDatabase1.Execute('update SPR_VENDORS'
                   + ' set VENDOR_NAME = ''' + ClientDataSet1['VENDOR_NAME'] + ''','
                   + ' NAME = ''' + ClientDataSet1['NAME'] + ''','
                   + ' PHONE = ''' + ClientDataSet1['PHONE'] + ''','
                   + ' INN = ''' + ClientDataSet1['INN'] + ''','
                   + ' OKOHX = ''' + ClientDataSet1['OKOHX'] + ''','
                   + ' OKPO = ''' + ClientDataSet1['OKPO'] + ''','
                   + ' ADRES = ''' + ClientDataSet1['ADRES'] + ''','
                   + ' KPP = ''' + ClientDataSet1['KPP'] + ''','
                   + ' REMARK = ''' + ClientDataSet1['REMARK'] + ''','
                   + ' BANK = ''' + ClientDataSet1['BANK'] + ''','
                   + ' KSCHET = ''' + ClientDataSet1['KSCHET'] + ''','
                   + ' RSCHET = ''' + ClientDataSet1['RSCHET'] + ''','
                   + ' BIK = ''' + ClientDataSet1['BIK'] + ''''
                   + ' where VENDOR_CODE = ' + IntToStr(ClientDataSet1['VENDOR_CODE']));
             end
             else
               ShopMainForm.pFIBDatabase1.Execute('insert into SPR_VENDORS(VENDOR_CODE, VENDOR_NAME, NAME, '
                 + 'PHONE, INN, OKOHX, OKPO, ADRES, REMARK, BANK, KSCHET, RSCHET, BIK, KPP)'
                 + 'values(' + IntToStr(ClientDataSet1['VENDOR_CODE']) + ', '''
                 + ClientDataSet1['VENDOR_NAME'] + ''', ''' + ClientDataSet1['NAME'] + ''', '''
                 + ClientDataSet1['PHONE'] + ''', ''' + ClientDataSet1['INN'] + ''', '''
                 + ClientDataSet1['OKOHX'] + ''', ''' + ClientDataSet1['OKPO'] + ''', '''
                 + ClientDataSet1['ADRES'] + ''', ''' + ClientDataSet1['REMARK'] + ''', '''
                 + ClientDataSet1['BANK'] + ''', ''' + ClientDataSet1['KSCHET'] + ''', '''
                 + ClientDataSet1['RSCHET'] + ''', ''' + ClientDataSet1['BIK'] + ''', '''
                 + ClientDataSet1['KPP'] + ''')');
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
      finally
        ShopMainForm.pFIBDatabase1.Execute('ALTER TRIGGER SPR_VENDORS_BI ACTIVE;');
        if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
      end;
       end;
       Inc(i);
       ProgressBar1.Position:= ProgressBar1.Min;
       Application.ProcessMessages;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника покупателей
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Spr_Buyers.xml');
         Open;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from SPR_BUYERS');
             SelectSQL.Add('where BUYER_CODE = ' + IntToStr(ClientDataSet1['BUYER_CODE']));
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['BUYER_CODE'])then
             begin
               if notMainObj and
                  ((ShopMainForm.pFIBService['BUYER_NAME'] <> ClientDataSet1['BUYER_NAME'])or
                  (ShopMainForm.pFIBService['NAME'] <> ClientDataSet1['NAME'])or
                  (ShopMainForm.pFIBService['PHONE'] <> ClientDataSet1['PHONE'])or
                  (ShopMainForm.pFIBService['INN'] <> ClientDataSet1['INN'])or
                  (ShopMainForm.pFIBService['OKOHX'] <> ClientDataSet1['OKOHX'])or
                  (ShopMainForm.pFIBService['OKPO'] <> ClientDataSet1['OKPO'])or
                  (ShopMainForm.pFIBService['ADRES'] <> ClientDataSet1['ADRES'])or
                  (ShopMainForm.pFIBService['KPP'] <> ClientDataSet1['KPP'])or
                  (ShopMainForm.pFIBService['REMARK'] <> ClientDataSet1['REMARK'])or
                  (ShopMainForm.pFIBService['BANK'] <> ClientDataSet1['BANK'])or
                  (ShopMainForm.pFIBService['KSCHET'] <> ClientDataSet1['KSCHET'])or
                  (ShopMainForm.pFIBService['RSCHET'] <> ClientDataSet1['RSCHET'])or
                  (ShopMainForm.pFIBService['BIK'] <> ClientDataSet1['BIK']))then
                 ShopMainForm.pFIBDatabase1.Execute('update SPR_BUYERS'
                   + ' set BUYER_NAME = ''' + ClientDataSet1['BUYER_NAME'] + ''','
                   + ' NAME = ''' + ClientDataSet1['NAME'] + ''','
                   + ' PHONE = ''' + ClientDataSet1['PHONE'] + ''','
                   + ' INN = ''' + ClientDataSet1['INN'] + ''','
                   + ' OKOHX = ''' + ClientDataSet1['OKOHX'] + ''','
                   + ' OKPO = ''' + ClientDataSet1['OKPO'] + ''','
                   + ' ADRES = ''' + ClientDataSet1['ADRES'] + ''','
                   + ' KPP = ''' + ClientDataSet1['KPP'] + ''','
                   + ' REMARK = ''' + ClientDataSet1['REMARK'] + ''','
                   + ' BANK = ''' + ClientDataSet1['BANK'] + ''','
                   + ' KSCHET = ''' + ClientDataSet1['KSCHET'] + ''','
                   + ' RSCHET = ''' + ClientDataSet1['RSCHET'] + ''','
                   + ' BIK = ''' + ClientDataSet1['BIK'] + ''''
                   + ' where BUYER_CODE = ' + IntToStr(ClientDataSet1['BUYER_CODE']));
             end
             else
               ShopMainForm.pFIBDatabase1.Execute('insert into SPR_BUYERS(BUYER_CODE, BUYER_NAME, NAME, '
                 + 'PHONE, INN, OKOHX, OKPO, ADRES, REMARK, BANK, KSCHET, RSCHET, BIK, KPP)'
                 + 'values(' + IntToStr(ClientDataSet1['BUYER_CODE']) + ', '''
                 + ClientDataSet1['BUYER_NAME'] + ''', ''' + ClientDataSet1['NAME'] + ''', '''
                 + ClientDataSet1['PHONE'] + ''', ''' + ClientDataSet1['INN'] + ''', '''
                 + ClientDataSet1['OKOHX'] + ''', ''' + ClientDataSet1['OKPO'] + ''', '''
                 + ClientDataSet1['ADRES'] + ''', ''' + ClientDataSet1['REMARK'] + ''', '''
                 + ClientDataSet1['BANK'] + ''', ''' + ClientDataSet1['KSCHET'] + ''', '''
                 + ClientDataSet1['RSCHET'] + ''', ''' + ClientDataSet1['BIK'] + ''', '''
                 + ClientDataSet1['KPP'] + ''')');
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
       end;
       Inc(i);
       ProgressBar1.Position:= ProgressBar1.Min;
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       Application.ProcessMessages;
{*********************************************************************************}
{*********************************************************************************
                         Приём справочника ед.измерения
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Spr_Units.xml');
         Open;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from SPR_UNITS');
             SelectSQL.Add('where UNIT_KOD = ' + IntToStr(ClientDataSet1['UNIT_KOD']));
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['UNIT_KOD'])then
             begin
               if  notMainObj and
                  ((ShopMainForm.pFIBService['UNIT_INT'] <> ClientDataSet1['UNIT_INT'])or
                  (ShopMainForm.pFIBService['UNIT_NAME'] <> ClientDataSet1['UNIT_NAME']))then
                 ShopMainForm.pFIBDatabase1.Execute('update SPR_UNITS'
                   + ' set UNIT_NAME = ''' + ClientDataSet1['UNIT_NAME'] + ''','
                   + ' UNIT_INT = ' + IntToStr(ClientDataSet1['UNIT_INT'])
                   + ' where UNIT_KOD = ' + IntToStr(ClientDataSet1['UNIT_KOD']));
             end
             else
               ShopMainForm.pFIBDatabase1.Execute('insert into SPR_UNITS(UNIT_KOD, UNIT_NAME, UNIT_INT)'
                 + ' values(' + IntToStr(ClientDataSet1['UNIT_KOD']) + ', '''
                 + ClientDataSet1['UNIT_NAME'] + ''',' + IntToStr(ClientDataSet1['UNIT_INT']) + ')');
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         Close;
         CheckListBox2.Checked[i]:= True;
       end;
       Inc(i);
       ProgressBar1.Position:= ProgressBar1.Min;
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       Application.ProcessMessages;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника товаров
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Spr_Tovar.xml');
         Open;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         Label8.Caption:= '';
         Label8.Visible:= True;
         FormatSettings.DecimalSeparator:= '.';
         ShopMainForm.pFIBService.SelectSQL.Clear;
         ShopMainForm.pFIBService.SelectSQL.Add('select ITEM from SPR_TOVAR where ITEM = :ITEM');
         ShopMainForm.pFIBService.Prepare;
         while not Eof do
         begin
           Label8.Caption:= ClientDataSet1['ITEM'] + ' - ' + ClientDataSet1['TOVAR_NAME'];
           with ShopMainForm.pFIBService do
           begin
             ParamByName('ITEM').AsString:= ClientDataSet1['ITEM'];
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['ITEM'])then
             begin
               if notMainObj then
               begin
                 ShopMainForm.pFIBDatabase1.Execute('update SPR_TOVAR'
                   + ' set TOVAR_NAME = ''' + ClientDataSet1['TOVAR_NAME'] + ''','
                   + ' T_GROUP = ' + IntToStr(ClientDataSet1['T_GROUP']) + ','
                   + ' LAST_UPD = ''' + DateTimeToStr(ClientDataSet1['LAST_UPD']) + ''','
                   + ' KKM_SECT = ' + IntToStr(ClientDataSet1['KKM_SECT']) + ','
                   + ' VENDOR_CODE = ' + IntToStr(ClientDataSet1['VENDOR_CODE']) + ','
                   + ' AUTOR_KOD = ' + IntToStr(ClientDataSet1['AUTOR_KOD']) + ','
                   + ' REMARK = ''' + ClientDataSet1['REMARK'] + ''','
                   + ' REMARK_1 = ''' + ClientDataSet1['REMARK_1'] + ''','
                   + ' VEND_ITEM = ''' + ClientDataSet1['VEND_ITEM'] + ''','
                   + ' PRODUCER = ''' + ClientDataSet1['PRODUCER'] + ''','
                   + ' ARTIKUL = ''' + ClientDataSet1['ARTIKUL'] + ''','
                   + ' UNIT_KOD = ' + IntToStr(ClientDataSet1['UNIT_KOD'])
                   + ' where ITEM = ''' + ClientDataSet1['ITEM'] + '''');
//                   SaveToLog('SPR_TOVAR(update): ' + ClientDataSet1['ITEM'] + ' - ' + ClientDataSet1['TOVAR_NAME'], 'recive.log');

                   ShopMainForm.pFIBDatabase1.Execute('update PRICES set SALE_PRICE = '
                     + FloatToStr(ClientDataSet1['SALE_PRICE'])
                     + ',PRICE_1 = ' + FloatToStr(ClientDataSet1['PRICE_1'])
                     + ',PRICE_1_TAG = ' + IntToStr(ClientDataSet1['PRICE_1_TAG'])
                     + ',PRICE_2 = ' + FloatToStr(ClientDataSet1['PRICE_2'])
                     + ',PRICE_2_TAG = ' + IntToStr(ClientDataSet1['PRICE_2_TAG'])
                     + ',PRICE_3 = ' + FloatToStr(ClientDataSet1['PRICE_3'])
                     + ',PRICE_3_TAG = ' + IntToStr(ClientDataSet1['PRICE_3_TAG'])
                     + ',PRICE_4 = ' + FloatToStr(ClientDataSet1['PRICE_4'])
                     + ',PRICE_4_TAG = ' + IntToStr(ClientDataSet1['PRICE_4_TAG'])
                     + ',PRICE_5 = ' + FloatToStr(ClientDataSet1['PRICE_5'])
                     + ',PRICE_5_TAG = ' + IntToStr(ClientDataSet1['PRICE_5_TAG'])
                     + ',PRICE_6 = ' + FloatToStr(ClientDataSet1['PRICE_6'])
                     + ',PRICE_6_TAG = ' + IntToStr(ClientDataSet1['PRICE_6_TAG'])
                     + ',PRICE_7 = ' + FloatToStr(ClientDataSet1['PRICE_7'])
                     + ',PRICE_7_TAG = ' + IntToStr(ClientDataSet1['PRICE_7_TAG'])
                     + ',PRICE_8 = ' + FloatToStr(ClientDataSet1['PRICE_8'])
                     + ',PRICE_8_TAG = ' + IntToStr(ClientDataSet1['PRICE_8_TAG'])
                     + ',PRICE_9 = ' + FloatToStr(ClientDataSet1['PRICE_9'])
                     + ',PRICE_9_TAG = ' + IntToStr(ClientDataSet1['PRICE_9_TAG'])
                     + ',VEND_PRICE = ' + FloatToStr(ClientDataSet1['VEND_PRICE'])
                     + ',PRICE_TYPE = ''' + ClientDataSet1['PRICE_TYPE'] + ''''
                     + 'where ITEM = ''' + ClientDataSet1['ITEM'] + ''''
                     + 'and MARKET_CODE = ' + IntToStr(CurrentMarketCode));
{
                   if ClientDataSet1.FieldDefs.IndexOf('CST_PRICE_1') > -1 then
                   begin
                     // Прием дополнительных цен
                     if((not VarIsNull(ClientDataSet1['CST_PRICE_1']))or( not VarIsNull(ClientDataSet1['CST_PRICE_2']))
                       or( not VarIsNull(ClientDataSet1['CST_PRICE_3'])))then
                         ShopMainForm.pFIBDatabase1.Execute('update or insert into CST_PRICES(ITEM,'
                           + 'CST_PRICE_1, CST_PRICE_1_TAG, CST_PRICE_1_TYPE,'
                           + 'CST_PRICE_2, CST_PRICE_2_TAG, CST_PRICE_2_TYPE,'
                           + 'CST_PRICE_3, CST_PRICE_3_TAG, CST_PRICE_3_TYPE)'
                           + 'values('''  + ClientDataSet1['ITEM'] + ''', '
                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_1']), 'null', FloatToStr(ClientDataSet1['CST_PRICE_1'])) + ', '
                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_1_TAG']), 'null', IntToStr(ClientDataSet1['CST_PRICE_1_TAG'])) + ', '
                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_1_TYPE']), 'null', '''' + ClientDataSet1['CST_PRICE_1_TYPE'] + '''') + ', '

                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_2']), 'null', FloatToStr(ClientDataSet1['CST_PRICE_2'])) + ', '
                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_2_TAG']), 'null', IntToStr(ClientDataSet1['CST_PRICE_2_TAG'])) + ', '
                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_2_TYPE']), 'null', '''' + ClientDataSet1['CST_PRICE_2_TYPE'] + '''') + ', '

                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_3']), 'null', FloatToStr(ClientDataSet1['CST_PRICE_3'])) + ', '
                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_3_TAG']), 'null', IntToStr(ClientDataSet1['CST_PRICE_3_TAG'])) + ', '
                           + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_3_TYPE']), 'null', '''' + ClientDataSet1['CST_PRICE_3_TYPE'] + '''')
                           + ')matching(ITEM)');
                   end
                   else SaveToLog('SPR_TOVAR() дополнительные цены отсутствуют в файле обмена', 'recive.log');
}
               end
               else SaveToLog('SPR_TOVAR(not update): ' + ClientDataSet1['ITEM'] + ' - ' + ClientDataSet1['TOVAR_NAME'], 'recive.log');
             end
             else
             begin
               begin
                 ShopMainForm.pFIBDatabase1.Execute('insert into SPR_TOVAR(ITEM, TOVAR_NAME, T_GROUP,'
                   + ' LAST_UPD, KKM_SECT, VENDOR_CODE, AUTOR_KOD, '
                   + 'REMARK, UNIT_KOD, ARTIKUL, PRODUCER, REMARK_1, VEND_ITEM)'
                   + 'values(''' + ClientDataSet1['ITEM'] + ''', '''
                   + ClientDataSet1['TOVAR_NAME'] + ''', '
                   + IntToStr(ClientDataSet1['T_GROUP']) + ', '''
                   + DateTimeToStr(ClientDataSet1['LAST_UPD']) + ''', '
                   + IntToStr(ClientDataSet1['KKM_SECT']) + ', '
                   + IntToStr(ClientDataSet1['VENDOR_CODE']) + ', '
                   + IntToStr(ClientDataSet1['AUTOR_KOD']) + ', '''
                   + ClientDataSet1['REMARK'] + ''', '
                   + IntToStr(ClientDataSet1['UNIT_KOD']) + ', '''
                   + ClientDataSet1['ARTIKUL'] + ''', '''
                   + ClientDataSet1['PRODUCER'] + ''', '''
                   + ClientDataSet1['REMARK_1'] + ''', '''
                   + ClientDataSet1['VEND_ITEM'] + ''')');
                 SaveToLog('SPR_TOVAR(insert): ' + ClientDataSet1['ITEM'] + ' - ' + ClientDataSet1['TOVAR_NAME'], 'recive.log');

                 ShopMainForm.pFIBDatabase1.Execute('insert into PRICES(MARKET_CODE, ITEM, SALE_PRICE, '
                   + 'PRICE_1, PRICE_1_TAG, PRICE_2, PRICE_2_TAG, PRICE_3, PRICE_3_TAG, PRICE_4, '
                   + 'PRICE_4_TAG, PRICE_5, PRICE_5_TAG, PRICE_6, PRICE_6_TAG, PRICE_7, '
                   + 'PRICE_7_TAG, PRICE_8, PRICE_8_TAG, PRICE_9, PRICE_9_TAG, VEND_PRICE, PRICE_TYPE)'
                   + 'values(' + IntToStr(CurrentMarketCode) + ', '''
                   + ClientDataSet1['ITEM'] + ''', ' + FloatToStr(ClientDataSet1['SALE_PRICE']) + ','
                   + FloatToStr(ClientDataSet1['PRICE_1']) + ',' + IntToStr(ClientDataSet1['PRICE_1_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_2']) + ',' + IntToStr(ClientDataSet1['PRICE_2_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_3']) + ',' + IntToStr(ClientDataSet1['PRICE_3_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_4']) + ',' + IntToStr(ClientDataSet1['PRICE_4_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_5']) + ',' + IntToStr(ClientDataSet1['PRICE_5_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_6']) + ',' + IntToStr(ClientDataSet1['PRICE_6_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_7']) + ',' + IntToStr(ClientDataSet1['PRICE_7_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_8']) + ',' + IntToStr(ClientDataSet1['PRICE_8_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['PRICE_9']) + ',' + IntToStr(ClientDataSet1['PRICE_9_TAG'])+ ','
                   + FloatToStr(ClientDataSet1['VEND_PRICE']) + ',''' + ClientDataSet1['PRICE_TYPE']+ ''')');

                {
                 if ClientDataSet1.FieldDefs.IndexOf('CST_PRICE_1') > -1 then
                 begin
                   // Прием дополнительных цен
                   if((not VarIsNull(ClientDataSet1['CST_PRICE_1']))or( not VarIsNull(ClientDataSet1['CST_PRICE_2']))
                     or( not VarIsNull(ClientDataSet1['CST_PRICE_3'])))then
                       ShopMainForm.pFIBDatabase1.Execute('update or insert into CST_PRICES(ITEM,'
                         + 'CST_PRICE_1, CST_PRICE_1_TAG, CST_PRICE_1_TYPE,'
                         + 'CST_PRICE_2, CST_PRICE_2_TAG, CST_PRICE_2_TYPE,'
                         + 'CST_PRICE_3, CST_PRICE_3_TAG, CST_PRICE_3_TYPE)'
                         + 'values('''  + ClientDataSet1['ITEM'] + ''', '
                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_1']), 'null', FloatToStr(ClientDataSet1['CST_PRICE_1'])) + ', '
                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_1_TAG']), 'null', IntToStr(ClientDataSet1['CST_PRICE_1_TAG'])) + ', '
                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_1_TYPE']), 'null', '''' + ClientDataSet1['CST_PRICE_1_TYPE'] + '''') + ', '

                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_2']), 'null', FloatToStr(ClientDataSet1['CST_PRICE_2'])) + ', '
                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_2_TAG']), 'null', IntToStr(ClientDataSet1['CST_PRICE_2_TAG'])) + ', '
                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_2_TYPE']), 'null', '''' + ClientDataSet1['CST_PRICE_2_TYPE'] + '''') + ', '

                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_3']), 'null', FloatToStr(ClientDataSet1['CST_PRICE_3'])) + ', '
                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_3_TAG']), 'null', IntToStr(ClientDataSet1['CST_PRICE_3_TAG'])) + ', '
                         + IIFStr(VarIsNull(ClientDataSet1['CST_PRICE_3_TYPE']), 'null', '''' + ClientDataSet1['CST_PRICE_3_TYPE'] + '''')
                         + ')matching(ITEM)');
                 end
                 else SaveToLog('SPR_TOVAR() дополнительные цены отсутствуют в файле обмена', 'recive.log');
                 }
               end;
             end;
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         FormatSettings.DecimalSeparator:= TmpSep;
         Label8.Visible:= False;
         Close;
         Inc(i);
         CheckListBox2.Checked[i]:= True;
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       end;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника норм наценок
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Spr_Charge.xml');
         Open;
         ProgressBar1.Position:= ProgressBar1.Min;
         ProgressBar1.Max:= RecordCount;
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from SPR_CHARGE');
             SelectSQL.Add('where ITEM = ''' + ClientDataSet1['ITEM'] + '''');
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['ITEM'])then
             begin
               if notMainObj and
                  (ShopMainForm.pFIBService['EXTRA_CHARGE'] <> ClientDataSet1['EXTRA_CHARGE'])then
                 ShopMainForm.pFIBDatabase1.Execute('update SPR_CHARGE'
                   + ' set EXTRA_CHARGE = ' + IntToStr(ClientDataSet1['EXTRA_CHARGE'])
                   + ' where ITEM = ''' + ClientDataSet1['ITEM'] + '''');
             end
             else
               ShopMainForm.pFIBDatabase1.Execute('insert into SPR_CHARGE(EXTRA_CHARGE, ITEM)'
                 + ' values(' + IntToStr(ClientDataSet1['EXTRA_CHARGE']) + ', ''' + ClientDataSet1['ITEM'] + ''')');
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         Close;
         Inc(i);
         CheckListBox2.Checked[i]:= True;
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       end;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника норм остатков
*********************************************************************************}
      CheckListBox2.Selected[i]:= True;
      if notMainObj then
       with ClientDataSet1 do
       begin
         ShopMainForm.pFIBDatabase1.Execute('ALTER TRIGGER SPR_NORM_OST_AIU0 INACTIVE;');
         LoadFromFile(GetSYSTempPath + 'Spr_Norm_Ost.xml');
         Open;  // Если НЕ ГЛАВНЫЙ объект  фильтруем для текущего объекта
         ClientDataSet1.Filter:= 'MARKET_CODE = ' + IntToStr(CurrentMarketCode);
         ClientDataSet1.Filtered:= True;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         pFIBQuery1.SQL.Clear;
         pFIBQuery1.SQL.Add('update or insert into SPR_NORM_OST(ITEM, MARKET_CODE, NORM_OST, MIN_OST)'
                 + ' values(:ITEM, :MARKET_CODE, :NORM_OST, :MIN_OST) matching(ITEM, MARKET_CODE)');
         pFIBQuery1.Prepare;
         First;
         while not Eof do
         begin
           pFIBQuery1.ParamByName('ITEM').AsString:= ClientDataSet1['ITEM'];
           pFIBQuery1.ParamByName('MARKET_CODE').AsInteger:= ClientDataSet1['MARKET_CODE'];
           pFIBQuery1.ParamByName('NORM_OST').AsFloat:= ClientDataSet1['NORM_OST'];
           pFIBQuery1.ParamByName('MIN_OST').AsFloat:= ClientDataSet1['MIN_OST'];
           pFIBQuery1.ExecQuery; // Добавляем-обновляем справочник норм остатков
           ProgressBar1.StepIt;
           Application.ProcessMessages;
           Next;
         end;

         with ShopMainForm.pFIBService do
         begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add('select count(*) as CNT from SPR_NORM_OST where MARKET_CODE = ' + IntToStr(CurrentMarketCode));
           Open;
           ProgressBar1.Max:= ShopMainForm.pFIBService['CNT'];
           ProgressBar1.Position:= ProgressBar1.Min;
           Close;
           SelectSQL.Clear; // Выбираем нормы остатков из базы
           SelectSQL.Add('select ITEM from SPR_NORM_OST where MARKET_CODE = ' + IntToStr(CurrentMarketCode));
           Open;
           while not Eof do
           begin  // Удаляем из справочника нормы остатков товаров, которых нет в файле обмена
             if not ClientDataSet1.Locate('ITEM', ShopMainForm.pFIBService.FieldByName('ITEM').AsString, [])then
               ExecSQLStr('delete from SPR_NORM_OST where ITEM = ''' + ShopMainForm.pFIBService.FieldByName('ITEM').AsString +
                 ''' and MARKET_CODE = ' + IntToStr(CurrentMarketCode));
             ProgressBar1.StepIt;
             Application.ProcessMessages;
             Next;
           end;
           Close;
         end;
         Close;
         ClientDataSet1.Filtered:= False;
         ClientDataSet1.Filter:= '';

         ProgressBar1.Position:= ProgressBar1.Min;
         ShopMainForm.pFIBDatabase1.Execute('ALTER TRIGGER SPR_NORM_OST_AIU0 ACTIVE;');
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       end;
       Inc(i);
       CheckListBox2.Checked[i]:= True;
       Application.ProcessMessages;
{*********************************************************************************}
{*********************************************************************************
                        Приём приходных накладных
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Hdr_Prihod.xml');
         if notMainObj then // Если НЕ ГЛАВНЫЙ объект  фильтруем для текущего объекта
           begin
             ClientDataSet1.Filter:= 'MARKET_CODE = ' + IntToStr(CurrentMarketCode);
             ClientDataSet1.Filtered:= True;
           end;

         ClientDataSet2.LoadFromFile(GetSYSTempPath + 'Pos_Prihod.xml');
         Open;
         ClientDataSet2.Open; // Открываем позиции док-та
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         FormatSettings.DecimalSeparator:= '.';
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from HDR_PRIHOD');
             SelectSQL.Add('where MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
             SelectSQL.Add('and DOC_NUMBER = ' + IntToStr(ClientDataSet1['DOC_NUMBER']));
             SelectSQL.Add('and DOC_TYPE = ' + IntToStr(ClientDataSet1['DOC_TYPE']));
             Open;
             Label8.Visible:= True;
             Label8.Caption:= 'Док-т № ' + IntToStr(ClientDataSet1['DOC_NUMBER']);
             if not VarIsNull(ShopMainForm.pFIBService['KOD'])then
             begin
               if not notMainObj then DocKod:= -1 // Док-т найден и главный объект
               else
               begin
                 DocKod:= ShopMainForm.pFIBService['KOD'];
                   // Удаляем старые позиции док-та
                 ShopMainForm.pFIBDatabase1.Execute('delete from POS_PRIHOD where KOD = ' + IntToStr(DocKod));
                   // Изменяем заголовок док-та
                 ShopMainForm.pFIBDatabase1.Execute('update HDR_PRIHOD'
                   + ' set DOC_DATE = ''' + DateTimeToStr(ClientDataSet1['DOC_DATE']) + ''','
                   + ' VENDOR_CODE = ' + IntToStr(ClientDataSet1['VENDOR_CODE']) + ','
                   + ' DOC_SUM = 0, VEND_SUM = 0,'
                   + ' AUTOR_KOD = ' + IntToStr(ClientDataSet1['AUTOR_KOD']) + ','
                   + ' LAST_UPD = ''' + DateTimeToStr(ClientDataSet1['LAST_UPD']) + ''''
                   + ' where KOD = ' + IntToStr(DocKod));
               end;
             end
             else
             begin
               // Если док-т не найден добавляем новый заголовок
               ShopMainForm.pFIBDatabase1.Execute('insert into HDR_PRIHOD(MARKET_CODE, DOC_DATE, DOC_NUMBER, '
                 + 'VENDOR_CODE, DOC_TYPE, AUTOR_KOD, LAST_UPD, VEND_SUM, DOC_SUM)'
                 + ' values(' + IntToStr(ClientDataSet1['MARKET_CODE']) + ', '''
                 + DateTimeToStr(ClientDataSet1['DOC_DATE']) + ''', '
                 + IntToStr(ClientDataSet1['DOC_NUMBER']) + ', '
                 + IntToStr(ClientDataSet1['VENDOR_CODE']) + ', '
                 + IntToStr(ClientDataSet1['DOC_TYPE']) + ', '
                 + IntToStr(ClientDataSet1['AUTOR_KOD']) + ', '''
                 + DateTimeToStr(ClientDataSet1['LAST_UPD']) + ''', 0, 0)');
               Close;
               SelectSQL.Clear;// Получаем код зарегистрированного док-та
               SelectSQL.Add('select * from HDR_PRIHOD');
               SelectSQL.Add('where MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
               SelectSQL.Add('and DOC_NUMBER = ' + IntToStr(ClientDataSet1['DOC_NUMBER']));
               SelectSQL.Add('and DOC_TYPE = ' + IntToStr(ClientDataSet1['DOC_TYPE']));
               Open;
               DocKod:= ShopMainForm.pFIBService['KOD'];
             end;
             Close;

             if DocKod <> -1 then // Док-т найден и главный объект
             begin
               ClientDataSet2.Filter:= 'KOD = ' + IntToStr(ClientDataSet1['KOD']);
               ClientDataSet2.Filtered:= True;
               while not ClientDataSet2.Eof do
               begin
                   // Добавляем позиции док-та
                 ShopMainForm.pFIBDatabase1.Execute('insert into POS_PRIHOD(KOD, ITEM, '
                   + 'KOLVO, PRICE, VEND_PRICE, MARKET_CODE, VENDOR_CODE)'
                   + ' values(' + IntToStr(DocKod) + ', ''' + ClientDataSet2['ITEM'] + ''', '
                   + FloatToStr(ClientDataSet2['KOLVO']) + ', ' + FloatToStr(ClientDataSet2['PRICE']) + ', '
                   + FloatToStr(ClientDataSet2['VEND_PRICE']) + ', ' + IntToStr(ClientDataSet2['MARKET_CODE']) + ', '
                   + IntToStr(ClientDataSet2['VENDOR_CODE']) + ')');
//                 SaveToLog('POS_PRIHOD(insert): ' + ClientDataSet2['ITEM'], 'recive.log');
                 ClientDataSet2.Next;
                 Application.ProcessMessages;
               end;
             end;

           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;


         ClientDataSet2.Filtered:= False;
         ClientDataSet2.Filter:= '';
         ClientDataSet2.Close;
         FormatSettings.DecimalSeparator:= TmpSep;

         Close;
         ClientDataSet1.Filtered:= False;
         ClientDataSet1.Filter:= '';

         Label8.Visible:= False;
         Inc(i);
         CheckListBox2.Checked[i]:= True;
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       end;
{*********************************************************************************}
{*********************************************************************************
                        Приём расходных накладных
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Hdr_Rashod.xml');
         if notMainObj then // Если НЕ ГЛАВНЫЙ объект  фильтруем для текущего объекта
           begin
             ClientDataSet1.Filter:= 'MARKET_CODE = ' + IntToStr(CurrentMarketCode);
             ClientDataSet1.Filtered:= True;
           end;

         ClientDataSet2.LoadFromFile(GetSYSTempPath + 'Pos_Rashod.xml');
         Open;
         ClientDataSet2.Open; // Открываем позиции док-та
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         FormatSettings.DecimalSeparator:= '.';
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from HDR_RASHOD');
             SelectSQL.Add('where MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
             SelectSQL.Add('and DOC_NUMBER = ' + IntToStr(ClientDataSet1['DOC_NUMBER']));
             SelectSQL.Add('and DOC_TYPE = ' + IntToStr(ClientDataSet1['DOC_TYPE']));
             Open;
             if not VarIsNull(ShopMainForm.pFIBService['KOD'])then
             begin
               if not notMainObj then DocKod:= -1 // Док-т найден и главный объект
               else
               begin
                 DocKod:= ShopMainForm.pFIBService['KOD'];
                 // Удаляем старые позиции док-та
                 ShopMainForm.pFIBDatabase1.Execute('delete from POS_RASHOD where KOD = ' + IntToStr(DocKod));
                 // Изменяем заголовок док-та
                 ShopMainForm.pFIBDatabase1.Execute('update HDR_RASHOD'
                   + ' set DOC_DATE = ''' + DateTimeToStr(ClientDataSet1['DOC_DATE']) + ''','
                   + ' VENDOR_CODE = ' + IntToStr(ClientDataSet1['VENDOR_CODE'])
                   + ',DOC_SUM = 0, VEND_SUM = 0,'
                   + ' AUTOR_KOD = ' + IntToStr(ClientDataSet1['AUTOR_KOD'])
                   + ',LAST_UPD = ''' + DateTimeToStr(ClientDataSet1['LAST_UPD']) + ''''
                   + ' where KOD = ' + IntToStr(DocKod));
               end;
             end
             else
             begin
               // Если док-т не найден добавляем новый заголовок
               ShopMainForm.pFIBDatabase1.Execute('insert into HDR_RASHOD(MARKET_CODE, DOC_DATE, DOC_NUMBER, '
                 + 'VENDOR_CODE, DOC_TYPE, AUTOR_KOD, LAST_UPD, VEND_SUM, DOC_SUM)'
                 + ' values(' + IntToStr(ClientDataSet1['MARKET_CODE']) + ', '''
                 + DateTimeToStr(ClientDataSet1['DOC_DATE']) + ''', '
                 + IntToStr(ClientDataSet1['DOC_NUMBER']) + ', '
                 + IntToStr(ClientDataSet1['VENDOR_CODE']) + ', '
                 + IntToStr(ClientDataSet1['DOC_TYPE']) + ', '
                 + IntToStr(ClientDataSet1['AUTOR_KOD']) + ', '''
                 + DateTimeToStr(ClientDataSet1['LAST_UPD']) + ''', 0, 0)');
               Close;
               SelectSQL.Clear;// Получаем код зарегистрированного док-та
               SelectSQL.Add('select * from HDR_RASHOD');
               SelectSQL.Add('where MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
               SelectSQL.Add('and DOC_NUMBER = ' + IntToStr(ClientDataSet1['DOC_NUMBER']));
               SelectSQL.Add('and DOC_TYPE = ' + IntToStr(ClientDataSet1['DOC_TYPE']));
               Open;
               DocKod:= ShopMainForm.pFIBService['KOD'];
             end;
             Close;

             if DocKod <> -1 then // Док-т найден и главный объект
             begin
               ClientDataSet2.Filter:= 'KOD = ' + IntToStr(ClientDataSet1['KOD']);
               ClientDataSet2.Filtered:= True;
               while not ClientDataSet2.Eof do
               begin
                 // Добавляем позиции док-та
                 ShopMainForm.pFIBDatabase1.Execute('insert into POS_RASHOD(KOD, ITEM, KOLVO, PRICE, VEND_PRICE,'
                   + ' MARKET_CODE, VENDOR_CODE) values(' + IntToStr(DocKod) + ', ''' + ClientDataSet2['ITEM'] + ''', '
                   + FloatToStr(ClientDataSet2['KOLVO']) + ', ' + FloatToStr(ClientDataSet2['PRICE']) + ', '
                   + FloatToStr(ClientDataSet2['VEND_PRICE']) + ', ' + IntToStr(ClientDataSet2['MARKET_CODE']) + ','
                   + IntToStr(ClientDataSet2['VENDOR_CODE']) + ')');
                 ClientDataSet2.Next;
                 Application.ProcessMessages;
               end;
             end;

           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         ClientDataSet2.Close;
         ClientDataSet2.Filter:= '';
         ClientDataSet2.Filtered:= False;
         FormatSettings.DecimalSeparator:= TmpSep;

         Close;
         ClientDataSet1.Filtered:= False;
         ClientDataSet1.Filter:= '';

         Inc(i);
         CheckListBox2.Checked[i]:= True;
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       end;
{*********************************************************************************}
{*********************************************************************************
                        Приём переоценок
*********************************************************************************}
      CheckListBox2.Selected[i]:= True;
      SndIni:= TIniFile.Create(GetSYSTempPath + 'transfer.ini');
      if SndIni.ReadBool('Main', 'Pereocen', False) then
       with ClientDataSet1 do
       begin
         if notMainObj then
           begin
             S:= 'delete from PRICE_CHANGE '
               + 'where P_DATE between ''' + SndIni.ReadString('Main', 'BeginDateTime', 'now')
               + ''' and ''' + SndIni.ReadString('Main', 'SndDateTime', 'now') + '''';
             if SndIni.ReadInteger('Main', 'Market_Code', CurrentMarketCode) > -1 then
               S:= S + 'and MARKET_CODE = '
                  + SndIni.ReadString('Main', 'Market_Code', IntToStr(CurrentMarketCode));
             ShopMainForm.pFIBDatabase1.Execute(S);
           end;
         LoadFromFile(GetSYSTempPath + 'Price_Change.xml');
           if notMainObj then // Если НЕ ГЛАВНЫЙ объект  фильтруем для текущего объекта
             begin
               ClientDataSet1.Filter:= 'MARKET_CODE = ' + IntToStr(CurrentMarketCode);
               ClientDataSet1.Filtered:= True;
             end;

         Open;
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         FormatSettings.DecimalSeparator:= '.';
         while not Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from PRICE_CHANGE');
             SelectSQL.Add('where P_DATE = ''' + DateTimeToStr(ClientDataSet1['P_DATE']) + '''');
             SelectSQL.Add('and ITEM = ''' + ClientDataSet1['ITEM'] + '''');
             SelectSQL.Add('and MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
             Open;
             if VarIsNull(ShopMainForm.pFIBService['ITEM'])then
               ShopMainForm.pFIBDatabase1.Execute('insert into PRICE_CHANGE(MARKET_CODE, P_DATE, ITEM, '
                 + 'KOLVO, OLD_PRICE, NEW_PRICE)'
                 + ' values(' + IntToStr(ClientDataSet1['MARKET_CODE']) + ', '''
                 + DateTimeToStr(ClientDataSet1['P_DATE']) + ''', ''' + ClientDataSet1['ITEM'] + ''', '
                 + FloatToStr(ClientDataSet1['KOLVO']) + ', ' + FloatToStr(ClientDataSet1['OLD_PRICE']) + ', '
                 + FloatToStr(ClientDataSet1['NEW_PRICE']) + ')')
             else
               ShopMainForm.pFIBDatabase1.Execute('update PRICE_CHANGE'
                 + ' set KOLVO = ' + FloatToStr(ClientDataSet1['KOLVO'])
                 + ', OLD_PRICE = ' + FloatToStr(ClientDataSet1['OLD_PRICE'])
                 + ', NEW_PRICE = ' + FloatToStr(ClientDataSet1['NEW_PRICE'])
                 + ' where P_DATE = ''' + DateTimeToStr(ClientDataSet1['P_DATE']) + ''''
                 + ' and ITEM = ''' + ClientDataSet1['ITEM'] + ''''
                 + ' and MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
             Close;
           end;
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
         end;
         FormatSettings.DecimalSeparator:= TmpSep;

         Close;
         ClientDataSet1.Filtered:= False;
         ClientDataSet1.Filter:= '';

         Inc(i);
         CheckListBox2.Checked[i]:= True;
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
       end
       else Inc(i);
       SndIni.Free;
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
{*********************************************************************************}
{*********************************************************************************
                        Приём кассовых смен
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Hdr_Smens.xml');
         if notMainObj then // Если НЕ ГЛАВНЫЙ объект  фильтруем для текущего объекта
           begin
             ClientDataSet1.Filter:= 'MARKET_CODE = ' + IntToStr(CurrentMarketCode);
             ClientDataSet1.Filtered:= True;
           end;

         ClientDataSet2.LoadFromFile(GetSYSTempPath + 'Pos_Sales.xml');
         Open;
         ClientDataSet2.Open;  // Открываем позиции смены
         ProgressBar1.Max:= RecordCount;
         ProgressBar1.Position:= ProgressBar1.Min;
         FormatSettings.DecimalSeparator:= '.';
         while not ClientDataSet1.Eof do
         begin
           with ShopMainForm.pFIBService do
           begin
             SelectSQL.Clear;
             SelectSQL.Add('select * from HDR_SMENS');
             SelectSQL.Add('where MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
//             SelectSQL.Add('and BEGIN_DATETIME = ''' + DateTimeToStr(ClientDataSet1['BEGIN_DATETIME']) + '''');
             SelectSQL.Add('and END_DATETIME = ''' + DateTimeToStr(ClientDataSet1['END_DATETIME']) + '''');
             Open;// Проверяем наличие данного заголовка
             Label8.Visible:= True;
             Label8.Caption:= 'Смена № ' + IntToStr(ClientDataSet1['SMENS_KOD']);
             if not VarIsNull(ShopMainForm.pFIBService['SMENS_KOD'])then
             begin
               if not notMainObj then DocKod:= -1
               else
               begin
                 DocKod:= ShopMainForm.pFIBService['SMENS_KOD'];
                 // Удаляем старые позиции смены
                 ShopMainForm.pFIBDatabase1.Execute('delete from POS_SALES where SMENS_KOD = ' + IntToStr(DocKod));
               end;
             end
             else
             begin
               // Добавляем новый заголовок кассовой смены
               ShopMainForm.pFIBDatabase1.Execute('insert into HDR_SMENS(MARKET_CODE, AUTOR_KOD, BEGIN_DATETIME, '
                 + 'END_DATETIME) values(' + IntToStr(ClientDataSet1['MARKET_CODE']) + ', '
                 + IntToStr(ClientDataSet1['AUTOR_KOD']) + ', '''
                 + DateTimeToStr(ClientDataSet1['BEGIN_DATETIME']) + ''', '''
                 + DateTimeToStr(ClientDataSet1['END_DATETIME']) + ''')');
               Close;
               SelectSQL.Clear;// Получаем код зарегистрированной смены
               SelectSQL.Add('select * from HDR_SMENS');
               SelectSQL.Add('where MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
//               SelectSQL.Add('and BEGIN_DATETIME = ''' + DateTimeToStr(ClientDataSet1['BEGIN_DATETIME']) + '''');
               SelectSQL.Add('and END_DATETIME = ''' + DateTimeToStr(ClientDataSet1['END_DATETIME']) + '''');
               Open;
               DocKod:= ShopMainForm.pFIBService['SMENS_KOD'];
             end;
             Close;

             if DocKod <> -1 then
             begin
               ClientDataSet2.Filter:= 'SMENS_KOD = ' + IntToStr(ClientDataSet1['SMENS_KOD']);
               ClientDataSet2.Filtered:= True;
               while not ClientDataSet2.Eof do
               begin
                 // Добавляем позиции смены
                 ShopMainForm.pFIBDatabase1.Execute('insert into POS_SALES(MARKET_CODE, NCHECK, SMENS_KOD, SALE_DATE, '
                   + 'ITEM, KOLVO, SALE_PRICE, NCARD, AUTOR_KOD, COST_PRICE, VEND_PRICE, VENDOR_CODE, PAY_TYPE)'
                   + ' values(' + IntToStr(ClientDataSet2['MARKET_CODE']) + ', '
                   + IntToStr(ClientDataSet2['NCHECK']) + ', ' + IntToStr(DocKod) + ', '''
                   + DateTimeToStr(ClientDataSet2['SALE_DATE']) + ''', '''
                   + ClientDataSet2['ITEM'] + ''', '
                   + FloatToStr(ClientDataSet2['KOLVO']) + ', '
                   + FloatToStr(ClientDataSet2['SALE_PRICE']) + ', '''
                   + ClientDataSet2['NCARD'] + ''', '
                   + IntToStr(ClientDataSet2['AUTOR_KOD']) + ', '
                   + FloatToStr(ClientDataSet2['COST_PRICE']) + ','
                   + FloatToStr(ClientDataSet2['VEND_PRICE']) + ','
                   + IntToStr(ClientDataSet2['VENDOR_CODE']) + ','
                   + IntToStr(ClientDataSet2['PAY_TYPE']) + ')');

                 ClientDataSet2.Next;
                 Application.ProcessMessages;
               end;
             end;

             if DisplayProgress then
             begin
               ProgressBar1.StepIt;
               Application.ProcessMessages;
             end;
           end;
           Next;
         end;
         ClientDataSet2.Close;
         ClientDataSet2.Filter:= '';
         ClientDataSet2.Filtered:= False;
         FormatSettings.DecimalSeparator:= TmpSep;
         Close;
         ClientDataSet1.Filtered:= False;
         ClientDataSet1.Filter:= '';

         Label8.Visible:= False;
         Inc(i);
         CheckListBox2.Checked[i]:= True;
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       end;
{*********************************************************************************}
{*********************************************************************************
                              Приём учётов
*********************************************************************************}
       CheckListBox2.Selected[i]:= True;
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Uchet.xml');
         if notMainObj then // Если НЕ ГЛАВНЫЙ объект  фильтруем для текущего объекта
           begin
             ClientDataSet1.Filter:= 'MARKET_CODE = ' + IntToStr(CurrentMarketCode);
             ClientDataSet1.Filtered:= True;
           end;
         Open;
         ProgressBar1.Position:= ProgressBar1.Min;
         ProgressBar1.Max:= RecordCount;
         while not Eof do
         begin
           // Удаляем старые позиции учёта
           ShopMainForm.pFIBDatabase1.Execute('delete from UCHET where UCHET_NUM = '
             + IntToStr(ClientDataSet1['UCHET_NUM'])
             + ' and MARKET_CODE = ' + IntToStr(ClientDataSet1['MARKET_CODE']));
           Next;
         end;
         FormatSettings.DecimalSeparator:= '.';
         while not Eof do
         begin
           // Добавляем новые позиции учёта
           ShopMainForm.pFIBDatabase1.Execute('insert into UCHET(MARKET_CODE, ITEM, UCHET_NUM, ACOUNT_KOLVO,'
             + ' COUNT_KOLVO, SALE_PRICE, TOVAR_NAME, SAVE_DATE, VEND_PRICE)'
             + ' values(' + IntToStr(ClientDataSet1['MARKET_CODE']) + ', '''
             + ClientDataSet1['ITEM'] + ''', '
             + IntToStr(ClientDataSet1['UCHET_NUM']) + ', '
             + FloatToStr(ClientDataSet1['ACOUNT_KOLVO']) + ', '
             + FloatToStr(ClientDataSet1['COUNT_KOLVO']) + ', '
             + FloatToStr(ClientDataSet1['SALE_PRICE']) + ', '''
             + ClientDataSet1['TOVAR_NAME'] + ''', '''
             + DateTimeToStr(ClientDataSet1['SAVE_DATE']) + ''', '
             + FloatToStr(ClientDataSet1['VEND_PRICE']) + ')');
           if DisplayProgress then
           begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Next;
           Application.ProcessMessages;
         end;
         FormatSettings.DecimalSeparator:= TmpSep;
         Close;
         ClientDataSet1.Filtered:= False;
         ClientDataSet1.Filter:= '';

         Inc(i);
         CheckListBox2.Checked[i]:= True;
         Application.ProcessMessages;
         ProgressBar1.Position:= ProgressBar1.Min;
         if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       end;
{*********************************************************************************}
{*********************************************************************************
                        Приём справочника атрибутов
*********************************************************************************}
     CheckListBox2.Selected[i]:= True;
     if notMainObj then
     begin
       if FileExists(GetSYSTempPath + 'Spr_Tovar_Attr.xml') then
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Spr_Tovar_Attr.xml');
         Open;

         with ShopMainForm.pFIBService do
         begin // Удаляем из справочника атрибуты, которых нет в файле обмена
           SelectSQL.Clear;
           SelectSQL.Add('select * from SPR_TOVAR_ATTR');
           Open;
           ProgressBar1.Position:= ProgressBar1.Min;
           ProgressBar1.Max:= ShopMainForm.pFIBService.RecordCount;
           while not Eof do
           begin
             if not ClientDataSet1.Locate('ATR_ID', ShopMainForm.pFIBService['ATR_ID'],[]) then
               begin
                 ShopMainForm.pFIBDatabase1.Execute('delete from TOVAR_ATTR where ATR_ID = '
                    + IntToStr(ShopMainForm.pFIBService['ATR_ID']));
                 ShopMainForm.pFIBDatabase1.Execute('delete from SPR_TOVAR_ATTR where ATR_ID = '
                    + IntToStr(ShopMainForm.pFIBService['ATR_ID']));
                 SaveToLog('SPR_TOVAR_ATTR(лишний атрибут в справочнике): ' + IntToStr(ShopMainForm.pFIBService['ATR_ID']) + ' - ' + ShopMainForm.pFIBService['ATR_NAME'], 'recive.log');
               end;
             Next;
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Close;
         end;

         ProgressBar1.Position:= ProgressBar1.Min;
         ProgressBar1.Max:= RecordCount;
         First;
         pFIBQuery1.SQL.Clear;
         pFIBQuery1.SQL.Add('update or insert into SPR_TOVAR_ATTR(ATR_ID, ATR_NAME)'
                 + ' values(:ATR_ID, :ATR_NAME) matching(ATR_ID)');
         pFIBQuery1.Prepare;
         while not Eof do
         begin
           pFIBQuery1.ParamByName('ATR_ID').AsInteger:= ClientDataSet1['ATR_ID'];
           pFIBQuery1.ParamByName('ATR_NAME').AsString:= ClientDataSet1['ATR_NAME'];
           pFIBQuery1.ExecQuery; // Добавляем-обновляем справочник атрибутов
           ProgressBar1.StepIt;
           Application.ProcessMessages;
           Next;
         end;
         Close;

         CheckListBox2.Checked[i]:= True;
       end
       else
       begin
         SaveToLog('Не найден ' + GetSYSTempPath + 'Spr_Tovar_Attr.xml', 'recive.log');
         CheckListBox2.State[i]:= cbGrayed;
       end;
     end;
     Inc(i);
     Application.ProcessMessages;
     ProgressBar1.Position:= ProgressBar1.Min;
     if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
{*********************************************************************************}

{*********************************************************************************
                        Приём атрибутов товаров
*********************************************************************************}
     CheckListBox2.Selected[i]:= True;
     if notMainObj then
     begin
       if FileExists(GetSYSTempPath + 'Tovar_Atr.xml') then
       with ClientDataSet1 do
       begin
         LoadFromFile(GetSYSTempPath + 'Tovar_Atr.xml');
         Open;

         with ShopMainForm.pFIBService do
         begin // Удаляем из справочника атрибутов товаров, которых нет в файле обмена
           SelectSQL.Clear;
           SelectSQL.Add('select count(*) as ATR_COUNT from TOVAR_ATR');
           Open;
           ProgressBar1.Max:= ShopMainForm.pFIBService['ATR_COUNT'];

           Close;
           SelectSQL.Clear;
           SelectSQL.Add('select ATR_ID, ITEM from TOVAR_ATR order by ATR_ID');
           Open;

           var cur_id: Integer;
           ClientDataSet1.Filtered:= True;
           cur_id:= -1;
           ProgressBar1.Position:= ProgressBar1.Min;
           while not Eof do
           begin
             if (cur_id <> ShopMainForm.pFIBService['ATR_ID']) then
             begin
               ClientDataSet1.Filter:= 'ATR_ID = ' + IntToStr(ShopMainForm.pFIBService['ATR_ID']);
               cur_id:= ShopMainForm.pFIBService['ATR_ID'];
             end;

             if not ClientDataSet1.Locate('ITEM', ShopMainForm.pFIBService.FieldByName('ITEM').AsString,[])then
               begin
                 ShopMainForm.pFIBDatabase1.Execute('delete from TOVAR_ATR where ATR_ID = '
                    + IntToStr(ShopMainForm.pFIBService['ATR_ID']) + ' and ITEM = ''' + ShopMainForm.pFIBService['ITEM'] + '''');
                 SaveToLog('SPR_TOVAR_ATTR(лишний атрибут для товара): ' + ShopMainForm.pFIBService['ITEM'] + ' - ' + IntToStr(ShopMainForm.pFIBService['ATR_ID']), 'recive.log');
               end;
{
          SelectSQL.Add('select * from TOVAR_ATR');
           Open;
           ProgressBar1.Position:= ProgressBar1.Min;
           while not Eof do
           begin
             if not ClientDataSet1.Locate('ATR_ID;ITEM', VarArrayOf([ShopMainForm.pFIBService.FieldByName('ATR_ID').AsInteger,
                  ShopMainForm.pFIBService.FieldByName('ITEM').AsString]),[])then
               begin
                 ShopMainForm.pFIBDatabase1.Execute('delete from TOVAR_ATR where ATR_ID = '
                    + IntToStr(ShopMainForm.pFIBService['ATR_ID']) + ' and ITEM = ''' + ShopMainForm.pFIBService['ITEM'] + '''');
                 SaveToLog('SPR_TOVAR_ATTR(лишний атрибут для товара): ' + ShopMainForm.pFIBService['ITEM'] + ' - ' + IntToStr(ShopMainForm.pFIBService['ATR_ID']), 'recive.log');
               end;
   }
             Next;
             ProgressBar1.StepIt;
             Application.ProcessMessages;
           end;
           Close;
           ClientDataSet1.Filtered:= False;
           ClientDataSet1.Filter:= '';
         end;

         First;
         ProgressBar1.Position:= ProgressBar1.Min;
         ProgressBar1.Max:= RecordCount;
         pFIBQuery1.SQL.Clear;
         pFIBQuery1.SQL.Add('update or insert into TOVAR_ATR(ATR_ID, ITEM)'
                 + ' values(:ATR_ID, :ITEM) matching(ATR_ID, ITEM)');
         pFIBQuery1.Prepare;
         while not Eof do
         begin
           pFIBQuery1.ParamByName('ATR_ID').AsInteger:= ClientDataSet1['ATR_ID'];
           pFIBQuery1.ParamByName('ITEM').AsString:= ClientDataSet1['ITEM'];
           pFIBQuery1.ExecQuery; // Добавляем атрибуты
           ProgressBar1.StepIt;
           Application.ProcessMessages;
           Next;
         end;
         Close;

         CheckListBox2.Checked[i]:= True;
       end
       else
       begin
         SaveToLog('Не найден ' + GetSYSTempPath + 'Tovar_Atr.xml', 'recive.log');
         CheckListBox2.State[i]:= cbGrayed;
       end;
     end;
     Inc(i);
     Application.ProcessMessages;
     ProgressBar1.Position:= ProgressBar1.Min;
     if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
{*********************************************************************************}

{*********************************************************************************
                              Приём остатков товаров
*********************************************************************************}
     CheckListBox2.Selected[i]:= True;
     if notMainObj then
     begin
       // Удаляем старые позиции
       ShopMainForm.pFIBDatabase1.Execute('delete from TOVAR_OST'
         + ' where MARKET_CODE <> ' + IntToStr(CurrentMarketCode));
       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
       pFIBQuery1.Close;
       pFIBQuery1.SQL.Clear;

       // Если есть .xml файл разбираем его
       if FileExists(GetSYSTempPath + 'Tovar_ost.xml') then
       begin
         with ClientDataSet1 do
         begin
           LoadFromFile(GetSYSTempPath + 'Tovar_ost.xml');
           Filter:= 'MARKET_CODE <> ' + IntToStr(CurrentMarketCode);
           Filtered:= True;
           Open;
           ProgressBar1.Max:= RecordCount;
           ProgressBar1.Position:= ProgressBar1.Min;

           pFIBQuery1.SQL.Add('insert into TOVAR_OST(MARKET_CODE, ITEM, '
             + 'KOLVO, DOC_DATE, VEND_PRICE, VENDOR_CODE)values(:MARKET_CODE, :ITEM, '
             + ':KOLVO, :DOC_DATE, :VEND_PRICE, :VENDOR_CODE)');
           pFIBQuery1.Prepare;

           while not Eof do
           begin  // Добавляем новые позиции
             pFIBQuery1.ParamByName('MARKET_CODE').AsInteger:= ClientDataSet1['MARKET_CODE'];
             pFIBQuery1.ParamByName('ITEM').AsString:= ClientDataSet1['ITEM'];
             pFIBQuery1.ParamByName('KOLVO').AsFloat:= ClientDataSet1['KOLVO'];
             pFIBQuery1.ParamByName('DOC_DATE').AsDateTime:= ClientDataSet1['DOC_DATE'];
             pFIBQuery1.ParamByName('VEND_PRICE').AsFloat:= ClientDataSet1['VEND_PRICE'];
             pFIBQuery1.ParamByName('VENDOR_CODE').AsInteger:= ClientDataSet1['VENDOR_CODE'];
             pFIBQuery1.ExecQuery;

             ProgressBar1.StepIt;
             Application.ProcessMessages;
             Next;
           end;
           Close;
           Filter:= '';
           Filtered:= False;
         end
       end
       else
       begin //  Если нет .xml файла принимаем из кэша fib
         pFIBQuery1.SQL.Add('insert into TOVAR_OST(MARKET_CODE, ITEM, '
           + 'KOLVO, DOC_DATE, VEND_PRICE, VENDOR_CODE)values(:MARKET_CODE, :ITEM, '
           + ':KOLVO, :DOC_DATE, :VEND_PRICE, :VENDOR_CODE)');
         if not ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.StartTransaction;
         pFIBQuery1.BatchInputRawFile(GetSYSTempPath + 'Tovar_ost.fib');
       end;

       CheckListBox2.Checked[i]:= True;
     end;
     Inc(i);
     ProgressBar1.Position:= ProgressBar1.Min;
     if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
{*********************************************************************************}


    finally
       CheckListBox2.Selected[CheckListBox2.Items.Count - 1]:= False;
       FormatSettings.DecimalSeparator:= TmpSep;
       with ShopMainForm.pFIBDatabase1 do
       begin

         Execute('ALTER TRIGGER SPR_VENDORS_BI ACTIVE;');
         Execute('ALTER TRIGGER SPR_BUYERS_BI ACTIVE;');

         Execute('ALTER TRIGGER SPR_TOVAR_BI ACTIVE;');
         Execute('ALTER TRIGGER SPR_TOVAR_BU ACTIVE;');

         Execute('ALTER TRIGGER HDR_PRIHOD_BU ACTIVE;');
         Execute('ALTER TRIGGER HDR_PRIHOD_BI ACTIVE;');

         Execute('ALTER TRIGGER HDR_RASHOD_BU ACTIVE;');
         Execute('ALTER TRIGGER HDR_RASHOD_BI ACTIVE;');
//         Execute('ALTER TRIGGER POS_RASHOD_BI0 ACTIVE;');

         Execute('ALTER TRIGGER HDR_SMENS_BI ACTIVE;');
         Execute('ALTER TRIGGER SPR_TOVAR_ATTR_BI0 ACTIVE;');

//         Execute('ALTER TRIGGER POS_SALES_BI0 ACTIVE;');
         if ShopMainForm.pFIBTransaction1.Active then
         begin
           ShopMainForm.pFIBTransaction1.Commit;
           SprFrmFree;
         end;
       end;
       ProgressBar1.Visible:= False;
       GroupBox1.Enabled:= True;
       GroupBox2.Enabled:= True;
       DelExists(GetSYSTempPath + 'transfer.ini');
       DelExists(GetSYSTempPath + 'kkm_log.err');
       DelExists(GetSYSTempPath + 'shop.err');
       DelExists(GetSYSTempPath + 'shop.log');
       DelExists(GetSYSTempPath + 'transfer.log');
       DelExists(GetSYSTempPath + 'Clients.xml');
       DelExists(GetSYSTempPath + 'Hdr_Prihod.xml');
       DelExists(GetSYSTempPath + 'Hdr_Rashod.xml');
       DelExists(GetSYSTempPath + 'Hdr_Smens.xml');
       DelExists(GetSYSTempPath + 'Price_Change.xml');
       DelExists(GetSYSTempPath + 'Pos_Prihod.xml');
       DelExists(GetSYSTempPath + 'Pos_Rashod.xml');
       DelExists(GetSYSTempPath + 'Pos_Sales.xml');
       DelExists(GetSYSTempPath + 'Spr_Acount.xml');
       DelExists(GetSYSTempPath + 'Spr_Buyers.xml');
       DelExists(GetSYSTempPath + 'Spr_Charge.xml');
       DelExists(GetSYSTempPath + 'Spr_Group.xml');
       DelExists(GetSYSTempPath + 'Spr_Market.xml');
       DelExists(GetSYSTempPath + 'Spr_Norm_Ost.xml');
       DelExists(GetSYSTempPath + 'Spr_Tovar.xml');
       DelExists(GetSYSTempPath + 'Spr_Vendors.xml');
       DelExists(GetSYSTempPath + 'Spr_Units.xml');
       DelExists(GetSYSTempPath + 'Spr_Users.xml');
       DelExists(GetSYSTempPath + 'Spr_Tovar_Attr.xml');
       DelExists(GetSYSTempPath + 'Tovar_Atr.xml');
       DelExists(GetSYSTempPath + 'Uchet.xml');
       DelExists(GetSYSTempPath + 'Tovar_ost.fib');

       CopyFile(PChar(Edit1.Text), PChar(ExtractFilePath(ParamStr(0)) + 'RECEIVE\' + ExtractFileName(Edit1.Text)), False);
       Screen.Cursor:= crDefault;
    end;

    SaveToLog('Загрузка данных из файла: ' + Edit1.Text + ' ('
    + FloatToStrF((GetTickCount - ProcTime)/60000, ffFixed, 16, 0)  + ' мин)', 'shop.log');
    MessageDlg('Данные успешно приняты (Время работы: ' + FloatToStrF((GetTickCount - ProcTime)/60000, ffFixed, 16, 0)
     + ' мин)', mtInformation, [mbOK], 0);
end;

procedure TDataSendFrm.Edit1DblClick(Sender: TObject);
begin
    TabSheet3.TabVisible:= True;
end;

end.
