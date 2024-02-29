//****************************************************************************//
//                              © Guard  2002-2024                            //
//****************************************************************************//
unit ShopMain;

interface

uses
//  OneHinst,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ShellApi, ComObj, IniFiles, Registry,
  frxExportPDF, SIBEABase, SIBFIBEA, frxClass, frxCross, frxDBSet, pFIBSQLLog,
  pFIBStoredProc, frxExportXML, FIBQuery, pFIBQuery, frxFIBComponents,
  IB_Services, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxExportRTF, frxExportXLS, frxGZip, frxDCtrl, frxChBox, Menus, StdActns,
  BandActn, ActnList, XPStyleActnCtrls, ActnMan, ImgList, ComCtrls,
  ToolWin, sndkey32, frxDesgn,  frxBarcode, ZipForge, ShellAnimations,
  System.Actions, System.IOUtils, Vcl.ExtCtrls, frxExportXLSX, Grids, DBGrids,
  Vcl.PlatformDefaultStyleActnCtrls, System.ImageList, frxExportBaseDialog,
  Vcl.CheckLst, Vcl.CustomizeDlg, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, Vcl.Taskbar,
  System.Win.TaskbarCore, IdFTPCommon, IdFTPList, IdAllFTPListParsers, idGlobal,
  System.UITypes, MidasLib, frxChart;

