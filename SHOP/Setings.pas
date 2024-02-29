//****************************************************************************//
//                              © Guard  2002-2023                            //
//****************************************************************************//
unit Setings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ComCtrls, ComObj, FIBQuery, pFIBQuery,
  pFIBStoredProc, Grids, DBGrids, FIBDataSet, pFIBDataSet, DBClient, md5,
  FIBDatabase, pFIBDatabase, Vcl.ExtCtrls, Vcl.FileCtrl, Winapi.ShellAPI,
  Vcl.Mask, Vcl.CheckLst, Vcl.ValEdit, System.UITypes;

type
  TSetingsFrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    ComboBox1: TComboBox;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    ComboBox2: TComboBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    TabSheet3: TTabSheet;
    LMDButton1: TBitBtn;
    OpenDialog1: TOpenDialog;
    SpeedButton5: TSpeedButton;
    LMDFileOpenEdit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    Label4: TLabel;
    SpeedButton7: TSpeedButton;
    BitBtn3: TBitBtn;
    OrgNameEdit: TEdit;
    Label5: TLabel;
    BossEdit: TEdit;
    Label6: TLabel;
    BuhEdit: TEdit;
    Label7: TLabel;
    INNEdit: TEdit;
    Label8: TLabel;
    KPPEdit: TEdit;
    Label9: TLabel;
    BIKEdit: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    AdresEdit: TEdit;
    BANKEdit: TEdit;
    Label12: TLabel;
    RSCHETEdit: TEdit;
    Label13: TLabel;
    OKOHXEdit: TEdit;
    Label14: TLabel;
    OKPOEdit: TEdit;
    Label15: TLabel;
    PhoneEdit: TEdit;
    Label16: TLabel;
    LongOrgNameEdit: TEdit;
    Label17: TLabel;
    TabSheet4: TTabSheet;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    KSCHETEdit: TEdit;
    Label18: TLabel;
    BitBtn5: TBitBtn;
    CheckBox2: TCheckBox;
    pFIBStoredProc1: TpFIBStoredProc;
    TabSheet5: TTabSheet;
    SprUsers: TpFIBDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    TabSheet6: TTabSheet;
    DataSource2: TDataSource;
    ClientDataSet1: TClientDataSet;
    DBGrid2: TDBGrid;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    OpenDialog2: TOpenDialog;
    SaveDialog1: TSaveDialog;
    TabSheet7: TTabSheet;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    OpenDialog3: TOpenDialog;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Memo1: TMemo;
    SlaveData: TpFIBDataSet;
    MasterData: TpFIBDataSet;
    Edit3: TEdit;
    BitBtn12: TBitBtn;
    StatusBar1: TStatusBar;
    Memo2: TMemo;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    Bevel1: TBevel;
    PinpadEnableCheckBox: TCheckBox;
    BitBtn16: TBitBtn;
    FileOpenDialog1: TFileOpenDialog;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    SberPathEdit: TLabeledEdit;
    AccessCheckListBox: TCheckListBox;
    Panel1: TPanel;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    CheckBox3: TCheckBox;
    BitBtn19: TBitBtn;
    TabSheet8: TTabSheet;
    DBGrid3: TDBGrid;
    BitBtn15: TBitBtn;
    DataSource3: TDataSource;
    CheckReservDataSet: TpFIBDataSet;
    TableRsrvCheckBox: TCheckBox;
    DBGrid4: TDBGrid;
    BitBtn20: TBitBtn;
    pFIBDataSet1: TpFIBDataSet;
    DataSource4: TDataSource;
    TabSheet9: TTabSheet;
    Edit4: TEdit;
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure LMDFileOpenEdit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure OrgNameEditChange(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure LMDButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetingsFrm: TSetingsFrm;
  KKMOleObject: Variant;

implementation

uses ShopMain, DeviceCfg, IniFiles, PereocenEdit, PassEnter;

{$R *.dfm}

procedure TSetingsFrm.FormCreate(Sender: TObject);
var i: Integer;
begin
        LMDFileOpenEdit1.Text:= ShopIni.ReadString('Main', 'BasePath', ExtractFilePath(ParamStr(0)) + 'Shop.fdb');

        if ShopMainForm.pFIBDatabase1.IsRemoteConnect then
          StatusBar1.SimpleText:= 'server:' + ShopMainForm.pFIBDatabase1.DBSiteName
            + ' BaseFile:' + ShopMainForm.pFIBDatabase1.DBFileName
        else StatusBar1.SimpleText:= 'Local connect BaseFile:' + ShopMainForm.pFIBDatabase1.DBFileName;

        ComboBox1.ItemIndex:= ShopIni.ReadInteger('Devices', 'Device1', 0);
        case ShopIni.ReadInteger('KKM', 'KKM_Type', 2) of
          100: ComboBox2.ItemIndex:= 0;
            2: ComboBox2.ItemIndex:= 1;
            3: ComboBox2.ItemIndex:= 2;
            4: ComboBox2.ItemIndex:= 3;
            5: ComboBox2.ItemIndex:= 4;
        end;
        SpeedButton4.Enabled:= ComboBox2.ItemIndex > 0;
        CheckBox1.Checked:= ShopIni.ReadBool('Main', 'DiscontEnable', False);
        Edit1.Text:= ShopIni.ReadString('Main', 'DiscontPercent', '5');
        Edit2.Text:= ShopIni.ReadString('BackUp', 'BackUpPath', ExtractFilePath(ParamStr(0))+ 'BackUp\');
        CheckBox2.Checked:= ShopIni.ReadBool('Main', 'PriceOKR', False);
        TableRsrvCheckBox.Checked:= ShopIni.ReadBool('Main', 'TableRSRV', False);
        CheckBox3.Checked:= ShopIni.ReadBool('Main', 'MD5_Code', False);
        OrgNameEdit.Text:= OrgName;
        LongOrgNameEdit.Text:= LongOrgName;
        PhoneEdit.Text:= Phone;
        INNEdit.Text:= INN;
        OKOHXEdit.Text:= OKOHX;
        OKPOEdit.Text:= OKPO;
        ADRESEdit.Text:= ADRES;
        BANKEdit.Text:= BANK;
        RSCHETEdit.Text:= RSCHET;
        KSCHETEdit.Text:= KSCHET;
        KPPEdit.Text:= KPP;
        BIKEdit.Text:= BIK;
        BOSSEdit.Text:= BOSS;
        BUHEdit.Text:= BUH;

        AccessCheckListBox.Items.Clear;
        for i:= 0 to Length(MyListAccess)-1 do
        begin
          AccessCheckListBox.Items.Add(MyListAccess[i].DisplayName);
        end;
        SprUsers.Open;

        SberPathEdit.Text:= ShopIni.ReadString('PINPAD', 'SberPath', 'c:\sc552\');
        PinpadEnableCheckBox.Checked:= ShopIni.ReadBool('PINPAD', 'PinpadEnable', False);
        PageControl1.ActivePage:= TabSheet3;
        CheckReservDataSet.Open;
end;

procedure TSetingsFrm.SpeedButton1Click(Sender: TObject);
begin
  ShopIni.WriteString('Main', 'BasePath', LMDFileOpenEdit1.Text);
end;

procedure TSetingsFrm.LMDFileOpenEdit1Change(Sender: TObject);
begin
  SpeedButton1.Enabled:= LMDFileOpenEdit1.Text <> '';
end;

procedure TSetingsFrm.ComboBox1Change(Sender: TObject);
begin
  SpeedButton2.Enabled:= ComboBox1.ItemIndex > 0;
end;

procedure TSetingsFrm.SpeedButton2Click(Sender: TObject);
begin    // Настройка устройства чтения штрих-кодов
        Application.CreateForm(TDeviceCfgFrm, DeviceCfgFrm);
        DeviceCfgFrm.Tag:= 1;
       try
        DeviceCfgFrm.ShowModal;
       finally
        DeviceCfgFrm.Free;
       end;
        if ComboBox1.ItemIndex <> ShopIni.ReadInteger('Devices', 'Device1', 0) then

        //  if ComboBox1.ItemIndex = 0 then ShopMainForm.DevicesStart
        //  else ShopMainForm.CommDevice1.StopComm;

        ComboBox1.ItemIndex:= ShopIni.ReadInteger('Devices', 'Device1', 0);
end;

procedure TSetingsFrm.SpeedButton3Click(Sender: TObject);
begin
        case ComboBox2.ItemIndex of
          0: ShopIni.WriteInteger('KKM', 'KKM_Type', 100);
          1: ShopIni.WriteInteger('KKM', 'KKM_Type', 2);
        end;
end;

procedure TSetingsFrm.ComboBox2Change(Sender: TObject);
begin
        SpeedButton4.Enabled:= ComboBox2.ItemIndex > 0;
end;

procedure TSetingsFrm.SpeedButton4Click(Sender: TObject);
begin
  case ComboBox2.ItemIndex of
    1: begin // Элвес-Мини-ФР-Ф A2.7
         try
           KKMOleObject:= CreateOleObject('AddIn.DrvFR');
         except
           on EOleSysError do
           begin
             MessageDlg('Драйвер Элвес-Мини-ФР-Ф A2.7 не зарегистрирован'#10#13
                    + 'Попробуйте установить драйвер ФР еще раз',
                       mtError, [mbOK], 0);
             Abort;
           end;
         end;
         KKMOleObject.ShowProperties;
       end;
    2: begin // Элвес-Мини-ФР-Ф 4.52
         try
           KKMOleObject:= CreateOleObject('AddIn.FprnM45');
         except
           on EOleSysError do
           begin
             MessageDlg('Драйвер Элвес-Мини-ФР-Ф 4.52 не зарегистрирован'#10#13
                    + 'Попробуйте установить драйвер ФР еще раз',
                       mtError, [mbOK], 0);
             Abort;
           end;
         end;
         KKMOleObject.ShowProperties;
       end;
     3: begin // АМС-100Ф
          Application.CreateForm(TDeviceCfgFrm, DeviceCfgFrm);
          DeviceCfgFrm.Tag:= 0;
          DeviceCfgFrm.ShowModal;
          DeviceCfgFrm.Free;
        end;
    4: begin // Элвес 01-03Ф
         try
           KKMOleObject:= CreateOleObject('Fprn.Fprn4');
         except
           on EOleSysError do
           begin
             MessageDlg('Драйвер Элвес 01-03Ф не зарегистрирован'#10#13
                    + 'Попробуйте установить драйвер ФР еще раз',
                       mtError, [mbOK], 0);
             Abort;
           end;
         end;
         KKMOleObject.ShowPropertys(KKMOleObject);
       end;
    5: begin // Атол 2.Х
         try
           KKMOleObject:= CreateOleObject('AddIn.FprnM45');
           KKMOleObject.ApplicationHandle := Application.Handle;
         except
           on EOleSysError do
           begin
             MessageDlg('Драйвер Атол 2.х не зарегистрирован'#10#13
                    + 'Попробуйте установить драйвер ФР еще раз',
                       mtError, [mbOK], 0);
             Abort;
           end;
         end;
         KKMOleObject.ShowProperties;
       end;
   end;
end;

procedure TSetingsFrm.SpeedButton5Click(Sender: TObject);
begin
      if OpenDialog1.Execute then LMDFileOpenEdit1.Text:= OpenDialog1.FileName;
end;

procedure TSetingsFrm.CheckBox1Click(Sender: TObject);
begin
      Edit1.Enabled:= CheckBox1.Checked;
      if CheckBox1.Checked then Edit1.Color:= clWindow
      else Edit1.Color:= clBtnFace;
end;

procedure TSetingsFrm.BitBtn10Click(Sender: TObject);
begin
  if OpenDialog3.Execute then
  begin
    pFIBDatabase1.DBName:= OpenDialog3.FileName;
    pFIBDatabase1.Open;
  end;
end;

procedure TSetingsFrm.BitBtn11Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  with MasterData do
  begin
// Приходы
    SelectSQL.Clear;
    SelectSQL.Add('select * from HDR_PRIHOD where MARKET_CODE = ' + IntToStr(CurrentMarketCode));
    SelectSQL.Add('and DOC_TYPE <> 12');
    SelectSQL.Add('order by DOC_DATE');
    Open;
    while not Eof do
    begin
      SlaveData.SelectSQL.Clear;
      SlaveData.SelectSQL.Add('select * from HDR_PRIHOD');
      SlaveData.SelectSQL.Add('where MARKET_CODE = ' + IntToStr(MasterData['MARKET_CODE']));
      SlaveData.SelectSQL.Add('and DOC_NUMBER = ' + IntToStr(MasterData['DOC_NUMBER']));
      SlaveData.SelectSQL.Add('and DOC_TYPE = ' + IntToStr(MasterData['DOC_TYPE']));
      SlaveData.Open;
      if VarIsNull(SlaveData['MARKET_CODE'])then
        Memo1.Lines.Add('Приход не найден - ' + GetDocTypeName(MasterData['DOC_TYPE']) + ' № ' + IntToStr(MasterData['DOC_NUMBER']) + ' от ' + DateToStr(MasterData['DOC_DATE']))
      else if SlaveData['DOC_SUM'] <> MasterData['DOC_SUM'] then
        Memo1.Lines.Add('Приход не совпадает - ' + GetDocTypeName(MasterData['DOC_TYPE']) + ' № ' + IntToStr(MasterData['DOC_NUMBER']) + ' от ' + DateToStr(MasterData['DOC_DATE'])
          + '(' + FloatToSTr(SlaveData['DOC_SUM']) + ' - ' + FloatToSTr(MasterData['DOC_SUM']) + ')');
      Next;
      SlaveData.Close;
    end;
    Close;

// Расходы
    Memo1.Lines.Add('-------------------------------------------');
    SelectSQL.Clear;
    SelectSQL.Add('select * from HDR_RASHOD where MARKET_CODE = ' + IntToStr(CurrentMarketCode));
    SelectSQL.Add('and DOC_TYPE <> 12');
    SelectSQL.Add('order by DOC_DATE');
    Open;
    while not Eof do
    begin
      SlaveData.SelectSQL.Clear;
      SlaveData.SelectSQL.Add('select * from HDR_RASHOD');
      SlaveData.SelectSQL.Add('where MARKET_CODE = ' + IntToStr(MasterData['MARKET_CODE']));
      SlaveData.SelectSQL.Add('and DOC_NUMBER = ' + IntToStr(MasterData['DOC_NUMBER']));
      SlaveData.SelectSQL.Add('and DOC_TYPE = ' + IntToStr(MasterData['DOC_TYPE']));
      SlaveData.Open;
      if VarIsNull(SlaveData['MARKET_CODE'])then
        Memo1.Lines.Add('Расход не найден - ' + GetDocTypeName(MasterData['DOC_TYPE']) + ', № ' + IntToStr(MasterData['DOC_NUMBER']) + ' от ' + DateToStr(MasterData['DOC_DATE']))
      else if SlaveData['DOC_SUM'] <> MasterData['DOC_SUM'] then
        Memo1.Lines.Add('Расход не совпадает - ' + GetDocTypeName(MasterData['DOC_TYPE']) + ', № ' + IntToStr(MasterData['DOC_NUMBER']) + ' от ' + DateToStr(MasterData['DOC_DATE'])
          + '(' + FloatToSTr(SlaveData['DOC_SUM']) + ' - ' + FloatToSTr(MasterData['DOC_SUM']) + ')');
      Next;
      SlaveData.Close;
    end;
    Close;

// Смены
    Memo1.Lines.Add('-------------------------------------------');
    SelectSQL.Clear;
    SelectSQL.Add('select h.market_code, h.begin_datetime, h.end_datetime, SUM(P.SALE_PRICE*(P.KOLVO + 2*P.KOLVO*(CAST(P.NCARD as INTEGER))))SALE_SUM');
    SelectSQL.Add('from hdr_smens h left join POS_SALES P on h.smens_kod = p.smens_kod');
    SelectSQL.Add('where CAST(P.NCARD as INTEGER) <= 0 and not h.END_DATETIME is null and h.MARKET_CODE = ' + IntToStr(CurrentMarketCode));
    SelectSQL.Add('group by h.market_code, h.begin_datetime, h.end_datetime order by h.begin_datetime');
    Open;
    while not Eof do
    begin
      SlaveData.SelectSQL.Clear;
      SlaveData.SelectSQL.Add('select h.market_code, h.begin_datetime, h.end_datetime, SUM(P.SALE_PRICE*(P.KOLVO + 2*P.KOLVO*(CAST(P.NCARD as INTEGER))))SALE_SUM');
      SlaveData.SelectSQL.Add('from hdr_smens h left join POS_SALES P on h.smens_kod = p.smens_kod');
      SlaveData.SelectSQL.Add('where CAST(P.NCARD as INTEGER) <= 0 and h.MARKET_CODE = ' + IntToStr(MasterData['MARKET_CODE']));
      SlaveData.SelectSQL.Add('and END_DATETIME = ''' + DateTimeToStr(MasterData['END_DATETIME']) + '''');
      SlaveData.SelectSQL.Add('group by h.market_code, h.begin_datetime, h.end_datetime order by h.begin_datetime');

      SlaveData.Open;
      if VarIsNull(SlaveData['MARKET_CODE'])then
        Memo1.Lines.Add('Смена не найдена(Дата окончания ' + DateTimeToStr(MasterData['END_DATETIME']))
      else
        if FloatToStr(MasterData['SALE_SUM']) <> FloatToStr(SlaveData['SALE_SUM']) then
          Memo1.Lines.Add('Смена не совпадает(Дата окончания ' + DateTimeToStr(MasterData['END_DATETIME']) + ') '
            + FloatToStr(SlaveData['SALE_SUM']) + ' - ' + FloatToStr(MasterData['SALE_SUM']));

      Next;
      SlaveData.Close;
    end;
    Close;

// Приходы лишние
    Memo1.Lines.Add('-------------------------------------------');
    SlaveData.SelectSQL.Clear;
    SlaveData.SelectSQL.Add('select * from HDR_PRIHOD where MARKET_CODE = ' + IntToStr(CurrentMarketCode));
    SlaveData.SelectSQL.Add('and DOC_TYPE <> 12');
    SlaveData.SelectSQL.Add('order by DOC_DATE');
    SlaveData.Open;
    while not SlaveData.Eof do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select * from HDR_PRIHOD');
      SelectSQL.Add('where MARKET_CODE = ' + IntToStr(SlaveData['MARKET_CODE']));
      SelectSQL.Add('and DOC_NUMBER = ' + IntToStr(SlaveData['DOC_NUMBER']));
      SelectSQL.Add('and DOC_TYPE = ' + IntToStr(SlaveData['DOC_TYPE']));
      Open;
      if VarIsNull(MasterData['MARKET_CODE'])then
        Memo1.Lines.Add('Приход лишний - ' + GetDocTypeName(SlaveData['DOC_TYPE']) + ', № ' + IntToStr(SlaveData['DOC_NUMBER']) + ' от ' + DateToStr(SlaveData['DOC_DATE']));
      SlaveData.Next;
      MasterData.Close;
    end;
    SlaveData.Close;

// Расходы лишние
    Memo1.Lines.Add('-------------------------------------------');
    SlaveData.SelectSQL.Clear;
    SlaveData.SelectSQL.Add('select * from HDR_RASHOD where MARKET_CODE = ' + IntToStr(CurrentMarketCode));
    SlaveData.SelectSQL.Add('and DOC_TYPE <> 12');
    SlaveData.SelectSQL.Add('order by DOC_DATE');
    SlaveData.Open;
    while not SlaveData.Eof do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select * from HDR_RASHOD');
      SelectSQL.Add('where MARKET_CODE = ' + IntToStr(SlaveData['MARKET_CODE']));
      SelectSQL.Add('and DOC_NUMBER = ' + IntToStr(SlaveData['DOC_NUMBER']));
      SelectSQL.Add('and DOC_TYPE = ' + IntToStr(SlaveData['DOC_TYPE']));
      Open;
      if VarIsNull(MasterData['MARKET_CODE'])then
        Memo1.Lines.Add('Расход лишний - ' + GetDocTypeName(SlaveData['DOC_TYPE']) + ', № ' + IntToStr(SlaveData['DOC_NUMBER']) + ' от ' + DateToStr(SlaveData['DOC_DATE']));
      SlaveData.Next;
      MasterData.Close;
    end;
    SlaveData.Close;
  end;
  ShowMessage('Проверка завершена');
end;

procedure TSetingsFrm.BitBtn12Click(Sender: TObject);
begin
  if Edit3.Text <> '' then
  begin
    ClientDataSet1.Filter:= Edit3.Text;
  end;
  ClientDataSet1.Filtered:= Edit3.Text <> '';

end;

procedure TSetingsFrm.BitBtn13Click(Sender: TObject);
begin
  if OpenDialog2.Execute then Memo2.Lines.LoadFromFile(OpenDialog2.FileName);
end;

procedure TSetingsFrm.BitBtn14Click(Sender: TObject);
begin
  ExecSQLStr(Memo2.Lines.Text);
end;

procedure TSetingsFrm.BitBtn15Click(Sender: TObject);
begin
  ExecSQLStr('delete from TOVAR_RSRV');
  ExecSQLStr('insert into tovar_rsrv(item, kolvo) select p.item, sum(p.kolvo)'
      + ' from hdr_rashod h left join pos_rashod p on h.kod = p.kod where h.doc_type = 12 group by item');
  CheckReservDataSet.CloseOpen(True);
end;

procedure TSetingsFrm.BitBtn16Click(Sender: TObject);
var SelDir: String;
begin
  FileOpenDialog1.FileName:= SberPathEdit.Text;
  if FileOpenDialog1.Execute then SberPathEdit.Text:= FileOpenDialog1.FileName + '\';

end;

procedure TSetingsFrm.BitBtn17Click(Sender: TObject);
begin
    ShellExecute(Handle,'open', PWideChar(SberPathEdit.Text + 'LoadParm.exe'),nil,nil,SW_SHOW);
end;

procedure TSetingsFrm.BitBtn18Click(Sender: TObject);
begin
        ShopIni.WriteString('PINPAD', 'SberPath', SberPathEdit.Text);
        ShopIni.WriteBool('PINPAD', 'PinpadEnable', PinpadEnableCheckBox.Checked);
end;

procedure TSetingsFrm.BitBtn19Click(Sender: TObject);
var i: Integer;
begin
    for i:= 0 to Length(MyListAccess)-1 do
    begin
      with ShopMainForm.pFIBService do
      begin
        SelectSQL.Clear;
        SelectSQL.Add('select * from USER_SETINGS where AUTOR_KOD = -1'
          + 'and SECTION = ''ACCESS'' and KEY_NAME = ''' + MyListAccess[i].AccName + '''');
        Open;
        if AccessCheckListBox.Checked[i] then
        begin
          if VarIsNull(ShopMainForm.pFIBService['KEY_VALUE']) then
            ShopMainForm.pFIBDatabase1.Execute('insert into USER_SETINGS(AUTOR_KOD, SECTION, KEY_NAME, KEY_VALUE)'
              + 'values(-1, ''ACCESS'', ''' + MyListAccess[i].AccName + ''', '',' + IntToStr(SprUsers['AUTOR_KOD']) + ','')')
          else
            if (Pos(','+ IntToStr(SprUsers['AUTOR_KOD']) + ',', ShopMainForm.pFIBService['KEY_VALUE']) = 0) then
              ShopMainForm.pFIBDatabase1.Execute('update USER_SETINGS set KEY_VALUE = KEY_VALUE || '','
                + IntToStr(SprUsers['AUTOR_KOD']) + ','' where AUTOR_KOD = -1 and SECTION = ''ACCESS'' and KEY_NAME = '''
                + MyListAccess[i].AccName + '''');
        end
        else
          if not VarIsNull(ShopMainForm.pFIBService['KEY_VALUE']) then
            if (Pos(','+ IntToStr(SprUsers['AUTOR_KOD']) + ',', ShopMainForm.pFIBService['KEY_VALUE']) > 0) then
            begin
              ShopMainForm.pFIBDatabase1.Execute('update USER_SETINGS set KEY_VALUE = '''
                + StringReplace(ShopMainForm.pFIBService['KEY_VALUE'], ','+IntToStr(SprUsers['AUTOR_KOD'])+',', '', [])
                + ''' where AUTOR_KOD = -1 and SECTION = ''ACCESS'' and KEY_NAME = '''
                + MyListAccess[i].AccName + '''');
            end;

//      (not VarIsNull(ShopMainForm.pFIBService['KEY_VALUE']) and
  //       (Pos(User_ID.ToString, ShopMainForm.pFIBService['KEY_VALUE']) > 0));
        Close;
      end;
    end;
    if User_ID = SprUsers['AUTOR_KOD'] then UpdAccessForUser(User_ID); // Обновляем список доступных команд для текущего пользователя
end;

procedure TSetingsFrm.BitBtn1Click(Sender: TObject);
begin
          ShopMainForm.pFIBTransaction1.Active:= True;
          ShopMainForm.pFIBDatabase1.Execute('update INF_CURRENT_OBJ '
            + 'set ORG_NAME = ''' + OrgNameEdit.Text + ''','
            + 'LONG_ORG_NAME = ''' + LongOrgNameEdit.Text + ''','
            + 'PHONE = ''' + PhoneEdit.Text + ''','
            + 'INN = ''' + INNEdit.Text + ''','
            + 'OKOHX = ''' + OKOHXEdit.Text + ''','
            + 'OKPO = ''' + OKPOEdit.Text + ''','
            + 'ADRES = ''' + ADRESEdit.Text + ''','
            + 'BANK = ''' + BANKEdit.Text + ''','
            + 'RSCHET = ''' + RSCHETEdit.Text + ''','
            + 'KSCHET = ''' + KSCHETEdit.Text + ''','
            + 'KPP = ''' + KPPEdit.Text + ''','
            + 'BIK = ''' + BIKEdit.Text + ''','
            + 'BOSS = ''' + BOSSEdit.Text + ''','
            + 'BUH = ''' + BUHEdit.Text + '''');
        if ShopMainForm.pFIBTransaction1.Active then
        begin
          ShopMainForm.pFIBTransaction1.Commit;SprFrmFree;
        end;
        OrgName:= OrgNameEdit.Text;
        LongOrgName:= LongOrgNameEdit.Text;
        Phone:= PhoneEdit.Text;
        INN:= INNEdit.Text;
        OKOHX:= OKOHXEdit.Text;
        OKPO:= OKPOEdit.Text;
        ADRES:= ADRESEdit.Text;
        BANK:= BANKEdit.Text;
        RSCHET:= RSCHETEdit.Text;
        KSCHET:= KSCHETEdit.Text;
        KPP:= KPPEdit.Text;
        BIK:= BIKEdit.Text;
        BOSS:= BOSSEdit.Text;
        BUH:= BUHEdit.Text;
end;

procedure TSetingsFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
      if not(Key in [#8, '0'..'9'])then Key:= #0;
end;

procedure TSetingsFrm.Edit4Change(Sender: TObject);
begin
  if CheckINN(Edit4.Text) then Edit4.Font.Color:= clWindowText
  else Edit4.Font.Color:= clRed;end;

procedure TSetingsFrm.BitBtn20Click(Sender: TObject);
begin
  pFIBDataSet1.Close;
  pFIBDataSet1.SelectSQL:= Memo2.Lines;
  pFIBDataSet1.Open;
end;

procedure TSetingsFrm.BitBtn2Click(Sender: TObject);
begin
  BaseBackUp;
end;

procedure TSetingsFrm.SpeedButton6Click(Sender: TObject);
begin
  if OpenDialog1.Execute then LMDFileOpenEdit1.Text:= OpenDialog1.FileName;
end;

procedure TSetingsFrm.SpeedButton7Click(Sender: TObject);
begin
  ShopIni.WriteString('BackUp', 'BackUpPath', Edit2.Text);
end;

procedure TSetingsFrm.BitBtn3Click(Sender: TObject);
begin
  Application.CreateForm(TPereocenEditFrm, PereocenEditFrm);
  PereocenEditFrm.ShowModal;
  PereocenEditFrm.Free;
end;

procedure TSetingsFrm.OrgNameEditChange(Sender: TObject);
begin
  BitBtn1.Enabled:= OrgNameEdit.Text <> '';
end;

procedure TSetingsFrm.BitBtn4Click(Sender: TObject);
begin
  ShopIni.WriteBool('Main', 'DiscontEnable', CheckBox1.Checked);
  ShopIni.WriteBool('Main', 'PriceOKR', CheckBox2.Checked);
  ShopIni.WriteBool('Main', 'TableRSRV', TableRsrvCheckBox.Checked);
  ShopIni.WriteString('Main', 'DiscontPercent', Edit1.Text);
end;

procedure TSetingsFrm.BitBtn7Click(Sender: TObject);
begin
  Application.CreateForm(TPasswEnterForm, PasswEnterForm);
  PasswEnterForm.OKSpeedButton.OnClick:= PasswEnterForm.OKSpeedButtonClickEdit;
  PasswEnterForm.OnDestroy:= nil;
  PasswEnterForm.RememberPassCheckBox.Visible:= False;
  PasswEnterForm.Edit2.Text:= SprUsers['NAME'];
  PasswEnterForm.Edit1.Text:= SprUsers['USR_PASSW'];

  PasswEnterForm.ShowModal;
  PasswEnterForm.Free;
end;

procedure TSetingsFrm.BitBtn8Click(Sender: TObject);
begin
  with OpenDialog2 do
  begin
    Filter:= 'XML таблицы (*.xml)|*.xml|Все файлы (*.*)| *.*';
    Title:= 'XML таблицы';
    if Execute then ClientDataSet1.LoadFromFile(FileName);
  end;
end;

procedure TSetingsFrm.BitBtn9Click(Sender: TObject);
begin
  with SaveDialog1 do
  begin
    Filter:= 'XML таблицы|*.xml';
    Title:= 'XML таблицы';
    if Execute then ClientDataSet1.SaveToFile(FileName);
  end;
end;

procedure TSetingsFrm.LMDButton1Click(Sender: TObject);
begin
      pFIBStoredProc1.ExecProc;
end;

procedure TSetingsFrm.FormDestroy(Sender: TObject);
begin
  ShopIni.WriteBool('Main', 'MD5_Code', CheckBox3.Checked);
end;

procedure TSetingsFrm.FormResize(Sender: TObject);
begin
  DBGrid4.Width:= Memo2.Width;
  DBGrid4.Height:= BitBtn13.Top - DBGrid4.Top - Trunc(BitBtn13.Height / 2);
end;

procedure TSetingsFrm.DataSource1DataChange(Sender: TObject;
  Field: TField);
var i: Integer;
begin
  BitBtn7.Enabled:= not VarIsNull(SprUsers['AUTOR_KOD']);
  for i := 0 to Length(MyListAccess)-1 do
    AccessCheckListBox.Checked[i]:= accessAllowed(MyListAccess[i].AccName, SprUsers['AUTOR_KOD']);

end;

end.