type
  TShopMainForm = class(TForm)
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    ActionManager1: TActionManager;
    FileExit1: TFileExit;
    ACT_ABOUT: TAction;
    CustomizeActionBars1: TCustomizeActionBars;
    ACT_REGUSER: TAction;
    ACT_SETINGS: TAction;
    ACT_SALES: TAction;
    ACT_DATASEND: TAction;
    ACT_NAKL: TAction;
    ACT_REP_TOVAR_MOVE: TAction;
    ACT_TOVAR_SPARE: TAction;
    ACT_UCHET: TAction;
    ACT_REP_REVAL: TAction;
    ACT_REP_AKTMOVE: TAction;
    ACT_PRICE_LABEL: TAction;
    ACT_REP_GROUP_MOVE: TAction;
    ACT_VIEWSAVED: TAction;
    ACT_EDITFORMS: TAction;
    ACT_SPR_TOVAR: TAction;
    ACT_SPR_VENDORS: TAction;
    ACT_SPR_MARKET: TAction;
    ACT_MOVE_ITEM: TAction;
    ACT_ZAKAZ: TAction;
    ACT_EXPENSES: TAction;
    Action1: TAction;
    ACT_SPR_BUYERS: TAction;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ACT_DISCONT_CARD: TAction;
    ToolButton17: TToolButton;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    Action2: TAction;
    frxDesigner1: TfrxDesigner;
    FR31: TMenuItem;
    ActionAvtoCatalog: TAction;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    pFIBService: TpFIBDataSet;
    pFIBQuery1: TpFIBQuery;
    frxXMLExport1: TfrxXMLExport;
    pFindTovarStoredProc: TpFIBStoredProc;
    pFIBFindTovarStoredProc: TpFIBStoredProc;
    pGetTovarKolvoStoredProc: TpFIBStoredProc;
    pFIBStoredProc1: TpFIBStoredProc;
    FIBSQLLogger1: TFIBSQLLogger;
    frxCrossObject1: TfrxCrossObject;
    SaveDialog1: TSaveDialog;
    SIBfibEventAlerter1: TSIBfibEventAlerter;
    frxReport1: TfrxReport;
    pFIBSysService: TpFIBDataSet;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxDialogControls1: TfrxDialogControls;
    frxBarCodeObject1: TfrxBarCodeObject;
    ZipForge1: TZipForge;
    frxFIBComponents1: TfrxFIBComponents;
    frxXLSXExport1: TfrxXLSXExport;
    frxPDFExport1: TfrxPDFExport;
    N23: TMenuItem;
    XLS1: TMenuItem;
    ImageList2: TImageList;
    OpenYandexDisk1: TMenuItem;
    N26: TMenuItem;
    IntMoveToolButton: TToolButton;
    ServiceQuery: TpFIBQuery;
    ACT_INTMOVE: TAction;
    ExecSQLQuery: TpFIBQuery;
    IdFTP1: TIdFTP;
    frxGZipCompressor1: TfrxGZipCompressor;
    TrayIcon1: TTrayIcon;
    N35: TMenuItem;
    CheckFTPMenuItem: TMenuItem;
    Timer1: TTimer;
    ToolButton19: TToolButton;
    ZakazCheckToolButton: TToolButton;
    DelDocViewMenuItem: TMenuItem;
    N36: TMenuItem;
    frxChartObject1: TfrxChartObject;
    procedure AppException(Sender: TObject; E: Exception);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CommDevice1ReceiveData(Buffer: Pointer; BufferLength: Word);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ACT_ABOUTExecute(Sender: TObject);
    procedure ACT_REGUSERExecute(Sender: TObject);
    procedure ACT_SETINGSExecute(Sender: TObject);
    procedure ACT_SALESExecute(Sender: TObject);
    procedure ACT_DATASENDExecute(Sender: TObject);
    procedure ACT_NAKLExecute(Sender: TObject);
    procedure ACT_VIEWSAVEDExecute(Sender: TObject);
    procedure ACT_REP_TOVAR_MOVEExecute(Sender: TObject);
    procedure ACT_TOVAR_SPAREExecute(Sender: TObject);
    procedure ACT_UCHETExecute(Sender: TObject);
    procedure ACT_REP_REVALExecute(Sender: TObject);
    procedure ACT_REP_AKTMOVEExecute(Sender: TObject);
    procedure ACT_PRICE_LABELExecute(Sender: TObject);
    procedure ACT_REP_GROUP_MOVEExecute(Sender: TObject);

    procedure ACT_SPR_VENDORSExecute(Sender: TObject);
    procedure ACT_SPR_MARKETExecute(Sender: TObject);
    procedure ACT_SPR_TOVARExecute(Sender: TObject);
    procedure ACT_MOVE_ITEMExecute(Sender: TObject);
    procedure HintShow(Sender: TObject);
    procedure ACT_ZAKAZExecute(Sender: TObject);
    procedure ACT_EXPENSESExecute(Sender: TObject);
    procedure ACT_SPR_BUYERSExecute(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure ACT_DISCONT_CARDExecute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure OtherMenuClick(Sender: TObject);
    procedure ActionAvtoCatalogExecute(Sender: TObject);
    function frxReport1UserFunction(const MethodName: String;
      var Params: Variant): Variant;
    procedure XLS1Click(Sender: TObject);
    procedure OpenYandexDisk1Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure ACT_DATASENDUpdate(Sender: TObject);
    procedure ACT_SETINGSUpdate(Sender: TObject);
    procedure ACT_SALESUpdate(Sender: TObject);
    procedure ACT_NAKLUpdate(Sender: TObject);
    procedure ACT_UCHETUpdate(Sender: TObject);
    procedure ACT_REP_AKTMOVEUpdate(Sender: TObject);
    procedure ACT_VIEWSAVEDUpdate(Sender: TObject);
    procedure ACT_EDITFORMSUpdate(Sender: TObject);
    procedure ACT_SPR_VENDORSUpdate(Sender: TObject);
    procedure ACT_SPR_MARKETUpdate(Sender: TObject);
    procedure ACT_ZAKAZUpdate(Sender: TObject);
    procedure ACT_EXPENSESUpdate(Sender: TObject);
    procedure ACT_SPR_BUYERSUpdate(Sender: TObject);
    procedure ACT_DISCONT_CARDUpdate(Sender: TObject);
    procedure Action2Update(Sender: TObject);
    procedure ACT_INTMOVEUpdate(Sender: TObject);
    procedure CheckFTPMenuItemClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrayIcon1BalloonClick(Sender: TObject);
    procedure ZakazCheckToolButtonClick(Sender: TObject);
    procedure DelDocViewMenuItemClick(Sender: TObject);
    procedure N36Click(Sender: TObject);

  private
    { Private declarations }
  public
    procedure DevicesStart;
  end;

type
  TAccessRec = record
    AccName: string; // Название
    DisplayName: string; // Текст отображаемый элементом
//    AccIDList: string; // Список ID разрешенных пользавателей
    CurUserAccess: Boolean; // Доступ для текущего пользователя
end;

var
  ShopMainForm: TShopMainForm;
  NDC, User_ID, User_Role, User_KKM_Pass, CurrentMarketType, CurrentMarketCode, CurNakl: Integer;
  CurXY: TPoint;
  ShopIni: TIniFile;
  FLastTime: Cardinal;
  User_Name, OrgName, LongOrgName, Phone, INN, OKOHX, OKPO,
    ADRES, BANK, RSCHET, KSCHET, KPP, BIK, BOSS, BUH, AtrSelectStr,
    FString, ScanStr, ReportsPath, TmpFilterStr, ZakWhereFilterStr, ZakHavingFilterStr: string;
  LibName: string = 'c:\sc552\pilot_nt.dll';
  FTPUsername, FTPPassword, FTPHost, FTPSendDir: string;
  FTPLastCheck: TDateTime;
  SprShowGroup, SprHideGroup, SprShowVendor, SprHideVendor,
    ZakShowGroup, ZakHideGroup, ZakShowVendor, ZakHideVendor: TStringList;
  MyReg: TRegistry;
  SendKeyFrm: Boolean;
  TmpSep: Char;
  MyObject: Variant;
  AtomText: array [0..31] of Char;

  MyListAccess: Array of TAccessRec;


   function WinErase(Owner: Integer;  WichFiles: String;  SendToRecycleBin, Confirm: Boolean): Boolean;
   function CheckFindString(Key: Char): Boolean;
   function FindString(S: String; StrList: TStrings): Integer;// Поиск индекса строки
   function FindMarketCode(S: String): Integer;// Поиск кода торгового объекта по имени
   function FindPaymentCode(S: String): Integer;// Поиск кода типа оплаты по названию
   function FindPayment(S: Integer): String; // Поиск названия типа оплаты по коду
   function FindMarket(S: Integer):String ;// Поиск торгового объекта по коду
   function FindVendorCode(S: String): Integer;// Поиск кода поставщика по имени
   function FindVendor(S: Integer): String;// Поиск поставщика по коду
   function FindBuyerCode(S: String): Integer;// Поиск кода покупателя по имени
   function FindBuyer(S: Integer): String;// Поиск покупателя по коду
   function FindUnit(S: Integer): String;// Поиск ед.измерения по коду
   function FindUser(S: Integer): String;// Поиск пользователя по коду
   function FindGroupCode(S: String): Integer;// Поиск кода группы по названию
   function FindAcountCode(S: String): Integer;// Поиск кода учётной группы по названию
   function FindTovarName(S: String): String;// Поиск названия товара по коду
   function GetGroupFltrStr(const SetStr: TStringList): String;
   function GetVendorFltrStr(const SetStr: TStringList): String;
   function GetMarketFltrStr(const SetStr: TStringList): String;
   function GetSYSTempPath: String; // Получение пути для создания временных файлов
   function ChangeWithCat: String; // Подбор по каталогу
   function GetStrParam(Str: String; No_Param: Integer; DelChar: Char = ';'): String; // Получение параметра № No_Param из строки с разделителями ";"
   function RoundEx(X: Double; Precision: Integer = 100): Double; // Нормальное округление
   function GetCompName: String;
   function GetDBGridFieldIndex(CurDBGrid: TDBGrid; CurFieldName: String): Integer;
   function Spr_Vendors_Buyers_Edit(var j: Integer;const i: Integer):String;
   function GetDocTypeName(const i: Integer): String; // Получение названия вида док-та по коду
   function CalcChecked(CheckListBox: TCheckListBox): Integer; // Получение количества выделенных элементов
   function GetFileVersion(AFileName: UnicodeString): UnicodeString;
   function IIFStr(Expr: Boolean; Par1, Par2: string): string; // IIF
   function CheckINN(const INN: string): Boolean;
   function CheckPFCertificate(const PF: string): Boolean;
   function TranslitRus2Lat(const Str: string): string;

// Хранение настроек в базе
// *************************************************************************************** //
   function BaseReadString(const Section, Ident, Default: string;ID_User: Integer = 0): string;
   function BaseReadInteger(const Section, Ident : string; Default: integer;ID_User: Integer = 0): integer;
   function BaseReadFloat(const Section, Ident : string; Default: Double;ID_User: Integer = 0): Double;
   function BaseReadBool(const Section, Ident : String; Default: Boolean;ID_User: Integer = 0): Boolean;
   function BaseReadDateTime(const Section, Ident: String; Default: TDateTime;ID_User: Integer = 0): TDateTime;
   procedure BaseWriteString(const Section, Ident, Value: string;ID_User: Integer = 0);
   procedure BaseWriteInteger(const Section, Ident: string; Value: Integer;ID_User: Integer = 0);
   procedure BaseWriteFloat(const Section, Ident : string; Value: Double;ID_User: Integer = 0);
   procedure BaseWriteBool(const Section, Ident: string; Value: Boolean;ID_User: Integer = 0);
   procedure BaseWriteDateTime(const Section, Ident : String; Value: TDateTime;ID_User: Integer = 0);
// *************************************************************************************** //

   procedure DataSetReOpen(Sender: TDataSet);
   procedure SaveToLog(const Mess, LogFile: String);// Добавление сведений в протокол
   procedure PinpadLog(const Mess: String);
   procedure DelExists(const pFile: String);
   procedure AddUserFunction; // Добавление пользовательских функций в FastReport
   procedure SprFrmFree;
   procedure SetSysFontsCharset(CharSet : Byte = DEFAULT_CHARSET);
   procedure BaseBackUp;// Резервное копирование
   procedure CheckToIntMove(const queue_number, SenderMarketCode, DestMarketCode: Integer); // Передача чека в таблицу перебросок
   procedure ExecSQLStr(SQLStr: String);

   procedure CreateAccessList;
   procedure UpdAccessForUser(CurUserID: Integer);
   function accessAllowed(CurAccName: String; curUserID: Integer): Boolean;

implementation

uses PassEnter, Spr, MoveTovar, Sale, DataSend, NewDoc, About, SmensReports,
     TovarRep, Uchet, Setings, Reval, ActMove, PriceLabelPrint, TovarGroupRep,
     SprVendors, SprMarkets, MoveTovarShow, Zakaz, ExpensesAmount, VerbSumm,
     Clients, AtrChange, SprFilter, ZakazFilter, md5, BackUp, XLStoNakl, IntMove,
     ZakazAuto, ZakazCheck, DelDoc;


{$R *.dfm}

function GetDBGridFieldIndex(CurDBGrid: TDBGrid; CurFieldName: String): Integer;
var i: Integer;
begin
  Result:= -1;
  for i:= 0 to CurDBGrid.Columns.Count - 1 do
    if (CurDBGrid.Columns[i].FieldName = CurFieldName) then
      Result:= CurDBGrid.Columns[i].Index;
end;

function TranslitRus2Lat(const Str: string): string;
//>> Транслитерация кириллицы в латынь
//
//Преобразование строки вида 'Транслитерация' в 'Transliteratsiya' по правилам ГОСТа
//
//*****************************************************
const
  RArrayL = 'абвгдеёжзийклмнопрстуфхцчшщьыъэюя';
  RArrayU = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ';
  colChar = 33;
  arr: array[1..2, 1..ColChar] of string =
  (('a', 'b', 'v', 'g', 'd', 'e', 'e', 'zh', 'z', 'i', 'y',
    'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f',
    'kh', 'c', 'ch', 'sh', 'sh', '''', 'y', '''', 'e', 'yu', 'ya'),
    ('A', 'B', 'V', 'G', 'D', 'E', 'E', 'Zh', 'Z', 'I', 'Y',
    'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F',
    'Kh', 'C', 'Ch', 'Sh', 'Sh', '''', 'Y', '''', 'E', 'Yu', 'Ya'));
{
  arr: array[1..2, 1..ColChar] of string =
  (('a', 'b', 'v', 'g', 'd', 'e', 'yo', 'zh', 'z', 'i', 'y',
    'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f',
    'kh', 'ts', 'ch', 'sh', 'shch', '''', 'y', '''', 'e', 'yu', 'ya'),
    ('A', 'B', 'V', 'G', 'D', 'E', 'Yo', 'Zh', 'Z', 'I', 'Y',
    'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F',
    'Kh', 'Ts', 'Ch', 'Sh', 'Shch', '''', 'Y', '''', 'E', 'Yu', 'Ya'));
}
var
  i: Integer;
  LenS: Integer;
  p: integer;
  d: byte;
begin
  result := '';
  LenS := length(str);
  for i := 1 to lenS do
  begin
    d := 1;
    p := pos(str[i], RArrayL);
    if p = 0 then
    begin
      p := pos(str[i], RArrayU);
      d := 2
    end;
    if p <> 0 then
      result := result + arr[d, p]
    else
      result := result + str[i]; //если не русская буква, то берем исходную
  end;
end;

function CheckPFCertificate(const PF: string): Boolean;
// ===========================================
// Функция вычисляет контрольное число страхового номера ПФ и возвращает True если
// оно введено правильно или False в противном случае
// В качестве параметра передается страховой номер ПФ без разделителй
//
// Проверка контрольного числа Страхового номера проводится только для
// номеров больше  номера 001-001-998.
// Контрольное число Страхового номера рассчитывается следующим образом:
// каждая цифра Страхового номера умножается на номер своей позиции (позиции
// отсчитываются с конца), полученные произведения суммируются, сумма делится
// на 101, последние две цифры остатка от деления являются Контрольным числом.
// ===========================================
var
  sum: Word;
  i: Byte;
begin
  Result := False;
  sum := 0;
  if Length(PF) <> 11 then Exit;

  try
    for i := 1 to 9 do
      sum := sum + StrToInt(PF[i]) * (9 - i + 1);
    sum := sum mod 101;
    Result := StrToInt(Copy(PF, 10, 2)) = sum;
  except
    Result := False;
  end; // try
end;

function CheckINN(const INN: string): Boolean;
// ==================================================================================================
// Функция вычисляет контрольное число ИНН и возвращает True если ИНН
// введен правильно или False в противном случае
// В качестве параметра передается проверяемый ИНН
// Для справки: структура ИНН
//              10-ти разрядный ИНН - NNNNXXXXXC
//              12-ти разрядный ИНН - NNNNXXXXXXCC
//              где: NNNN - номер налоговой инспекции
//                   XXXXX, XXXXXX - порядковый номер налогоплательщика (номер записи в госреестре)
//                   C - контрольное число в 10-ти разрядном ИНН
//                   CC - контрольное число в 12-ти разрядном ИНН
//                        (фактически, идущие подряд две контрольные цифры)
// ==================================================================================================
const
  factor1: array[0..8] of byte = (2, 4, 10, 3, 5, 9, 4, 6, 8);
  factor2: array[0..9] of byte = (7, 2, 4, 10, 3, 5, 9, 4, 6, 8);
  factor3: array[0..10] of byte = (3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8);
var
  i: byte;
  sum: word;
  sum2: word;
begin
  Result := False;

  try
    if Length(INN) = 10 then begin
      sum := 0;
      for i := 0 to 8 do
        sum := sum + StrToInt(INN[i + 1]) * factor1[i];
      sum := sum mod 11;
      sum := sum mod 10;
      Result := StrToInt(INN[10]) = sum;
    end
    else if Length(INN) = 12 then begin
      sum := 0;
      for i := 0 to 9 do
        sum := sum + StrToInt(INN[i + 1]) * factor2[i];
      sum := sum mod 11;
      sum := sum mod 10;
      sum2 := 0;
      for i := 0 to 10 do
        sum2 := sum2 + StrToInt(INN[i + 1]) * factor3[i];
      sum2 := sum2 mod 11;
      sum2 := sum2 mod 10;
      Result := (StrToInt(INN[11]) = sum) and
        (StrToInt(INN[12]) = sum2);
    end; //
  except
    Result := False;
  end; // try
end;

function IIFStr(Expr: Boolean; Par1, Par2: string): string;
begin
  if Expr then
    Result := Par1
  else
    Result := Par2;
end;

procedure ExecSQLStr(SQLStr: String);
begin
  with ShopMainForm.ExecSQLQuery do
  begin
    SQL.Clear;
    SQL.Add(SQLStr);
    ExecQuery;
  end;
end;

function accessAllowed(CurAccName: String; curUserID: Integer): Boolean;
var i: Integer;
begin
  Result:= False;
  if curUserID = User_ID then // Текущий пользователь
    for i := 0 to Length(MyListAccess) - 1 do
    begin
      if MyListAccess[i].AccName = CurAccName then
        Result:= MyListAccess[i].CurUserAccess;
    end
  else
  begin
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select * from USER_SETINGS where AUTOR_KOD = -1'
        + 'and SECTION = ''ACCESS'' and KEY_NAME = ''' + CurAccName + '''');
      Open;
      Result:= (not VarIsNull(ShopMainForm.pFIBService['KEY_VALUE']) and
         (Pos(','+curUserID.ToString+',', ShopMainForm.pFIBService['KEY_VALUE']) > 0));
      Close;
    end;
  end;
end;

procedure UpdAccessForUser(CurUserID: Integer);
var i: Integer;
begin
  with ShopMainForm.pFIBService do
  begin
    SelectSQL.Clear;
    SelectSQL.Add('select * from USER_SETINGS where AUTOR_KOD = -1'
      + 'and SECTION = ''ACCESS''');
    Open;
    for i := 0 to Length(MyListAccess) - 1 do
    begin
      if ShopMainForm.pFIBService.Locate('KEY_NAME', MyListAccess[i].AccName, []) then
        MyListAccess[i].CurUserAccess:= Pos(','+User_ID.ToString+',', ShopMainForm.pFIBService['KEY_VALUE']) > 0
      else MyListAccess[i].CurUserAccess:= False;
    end;
    Close;
  end;
end;

procedure CreateAccessList;
var i: Integer;
begin
        SetLength(MyListAccess, 24);
        i:= 0;
        MyListAccess[i].AccName:= 'SprTovar';
        MyListAccess[i].DisplayName:= 'Справочник товаров';
        Inc(i);
        MyListAccess[i].AccName:= 'SprVendors';
        MyListAccess[i].DisplayName:= 'Справочник поставщиков';
        Inc(i);
        MyListAccess[i].AccName:= 'SprBuyers';
        MyListAccess[i].DisplayName:= 'Справочник покупателей';
        Inc(i);
        MyListAccess[i].AccName:= 'SprMarket';
        MyListAccess[i].DisplayName:= 'Справочник торговых объектов';
        Inc(i);
        MyListAccess[i].AccName:= 'SprCard';
        MyListAccess[i].DisplayName:= 'Справочник дисконтных карт';
        Inc(i);
        MyListAccess[i].AccName:= 'SprCardAuto';
        MyListAccess[i].DisplayName:= 'Справочник дисконтных карт автодобавление';
        Inc(i);
        MyListAccess[i].AccName:= 'OperSale';
        MyListAccess[i].DisplayName:= 'Торговля';
        Inc(i);
        MyListAccess[i].AccName:= 'OperEditPrice';
        MyListAccess[i].DisplayName:= 'Изменение цены';
        Inc(i);
        MyListAccess[i].AccName:= 'OperNakl';
        MyListAccess[i].DisplayName:= 'Накладные';
        Inc(i);
        MyListAccess[i].AccName:= 'OperNaklDel';
        MyListAccess[i].DisplayName:= 'Накладные удаление';
        Inc(i);
        MyListAccess[i].AccName:= 'NaklDelView';
        MyListAccess[i].DisplayName:= 'Накладные удаленные прсмотр';
        Inc(i);
        MyListAccess[i].AccName:= 'OperZakaz';
        MyListAccess[i].DisplayName:= 'Заказ';
        Inc(i);
        MyListAccess[i].AccName:= 'OperMove';
        MyListAccess[i].DisplayName:= 'Перемещение';
        Inc(i);
        MyListAccess[i].AccName:= 'OperExpenses';
        MyListAccess[i].DisplayName:= 'Расходы';
        Inc(i);
        MyListAccess[i].AccName:= 'OperExpensesEdit';
        MyListAccess[i].DisplayName:= 'Расходы редактирование';
        Inc(i);
        MyListAccess[i].AccName:= 'OperUchet';
        MyListAccess[i].DisplayName:= 'Учет';
        Inc(i);
        MyListAccess[i].AccName:= 'AdmDatasend';
        MyListAccess[i].DisplayName:= 'Обмен';
        Inc(i);
        MyListAccess[i].AccName:= 'AdmSettings';
        MyListAccess[i].DisplayName:= 'Установки';
        Inc(i);
        MyListAccess[i].AccName:= 'AdmTools';
        MyListAccess[i].DisplayName:= 'Инструменты';
        Inc(i);
        MyListAccess[i].AccName:= 'RepActMove';
        MyListAccess[i].DisplayName:= 'Движение по актам';
        Inc(i);
        MyListAccess[i].AccName:= 'RepViewSave';
        MyListAccess[i].DisplayName:= 'Просмотр сохраненных';
        Inc(i);
        MyListAccess[i].AccName:= 'RepEditTemplate';
        MyListAccess[i].DisplayName:= 'Редактирование шаблонов';
        Inc(i);
        MyListAccess[i].AccName:= 'OperDebit';
        MyListAccess[i].DisplayName:= 'Списание';
        Inc(i);
        MyListAccess[i].AccName:= 'OperDebitDel';
        MyListAccess[i].DisplayName:= 'Списание удаление';
        Inc(i);
//        MyListAccess[].AccName:= '';
//        MyListAccess[].DisplayName:= '';

end;

procedure CheckToIntMove(const queue_number, SenderMarketCode, DestMarketCode: Integer);
begin
  with ShopMainForm.pFIBService do
  begin
    SelectSQL.Clear;
    SelectSQL.Add('select q.item, q.kolvo from queue q');
    SelectSQL.Add('where q.queue_number = ' + queue_number.ToString);
    Open;
    ShopMainForm.ServiceQuery.SQL.Clear;
    ShopMainForm.ServiceQuery.SQL.Add('select kolvo from INT_MOVE where ITEM = :cur_item and SENDER_MARKET_CODE = '
      + SenderMarketCode.ToString + ' and DEST_MARKET_CODE = ' + DestMarketCode.ToString);// + 'into :cur_kolvo');
    ShopMainForm.ServiceQuery.Prepare;
    while not Eof do
    begin
      ShopMainForm.ServiceQuery.ParamByName('cur_item').AsString:= ShopMainForm.pFIBService['ITEM'];
      ShopMainForm.ServiceQuery.ExecQuery;
      if (ShopMainForm.ServiceQuery.FieldByName('KOLVO').AsFloat > 0) then
        ExecSQLStr('update INT_MOVE set KOLVO = KOLVO + '
          + StringReplace(FloatToStr(ShopMainForm.pFIBService['KOLVO']), ',', '.', [])
          + ' where ITEM = ''' + ShopMainForm.pFIBService['ITEM']
          + ''' and SENDER_MARKET_CODE = '
          + SenderMarketCode.ToString + ' and DEST_MARKET_CODE = ' + DestMarketCode.ToString)
       else
        ExecSQLStr('insert into INT_MOVE(ITEM,  KOLVO, SENDER_MARKET_CODE, DEST_MARKET_CODE)'
          + 'values(''' + ShopMainForm.pFIBService['ITEM'] + ''', ' + StringReplace(FloatToStr(ShopMainForm.pFIBService['KOLVO']), ',', '.', [])
          + ', ' + SenderMarketCode.ToString + ', ' + DestMarketCode.ToString + ')');
      Next;
    end;
    Close;
    ShopMainForm.ServiceQuery.Close;
    ShopMainForm.pFIBDatabase1.CommitRetaining;
  end;
end;

function GetFileVersion(AFileName: UnicodeString): UnicodeString;
var  VerBlk          : VS_FIXEDFILEINFO;
     InfoSize, puLen : DWord;
     Pt, InfoPtr     : Pointer;
begin
  InfoSize:= GetFileVersionInfoSize(PChar(AFilename), puLen);
  FillChar(VerBlk, SizeOf(VS_FIXEDFILEINFO),0);
  if InfoSize > 0 then
  begin
    GetMem(Pt, InfoSize);
    GetFileVersionInfo(PChar(AFilename), 0, InfoSize, Pt);
    VerQueryValue(Pt, '\', InfoPtr, puLen);
    Move(InfoPtr^, VerBlk, SizeOf(VS_FIXEDFILEINFO));

    Result := Format('%d.%d.%d',[VerBlk.dwFileVersionMS shr 16,
                                    VerBlk.dwFileVersionMS and 65535,
                                    VerBlk.dwFileVersionLS shr 16]);
{      Result := Format('%d.%d.%d.%d',[VerBlk.dwFileVersionMS shr 16,
                                      VerBlk.dwFileVersionMS and 65535,
                                      VerBlk.dwFileVersionLS shr 16,
                                      VerBlk.dwFileVersionLS and 65535]);  }
    FreeMem(Pt);
  end
  else Result := '';
end;

function CalcChecked(CheckListBox: TCheckListBox): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to CheckListBox.Count - 1 do
    if CheckListBox.Checked[i] then Inc(Result);
end;

procedure SetSysFontsCharset(CharSet : Byte = DEFAULT_CHARSET);
var
  NonClientMetrics: TNonClientMetrics;
begin
  NonClientMetrics.cbSize := sizeof(NonClientMetrics);
  if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0) then
  begin
    NonClientMetrics.lfSmCaptionFont.lfCharSet:= CharSet;
    NonClientMetrics.lfCaptionFont.lfCharSet:= Charset;
    NonClientMetrics.lfMenuFont.lfCharSet:= Charset;
    NonClientMetrics.lfStatusFont.lfCharSet:= Charset;
    NonClientMetrics.lfMessageFont.lfCharSet:= Charset;
    SystemParametersInfo(SPI_SETNONCLIENTMETRICS, 0, @NonClientMetrics, 0)
  end;
end;

function GetCompName: String;
  var
    i: DWORD;
    p: PChar;
begin
  i:=255;
  GetMem(p, i);
  GetComputerName(p, i);
  Result:=String(p);
  FreeMem(p);
end;

function BaseReadString(const Section, Ident, Default: String;ID_User: Integer = 0): String;
begin
  if ID_User = 0 then ID_User:= User_ID;
  with ShopMainForm.pFIBSysService do
  begin
    SelectSQL.Clear;
    SelectSQL.Add('select KEY_VALUE from USER_SETINGS U');
    SelectSQL.Add('where U.AUTOR_KOD = ' + IntToStr(ID_User));
    SelectSQL.Add('and U.SECTION = ''' + Section + '''');
    SelectSQL.Add('and U.KEY_NAME = ''' + Ident + '''');
    Open;
    if VarIsNull(ShopMainForm.pFIBSysService['KEY_VALUE']) then Result:= Default
    else Result:= ShopMainForm.pFIBSysService['KEY_VALUE'];
    Close;
  end;
end;

function BaseReadInteger(const Section, Ident : String; Default: Integer; ID_User: Integer = 0): Integer;
begin
  Result:= StrToInt(BaseReadString(Section, Ident, IntToStr(Default), ID_User));
end;

function BaseReadDateTime(const Section, Ident: String; Default: TDateTime; ID_User: Integer = 0): TDateTime;
begin
  Result:= StrToDateTime(BaseReadString(Section, Ident, DateTimeToStr(Default), ID_User));
end;

function BaseReadBool(const Section, Ident : String; Default: Boolean; ID_User: Integer = 0): Boolean;
var Str_Default: String;
begin
  if Default then Str_Default:= '1'
  else Str_Default:= '0';
  Str_Default:= BaseReadString(Section, Ident, Str_Default, ID_User);
  Result:= Str_Default = '1';
end;

function BaseReadFloat(const Section, Ident : string; Default: Double; ID_User: Integer = 0): Double;
begin
  Result:= StrToFloat(BaseReadString(Section, Ident, FloatToStr(Default), ID_User));
end;

procedure BaseWriteInteger(const Section, Ident: string; Value: Integer; ID_User: Integer = 0);
begin
  BaseWriteString(Section, Ident, IntToStr(Value), ID_User);
end;

procedure BaseWriteBool(const Section, Ident: string; Value: Boolean; ID_User: Integer = 0);
var Str_Value: String;
begin
  if Value then Str_Value:= '1'
  else Str_Value:= '0';
  BaseWriteString(Section, Ident, Str_Value, ID_User);
end;

procedure BaseWriteFloat(const Section, Ident : String; Value: Double; ID_User: Integer = 0);
begin
  BaseWriteString(Section, Ident, FloatToStr(Value), ID_User);
end;

procedure BaseWriteDateTime(const Section, Ident : String; Value: TDateTime; ID_User: Integer = 0);
begin
  BaseWriteString(Section, Ident, DateTimeToStr(Value), ID_User);
end;

procedure BaseWriteString(const Section, Ident, Value: String; ID_User: Integer = 0);
begin
  if ID_User = 0 then ID_User:= User_ID;
  ShopMainForm.pFIBDatabase1.Execute('update or insert into USER_SETINGS(AUTOR_KOD,'
    + ' SECTION, KEY_NAME, KEY_VALUE)values(' + IntToStr(ID_User)
    + ' , ''' + Section + ''', ''' + Ident + ''', ''' + Value + ''')'
    +' matching(AUTOR_KOD, SECTION, KEY_NAME)')
end;

// Нормальное округление
function RoundEx(X: Double; Precision: Integer = 100): Double;
{Precision : 1 - до целых, 10 - до десятых, 100 - до сотых ...}
var ScaledFractPart, Temp: Double;
begin
  ScaledFractPart:= Frac(X) * Precision;
  Temp:= Frac(ScaledFractPart);
  ScaledFractPart:= Int(ScaledFractPart);
  if Temp >= 0.5 then
    ScaledFractPart:= ScaledFractPart + 1;
  if Temp <= -0.5 then
    ScaledFractPart:= ScaledFractPart - 1;
  RoundEx:= Int(X) + ScaledFractPart / Precision;
end;

function GetDocTypeName(const i: Integer): String; // Получение названия вида док-та по коду
begin
{Тип документа : 1 - Приходная накладная, 2 - Расходная накладная, 3- Переброска расход,
4 - Пересортица, 5 - Списание недостачи, 6 - Оприходование, 7 - Переброска приход,
8 - Возврат поставщику, 9 - Списание, 10 - возврат от покупателя, 11 - Продажа, 12 - Резерв}
  case i of
   1: Result:= 'Приходная накладная';
   2: Result:= 'Расходная накладная';
   3: Result:= 'Переброска расход';
   4: Result:= 'Пересортица';
   5: Result:= 'Списание недостачи';
   6: Result:= 'Оприходование';
   7: Result:= 'Переброска приход';
   8: Result:= 'Возврат поставщику';
   9: Result:= 'Списание';
  10: Result:= 'Возврат от покупателя';
  11: Result:= 'Продажа';
  12: Result:= 'Резерв';
  end;
//  Result:= Result + '(' + IntToStr(i) + ')';
end;


function GetSYSTempPath: String;
begin
  Result:= TPath.GetTempPath;
end;

function GetGroupFltrStr(const SetStr: TStringList): String;
var i: Integer;
begin
  with ShopMainForm.pFIBService do
  begin
    SelectSQL.Clear;
    SelectSQL.Add('select T_GROUP, GROUP_NAME from SPR_GROUP');
    Open;
    Result:= '';
    for i:= 0 to SetStr.Count - 1 do
    begin
      Locate('GROUP_NAME', SetStr[i], []);
      if not VarIsNull(ShopMainForm.pFIBService['T_GROUP'])then
      begin
        if Result <> '' then Result:= Result + ',';
        Result:= Result + IntToStr(ShopMainForm.pFIBService['T_GROUP']);
      end;
    end;
    Close;
  end;
end;

function GetVendorFltrStr(const SetStr: TStringList): String;
var i: Integer;
begin
          with ShopMainForm.pFIBService do
          begin
            SelectSQL.Clear;
            SelectSQL.Add('select VENDOR_CODE, VENDOR_NAME from SPR_VENDORS');
            Open;
            Result:= '';
            for i:= 0 to SetStr.Count - 1 do
            begin
              Locate('VENDOR_NAME', SetStr[i], []);
              if not VarIsNull(ShopMainForm.pFIBService['VENDOR_CODE'])then
              begin
                if Result <> '' then Result:= Result + ',';
                Result:= Result + IntToStr(ShopMainForm.pFIBService['VENDOR_CODE']);
              end;
            end;
            Close;
          end;
end;

function GetMarketFltrStr(const SetStr: TStringList): String;
var i: Integer;
begin
          with ShopMainForm.pFIBService do
          begin
            SelectSQL.Clear;
            SelectSQL.Add('select SHORT_NAME, MARKET_CODE from SPR_MARKET');
            Open;
            Result:= '';
            for i:= 0 to SetStr.Count - 1 do
            begin
              Locate('SHORT_NAME', SetStr[i], []);
              if not VarIsNull(ShopMainForm.pFIBService['MARKET_CODE'])then
              begin
                if Result <> '' then Result:= Result + ',';
                Result:= Result + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']);
              end;
            end;
            Close;
          end;
end;

function WinErase(Owner: Integer;  WichFiles: String;  SendToRecycleBin, Confirm: Boolean): Boolean;
const Aborted: Boolean = False;
var   Struct : TSHFileOpStructA;
begin
        while pos(';',WichFiles) > 0 do WichFiles[pos(';',WichFiles)]:= #0;
          WichFiles:= WichFiles + #0#0;
        with Struct do
        begin
          wnd:= Owner;
          wFunc:= FO_Delete;
          pFrom:= PAnsiChar(WichFiles);
          pTo:= nil;
          if not Confirm then fFlags:= FOF_NOCONFIRMATION;
          if SendToRecycleBin then fFLags:= fFlags or FOF_ALLOWUNDO or FOF_FILESONLY
          else fFlags:= fFlags or 0 or FOF_FILESONLY;
          fAnyOperationsAborted:= Aborted;
          hNameMappings:= nil;
          lpszProgressTitle:= nil;
        end;
        result:= (SHFileOperationA(Struct)=0) and (not Aborted);
end;

procedure DelDir(DirName: string);
var SearchRec: TSearchRec;
       GotOne: integer;
begin
        GotOne:= FindFirst(DirName + '\*.*', faAnyFile, SearchRec);
        while GotOne = 0 do
        begin
          if ((SearchRec.Attr and faDirectory) = 0) then
            DeleteFile(DirName + '\' + SearchRec.Name)
          else if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
          DelDir(DirName + '\' + SearchRec.Name);
          GotOne:= FindNext(SearchRec);
        end;
        FindClose(SearchRec);
end;

procedure BaseBackUp;// Резервное копирование
begin
  Application.CreateForm(TBackUpForm, BackUpForm);
  BackUpForm.ShowModal;
  BackUpForm.Free;
end;

procedure TShopMainForm.DelDocViewMenuItemClick(Sender: TObject);
begin
  Application.CreateForm(TDelDocFrm, DelDocFrm);
  DelDocFrm.ShowModal;
  DelDocFrm.Free;
end;

procedure TShopMainForm.DevicesStart;
begin  { Инициализация внешних устройств }
        if ShopIni.ReadBool('Devices', 'Device1', False) then
 {       begin
         // Установка номера СОМ-порта
          case ShopIni.ReadInteger('Devices', 'Device1Port', 1) of
            1: CommDevice1.CommPort:= Com1;
            2: CommDevice1.CommPort:= Com2;
            3: CommDevice1.CommPort:= Com3;
            4: CommDevice1.CommPort:= Com4;
          end;
          // Установка скорости СОМ-порта
          case ShopIni.ReadInteger('Devices', 'Device1BoudRate', 9600) of
            110: CommDevice1.BaudRate:= ____110;
            300: CommDevice1.BaudRate:= ____300;
            600: CommDevice1.BaudRate:= ____600;
           1200: CommDevice1.BaudRate:= ___1200;
           2400: CommDevice1.BaudRate:= ___2400;
           4800: CommDevice1.BaudRate:= ___4800;
           9600: CommDevice1.BaudRate:= ___9600;
          14400: CommDevice1.BaudRate:= __14400;
          19200: CommDevice1.BaudRate:= __19200;
          38400: CommDevice1.BaudRate:= __38400;
          56000: CommDevice1.BaudRate:= __56000;
         128000: CommDevice1.BaudRate:= _128000;
         256000: CommDevice1.BaudRate:= _256000;
          end;
          // Установка бит данных
          case ShopIni.ReadInteger('Devices', 'Device1DataBits', 8) of
            4: CommDevice1.DataBits:= _4;
            5: CommDevice1.DataBits:= _5;
            6: CommDevice1.DataBits:= _6;
            7: CommDevice1.DataBits:= _7;
            8: CommDevice1.DataBits:= _8;
          end;
          // Установка стоповых битов
          case ShopIni.ReadInteger('Devices', 'Device1StopBits', 1) of
            1: CommDevice1.StopBits:= _1;
            15: CommDevice1.StopBits:= _1_5;
            2: CommDevice1.StopBits:= _2;
          end;
          // Установка чётности
          case ShopIni.ReadInteger('Devices', 'Device1Parity', 2) of
            0: CommDevice1.Parity:= Even;
            1: CommDevice1.Parity:= Mark;
            2: CommDevice1.Parity:= None;
            3: CommDevice1.Parity:= Odd;
            4: CommDevice1.Parity:= Space;
          end;
          CommDevice1.StartComm;
        end;}
end;

function GetStrParam(Str: String; No_Param: Integer; DelChar: Char = ';'): String;
var TmpStr: String;
    i,j,a: Integer;
begin // Получение параметра № No_Param из строки с разделителями ";"
   TmpStr:= Str;
   j:= 0;
   a:= 0;
   for i:= 0 to No_Param do
   begin
     a:= j + 1;
     j:= Pos(DelChar, TmpStr);
     if j > 0 then TmpStr[j]:= ' ';
   end;
   if j = 0 then Result:= ''
   else Result:= Copy(TmpStr, a, j - a);
end;

function CheckFindString(Key: Char): Boolean;
begin
   if GetTickCount - FLastTime >= 1000 then
   begin
     FString:= '';
     FLastTime:= GetTickCount;
   end;
   if Key in ['0'..'9','A'..'Z','a'..'z','А'..'я'] then FString:= FString + Key;
   Result:= FString <> '';
end;

procedure DelExists(const pFile: String);
var  F: file;
begin
     if FileExists(pFile) then
     begin
       AssignFile(F,pFile);
      try
        Reset(F);
      finally
        CloseFile(F);
        Erase(F);
      end;
     end;
end;

function FindString(S: string; StrList: TStrings): Integer;
begin// Поиск индекса строки
        for Result:= 0 to StrList.Count - 1 do
          if StrList[Result] = S then Exit;
        Result:= -1;
end;

function FindMarketCode(S: String): Integer;
begin // Поиск кода торгового объекта по имени
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select MARKET_CODE from SPR_MARKET where SHORT_NAME = ''' + S + '''');
       Open;
       if VarIsNull(ShopMainForm.pFIBService['MARKET_CODE'])then Result:= -1
       else Result:= ShopMainForm.pFIBService['MARKET_CODE'];
       Close;
     end;
end;

function FindPaymentCode(S: String): Integer;
begin // Поиск кода типа оплаты по названию
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select PAYMENT_TYPE from SPR_PAYMENT_TYPE where PAYMENT_NAME = ''' + S + '''');
       Open;
       if VarIsNull(ShopMainForm.pFIBService['PAYMENT_TYPE'])then Result:= -1
       else Result:= ShopMainForm.pFIBService['PAYMENT_TYPE'];
       Close;
     end;
end;

function FindPayment(S: Integer): String;
begin // Поиск названия типа оплаты по коду
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select PAYMENT_NAME from SPR_PAYMENT_TYPE where PAYMENT_TYPE = ' + IntToStr(S));
       Open;
       if VarIsNull(ShopMainForm.pFIBService['PAYMENT_NAME'])then Result:= 'Не найден'
       else Result:= ShopMainForm.pFIBService['PAYMENT_NAME'];
       Close;
     end;
end;

function FindMarket(S: Integer): String;
begin // Поиск торгового объекта по коду
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select SHORT_NAME from SPR_MARKET where MARKET_CODE = ' + IntToStr(S));
       Open;
       if VarIsNull(ShopMainForm.pFIBService['SHORT_NAME'])then Result:= 'Не найден'
       else Result:= ShopMainForm.pFIBService['SHORT_NAME'];
       Close;
     end;
end;

function FindVendorCode(S: String): Integer;
begin // Поиск кода поставщика по имени
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select VENDOR_CODE from SPR_VENDORS where VENDOR_NAME = ''' + S + '''');
       Open;
       if VarIsNull(ShopMainForm.pFIBService['VENDOR_CODE'])then Result:= -1
       else Result:= ShopMainForm.pFIBService['VENDOR_CODE'];
       Close;
     end;
end;

function FindVendor(S: Integer): String;
begin // Поиск поставщика по коду
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select VENDOR_NAME from SPR_VENDORS where VENDOR_CODE = ' + IntToStr(S));
       Open;
       if VarIsNull(ShopMainForm.pFIBService['VENDOR_NAME'])then Result:= 'Не найден'
       else Result:= ShopMainForm.pFIBService['VENDOR_NAME'];
       Close;
     end;
end;

function FindGroupCode(S: String): Integer;
begin // Поиск кода группы по названию
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select T_GROUP from SPR_GROUP where GROUP_NAME = ''' + S + '''');
       Open;
       if VarIsNull(ShopMainForm.pFIBService['T_GROUP'])then Result:= -1
       else Result:= ShopMainForm.pFIBService['T_GROUP'];
       Close;
     end;
end;

function FindAcountCode(S: String): Integer;
begin // Поиск кода учётной группы по названию
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select KOD_ACOUNT from SPR_ACOUNT where ACOUNT_NAME = ''' + S + '''');
       Open;
       if VarIsNull(ShopMainForm.pFIBService['KOD_ACOUNT'])then Result:= -1
       else Result:= ShopMainForm.pFIBService['KOD_ACOUNT'];
       Close;
     end;
end;

function FindTovarName(S: String): String;
begin // Поиск названия товара по коду
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select TOVAR_NAME from SPR_TOVAR where ITEM = ''' + S + '''');
       Open;
       if VarIsNull(ShopMainForm.pFIBService['TOVAR_NAME'])then Result:= 'Не найден'
       else Result:= ShopMainForm.pFIBService['TOVAR_NAME'];
       Close;
     end;
end;

function FindBuyerCode(S: String): Integer;
begin // Поиск кода покупателя по имени
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select BUYER_CODE from SPR_BUYERS where BUYER_NAME = ''' + S + '''');
       Open;
       if VarIsNull(ShopMainForm.pFIBService['BUYER_CODE'])then Result:= -1
       else Result:= ShopMainForm.pFIBService['BUYER_CODE'];
       Close;
     end;
end;

function FindBuyer(S: Integer): String;
begin // Поиск покупателя по коду
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select BUYER_NAME from SPR_BUYERS where BUYER_CODE = ' + IntToStr(S));
       Open;
       if VarIsNull(ShopMainForm.pFIBService['BUYER_NAME'])then Result:= 'Не найден'
       else Result:= ShopMainForm.pFIBService['BUYER_NAME'];
       Close;
     end;
end;

function FindUnit(S: Integer): String;
begin // Поиск ед.измерения по коду
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select UNIT_NAME from SPR_UNITS where UNIT_KOD = ' + IntToStr(S));
       Open;
       if VarIsNull(ShopMainForm.pFIBService['UNIT_NAME'])then Result:= 'Не найден'
       else Result:= ShopMainForm.pFIBService['UNIT_NAME'];
       Close;
     end;
end;

function FindUser(S: Integer): String;
begin // Поиск пользователя по коду
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select NAME from SPR_USERS where AUTOR_KOD = ' + IntToStr(S));
       Open;
       if VarIsNull(ShopMainForm.pFIBService['NAME'])then Result:= 'Не найден'
       else Result:= ShopMainForm.pFIBService['NAME'];
       Close;
     end;
end;

procedure DataSetReOpen(Sender: TDataSet);
begin
      with Sender do
      begin
        DisableControls;
        Close;
        Open;
        EnableControls;
      end;
end;

procedure TShopMainForm.HintShow(Sender: TObject);
begin
      StatusBar1.Panels[1].Text:= Application.Hint;
end;

procedure TShopMainForm.N26Click(Sender: TObject);
begin
        Application.CreateForm(TIntMoveForm, IntMoveForm);
        IntMoveForm.TabSheet1.TabVisible:= False;
        IntMoveForm.TabSheet4.Visible:= False;
        IntMoveForm.TabSheet4.TabVisible:= False;
        IntMoveForm.PageControl1.ActivePage:= IntMoveForm.TabSheet1;
        IntMoveForm.ShowModal;
        IntMoveForm.Free;
end;

procedure TShopMainForm.N36Click(Sender: TObject);
var LS: TStringList;
    i: Integer;
    FTPFile: String;
begin
  if MessageDlg('Обновить программу ?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
  begin
      with ShopMainForm.IdFTP1 do
      begin
        Connect;
        try
         ChangeDir('/files/Shop');
         ShopMainForm.IdFTP1.TransferType:= ftBinary;
//         if (not FileExists(ExtractFilePath(ParamStr(0))+'Update.bat')) then
         ShopMainForm.idFTP1.Get('Update.bat', ExtractFilePath(ParamStr(0))+'Update.bat', True);
         ShopMainForm.idFTP1.Get('Shop.exe', ExtractFilePath(ParamStr(0))+'Shop_tmp.exe', True);
        finally
         Disconnect;
        end;
      end;
      Application.Terminate;
      ShellExecute(Handle,'open', PWideChar(ExtractFilePath(ParamStr(0))+'Update.bat'), PWideChar(ExtractFileName(ParamStr(0))), nil, SW_HIDE);
  end;
end;

procedure TShopMainForm.CheckFTPMenuItemClick(Sender: TObject);
begin
    Timer1.Enabled:= CheckFTPMenuItem.Checked;
    FTPLastCheck:= Now;
end;

procedure TShopMainForm.OpenYandexDisk1Click(Sender: TObject);
begin
   ShellExecute(Handle,'open',PChar(ShopIni.ReadString('Main', 'UpdateUrl', 'https://disk.yandex.ru/d/Ze6vh7qucPufzQ')),nil,nil,SW_SHOWNORMAL);
end;

procedure TShopMainForm.OtherMenuClick(Sender: TObject);
begin
  with ShopMainForm.frxReport1 do
  begin
    LoadFromFile(ReportsPath + 'Other\' + (Sender as TMenuItem).Caption + '.fr3');
    ShowReport;
  end;
end;

procedure TShopMainForm.Timer1Timer(Sender: TObject);
var LS: TStringList;
    i: Integer;
    NewFileOnFTP: Boolean;
begin
   with ShopMainForm.IdFTP1 do
   begin
     Application.ProcessMessages;
     TransferType:= ftASCII;
     NewFileOnFTP:= False;
     LS:= TStringList.Create;
     Connect;
     try
      ChangeDir(FTPSendDir);
      if (CurrentMarketType <> 0) then ShopMainForm.IdFTP1.List(LS, 'A_*.zip', True)
      else ShopMainForm.IdFTP1.List(LS, 'r_*.zip', True);

      for i:= 0 to ShopMainForm.IdFTP1.DirectoryListing.Count-1 do
       if ShopMainForm.IdFTP1.DirectoryListing.Items[i].ModifiedDate > FTPLastCheck then
         NewFileOnFTP:= True;

     finally
      Disconnect;
      LS.Free;
      if NewFileOnFTP then
      begin
        TrayIcon1.Visible:= True;
        TrayIcon1.ShowBalloonHint;
        Timer1.Enabled:= False;
      end;
     end;
   end;
   FTPLastCheck:= Now;
end;

procedure TShopMainForm.TrayIcon1BalloonClick(Sender: TObject);
begin
       TrayIcon1.Visible:= False;
       Timer1.Enabled:= CheckFTPMenuItem.Checked;
end;

procedure TShopMainForm.FormCreate(Sender: TObject);
var NewItem: TMenuItem;
    sr: TSearchRec;
begin
{$IF CompilerVersion >= 23}
{$IF DECLARED(System.Variants.DispatchUnsignedAsSigned)}
  System.Variants.DispatchUnsignedAsSigned := True;
{$IFEND}
{$IFEND}
        Application.OnException:= AppException;
        Application.OnHint:= HintShow;

        SetSysFontsCharset(RUSSIAN_CHARSET);

        Application.UpdateFormatSettings:= False;
        Application.UpdateMetricSettings:= False;
        TmpSep:= ','; //DecimalSeparator;
        CreateAccessList; // Создаем список доступных команд

        ShopMainForm.Top:= 0;
        ShopMainForm.Left:= 0;
        ShopMainForm.ClientHeight:= ToolBar1.Height + StatusBar1.Height;
        ShopMainForm.Width:= Screen.Width;
        User_ID:= -1;
        User_Role:= -1;
        User_KKM_Pass:= -1;
        SendKeyFrm:= True;
        CurNakl:= 0;
        AddUserFunction; // Добавление пользовательских функций в FastReport
        ShopIni:= TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Shop.ini');
        ReportsPath:= ShopIni.ReadString('Main', 'ReportsPath', ExtractFilePath(ParamStr(0)) + 'Reports\');
        frxDesigner1.OpenDir:= ReportsPath;
        FTPUsername:= ShopIni.ReadString('Transmit', 'FTP_UserName', 'tehkom-ftp');
        FTPPassword:= ShopIni.ReadString('Transmit', 'FTP_Password', 'loh2ooCaepaidojo');
        FTPHost:= ShopIni.ReadString('Transmit', 'FTP_Host', '77.221.147.70');
        FTPSendDir:= ShopIni.ReadString('Transmit', 'FTP_SendDir', '/files/Send');
        ShopMainForm.IdFTP1.Username:= FTPUsername;
        ShopMainForm.IdFTP1.Password:= FTPPassword;
        ShopMainForm.IdFTP1.Host:= FTPHost;
        ShopMainForm.IdFTP1.Passive:= True;
        ShopMainForm.IdFTP1.DefStringEncoding:= enUTF8;
        Timer1.Interval:= ShopIni.ReadInteger('Transmit', 'FTPIntervalCheck', 900000); // Интервал проверки FTP
        CheckFTPMenuItem.Visible:= ShopIni.ReadBool('Transmit', 'FTPEnable', False);

        if CheckFTPMenuItem.Visible then
          if ShopIni.ReadBool('Transmit', 'CheckFTP', False) then
          begin
            CheckFTPMenuItem.Checked:= True;
            Timer1.Enabled:= True;
            FTPLastCheck:= Now;
          end
          else CheckFTPMenuItem.Checked:= False;



        ActionAvtoCatalog.Visible:= ShopIni.ReadInteger('Main', 'Autocatalog', 0) > 0;

        pFIBDatabase1.Connected:= False;
        pFIBDatabase1.DBName:= ShopIni.ReadString('Main', 'BasePath', ExtractFilePath(ParamStr(0)) + 'Shop.fdb');
        if TFile.Exists(ExtractFilePath(ParamStr(0)) + 'fbclient.dll') then
          pFIBDatabase1.LibraryName:=  ExtractFilePath(ParamStr(0)) + 'fbclient.dll'
        else
          pFIBDatabase1.LibraryName:=  'gds32.dll';
        pFIBDatabase1.Connected:= True;
        FIBSQLLogger1.LogFileName:= ExtractFilePath(ParamStr(0)) + 'Shop.sql';
        if ShopIni.ReadBool('Main', 'SQLLogDel', True) then DelExists(FIBSQLLogger1.LogFileName);
        FIBSQLLogger1.ActiveLogging:= ShopIni.ReadBool('Main', 'SQLLog', False);

        if FindFirst(ReportsPath + 'OTHER\*.fr3', faAnyFile, sr) = 0 then
        begin
          repeat
            if (sr.Attr and fadirectory) <> sr.Attr then
            begin
              NewItem:= TMenuItem.Create(MainMenu1);
              N22.Insert(0, NewItem);
              NewItem.Caption:= Copy(sr.Name, 1, Length(sr.Name) - 4);
              NewItem.OnClick:= OtherMenuClick;
            end;
          until FindNext(sr) <> 0;
          FindClose(sr);
        end;

        NDC:= ShopIni.ReadInteger('Main', 'NDC', 18);
        with pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select I.*, M.MARKET_TYPE, M.SHORT_NAME');
          SelectSQL.Add('from INF_CURRENT_OBJ I left join SPR_MARKET M on I.OBJ_ID = M.MARKET_CODE');
          Open;
          CurrentMarketCode:= pFIBService['OBJ_ID'];
          CurrentMarketType:= pFIBService['MARKET_TYPE'];
          ShopMainForm.Caption:= pFIBService['SHORT_NAME'];
          OrgName:= pFIBService['ORG_NAME'];
          LongOrgName:= pFIBService['LONG_ORG_NAME'];
          Phone:= pFIBService['PHONE'];
          INN:= pFIBService['INN'];
          OKOHX:= pFIBService['OKOHX'];
          OKPO:= pFIBService['OKPO'];
          ADRES:= pFIBService['ADRES'];
          BANK:= pFIBService['BANK'];
          RSCHET:= pFIBService['RSCHET'];
          KSCHET:= pFIBService['KSCHET'];
          KPP:= pFIBService['KPP'];
          BIK:= pFIBService['BIK'];
          BOSS:= pFIBService['BOSS'];
          BUH:= pFIBService['BUH'];
          Close;
        end;
        ACT_REGUSERExecute(ShopMainForm); // Авторизация пользователя
        DelDocViewMenuItem.Visible:= accessAllowed('NaklDelView', User_ID);
        DevicesStart;



        MyReg:= TRegistry.Create;
        MyReg.RootKey:= HKEY_CURRENT_USER;
      try
        if MyReg.OpenKey('\SOFTWARE\Shop', True)then
        begin
          if MyReg.ValueExists('CorrectShutdown')then
            if not MyReg.ReadBool('CorrectShutdown')then
              SaveToLog('Запуск после аварийного завершения !!!', 'shop.err');
          MyReg.WriteBool('CorrectShutdown', False);
        end;
        MyReg.CloseKey;
      finally
        MyReg.Free;
      end;
end;

procedure SaveToLog(const Mess, LogFile: String);
var f: TextFile;
begin // Добавление сведений в протокол
    AssignFile(f, ExtractFilePath(ParamStr(0)) + LogFile);
    if FileExists(ExtractFilePath(ParamStr(0)) + LogFile)then Append(f) else Rewrite(f);
  try
    Writeln(f, DateTimeToStr(Now) + ' - ' + Mess);
  finally
    CloseFile(f);
  end;
end;

procedure PinpadLog(const Mess: String);
var f: TextFile;
    LogFile: String;
begin // Добавление сведений в протокол
    LogFile:= ExtractFilePath(ParamStr(0)) + 'Pinpad' + FormatDateTime('YYYY-MM-dd', Date) + '.log';
    AssignFile(f, LogFile);
    if FileExists(LogFile)then Append(f) else Rewrite(f);
  try
    Writeln(f, DateTimeToStr(Now) + ' - ' + Mess);
  finally
    CloseFile(f);
  end;
end;


procedure TShopMainForm.AppException(Sender: TObject; E: Exception);
begin // Протокол ошибок программы
     SaveToLog(E.Message, 'shop.err');
     Application.ShowException(E);
end;

procedure TShopMainForm.FormDestroy(Sender: TObject);
var FoundAtom : TAtom;
    ValueReturned : word;
begin
  pFIBDatabase1.Connected:= False;
  ShopIni.WriteBool('Transmit', 'CheckFTP', CheckFTPMenuItem.Checked);
//        CommDevice1.StopComm;
        MyReg:= TRegistry.Create;
        MyReg.RootKey:= HKEY_CURRENT_USER;
      try
        if MyReg.OpenKey('\SOFTWARE\Shop', True)then
           MyReg.WriteBool('CorrectShutdown', True);
        MyReg.CloseKey;
      finally
        MyReg.Free;
      end;
      ShopIni.Free;

end;

procedure TShopMainForm.CommDevice1ReceiveData(Buffer: Pointer;
  BufferLength: Word);
//var i: Integer;
 //   Str: String;
begin
{        Str:= Copy(StrPas(Buffer), 1, Length(StrPas(Buffer)) - 2);
        ScanStr:= '';

        for i:= 1  to Length(Str) do
          if Str[i] in ['0'..'9'] then ScanStr:= ScanStr + Str[i];
        SendKeys(PChar(ScanStr + #13), True);}
//        SendKeys(PChar(Copy(StrPas(Buffer), 1, Length(StrPas(Buffer)) - 1)), True);
end;

procedure TShopMainForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose:= MessageDlg('Закрыть программу ?', mtConfirmation, [mbYes,mbNo], 0) = IDYES;
end;

procedure TShopMainForm.ACT_ABOUTExecute(Sender: TObject);
begin
        Application.CreateForm(TAboutBox, AboutBox);
        AboutBox.ShowModal;
        AboutBox.Free;
end;

procedure TShopMainForm.ACT_REGUSERExecute(Sender: TObject);
begin
        Application.CreateForm(TPasswEnterForm, PasswEnterForm);

        PasswEnterForm.ShowModal;

{  АВТОЛОГИН
        if User_ID <> -1 then
           PasswEnterForm.ShowModal
        else
          if (User_ID = -1) and PasswEnterForm.CheckBox1.Checked then
          begin
            PasswEnterForm.BitBtn1.Click;
            if User_ID = -1 then
            begin
              PasswEnterForm.Edit1.Text:= '';
              PasswEnterForm.ShowModal;
            end;
          end;
}
        PasswEnterForm.Free;
        SprFrmFree;
end;

procedure TShopMainForm.ACT_SETINGSExecute(Sender: TObject);
begin
        Application.CreateForm(TSetingsFrm, SetingsFrm);
        SetingsFrm.ShowModal;
        SetingsFrm.Free;
end;

procedure TShopMainForm.ACT_SETINGSUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('AdmSettings', User_ID);
end;

procedure TShopMainForm.ACT_SALESExecute(Sender: TObject);
begin
  Application.CreateForm(TSaleFrm, SaleFrm);
  ShopMainForm.Hide;
  SaleFrm.ShowModal;
  ShopMainForm.Show;
  SaleFrm.Free;
end;

procedure TShopMainForm.ACT_SALESUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('OperSale', User_ID);
end;

procedure TShopMainForm.ACT_DATASENDExecute(Sender: TObject);
begin
        Application.CreateForm(TDataSendFrm, DataSendFrm);
        DataSendFrm.ShowModal;
        DataSendFrm.Free;
end;

procedure TShopMainForm.ACT_DATASENDUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('AdmDatasend', User_ID);
end;

procedure TShopMainForm.ACT_NAKLExecute(Sender: TObject);
begin
        Application.CreateForm(TMoveTovarFrm, MoveTovarFrm);
        ShopMainForm.Hide;
        MoveTovarFrm.ShowModal;
        ShopMainForm.Show;
        MoveTovarFrm.Free;
        MoveTovarFrm:= nil;
//        if pFIBTransaction1.Active then pFIBTransaction1.CommitRetaining;
end;

procedure TShopMainForm.ACT_NAKLUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('OperNakl', User_ID);
end;

procedure TShopMainForm.ACT_VIEWSAVEDExecute(Sender: TObject);
begin
    OpenDialog1.Title:= 'Выберите отчёт';
    OpenDialog1.InitialDir:= ExtractFilePath(ParamStr(0)) + 'DOC\';
    OpenDialog1.Filter:= 'Отчёты|*.fp3';
    if OpenDialog1.Execute then
    begin
      frxReport1.PreviewPages.LoadFromFile(OpenDialog1.FileName);
      frxReport1.ShowPreparedReport;
    end;
end;

procedure TShopMainForm.ACT_VIEWSAVEDUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('RepViewSave', User_ID);
end;

procedure TShopMainForm.ACT_REP_TOVAR_MOVEExecute(Sender: TObject);
begin
        Application.CreateForm(TSmensRepFrm, SmensRepFrm);
        SmensRepFrm.ShowModal;
        SmensRepFrm.Free;
end;

procedure TShopMainForm.ACT_TOVAR_SPAREExecute(Sender: TObject);
begin
{        Application.CreateForm(TTovarRepFrm, TovarRepFrm);
        TovarRepFrm.ShowModal;
        TovarRepFrm.Free;}
       ShopMainForm.frxReport1.LoadFromFile(ShopIni.ReadString('Reports',
             'CurOst', ReportsPath + 'CurOst.fr3'));
       ShopMainForm.frxReport1.ShowReport;
end;

procedure TShopMainForm.ACT_UCHETExecute(Sender: TObject);
begin
        Application.CreateForm(TUchetFrm, UchetFrm);
        UchetFrm.ShowModal;
        UchetFrm.Free;
end;

procedure TShopMainForm.ACT_UCHETUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('OperUchet', User_ID);
end;

procedure TShopMainForm.ACT_REP_REVALExecute(Sender: TObject);
begin
        Application.CreateForm(TRevalFrm, RevalFrm);
        RevalFrm.ShowModal;
        RevalFrm.Free;
end;

procedure TShopMainForm.ACT_REP_AKTMOVEExecute(Sender: TObject);
begin
        Application.CreateForm(TActMoveFrm, ActMoveFrm);
        ActMoveFrm.ShowModal;
        ActMoveFrm.Free;
end;

procedure TShopMainForm.ACT_REP_AKTMOVEUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('RepActMove', User_ID);
end;

procedure TShopMainForm.ACT_PRICE_LABELExecute(Sender: TObject);
begin
        Application.CreateForm(TPriceLabelPrintFrm, PriceLabelPrintFrm);
        PriceLabelPrintFrm.ShowModal;
        PriceLabelPrintFrm.Free;
end;

procedure TShopMainForm.ACT_REP_GROUP_MOVEExecute(Sender: TObject);
begin
        Application.CreateForm(TTovarGroupRepFrm, TovarGroupRepFrm);
        TovarGroupRepFrm.ShowModal;
        TovarGroupRepFrm.Free;
end;

procedure TShopMainForm.XLS1Click(Sender: TObject);
begin
        Application.CreateForm(TXLStoNaklForm, XLStoNaklForm);
        XLStoNaklForm.ShowModal;
        XLStoNaklForm.Free;
end;

procedure TShopMainForm.ZakazCheckToolButtonClick(Sender: TObject);
begin
  Application.CreateForm(TZakazCheckForm, ZakazCheckForm);
  ZakazCheckForm.ShowModal;
  ZakazCheckForm.Free;
end;

procedure TShopMainForm.ACT_SPR_VENDORSExecute(Sender: TObject);
var j: Integer;
begin
        Spr_Vendors_Buyers_Edit(j,0);
end;

procedure TShopMainForm.ACT_SPR_VENDORSUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('SprVendors', User_ID);
end;

procedure TShopMainForm.ACT_SPR_BUYERSExecute(Sender: TObject);
var j: Integer;
begin
        Spr_Vendors_Buyers_Edit(j,1);
end;

procedure TShopMainForm.ACT_SPR_BUYERSUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('SprBuyers', User_ID);
end;

function Spr_Vendors_Buyers_Edit(var j: Integer;const i: Integer): String;
begin
        Application.CreateForm(TSprVendFrm, SprVendFrm);
        with SprVendFrm do
        begin
          Tag:= i;
          SprVendors.SelectSQL.Clear;
          if Tag = 1 then
          begin
            Caption:= 'Покупатели';
            SprVendors.SelectSQL.Add('select * from SPR_BUYERS');
            SprVendors.SelectSQL.Add('');
            SprVendors.SelectSQL.Add('order by BUYER_NAME');
            DBGrid3.Columns[0].FieldName:= 'BUYER_NAME';
            N1.Caption:= 'Отчет по покупателю';
            N2.Caption:= 'Отчет по всем покупателям';
          end
          else
          begin
            Caption:= 'Поставщики';
            SprVendors.SelectSQL.Add('select * from SPR_VENDORS');
            SprVendors.SelectSQL.Add('');
            SprVendors.SelectSQL.Add('order by VENDOR_NAME');
            DBGrid3.Columns[0].FieldName:= 'VENDOR_NAME';
            N1.Caption:= 'Отчет по поставщику';
            N2.Caption:= 'Отчет по всем поставщикам';
          end;
          SprVendors.Open;
          if ShowModal = mrOK then
          begin
            if Tag = 1 then begin
              j:= SprVendors['BUYER_CODE'];
              Result:= SprVendors['BUYER_NAME'];
            end
            else
            begin
              j:= SprVendors['VENDOR_CODE'];
              Result:= SprVendors['VENDOR_NAME'];
            end;
          end;
          Free;
        end;
end;

procedure TShopMainForm.ACT_SPR_MARKETExecute(Sender: TObject);
begin
        Application.CreateForm(TSprMarketsFrm, SprMarketsFrm);
        SprMarketsFrm.ShowModal;
        SprMarketsFrm.Free;
        if pFIBTransaction1.Active then pFIBTransaction1.CommitRetaining;
end;

procedure TShopMainForm.ACT_SPR_MARKETUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('SprMarket', User_ID);
end;

procedure TShopMainForm.ACT_SPR_TOVARExecute(Sender: TObject);
begin
    ChangeWithCat;
end;

function ChangeWithCat: String;
begin
     if not Assigned(SprFrm)then
     begin
       TmpFilterStr:= '';
       SprShowGroup:= TStringList.Create;
       SprHideGroup:= TStringList.Create;
       SprShowVendor:= TStringList.Create;
       SprHideVendor:= TStringList.Create;
       if not Assigned(SprFiterFrm)then SprFiterFrm:= TSprFiterFrm.Create(Application);
       SprFiterFrm.ShowModal;
       SprFiterFrm.Free;
       Application.CreateForm(TSprFrm, SprFrm);
       SprFiterFrm:= TSprFiterFrm.Create(Application, SprFrm.TabSheet3);
       SprFiterFrm.Show;
     end;
     SprFiterFrm.SpeedButton1.Down:= SprFrm.SprTovar.SelectSQL[SprFrm.SprTovar.SelectSQL.Count - 2] <> '';
     if SprFiterFrm.SpeedButton1.Down then
     begin
       SprFiterFrm.SpeedButton1.Hint:= 'Отменить фильтрацию';
       SprFiterFrm.SpeedButton1.ImageIndex:= 0;
       SprFiterFrm.SpeedButton2.Enabled:= True;
     end
     else
     begin
       SprFiterFrm.SpeedButton1.Hint:= 'Применить фильтр';
       SprFiterFrm.SpeedButton1.ImageIndex:= 6;
       SprFiterFrm.SpeedButton2.Enabled:= True;
     end;

     SprFrm.Tag:= 1;
     SprFrm.SprTovarGroup.Active:= True;
     SprFrm.BarCode.Active:= True;
     SprFrm.SprAcountGroup.Active:= True;
     SprFrm.SprTovar.Active:= True;
     if (SprFrm.ShowModal = idOK) then Result:= SprFrm.SprTovar['ITEM']
     else Result:= '';
     if not SprFrm.SpeedButton1.Down then SprFrmFree;
end;

procedure SprFrmFree;
begin
       if Assigned(SprFiterFrm)then
       begin
         SprFiterFrm.Free;
         SprFiterFrm:= nil;
         SprShowGroup.Free;
         SprHideGroup.Free;
         SprShowVendor.Free;
         SprHideVendor.Free;
       end;
       if Assigned(SprFrm)then
       begin
         SprFrm.Free;
         SprFrm:= nil;
       end;  
end;

procedure TShopMainForm.ACT_MOVE_ITEMExecute(Sender: TObject);
begin
  Application.CreateForm(TMoveTovarShowFrm, MoveTovarShowFrm);
  MoveTovarShowFrm.Edit1.Text:= '';
  MoveTovarShowFrm.BitBtn1.Enabled:= False;
  MoveTovarShowFrm.DateTimePicker1.DateTime:= Now - 30;
  MoveTovarShowFrm.DateTimePicker2.DateTime:= Now;
  MoveTovarShowFrm.DateTimePicker3.DateTime:= Now - 30;
  MoveTovarShowFrm.DateTimePicker4.DateTime:= Now;
  if CurrentMarketType <> 0 then
    with pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select * from SPR_MARKET where MARKET_CODE = ' + IntToStr(CurrentMarketCode));
      Open;
      if not VarIsNull(pFIBService['SHORT_NAME'])then
        MoveTovarShowFrm.ComboBox1.ItemIndex:=
            FindString(pFIBService['SHORT_NAME'], MoveTovarShowFrm.ComboBox1.Items);
      Close;
    end;
  MoveTovarShowFrm.ShowModal;
  MoveTovarShowFrm.Free;
end;

procedure TShopMainForm.ACT_ZAKAZExecute(Sender: TObject);
begin
    if not Assigned(ZakazFrm)then
    begin
      ZakWhereFilterStr:= '';
      ZakHavingFilterStr:= '';
      ZakShowGroup:= TStringList.Create;
      ZakHideGroup:= TStringList.Create;
      ZakShowVendor:= TStringList.Create;
      ZakHideVendor:= TStringList.Create;
      if not Assigned(ZakazFilterFrm)then ZakazFilterFrm:= TZakazFilterFrm.Create(Application);
      ZakazFilterFrm.ShowModal;
      ZakazFilterFrm.Free;
      Application.CreateForm(TZakazFrm, ZakazFrm);
      ZakazFilterFrm:= TZakazFilterFrm.Create(Application, ZakazFrm.TabSheet1);
      ZakazFilterFrm.Show;
   end;
   ZakazFilterFrm.SpeedButton1.Down:= (ZakazFrm.ZakazQuery.SelectSQL[ZakazFrm.ZakazQuery.SelectSQL.Count - 2]
       + ZakazFrm.ZakazQuery.SelectSQL[ZakazFrm.ZakazQuery.SelectSQL.Count - 4]) <> '';
   if ZakazFilterFrm.SpeedButton1.Down then
   begin
     ZakazFilterFrm.SpeedButton1.Hint:= 'Отменить фильтрацию';
     ZakazFilterFrm.SpeedButton1.ImageIndex:= 0;
     ZakazFilterFrm.ToolButton5.Enabled:= True;
   end
   else
   begin
     ZakazFilterFrm.SpeedButton1.Hint:= 'Применить фильтр';
     ZakazFilterFrm.SpeedButton1.ImageIndex:= 6;
     ZakazFilterFrm.ToolButton5.Enabled:= True;
   end;



   ZakazFrm.ZakazQuery.Active:= True;
   ZakazFrm.ShowModal;
   if not ZakazFrm.SpeedButton2.Down then
   begin
     ZakazFilterFrm.Free;
     ZakazFilterFrm:= nil;
     ZakazFrm.Free;
     ZakazFrm:= nil;
     ZakShowGroup.Free;
     ZakHideGroup.Free;
     ZakShowVendor.Free;
     ZakHideVendor.Free;
   end;  
end;

procedure TShopMainForm.ACT_ZAKAZUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('OperZakaz', User_ID);
end;

procedure TShopMainForm.ACT_EDITFORMSUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('RepEditTemplate', User_ID);
end;

procedure TShopMainForm.ACT_EXPENSESExecute(Sender: TObject);
begin
    Application.CreateForm(TExpensesAmountFrm, ExpensesAmountFrm);
    ExpensesAmountFrm.ShowModal;
    ExpensesAmountFrm.Free;
end;

procedure TShopMainForm.ACT_EXPENSESUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('OperExpenses', User_ID);
end;

procedure TShopMainForm.ACT_INTMOVEUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('OperMove', User_ID);
end;

procedure TShopMainForm.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
      if AnsiCompareText('ORGNAME', ParName) = 0 then ParValue:= OrgName;
      if AnsiCompareText('LONGORGNAME', ParName) = 0 then ParValue:= LongOrgName;
      if AnsiCompareText('PHONE', ParName) = 0 then ParValue:= Phone;
      if AnsiCompareText('INN', ParName) = 0 then ParValue:= INN;
      if AnsiCompareText('OKOHX', ParName) = 0 then ParValue:= OKOHX;
      if AnsiCompareText('OKPO', ParName) = 0 then ParValue:= OKPO;
      if AnsiCompareText('ADRES', ParName) = 0 then ParValue:= ADRES;
      if AnsiCompareText('BANK', ParName) = 0 then ParValue:= BANK;
      if AnsiCompareText('RSCHET', ParName) = 0 then ParValue:= RSCHET;
      if AnsiCompareText('KSCHET', ParName) = 0 then ParValue:= KSCHET;
      if AnsiCompareText('KPP', ParName) = 0 then ParValue:= KPP;
      if AnsiCompareText('BIK', ParName) = 0 then ParValue:= BIK;
      if AnsiCompareText('BOSS', ParName) = 0 then ParValue:= BOSS;
      if AnsiCompareText('BUH', ParName) = 0 then ParValue:= BUH;
      if AnsiCompareText('USERNAME', ParName) = 0 then ParValue:= User_Name;
      if AnsiCompareText('USERID', ParName) = 0 then ParValue:= User_ID;
      if AnsiCompareText('NDC', ParName) = 0 then ParValue:= NDC;
      if AnsiCompareText('MARKETCODE', ParName) = 0 then ParValue:= CurrentMarketCode;
end;

procedure TShopMainForm.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
      if AnsiCompareText('ORGNAME', VarName) = 0 then Value:= OrgName;
      if AnsiCompareText('LONGORGNAME', VarName) = 0 then Value:= LongOrgName;
      if AnsiCompareText('PHONE', VarName) = 0 then Value:= Phone;
      if AnsiCompareText('INN', VarName) = 0 then Value:= INN;
      if AnsiCompareText('OKOHX', VarName) = 0 then Value:= OKOHX;
      if AnsiCompareText('OKPO', VarName) = 0 then Value:= OKPO;
      if AnsiCompareText('ADRES', VarName) = 0 then Value:= ADRES;
      if AnsiCompareText('BANK', VarName) = 0 then Value:= BANK;
      if AnsiCompareText('RSCHET', VarName) = 0 then Value:= RSCHET;
      if AnsiCompareText('KSCHET', VarName) = 0 then Value:= KSCHET;
      if AnsiCompareText('KPP', VarName) = 0 then Value:= KPP;
      if AnsiCompareText('BIK', VarName) = 0 then Value:= BIK;
      if AnsiCompareText('BOSS', VarName) = 0 then Value:= BOSS;
      if AnsiCompareText('BUH', VarName) = 0 then Value:= BUH;
      if AnsiCompareText('USERNAME', VarName) = 0 then Value:= User_Name;
      if AnsiCompareText('USERID', VarName) = 0 then Value:= User_ID;
      if AnsiCompareText('NDC', VarName) = 0 then Value:= NDC;
      if AnsiCompareText('MARKETCODE', VarName) = 0 then Value:= CurrentMarketCode;
end;

function TShopMainForm.frxReport1UserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin
  if AnsiCompareText('CURR2TEXT', MethodName) = 0 then
    if VarIsNull(Params[0])then Result:= VerbalSum(0, 1, 1, True)
    else Result:= VerbalSum(Params[0], 1, 1, True);
  if AnsiCompareText('FLOAT2TEXT', MethodName) = 0 then
    if VarIsNull(Params[0])then Result:= VerbalSum(0, 0, 0, True)
    else Result:= VerbalSum(Params[0], 0, 0, True);
  if AnsiCompareText('ROUNDEX', MethodName) = 0 then
    if VarIsNull(Params[0])then Result:= 0
    else Result:= RoundEx(Params[0]);
end;

procedure AddUserFunction;
begin
  with ShopMainForm.frxReport1 do
  begin
    AddFunction('function CURR2TEXT(i: Double): String', 'ctFormat', 'Сумма прописью');
    AddFunction('function FLOAT2TEXT(i: Double): String', 'ctFormat', 'Число прописью');
    AddFunction('function ROUNDEX(x: Double; Precision: Integer = 100): Double', 'ctMath', 'Округление к большему(2.5 -> 3)');
  end;
end;

procedure TShopMainForm.ACT_DISCONT_CARDExecute(Sender: TObject);
begin
    Application.CreateForm(TClientsFrm, ClientsFrm);
    ClientsFrm.ShowModal;
    ClientsFrm.Free;
end;

procedure TShopMainForm.ACT_DISCONT_CARDUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('SprCard', User_ID);
end;

procedure TShopMainForm.Action2Execute(Sender: TObject);
begin
    frxDesigner1.OpenDir:= ExtractFilePath(ParamStr(0)) + 'Reports\';
    frxDesigner1.SaveDir:= ExtractFilePath(ParamStr(0)) + 'Reports\';
    frxReport1.Clear;
    frxReport1.DesignReport;
end;

procedure TShopMainForm.Action2Update(Sender: TObject);
begin
   (Sender as TAction).Enabled:= accessAllowed('RepEditTemplate', User_ID);
end;

procedure TShopMainForm.ActionAvtoCatalogExecute(Sender: TObject);
begin
   if not(Vartype(MyObject) = VarDispatch) then
   begin
//       ToolButton18.Tag:= 1;
     try
       case ShopIni.ReadInteger('Main', 'Autocatalog', 0) of
         1: MyObject:= CreateOleObject('AutoCat10.AutoDealer');  //AutoDealer 18
         2: MyObject:= CreateOleObject('AutoCat.AutoSoft_Catalogue'); // AutoSoft 26
         3: MyObject := CreateOleObject ('AutoDealer.Catalog');    //Система AutoDealer 5.3.1
       end;

     except
       on EOleSysError do
       begin
//         ToolButton18.Tag:= 0;
//         MessageDlg('Система АВТОКАТАЛОГ 12 не установлена', mtWarning, [mbOK], 0);
       end;
     end;
   end;
   if not(Vartype(MyObject) = VarDispatch) then N37.Checked:= True
   else N37.Checked:= False;
end;

end.
