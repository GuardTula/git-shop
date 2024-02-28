//****************************************************************************//
//                            © Guard  2003-2023                              //
//****************************************************************************//
unit Sale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ComObj, ExtCtrls, Menus, DB, Grids,  DBGrids,
  DateUtils, ToolWin, FIBDataSet, pFIBDataSet, IniFiles, frxFIBComponents,
  DrvFRLib_TLB, FIBQuery, pFIBQuery, Math, Vcl.Buttons, Vcl.Samples.Spin,
  System.ImageList, Vcl.ImgList, System.UITypes, frxClass, frxBarcode2D;

type
  TSaleFrm = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    UserInputEdit: TEdit;
    Panel1: TPanel;
    Panel4: TPanel;
    StaticText2: TStaticText;
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
    Panel5: TPanel;
    Memo1: TMemo;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    SmensMainItem: TMenuItem;
    OpenSmenItem: TMenuItem;
    CloseSmenItem: TMenuItem;
    N3: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    ReportsItem: TMenuItem;
    N2: TMenuItem;
    N20: TMenuItem;
    SmenReportItem: TMenuItem;
    N19: TMenuItem;
    PinpadServiceMenuItem: TMenuItem;
    N29: TMenuItem;
    N5: TMenuItem;
    N10: TMenuItem;
    N18: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N15: TMenuItem;
    N4: TMenuItem;
    SaleItem: TMenuItem;
    N6: TMenuItem;
    N16: TMenuItem;
    N24: TMenuItem;
    N23: TMenuItem;
    N22: TMenuItem;
    N17: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    ExitItem: TMenuItem;
    DataSource1: TDataSource;
    Timer2: TTimer;
    TmpSales: TpFIBDataSet;
    TmpSalesITEM: TFIBStringField;
    TmpSalesTOVAR_NAME: TFIBStringField;
    TmpSalesSALE_PRICE: TFIBFloatField;
    TmpSalesPRICE_1: TFIBFloatField;
    TmpSalesPRICE_2: TFIBFloatField;
    TmpSalesPRICE_3: TFIBFloatField;
    TmpSalesPRICE_4: TFIBFloatField;
    TmpSalesPRICE_5: TFIBFloatField;
    TmpSalesPRICE_6: TFIBFloatField;
    TmpSalesPRICE_7: TFIBFloatField;
    TmpSalesPRICE_8: TFIBFloatField;
    TmpSalesPRICE_9: TFIBFloatField;
    TmpSalesVEND_PRICE: TFIBFloatField;
    TmpSalesKKM_SECT: TFIBIntegerField;
    TmpSalesKOLVO: TFIBFloatField;
    TmpSalesREG: TFIBIntegerField;
    TmpSalesOSTATOK: TFIBFloatField;
    TmpSalesAUTOR_KOD: TFIBIntegerField;
    TmpSalesSCLAD: TFIBStringField;
    TmpSalesVEND_ITEM: TFIBStringField;
    TmpSalesPOS_SUM: TFloatField;
    TmpSalesBARCODE: TFIBStringField;
    pFIBQuery1: TpFIBQuery;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    pFIBQuery2: TpFIBQuery;
    pFIBQuery3: TpFIBQuery;
    SaleSpeedButton: TSpeedButton;
    ReturnSpeedButton: TSpeedButton;
    DiscontSpeedButton: TSpeedButton;
    CashPaySpeedButton: TSpeedButton;
    CardPaySpeedButton: TSpeedButton;
    CheckClearSpeedButton: TSpeedButton;
    CloseCheckSpeedButton: TSpeedButton;
    CheckToQueueSpeedButton: TSpeedButton;
    QueueToCheckSpeedButton: TSpeedButton;
    CatalogChangeSpeedButton: TSpeedButton;
    MoveUpSpeedButton: TSpeedButton;
    MoveDownSpeedButton: TSpeedButton;
    DelPosSpeedButton: TSpeedButton;
    MultiplySpeedButton: TSpeedButton;
    FavoriteItemsSpeedButton: TSpeedButton;
    PrintCheckSpeedButton: TSpeedButton;
    N28: TMenuItem;
    ImageList1: TImageList;
    TmpSalesPRICE: TFIBFloatField;
    AdmPriceEditSpeedButton: TSpeedButton;
    PrintLastCheckBtn: TBitBtn;
    N1: TMenuItem;
    KKM1Item: TMenuItem;
    KKM2Item: TMenuItem;
    KKM1SpeedButton: TSpeedButton;
    KKM2SpeedButton: TSpeedButton;
    frxReport1: TfrxReport;
    CloseCheckNoPrintSpeedButton: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure OpenSmenItemClick(Sender: TObject);
    procedure CloseSmenItemClick(Sender: TObject);
    procedure UserInputEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TmpSalesREGGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ExitItemClick(Sender: TObject);
    procedure SmenReportItemClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure frTBButton1Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure TmpSalesAfterOpen(DataSet: TDataSet);
    procedure TmpSalesPOS_SUMGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure N19Click(Sender: TObject);
    procedure UserInputEditKeyPress(Sender: TObject; var Key: Char);
    procedure N23Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure DiscontSpeedButtonClick(Sender: TObject);
    procedure CheckClearSpeedButtonClick(Sender: TObject);
    procedure CloseCheckSpeedButtonClick(Sender: TObject);
    procedure CheckToQueueSpeedButtonClick(Sender: TObject);
    procedure QueueToCheckSpeedButtonClick(Sender: TObject);
    procedure SaleSpeedButtonClick(Sender: TObject);
    procedure ReturnSpeedButtonClick(Sender: TObject);
    procedure CashPaySpeedButtonClick(Sender: TObject);
    procedure CardPaySpeedButtonClick(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure AdmPriceEditSpeedButtonClick(Sender: TObject);
    procedure Panel5Resize(Sender: TObject);
    procedure PrintLastCheckBtnClick(Sender: TObject);
    procedure KKM2ItemClick(Sender: TObject);
    procedure KKM1SpeedButtonClick(Sender: TObject);
    procedure KKM2SpeedButtonClick(Sender: TObject);
    procedure CloseCheckNoPrintSpeedButtonClick(Sender: TObject);
  private
    function GetCashInBox : Double;
    { Private declarations }
  public
    { Public declarations }
  end;

procedure StartKKM;
procedure KKM_ReportWithCleaning(KKM: Integer);
function KKM_RegAndClose: Integer;
function KKM_Err(const Rslt: Integer; KKM: Integer = 1; Operation: String = ''): Integer;
function KKM_PrintStrings(const InStr: String; KKM: Integer = 1; CutCheck: Boolean = False; FeedCheckCount: Integer = 0; Skip_Begin: Integer = 0; Skip_End : Integer = 0): Boolean;
function CheckKKMStatus(KKM: Integer): Integer;
function CheckKKMReady4Reg(KKM: Integer): Integer;

function InputBarCodeStr(var BarCodeStr: String): Boolean;
function MrpEncoder(MRPString: String): Double; //Функция декодирования максимальной розничной цены с пачки (табачная продукция). Алгоритм кодирования.
procedure CloseSmen;// Закрытие смены

var
  SaleFrm: TSaleFrm;
//  KKMOleObject: Variant;
  Drv1,Drv2: TDrvFR;
  KKM1_Type, KKM2_Type, CheckKKMStatusTimeout, ActiveSmenKod: Integer;
  PosMultiplier: Double;
  CheckSum, Discont: Currency;
  KKM1_Name, KKM2_Name, KKM1_Number, KKM2_Number, KKM1_OrgName, KKM2_OrgName, KKM1_INN, KKM2_INN, CardNumber: String;
  KKM1_Enable: Boolean = False;
  KKM2_Enable: Boolean = False;
  Pinpad_Enabled: Boolean = False;
  KKM1_SmensEnd: Boolean = False;
  KKM2_SmensEnd: Boolean = False;
  KKM1_Ready: Boolean = False;
  KKM2_Ready: Boolean = False;
  KKM1_OpenDoc: Boolean = False;
  KKM2_OpenDoc: Boolean = False;
  KKM_PrintCheck: Boolean = True;

//  DiscontPercent: Integer; DiscontEnable: Boolean;

implementation

uses ShopMain, EnterMoney, SmensReports, SaleHelp, VendSumFact, Unit11,
  OftenUse, Spr, Queue, BarcodeInput, PinPad_Pilot_nt;

{$R *.dfm}

function KKM_PrintStrings(const InStr: String; KKM: Integer = 1; CutCheck: Boolean = False; FeedCheckCount: Integer = 0; Skip_Begin: Integer = 0; Skip_End : Integer = 0): Boolean;
var i: Integer;
    PrintStr: TStrings;
begin
  Result:= True;
  if (InStr <> '')  then
    case KKM of
      1: begin
           if Assigned(Drv1) then
           begin
             PrintStr:= TStringList.Create;
             PrintStr.Text:= InStr;

             Drv1.UseReceiptRibbon:= True;
             Drv1.UseJournalRibbon:= False;
             Drv1.UseSlipDocument:= False;
             for i:= Skip_Begin to PrintStr.Count - Skip_End - 1 do
             begin
               if ShopIni.ReadBool('KKM1', 'ShiftRigth', True) then
                 Drv1.StringForPrinting:= '  ' + PrintStr[i]
               else
                 Drv1.StringForPrinting:= PrintStr[i];
               Result:= Drv1.PrintString = 0;
             end;
             if FeedCheckCount > 0 then
             begin
               Drv1.StringQuantity:= FeedCheckCount;
               Result:= Drv1.FeedDocument = 0;
             end;
             if CutCheck then Result:= Drv1.CutCheck = 0;
             PrintStr.Free;
           end
           else
           begin
             Result:= False;
           end
         end;
      2: begin
           if Assigned(Drv2) then
           begin
             PrintStr:= TStringList.Create;
             PrintStr.Text:= InStr;

             Drv2.UseReceiptRibbon:= True;
             Drv2.UseJournalRibbon:= False;
             Drv2.UseSlipDocument:= False;
             for i:= Skip_Begin to PrintStr.Count - Skip_End - 1 do
             begin
               if ShopIni.ReadBool('KKM2', 'ShiftRigth', True) then
                 Drv2.StringForPrinting:= '  ' + PrintStr[i]
               else
                 Drv2.StringForPrinting:= PrintStr[i];
               Result:= Drv1.PrintString = 0;
             end;
             if FeedCheckCount > 0 then
             begin
               Drv2.StringQuantity:= FeedCheckCount;
               Result:= Drv2.FeedDocument = 0;
             end;
             if CutCheck then Result:= Drv2.CutCheck = 0;
             PrintStr.Free;
           end
           else
           begin
             Result:= False;
           end
         end;
    end
  else Result:= False;
end;

procedure TSaleFrm.AdmPriceEditSpeedButtonClick(Sender: TObject);
begin
  Application.CreateForm(TVendSummFactFrm, VendSummFactFrm);
  VendSummFactFrm.Label1.Visible:= False;
  VendSummFactFrm.Edit1.Visible:= True;
  VendSummFactFrm.MoneyEdit1.Visible:= False;
  VendSummFactFrm.Tag:= 0;
  VendSummFactFrm.Edit1.Text:= FloatToStrF(TmpSales['PRICE'], ffFixed, 14, 2);
  VendSummFactFrm.ActiveControl:= VendSummFactFrm.Edit1;
  if VendSummFactFrm.ShowModal = idOK then
  begin
     SaveToLog('Ручное имзменение цены: ' + TmpSales['ITEM'] + ' "' + TmpSales['TOVAR_NAME']
       + '" с ' + FloatToStrF(TmpSales['PRICE'], ffFixed, 14, 2) + ' на '
       + VendSummFactFrm.Edit1.Text, 'shop.log');
     ShopMainForm.pFIBDatabase1.Execute('update POS_TMP_SALES'
       + ' set PRICE = ' + StringReplace(VendSummFactFrm.Edit1.Text, ',', '.', [])
       + ' where ITEM = ''' + TmpSales['ITEM'] + ''''
       + ' and MARKET_CODE = ' + IntToStr(CurrentMarketCode)
       + ' and AUTOR_KOD = ' + IntToStr(User_ID));
  end;
  VendSummFactFrm.Free;
  TmpSales.ReopenLocate('ITEM');
end;

function KKM_Err(const Rslt: Integer; KKM: Integer = 1; Operation: String = ''): Integer;
var ErrDesc: String;
begin
  if Rslt <> 0 then
  begin
    case KKM of
      1:
        case KKM1_Type of
          2: ErrDesc:= Drv1.ResultCodeDescription;
          3: ErrDesc:= 'ККМ не поддерживается в данной версии';//Drv.ResultDescription;
          5: ErrDesc:= 'ККМ не поддерживается в данной версии';//Drv.GetError(Rslt);
        end;
      2:
        case KKM1_Type of
          2: ErrDesc:= Drv2.ResultCodeDescription;
          3: ErrDesc:= 'ККМ не поддерживается в данной версии';//Drv.ResultDescription;
          5: ErrDesc:= 'ККМ не поддерживается в данной версии';//Drv.GetError(Rslt);
        end;
    end;
    SaveToLog('KKM'+ KKM.ToString + ' '  + Operation + ' : ' + ErrDesc + '(' + IntToStr(Rslt) + ')', 'kkm_log.err');
  end;
  Result:= Rslt;
end;

procedure StartKKM;
var TmpStr: string;
begin
   // 2- Штрих ФР, Штрих OnLine; 100 - Эмулятор ККМ; 110 - нефискальный принтер чеков
  KKM1_Enable:= ShopIni.ReadBool('KKM1', 'KKM_Enable', False); // ККМ 1 настроена
  KKM1_Type:= ShopIni.ReadInteger('KKM1', 'KKM_Type', 100); // Тип ККМ 1, по умолчанию 100 - эмулятор КММ
  KKM1_Name:= ShopIni.ReadString('KKM1', 'KKM_Name', 'Штрих ON LINE');
  KKM1_INN:= INN;
  KKM1_OrgName:= OrgName;
  KKM1_Ready:= False;

  KKM2_Enable:= ShopIni.ReadBool('KKM2', 'KKM_Enable', False); // ККМ 2 настроена
  KKM2_Type:= ShopIni.ReadInteger('KKM2', 'KKM_Type', 100); // Тип ККМ 2, по умолчанию 100 - эмулятор КММ
  KKM2_Name:= ShopIni.ReadString('KKM2', 'KKM_Name', 'Штрих ON LINE');
  KKM2_INN:= INN;
  KKM2_OrgName:= OrgName;
  KKM2_Ready:= False;

  SaleFrm.CloseSmenItem.Visible:= (KKM1_Enable or KKM2_Enable);    // ККМ подключены
  SaleFrm.OpenSmenItem.Visible:= (KKM1_Enable or KKM2_Enable);
  SaleFrm.ReportsItem.Visible:= (KKM1_Enable or KKM2_Enable);
  SaleFrm.N4.Visible:= (KKM1_Enable or KKM2_Enable);
  SaleFrm.SmenReportItem.Visible:= ((not (KKM1_Type in  [100, 110, 5]))or(not (KKM2_Type in  [100, 110, 5])));
  SaleFrm.N20.Visible:= ((not (KKM1_Type in  [100, 110, 5]))or(not (KKM2_Type in  [100, 110, 5])));  // Отчёты ККМ
  SaleFrm.N19.Visible:= ((not (KKM1_Type in  [100, 110, 5]))or(not (KKM2_Type in  [100, 110, 5])));  // Сменный отчёт с гашением

  SaleFrm.SaleSpeedButton.Visible:= (KKM1_Enable or KKM2_Enable);
  SaleFrm.ReturnSpeedButton.Visible:= (KKM1_Enable or KKM2_Enable);
  SaleFrm.CashPaySpeedButton.Visible:= (KKM1_Enable or KKM2_Enable);
  SaleFrm.CardPaySpeedButton.Visible:= (KKM1_Enable or KKM2_Enable);


  SaleFrm.KKM1SpeedButton.Visible:= KKM1_Enable and KKM2_Enable;  // Если одна из ККМ отключена скрываем выбор ККМ
  SaleFrm.KKM1Item.Visible:= KKM1_Enable and KKM2_Enable;
  SaleFrm.KKM2SpeedButton.Visible:= KKM2_Enable and KKM1_Enable;
  SaleFrm.KKM2Item.Visible:= KKM2_Enable and KKM1_Enable;

  if KKM2_Enable and not KKM1_Enable then SaleFrm.KKM2Item.Click; // Если ККМ 1 отключена, а ККМ 2 подключена переключаем на ККМ 2


  if KKM1_Enable then  //  ККМ 1
    case KKM1_Type of
     2:begin // Штрих ON LINE
         Drv1:= TDrvFR.Create(nil); // Создание объекта драйвера
         Drv1.Password:= User_KKM_Pass;
         Drv1.ComNumber:= ShopIni.ReadInteger('KKM1', 'Port', 1);
         Drv1.BaudRate:= ShopIni.ReadInteger('KKM1', 'BaudRate', 6); // 2400, 4800, 9600, 19200, 38400, 57600, 115200
         Drv1.Timeout:= ShopIni.ReadInteger('KKM1', 'Timeout', 10000);
         Drv1.ConnectionType:= ShopIni.ReadInteger('KKM1', 'ConnectionType', 0);// Local=0, TCP=1, DCOM=2, Escape=3, Сервер печати=4, Эмулятор ФР=5, TCP socket=6
         Drv1.ProtocolType:= 0; // Стандартный протокол
         Drv1.IPAddress:= ShopIni.ReadString('KKM1', 'IPAddress', '192.168.137.111'); // IP адрес ККТ
         Drv1.UseIPAddress:= True; // Используем свойство IP Address для указания адреса ККТ (в противном случае будет использоваться свойство ComputerName)
         Drv1.TCPPort:= ShopIni.ReadInteger('KKM1', 'TCPPort', 7778); // TCP Порт ККТ

         if (KKM_Err(Drv1.Connect, 1) <> 0)then // Проверяем подключение
           MessageDlg('(' + IntToStr(Drv1.ResultCode) + ')' + Drv1.ResultCodeDescription, mtError, [mbOK], 0)
         else
          if (CheckKKMReady4Reg(1) = 0) then
            case Drv1.ECRMode of
           1,2,3,4:
              begin
    // 1 - Выдача данных, 2 - Открытая смена, 24 часа не кончились, 3 - Открытая смена, 24 часа кончились,
    // 4 - Закрытая смена, 3 - Открытая смена, 24 часа кончились, 8 - открытый документ
                KKM1_SmensEnd:= Drv1.ECRMode = 3; //3 - 24 часа кончились
                KKM1_OpenDoc:= False; //Drv1.ECRMode = 8; // 8 - открытый документ ОТМЕНЯЕМ !!!!
                KKM1_Number:= Drv1.SerialNumber;

                Drv1.TableNumber:= 18;
                Drv1.RowNumber:= 1;
                Drv1.FieldNumber:= 2;
                KKM_Err(Drv1.ReadTable, 1, 'ReadTable');
                KKM1_INN:= Drv1.ValueOfFieldString;
                Drv1.TableNumber:= 18;
                Drv1.RowNumber:= 1;
                Drv1.FieldNumber:= 7;
                KKM_Err(Drv1.ReadTable, 1, 'ReadTable');
                TmpStr:= Drv1.ValueOfFieldString;

                if Pos('ИП', TmpStr) = 1 then    // Если организация ИП выделяем инициалы
                begin
                  TmpStr:= ';' + StringReplace(TmpStr, ' ', ';', [rfReplaceAll]) + ';';
                  KKM1_OrgName:= GetStrParam(TmpStr, 1) + ' ' + GetStrParam(TmpStr, 2) + ' '
                    + GetStrParam(TmpStr, 3)[1] + '. ' + GetStrParam(TmpStr, 4)[1] + '.';
                end
                  else KKM1_OrgName:= TmpStr;

                 if KKM1_SmensEnd then KKM2_Ready:= False
                else KKM1_Ready:= True;
              end;
              else
              begin
                KKM1_Ready:= False;
                MessageDlg('(' + IntToStr(Drv1.ResultCode) + ')' + Drv1.ECRModeDescription, mtWarning, [mbOK], 0);
              end;
            end;
       end;
  100: begin // Эмулятор ККМ
         KKM1_Number:= ShopIni.ReadString('KKM1', 'KKM_Number', '100');
         KKM1_OrgName:= ShopIni.ReadString('KKM1', 'KKM_OrgName', OrgName);
         KKM1_INN:= ShopIni.ReadString('KKM1', 'KKM_INN', INN);

         KKM1_Ready:= True;
          // KKM1_Name:= 'Эмулятор ККМ';
       end;
  110: begin // Нефискальный принтер чеков
         KKM1_Number:= ShopIni.ReadString('KKM1', 'KKM_Number', '110');
         KKM1_OrgName:= ShopIni.ReadString('KKM1', 'KKM_OrgName', OrgName);
         KKM1_INN:= ShopIni.ReadString('KKM1', 'KKM_INN', INN);
         KKM1_Ready:= True; /// Должна быть проверка готовности !!!!!!!!!!!!!!!!
         // KKM1_Name:= 'АСПД';
       end;

    else
      begin
        MessageDlg('Данная ККМ не поддерживается', mtError, [mbOK], 0);
        KKM1_Ready:= False;
      end;
    end;

  if KKM2_Enable then  //   KKM 2
    case KKM2_Type of
     2:begin // Штрих ON LINE
         Drv2:= TDrvFR.Create(nil); // Создание объекта драйвера
         Drv2.Password:= User_KKM_Pass;
         Drv2.ComNumber:= ShopIni.ReadInteger('KKM2', 'Port', 1);
         Drv2.BaudRate:= ShopIni.ReadInteger('KKM2', 'BaudRate', 6); // 2400, 4800, 9600, 19200, 38400, 57600, 115200
         Drv2.Timeout:= ShopIni.ReadInteger('KKM2', 'Timeout', 10000);
         Drv2.ConnectionType:= ShopIni.ReadInteger('KKM2', 'ConnectionType', 0);// Local=0, TCP=1, DCOM=2, Escape=3, Сервер печати=4, Эмулятор ФР=5, TCP socket=6
         Drv2.ProtocolType:= 0; // Стандартный протокол
         Drv2.IPAddress:= ShopIni.ReadString('KKM2', 'IPAddress', '192.168.137.111'); // IP адрес ККТ
         Drv2.UseIPAddress:= True; // Используем свойство IP Address для указания адреса ККТ (в противном случае будет использоваться свойство ComputerName)
         Drv2.TCPPort:= ShopIni.ReadInteger('KKM2', 'TCPPort', 7778); // TCP Порт ККТ

         if (KKM_Err(Drv2.Connect, 2) <> 0)then // Проверяем подключение
           MessageDlg('(' + IntToStr(Drv2.ResultCode) + ')' + Drv2.ResultCodeDescription, mtError, [mbOK], 0)
         else
          if (CheckKKMReady4Reg(2) = 0) then
            case Drv2.ECRMode of
           1,2,3,4:
              begin
    // 1 - Выдача данных, 2 - Открытая смена, 24 часа не кончились, 3 - Открытая смена, 24 часа кончились,
    // 4 - Закрытая смена, 3 - Открытая смена, 24 часа кончились, 8 - открытый документ
                KKM2_SmensEnd:= Drv2.ECRMode = 3; //3 - 24 часа кончились
                KKM2_OpenDoc:= False; //Drv1.ECRMode = 8; // 8 - открытый документ ОТМЕНЯЕМ !!!!
                KKM2_Number:= Drv2.SerialNumber;

                Drv2.TableNumber:= 18;
                Drv2.RowNumber:= 1;
                Drv2.FieldNumber:= 2;
                KKM_Err(Drv2.ReadTable, 2, 'ReadTable');
                KKM2_INN:= Drv2.ValueOfFieldString;
                Drv2.TableNumber:= 18;
                Drv2.RowNumber:= 1;
                Drv2.FieldNumber:= 7;
                KKM_Err(Drv2.ReadTable, 2, 'ReadTable');
                TmpStr:= Drv2.ValueOfFieldString;

                if Pos('ИП', TmpStr) = 1 then    // Если организация ИП выделяем инициалы
                begin
                  TmpStr:= ';' + StringReplace(TmpStr, ' ', ';', [rfReplaceAll]) + ';';
                  KKM2_OrgName:= GetStrParam(TmpStr, 1) + ' ' + GetStrParam(TmpStr, 2) + ' '
                    + GetStrParam(TmpStr, 3)[1] + '. ' + GetStrParam(TmpStr, 4)[1] + '.';
                end
                  else KKM2_OrgName:= TmpStr;

                if KKM2_SmensEnd then KKM2_Ready:= False
                else KKM2_Ready:= True;
              end;
              else
              begin
                KKM2_Ready:= False;
                MessageDlg('(' + IntToStr(Drv2.ResultCode) + ')' + Drv2.ECRModeDescription, mtWarning, [mbOK], 0);
              end;
            end;
       end;
  100: begin // Эмулятор ККМ
         KKM2_Number:= ShopIni.ReadString('KKM2', 'KKM_Number', '100');
         KKM2_OrgName:= ShopIni.ReadString('KKM2', 'KKM_OrgName', OrgName);
         KKM2_INN:= ShopIni.ReadString('KKM2', 'KKM_INN', INN);
         KKM2_Ready:= True;
          // KKM1_Name:= 'Эмулятор ККМ';
       end;
  110: begin // Нефискальный принтер чеков
         KKM2_Number:= ShopIni.ReadString('KKM2', 'KKM_Number', '110');
         KKM2_OrgName:= ShopIni.ReadString('KKM2', 'KKM_OrgName', OrgName);
         KKM2_INN:= ShopIni.ReadString('KKM2', 'KKM_INN', INN);
         KKM2_Ready:= True; /// Должна быть проверка готовности !!!!!!!!!!!!!!!!
         // KKM1_Name:= 'АСПД';
       end;

    else
      begin
        MessageDlg('Данная ККМ не поддерживается', mtError, [mbOK], 0);
        KKM2_Ready:= False;
      end;
    end;
end;

procedure TSaleFrm.FormCreate(Sender: TObject);
begin
//  Application.CreateForm(TWaitForm, WaitForm);

  LibName:= ShopIni.ReadString('PINPAD', 'SberPath', 'c:\sc552\') + 'pilot_nt.dll';
  Pinpad_Enabled:= ShopIni.ReadBool('PINPAD', 'PinpadEnable', False);
  PinpadServiceMenuItem.Visible:= Pinpad_Enabled;

  PosMultiplier:= 1;
  CheckSum:= 0;
  Discont:= 0;
  Timer2Timer(Self);
  N17.Enabled:= ShopIni.ReadBool('Main', 'RegWODisc', True);
  N27.Checked:= False;
  AdmPriceEditSpeedButton.Visible:= accessAllowed('OperEditPrice', User_ID);  // Ручное изменение цены

  StartKKM; // Подключаем ККМ

//  if KKM_Enable then
//  begin
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select * from HDR_SMENS');
      SelectSQL.Add('where END_DATETIME is null');
      SelectSQL.Add('and MARKET_CODE = ' + IntToStr(CurrentMarketCode));
      Open;
      if VarIsNull(ShopMainForm.pFIBService['SMENS_KOD'])then
      begin // Отсутствует открытая смена
        OpenSmenItem.Enabled:= True;
        CloseSmenItem.Enabled:= False;
        UserInputEdit.Enabled:= False;
        ReportsItem.Enabled:= False;
        N4.Enabled:= False;
        SaleFrm.Caption:= 'Смена закрыта';
      end
      else
      begin // Есть открытая смена
        OpenSmenItem.Enabled:= False;
        CloseSmenItem.Enabled:= True;
        ActiveSmenKod:= ShopMainForm.pFIBService['SMENS_KOD'];
        if (HoursBetween(Now, ShopMainForm.pFIBService['BEGIN_DATETIME']) > 24)then
        begin
          UserInputEdit.Enabled:= False;
          SaleFrm.Caption:= 'Смена превысила 24 часа';
        end
        else
        begin
          SaleFrm.Caption:= 'Смена открыта';
          with TmpSales do
          begin
            DisableControls;
            Close;
            ParamByName('CUR_MARKET').AsInteger:= CurrentMarketCode;
            ParamByName('CUR_AUTOR').AsInteger:= User_ID;
{
            SelectSQL[0]:= 'select P.ITEM, T.TOVAR_NAME, PR.SALE_PRICE, PR.PRICE_1, PR.PRICE_2, PR.PRICE_3,'
              + ' PR.PRICE_4, PR.PRICE_5, PR.PRICE_6, PR.PRICE_7, PR.PRICE_8, PR.PRICE_9, '
              + 'PR.VEND_PRICE, T.KKM_SECT, P.KOLVO, P.REG, IIF(SUM(O.KOLVO) is null,  0, '
              + 'SUM(O.KOLVO)) as OSTATOK, P.AUTOR_KOD, A.SCLAD, T.VEND_ITEM, P.BARCODE, P.PRICE';
            SelectSQL[1]:= 'from POS_TMP_SALES P left join SPR_Tovar T on P.ITEM = T.ITEM'
              + ' left join TOVAR_OST O on O.ITEM = P.ITEM and O.MARKET_CODE = ' + IntToStr(CurrentMarketCode);
            SelectSQL[2]:= 'left join PRICES PR on T.ITEM = PR.ITEM left join TOVAR_ADD A '
              + 'on A.ITEM = T.ITEM and PR.MARKET_CODE = ' + IntToStr(CurrentMarketCode);
            SelectSQL[3]:= 'where P.AUTOR_KOD = ' + IntToStr(User_ID);
            'group by P.ITEM, T.TOVAR_NAME, PR.SALE_PRICE, PR.PRICE_1, PR.PRICE_2, PR.PRICE_3, PR.PRICE_4, '
            'PR.PRICE_5, PR.PRICE_6, PR.PRICE_7, PR.PRICE_8, PR.PRICE_9, PR.VEND_PRICE, T.KKM_SECT, P.REG, '
            'P.AUTOR_KOD, P.KOLVO, A.SCLAD, T.VEND_ITEM, P.BARCODE, P.PRICE'
}
            Open;
            ToolButton1.Click;  // Устанавливаем выбор цен РОЗНИЦА
            EnableControls;
          end;
          UserInputEdit.Enabled:= True;
        end;

      end;
      Close;
    end;
//  end;
end;

function CheckKKMStatus(KKM: Integer): Integer;
var CheckTimeout: Integer;
begin  // Проверка состояния ККМ
  case KKM of
    1: case KKM1_Type of
        2: begin // ШТРИХ ON LINE
    //         SaleFrm.Timer1.Enabled:= True;
             CheckKKMStatusTimeout:= 0;
             CheckTimeout:= ShopIni.ReadInteger('KKM1', 'CheckStatusTimeout', 20);
             while(Drv1.ECRAdvancedMode <> 0)and(CheckKKMStatusTimeout < CheckTimeout)do
             begin
               Drv1.GetECRStatus;
               Application.ProcessMessages;
               case Drv1.ECRAdvancedMode of
             1,2: begin
    //                SaleFrm.Timer1.Enabled:= False;
                    MessageDlg('Закончилась кассовая лента. Замените её и нажмите ОК', mtWarning, [mbOK], 0);
    //                SaleFrm.Timer1.Enabled:= True;
                  end;
               3: Drv1.ContinuePrint;
               end;
             end;
             Result:= Drv1.ECRAdvancedMode;
    //         SaleFrm.Timer1.Enabled:= False;
           end;
      100: begin // Эмулятор ККМ
             Result:= 0;
           end;
      110: begin // Нефискальный принтер
             Result:= 0;
           end;
       else Result:= -1;
       end;
    2: case KKM2_Type of
        2: begin // ШТРИХ ON LINE
    //         SaleFrm.Timer1.Enabled:= True;
             CheckKKMStatusTimeout:= 0;
             CheckTimeout:= ShopIni.ReadInteger('KKM2', 'CheckStatusTimeout', 20);
             while(Drv2.ECRAdvancedMode <> 0)and(CheckKKMStatusTimeout < CheckTimeout)do
             begin
               Drv2.GetECRStatus;
               Application.ProcessMessages;
               case Drv2.ECRAdvancedMode of
             1,2: begin
    //                SaleFrm.Timer1.Enabled:= False;
                    MessageDlg('Закончилась кассовая лента. Замените её и нажмите ОК', mtWarning, [mbOK], 0);
    //                SaleFrm.Timer1.Enabled:= True;
                  end;
               3: Drv2.ContinuePrint;
               end;
             end;
             Result:= Drv1.ECRAdvancedMode;
    //         SaleFrm.Timer1.Enabled:= False;
           end;
      100: begin // Эмулятор ККМ
             Result:= 0;
           end;
      110: begin // Нефискальный принтер
             Result:= 0;
           end;
       else Result:= -1;
       end;
  end;
end;

procedure TSaleFrm.FormResize(Sender: TObject);
begin
//        Panel3.Width:= SaleFrm.Width - 23;
//        Panel3.Height:= SaleFrm.Height - 352;
 {
        Panel1.Width:= SaleFrm.Width - 23;
        Panel1.Top:= SaleFrm.Height - 325;
        UserInputEdit.Width:= SaleFrm.Width - 23;
        UserInputEdit.Top:= SaleFrm.Height - 156;
        }
end;

procedure TSaleFrm.OpenSmenItemClick(Sender: TObject);
begin
  if MessageDlg('Открыть новую смену', mtConfirmation, [mbYes,mbNo], 0) = idYes then
  begin
    with ShopMainForm.pFIBService do
    begin
      ExecSQLStr('insert into HDR_SMENS(MARKET_CODE, AUTOR_KOD, BEGIN_DATETIME)'
        + ' values (' + IntToStr(CurrentMarketCode) + ', ' + IntToStr(User_ID) + ', ''' + DateTimeToStr(Now) + ''')');

      ShopMainForm.pFIBDatabase1.Execute('delete from POS_TMP_SALES'
        + ' where MARKET_CODE = ' + IntToStr(CurrentMarketCode));

      if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.Commit;
      SprFrmFree;
      SelectSQL.Clear;
      SelectSQL.Add('select * from HDR_SMENS');
      SelectSQL.Add('where MARKET_CODE = ' + IntToStr(CurrentMarketCode));
      SelectSQL.Add('and END_DATETIME is null');
      Open;
      if not VarIsNull(ShopMainForm.pFIBService['SMENS_KOD']) then
      begin
        ActiveSmenKod:= ShopMainForm.pFIBService['SMENS_KOD'];
        UserInputEdit.Enabled:= True;
        OpenSmenItem.Enabled:= False;
        CloseSmenItem.Enabled:= True;
        ReportsItem.Enabled:= True;
        N4.Enabled:= True;
        N14.Enabled:= True;
        SaleFrm.Caption:= 'Смена открыта';
        UserInputEdit.SetFocus;
      end;
      Close;
    end;
  end;
end;

procedure TSaleFrm.Panel5Resize(Sender: TObject);
begin
  PrintLastCheckBtn.Top:= Memo1.Top + Memo1.Height - PrintLastCheckBtn.Height;
end;

procedure TSaleFrm.PrintLastCheckBtnClick(Sender: TObject);
var SelKKM: Integer;
begin
  with ShopMainForm.frxReport1 do
  begin
    if KKM1SpeedButton.Down then SelKKM:= 1 else SelKKM:= 2; // Загружаем шаблон товарного чека для выбранной ККМ
    LoadFromFile(ShopIni.ReadString('Reports', 'TovarCheck_KKM' + SelKKM.ToString, ReportsPath + 'TovarCheck.fr3'));

    Script.Variables['User_ID']:= -1;
    ShowReport;
    UserInputEdit.SetFocus;
  end;
end;

procedure TSaleFrm.CloseCheckNoPrintSpeedButtonClick(Sender: TObject);
var key: Word;
begin
  KKM_PrintCheck:= False;
  key:= VK_ADD;      // CloseCheckSpeedButton
  UserInputEditKeyDown(Sender,  key, []);
end;

procedure TSaleFrm.CloseCheckSpeedButtonClick(Sender: TObject);
var key: Word;
begin
  case (Sender as TSpeedButton).Tag of
   10: key:= VK_ADD;      // CloseCheckSpeedButton
   11: key:= VK_INSERT;   // CatalogChangeSpeedButton
   12: key:= VK_UP;       // MoveUpSpeedButton
   13: key:= VK_DOWN;     // MoveDownSpeedButton
   14: key:= VK_SUBTRACT; // DelPosSpeedButton
   15: key:= VK_F5;       // FavoriteItemsSpeedButton
   16: key:= VK_MULTIPLY; // MultiplySpeedButton
  end;
  UserInputEditKeyDown(Sender,  key, []);
end;

procedure TSaleFrm.CloseSmenItemClick(Sender: TObject);
begin
  if MessageDlg('Закрыть текущую смену', mtConfirmation,
     [mbYes,mbNo], 0) = idYes then
  begin
//    N19.Click; // Сменный отчет с гашением
//    if KKM1_Ready and (MessageDlg('Снять отчет с гашением ' + KKM1_Name + ' ?', mtConfirmation, [mbYes, mbNo], 0) = IDYES) then
    if KKM1_Enable then KKM_ReportWithCleaning(1);

//    if KKM2_Ready and (MessageDlg('Снять отчет с гашением ' + KKM2_Name + ' ?', mtConfirmation, [mbYes, mbNo], 0) = IDYES) then
    if KKM2_Enable then KKM_ReportWithCleaning(2);

    CloseSmen; // Закрываем смену

    if ShopIni.ReadBool('BackUp', 'BackUp', False)then BaseBackUp; // Резервное копирование базы
  end;
end;

{*******************************************************************************}
{                           Проверка готовности ККМ                             }
{*******************************************************************************}
function CheckKKMReady4Reg(KKM: Integer): Integer;
begin
{

       if (KKM_Err(Drv.Connect) <> 0)then // Проверяем подключение
        MessageDlg('(' + IntToStr(Drv.ResultCode) + ')' + Drv.ResultCodeDescription, mtError, [mbOK], 0)
      else if CheckKKMStatus = 0 then
              case KKM_Err(Drv.ECRMode) of
         1,2,3,4,8: begin
  // 1 - Выдача данных, 2 - Открытая смена, 24 часа не кончились, 3 - Открытая смена, 24 часа кончились,
  // 4 - Закрытая смена, 3 - Открытая смена, 24 часа кончились, 8 - открытый документ
                     OpenSmenItem.Enabled:= False;
                     KKM_SmensEnd:= Drv.ECRMode = 3; //3 - 24 часа кончились
                     KKM_OpenDoc:= Drv.ECRMode = 8; // 8 - открытый документ
                     KKM_Enable:= True;
                   end;
            10: if MessageDlg('Завершить тестовый прогон ?',
                     mtConfirmation, [mbYes,mbNo], 0) = idYes then KKM_Err(Drv.InterruptTest);
             else
               MessageDlg('(' + IntToStr(Drv.ResultCode) + ')' + Drv.ECRModeDescription, mtWarning, [mbOK], 0);
             end;

 }
{
  case KKM_Type of
    2: begin // ШТРИХ ON LINE
         SaleFrm.Timer1.Enabled:= True;
         CheckKKMStatusTimeout:= 0;
         CheckTimeout:= ShopIni.ReadInteger('KKM', 'CheckStatusTimeout', 20);
         while(Drv.ECRAdvancedMode <> 0)and(CheckKKMStatusTimeout < CheckTimeout)do
         begin
           Drv.GetECRStatus;
           Application.ProcessMessages;
           case Drv.ECRAdvancedMode of
         1,2: begin
                SaleFrm.Timer1.Enabled:= False;
                MessageDlg('Закончилась кассовая лента. Замените её и нажмите ОК', mtWarning, [mbOK], 0);
                SaleFrm.Timer1.Enabled:= True;
              end;
           3: Drv.ContinuePrint;
           end;
         end;
         Result:= Drv.ECRAdvancedMode;
         SaleFrm.Timer1.Enabled:= False;
       end;
 }
{
    ECRMode ---------------------------------------------------------------
0 - Принтер в рабочем режиме
1 - Выдача данных
2 - Открытая смена, 24 часа не кончились,
3 - Открытая смена, 24 часа кончились
4 - Закрытая смена,
5 - Блокировка по неправильному паролю налогового инспектора
6 - Ожидание подтверждения ввода даты
7 - Разрешение изменения положения десятичной точки
8 - Открытый документ
    ECRMode8Status --------------------------------------------------------
      0 - Открыт чек продажи
      1 - Открыт чек покупки
      2 - Открыт чек возврата продажи
      3 - Открыт чек возврата покупки
9 - Режим разрешения технологического обнуления
10 - Тестовый прогон
11 - Печать полного фискального отчета
12 - Печать длинного отчета ЭКЛЗ
13 - Работа с фискальным подкладным документом
14 - Печать подкладного документа
15 - Фискальный подкладной документ сформирован

ECRAdvancedMode----------------------------------------------
0 - Бумага есть – ККТ не в фазе печати операции – может принимать от хоста
    команды, связанные с печатью на том ленте, датчик которой сообщает о
    наличии бумаги.
1 - Пассивное отсутствие бумаги – ККМ не в фазе печати операции – не
    принимает от хоста команды, связанные с печатью на том ленте, датчик
    которой сообщает об отсутствии бумаги.
2 - Активное отсутствие бумаги – ККМ в фазе печати операции – принимает
    только команды, не связанные с печатью. Переход из этого подрежима
    только в подрежим 3.
3 - После активного отсутствия бумаги – ККМ ждет команду продолжения
    печати. Кроме этого принимает команды, не связанные с печатью.
4 - Фаза печати операции длинного отчета (полные фискальные отчеты, полные
    отчеты ЭКЛЗ, печать контрольных лент из ЭКЛЗ) – ККМ не принимает от
    хоста команды, связанные с печатью, кроме команды прерывания печати.
5 - Фаза печати операции – ККМ не принимает от хоста команды, связанные с
    печатью.

}

    Result:= 0;
    case KKM of
    1:case KKM1_Type of
        2: begin
             KKM_Err(Drv1.GetECRStatus, 1,'GetECRStatus'); // Проверка состояния ККМ
                    // Смена должна быть открыта
             if not Drv1.ECRMode in [2, 4]then // 2 - Открытая смена, 24 часа не кончились, 4 - Закрытая смена
             begin
               Drv1.Password:= 30; // Пароль администратора
{                 if Drv1.ECRMode = 4 then // 4 - Закрытая смена
                   KKM_Err(Drv1.OpenSession, 1, 'OpenSession') // Открываем смену
               else // Чек должен быть закрыт
}                 if Drv1.ECRMode = 8 then // 8 - Открытый документ
                   KKM_Err(Drv1.SysAdminCancelCheck, 1, 'SysAdminCancelCheck');
               KKM_Err(Drv1.GetECRStatus, 1, 'GetECRStatus');

               Drv1.Password:= User_KKM_Pass; // Пароль ККМ текущего пользователя
             end;

             if not Drv1.ECRMode in [2, 4] then // 2 - Открытая смена, 24 часа не кончились, 4 - Закрытая смена
             begin
               KKM1_Ready:= False;
               MessageDlg('Ошибка ККМ ' + #13#10 + Drv1.ECRModeDescription, mtError, [mbOK], 0);
               Result:= Drv1.ErrorCode;
             end
             else KKM1_Ready:= True;
           end;
        100: begin
               KKM1_Ready:= True; // Эмулятор ККМ
           end;

        110: begin // Написать проверку состояния !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
               KKM1_Ready:= True; //  Нефискальный принтер
           end;
      end;
    2:case KKM2_Type of
        2: begin
             KKM_Err(Drv2.GetECRStatus, 2,'GetECRStatus'); // Проверка состояния ККМ
                    // Смена должна быть открыта
             if not Drv1.ECRMode in [2, 4] then // 2 - Открытая смена, 24 часа не кончились, 4 - Закрытая смена
             begin
               Drv2.Password:= 30; // Пароль администратора

{               if Drv2.ECRMode = 4 then  // 4 - Закрытая смена
                 KKM_Err(Drv2.OpenSession, 2, 'OpenSession') // Открываем смену
               else // Чек должен быть закрыт
 }                if Drv2.ECRMode = 8 then // 8 - Открытый документ
                   KKM_Err(Drv2.SysAdminCancelCheck, 2, 'SysAdminCancelCheck');
               KKM_Err(Drv2.GetECRStatus, 2, 'GetECRStatus');

               Drv2.Password:= User_KKM_Pass; // Пароль ККМ текущего пользователя
              end;

             if not Drv1.ECRMode in [2, 4] then // 2 - Открытая смена, 24 часа не кончились, 4 - Закрытая смена
             begin
               KKM2_Ready:= False;
               MessageDlg('Ошибка ККМ ' + #13#10 + Drv2.ECRModeDescription, mtError, [mbOK], 0);
               Result:= Drv2.ErrorCode;
             end
             else KKM2_Ready:= True;
           end;
        100: begin
               KKM2_Ready:= True; // Эмулятор ККМ
           end;

        110: begin // Написать проверку состояния !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
               KKM2_Ready:= True; //  Нефискальный принтер
           end;
      end;
    end;

end;


{*******************************************************************************}
{                         Регистрация позиций и закрытие чека                   }
{*******************************************************************************}
function KKM_RegAndClose: Integer;
var SelectKKMNumber, SprItem,ItemStr,OperID,Price_Field,TmpString: String;
    RegDone, KKMReady, PinPadChek: Boolean;
    SelectKKM, CurKKMType, CheckNumber, PayType, PinpadOperation, i: Integer;
    TmpDSep: Char;
    PosSum, EnterCheckSum: Double;
    PinPad: TPinPad;
    PinPad2KKMStr, PinPadStr: TStrings;
    CurDrv: TDrvFR;
    Memo1, Memo2, Memo3, Memo4, Memo5: TfrxMemoView;
    Barcode2D: TfrxBarcode2DView;
begin
  try
    SaleFrm.TmpSales.DisableControls;
    RegDone:= True;
    CheckNumber:= 0;
    if SaleFrm.KKM1SpeedButton.Down then
    begin  // Записываем номер выбранной ККМ
      SelectKKM:= 1;
      SelectKKMNumber:= KKM1_Number;
    end
    else
    begin
      SelectKKM:= 2;
      SelectKKMNumber:= KKM2_Number;
    end;

    EnterCheckSum:= StrToFloat('0' + EnterMoneyFrm.MoneyEdit.Text);
    PinPadChek:= False;
    PinPadStr:= TStringList.Create;
    PinPad2KKMStr:= TStringList.Create;
    PinPadStr.Clear;
    PinPad2KKMStr.Clear;

    if SaleFrm.N24.Checked then
      PayType:= 1  // Наличная оплата
    else
    begin
      PayType:= 2; // Оплата картой
      if Pinpad_Enabled then
      begin
        PinPad:= TPinPad.Create;
        if PinPad.TestPinPad <> 0 then
        begin
          MessageDlg('Ошибка при подключении терминала', mtError, [mbOK], 0);
          raise Exception.create('Ошибка при подключении терминала');
        end;
      end;
    end;

    if(CheckKKMReady4Reg(SelectKKM) <> 0)then // Проверяем готовность выбранной ККМ
    begin
      MessageDlg('Ошибка при подключении KKM', mtError, [mbOK], 0);
      raise Exception.create('KKM not found');
    end;

    if((PayType = 2)and Pinpad_Enabled)then // Если безналичная оплата и используем терминал
    begin
      if SaleFrm.SaleItem.Checked then
        PinpadOperation:= OP_PURCHASE   // 1 - Оплата покупки
      else
        PinpadOperation:= OP_RETURN;  // 3 - Возврат либо отмена покупки

      PinPadChek:= PinPad.CardAuth9(EnterCheckSum, PinpadOperation) = 0;  // Авторизация карты

      if (PinPadChek and(PinpadOperation = OP_PURCHASE))then // Если ОПЛАТА
        PinPadChek:= PinPad.SuspendTrx(EnterCheckSum, PinPad.AuthCode) = 0; // Если оплата прошла cтавим транзакцию на паузу

      if not PinPadChek then // иначе отменяем транзакцию
      begin
       // PinPad.RollBackTrx(EnterCheckSum, PinPad.AuthCode);
        if (PinPad.LastError = 2000) then // Если 2000 'Операция прервана нажатием клавиши ОТМЕНА';
            Abort
        else
//          ShowMessage('Не удалось совершить операцию по терминалу (' + PinPad.LastError.ToString + ')');
          raise Exception.create(PinPad.GetMessageText(PinPad.LastError));
      end;

    end;

    case SelectKKM of
      1: begin
           CurKKMType:= KKM1_Type;
           if KKM1_Type = 2 then CurDrv:= Drv1; // Если ККМ 1 и Штрих поключаем Drv1
         end;
      2: begin
           CurKKMType:= KKM2_Type;
           if KKM2_Type = 2 then CurDrv:= Drv2; // Если ККМ 2 и Штрих поключаем Drv2
         end;
    end;

    case CurKKMType of // Выдача чека чека
      2: begin
        CurDrv.TableNumber:= 17;
        CurDrv.RowNumber:= 1;
        CurDrv.FieldNumber:= 7;
        if KKM_PrintCheck then CurDrv.ValueOfFieldInteger:= 0    // Печатать документы
        else CurDrv.ValueOfFieldInteger:= 1; // Не печатать следующий документ
        CurDrv.WriteTable;
      end;

    end;

    case CurKKMType of // Регистрируем позиции чека
      2: with SaleFrm.TmpSales do
         begin
           First;

           if SaleFrm.SaleItem.Checked then
             CurDrv.CheckType:= 0   // Продажа
           else
             CurDrv.CheckType:= 2;  // Возврат продажи

           CurDrv.OpenCheck; // Открываем чек

           while not Eof do  // Позиции чека
           begin
             CurDrv.Quantity:= SaleFrm.TmpSales['KOLVO'];
             if SaleFrm.N17.Checked and SaleFrm.N17.Visible then // Если режим СКИДКА и выбрана ПРОДАЖА "СКИДКА В КАРМАН"
               CurDrv.Price:= SaleFrm.TmpSales['SALE_PRICE']
             else
               CurDrv.Price:= SaleFrm.TmpSales['PRICE'];
             CurDrv.Department:= SaleFrm.TmpSales['KKM_SECT'];

             CurDrv.TaxValueEnabled:= False; // Налог мы не рассчитываем
             CurDrv.Tax1:= ShopIni.ReadInteger('KKM'+ SelectKKM.ToString, IntToStr(SaleFrm.TmpSales['KKM_SECT']) + '_Tax1', 0);
             // 0 - БЕЗ НДС, 1 - НДС 18%, 2 - НДС 10%, 3 - НДС 0%, 4 - БЕЗ НДС, 5 - НДС 18/118, 6 - НДС 10/110


             if (ShopIni.ReadBool('KKM'+ SelectKKM.ToString, 'SkipMaslo', False)and( Pos('МАСЛО ', SaleFrm.TmpSales['TOVAR_NAME']) > 0)) then
               CurDrv.StringForPrinting:= 'МАСЛО Т'
             else
               CurDrv.StringForPrinting:= SaleFrm.TmpSales['TOVAR_NAME'];


             if SaleFrm.TmpSales['BARCODE'] <> '' then
             begin            // Data Matrix 3
               CurDrv.PaymentItemSign:= 2; // Признак предмета расчета (Подакцизный товар) // Необходим для ФФД 1.05
               CurDrv.BarCode:= SaleFrm.TmpSales['BARCODE'];
               CurDrv.FNSendItemBarcode;
             end
             else CurDrv.PaymentItemSign := 1; // Признак предмета расчета (Товар) // Необходим для ФФД 1.05

             CurDrv.PaymentTypeSign:= 4; // Признак способа расчета (Полный расчет) // Необходим для ФФД 1.05
            {            //Код страны происхождения
                    Driver.TagNumber = 1230;
                    Driver.TagType = 7;
                    Driver.TagValueLength = 3;
                    Driver.TagValueStr = "460";
                    Driver.FNSendTagOperation();

                    //Номер таможенной декларации
                    Driver.TagNumber = 1231;
                    Driver.TagType = 7;
                    Driver.TagValueLength = 3;
                    Driver.TagValueStr = "111/22222/555555";
                    Driver.FNSendTagOperation();

                    //Акциз
                    Driver.TagNumber = 1229;
                    Driver.TagType = 3;
                    Driver.TagValueLength = 6;
                    Driver.TagValueVLN = "12345";
                    Driver.FNSendTagOperation();
            }


             KKM_Err(CurDrv.FNOperation, SelectKKM, 'FNOperation Пробиваем позицию');  // Пробиваем позицию

             if(CurDrv.ResultCode <> 0)then
             begin
               MessageDlg(CurDrv.ResultCodeDescription, mtError, [mbOK], 0);
               RegDone:= False;// Ошибка при регистрации
               raise Exception.create('Ошибка при регистрации позиций чека');
             end;
             Next;
           end;

         end;
       100: ;// Эмулятор ККМ
       110:with SaleFrm.TmpSales do // Нефискальный принтер
           begin
             First;
             SaleFrm.frxReport1.LoadFromFile(ShopIni.ReadString('Reports', 'Check_KKM' + SelectKKM.ToString, ReportsPath + 'Check.fr3'));
             Memo1:= SaleFrm.frxReport1.FindObject('Memo1') as TfrxMemoView;
             Memo2:= SaleFrm.frxReport1.FindObject('Memo2') as TfrxMemoView;
             Memo3:= SaleFrm.frxReport1.FindObject('Memo3') as TfrxMemoView;
             Memo4:= SaleFrm.frxReport1.FindObject('Memo4') as TfrxMemoView;
             Memo5:= SaleFrm.frxReport1.FindObject('Memo5') as TfrxMemoView;

// Заголовок чека
             Memo1.Lines.Clear;
             Memo1.Lines.Add('  АВОЗАПЧАСТИ');
             Memo1.Lines.Add('ДОБРО ПОЖАЛОВАТЬ !');

             TmpString:= '#' + (ShopIni.ReadInteger('KKM' + SelectKKM.ToString, 'FDNumber', 0) + 7).ToString;
             while Length(TmpString) < 9 do TmpString:= ' ' + TmpString; // Дополняем слева пробелами до 9 символов
             Memo1.Lines.Add('ЗН ККТ:0333380009045492' + TmpString);

             Memo1.Lines.Add('ИНН:712400062280  ' + FormatDateTime('dd.mm.YY HH:nn', Now));
             Memo1.Lines.Add(User_Name);
             if SaleFrm.SaleItem.Checked then
               Memo1.Lines.Add('КАССОВЫЙ ЧЕК/ПРИХОД')   // Продажа
             else
               Memo1.Lines.Add('КАССОВЫЙ ЧЕК/ВОЗВРАТ');  // Возврат продажи
             Memo1.Lines.Add('РН ККТ:0002650702049137');
             Memo1.Lines.Add('ФН:9960440301520380');
             Memo1.Lines.Add('Сайт ФНС:           www.nalog.ru');
             Memo1.Lines.Add('СМЕНА:' + ActiveSmenKod.ToString
                   + ' ЧЕК: ' + (ShopIni.ReadInteger('KKM' + SelectKKM.ToString, 'CheckNumber', 0) + 1).ToString);
             Memo1.Lines.Add('ИП САНКИН АНАТОЛИЙ ВАСИЛЬЕВИЧ');
             Memo1.Lines.Add('71-Тульская область, р-н Воловск');
             Memo1.Lines.Add('ий, 301570, п Волово, ул Слепцов');
             Memo1.Lines.Add('а, д 50а, торг зал 1');
             Memo1.Lines.Add('МЕСТО РАСЧЕТОВ  м-н Автозапчасти');
             Memo1.Lines.Add(' Торговый зал');
// Позиции чека
             Memo2.Lines.Clear;
             while not Eof do
             begin
               // Название товара
               if (ShopIni.ReadBool('KKM'+ SelectKKM.ToString, 'SkipMaslo', False)and( Pos('МАСЛО ', SaleFrm.TmpSales['TOVAR_NAME']) > 0)) then
                 Memo2.Lines.Add('МАСЛО Т')
               else
                 if Length(SaleFrm.TmpSales['TOVAR_NAME'])> 32 then
                   Memo2.Lines.Add(Copy(SaleFrm.TmpSales['TOVAR_NAME'], 0, 32))
                 else Memo2.Lines.Add(SaleFrm.TmpSales['TOVAR_NAME']);

               // Количество и цена
               TmpString:= FloatToStrF(SaleFrm.TmpSales['KOLVO'], ffFixed, 15, 3) + ' Х ';
               if SaleFrm.N17.Checked and SaleFrm.N17.Visible then // Если режим СКИДКА и выбрана ПРОДАЖА "СКИДКА В КАРМАН"
                 TmpString:= TmpString + FloatToStrF(SaleFrm.TmpSales['SALE_PRICE'], ffFixed, 15, 2)
               else
                 TmpString:= TmpString + FloatToStrF(SaleFrm.TmpSales['PRICE'], ffFixed, 15, 2);

               while Length(TmpString) < 32 do TmpString:= ' ' + TmpString; // Дополняем слева пробелами до 32 символов
               Memo2.Lines.Add(TmpString);

               // Сумма позиции
               if SaleFrm.N17.Checked and SaleFrm.N17.Visible then // Если режим СКИДКА и выбрана ПРОДАЖА "СКИДКА В КАРМАН"
                 TmpString:= FloatToStrF(SaleFrm.TmpSales['KOLVO'] * SaleFrm.TmpSales['SALE_PRICE'], ffFixed, 15, 2)
               else
                 TmpString:= FloatToStrF(SaleFrm.TmpSales['KOLVO'] * SaleFrm.TmpSales['PRICE'], ffFixed, 15, 2);

               TmpString:= '|' + TmpString + '_Г';
               while Length(TmpString) < 32 do TmpString:= ' ' + TmpString; // Дополняем слева пробелами до 32 символов
               Memo2.Lines.Add(TmpString);

               Next;
             end;
             Memo3.Lines.Clear;

{var Page1: TfrxReportPage;
    Band1: TfrxBand;
    DataBand1: TfrxMasterData;
    Memo1: TfrxMemoView;
    i,j,k: Integer;
    CurPos: TBookmark;
begin
     with frxReport2 do
     begin
       ZakazQuery.DisableControls;
       CurPos:= ZakazQuery.GetBookmark;
       LoadFromFile(ReportsPath + 'CrossRep.fr3');
       Page1:= FindObject('Page1') as TfrxReportPage;

       Memo1 := frxReport1.FindObject('Memo1') as TfrxMemoView;
}
           end;
    end;

  //***************************************************************************************************
      if PinPadChek then   // Если есть чек терминала
        begin // Выделяем чек терминала
          PinPadStr.Clear;
          PinPad2KKMStr.Clear;
          PinPadStr.Text:= PinPad.Cheque;
        // Выделяем чек терминала
          for i:= 0 to PinPadStr.Count - 1 do
          begin
            PinPad2KKMStr.Add(PinPadStr[i]);
            if (PinPadStr[i] = '================================') then Break;
          end;

          // Добавляем заголовок
          PinPad2KKMStr.Insert(4, 'Копия 1 ');
          PinPad2KKMStr.Insert(5, '--------------------------------');
          PinPad2KKMStr.Insert(6, '       БАНКОВСКИЕ ОПЛАТЫ        ');
          PinPad2KKMStr.Insert(7, '--------------------------------');

          //          KKM_PrintStrings(PinPad2KKMStr.Text);

          case CurKKMType of // Печатаем чек терминала в чеке ККМ
            2: for i:= 5 to PinPad2KKMStr.Count - 1 do
               begin
                 if ShopIni.ReadBool('KKM'+ SelectKKM.ToString, 'ShiftRigth', False) then
                   CurDrv.StringForPrinting:= '  ' + PinPad2KKMStr[i]
                 else
                   CurDrv.StringForPrinting:= PinPad2KKMStr[i];
                 CurDrv.WaitForPrinting;
                 KKM_Err(CurDrv.PrintString, SelectKKM, 'чек терминала в чеке ККМ');
               end;
          100: ;// Эмулятор ККМ
          110: begin // Нефискальный принтер
                  // Добавляем в чек ККМ чек терминала
                 for i:= 5 to PinPad2KKMStr.Count - 1 do
                   Memo3.Lines.Add(PinPad2KKMStr[i]);
               end;
          end;
          // Удаляем заголовок
          PinPad2KKMStr.Delete(5);
          PinPad2KKMStr.Delete(5);
          PinPad2KKMStr.Delete(5);
        end;
  //***************************************************************************************************

    case CurKKMType of // Закрываем чек
      2: begin
           if SaleFrm.N27.Checked then
              // Дополнительные реквизиты чека
              // Передаем сведения о покупателе
            begin
              CurDrv.TagNumber:= 1256;
              KKM_Err(CurDrv.FNBeginSTLVTag, SelectKKM, 'FNBeginSTLVTag');

              while Length(EnterMoneyFrm.INNBuyerEdit.Text) < 12 do EnterMoneyFrm.INNBuyerEdit.Text:= EnterMoneyFrm.INNBuyerEdit.Text + ' '; // Дополняем справа пробелами до 12 символов
              CurDrv.TagNumber:= 1228;
              CurDrv.TagType:= 7;
              CurDrv.TagValueStr:= EnterMoneyFrm.INNBuyerEdit.Text;  // Указываем ИНН покупателя
              KKM_Err(CurDrv.FNSendTag, SelectKKM, 'FNSendTag 1228 Указываем ИНН покупателя');

              CurDrv.TagNumber:= 1227;
              CurDrv.TagType:= 7;
              CurDrv.TagValueStr:= EnterMoneyFrm.NameBuyerEdit.Text; // Указываем Наименование покупателя
              KKM_Err(CurDrv.FNSendTag, SelectKKM, 'FNSendTag 1227 Указываем Наименование покупателя');

              CurDrv.TagNumber:= 1256;
              KKM_Err(CurDrv.FNSendSTLVTag, SelectKKM, 'FNSendSTLVTag');
            end;
{
  BeginSTLVTag(1256);
  AddTagStr(1227, 'Иванов Иван Иванович'); // Покупатель
  AddTagStr(1228, '526317984689'); // ИНН покупателя
  AddTagstr(1243, FormatDateTime('dd.mm.yyyy', EncodeDate(1980, 1, 1))); // Д.р. покупателя
  AddTagStr(1244, '643'); // гразданство покупателя
  AddTagStr(1245, '21'); // Вид документа удост. личность
  AddTagStr(1246, '1234 123456'); // Данные документа
  AddTagStr(1254, 'Москва'); // Адрес покупателя
  SendSTLVTag(1256);


}
           CurDrv.StringForPrinting:= '';
//           CheckNumber:= Drv.OpenDocumentNumber + 1;

           CurDrv.Summ1:= 0;
           CurDrv.Summ2:= 0;
           CurDrv.Summ3:= 0;
           CurDrv.Summ4:= 0;
           CurDrv.Summ5:= 0;
           CurDrv.Summ6:= 0;
           CurDrv.Summ7:= 0;
           CurDrv.Summ8:= 0;
           CurDrv.Summ9:= 0;
           CurDrv.Summ10:= 0;
           CurDrv.Summ11:= 0;
           CurDrv.Summ12:= 0;
           CurDrv.Summ13:= 0;
           CurDrv.Summ14:= 0;
           CurDrv.Summ15:= 0;
           CurDrv.Summ16:= 0;

           CurDrv.TaxValue1:= 0; // Налоги мы не считаем
           CurDrv.TaxValue2:= 0;
           CurDrv.TaxValue3:= 0;
           CurDrv.TaxValue4:= 0;
           CurDrv.TaxValue5:= 0;
           CurDrv.TaxValue6:= 0;
           CurDrv.RoundingSumm:= 0; // Сумма округления
  //          KKMOleObject.TaxType := 1; // Основная система налогообложения

           if PayType = 1 then CurDrv.Summ1:= EnterCheckSum // Наличная оплата
           else CurDrv.Summ2:= CheckSum;  // Карта


           if (CurDrv.FNCloseCheckEx <> 0) then
             begin
               RegDone:= False;// Ошибка при регистрации
               KKM_Err(CurDrv.ResultCode, SelectKKM, 'FNCloseCheckEx');
              // MessageDlg(CurDrv.ResultCodeDescription, mtError, [mbOK], 0);
               raise Exception.create('Ошибка при закрытии чека. ' + CurDrv.ResultCodeDescription);
             end;
           CheckNumber:= CurDrv.DocumentNumber;
         end;
    100: with ShopMainForm.pFIBService do // Эмулятор ККМ
         begin
           SelectSQL.Clear;
           SelectSQL.Add('select max(NCHECK) MAXCHECK from POS_SALES');
           Open;
           if VarIsNull(ShopMainForm.pFIBService['MAXCHECK'])then CheckNumber:= 1
           else CheckNumber:= ShopMainForm.pFIBService['MAXCHECK'] + 1;
           Close;
         end;
    110: with ShopMainForm.pFIBService do // Нефискальный принтер чеков
         begin // Считываем номер последнего ФД документа
           CheckNumber:= ShopIni.ReadInteger('KKM' + SelectKKM.ToString, 'FDNumber', 0) + 1;

           TmpString:= '|' + FloatToStrF(CheckSum, ffFixed, 15, 2); // Сумма чека
           while Length(TmpString) < 12 do TmpString:= ' ' + TmpString; // Дополняем слева пробелами до 12 символов
           Memo4.Lines.Clear;
           Memo4.Lines.Add('ИТОГ' + TmpString);

           Memo5.Lines.Clear;
           while Length(TmpString) < 17 do TmpString:= ' ' + TmpString; // Дополняем слева пробелами до 17 символов
           if PayType = 1 then
           begin
             Memo5.Lines.Add(' НАЛИЧНЫМИ     ' + TmpString);
             Memo5.Lines.Add('ПОЛУЧЕНО:');
             if EnterCheckSum > CheckSum then // Есть сдача
             begin
               TmpString:= '|' + FloatToStrF(EnterCheckSum, ffFixed, 15, 2); // Получено наличными
               while Length(TmpString) < 17 do TmpString:= ' ' + TmpString; // Дополняем слева пробелами до 17 символов
               Memo5.Lines.Add(' НАЛИЧНЫМИ     ' + TmpString);

               TmpString:= '|' + FloatToStrF(EnterCheckSum - CheckSum, ffFixed, 15, 2); // Сдача
               while Length(TmpString) < 17 do TmpString:= ' ' + TmpString; // Дополняем слева пробелами до 17 символов
               Memo5.Lines.Add(' СДАЧА         ' + TmpString);

               TmpString:= '|' + FloatToStrF(CheckSum, ffFixed, 15, 2);
               while Length(TmpString) < 17 do TmpString:= ' ' + TmpString; // Дополняем слева пробелами до 17 символов
             end
             else Memo5.Lines.Add(' НАЛИЧНЫМИ     ' + TmpString);
           end
           else
           begin
             Memo5.Lines.Add(' БЕЗНАЛИЧНЫМИ  ' + TmpString);
             Memo5.Lines.Add('ПОЛУЧЕНО:');
             Memo5.Lines.Add(' БЕЗНАЛИЧНЫМИ  ' + TmpString);
           end;

           Memo5.Lines.Add('Г:СУММА БЕЗ НДС' + TmpString);
           Memo5.Lines.Add('СНО:                      Патент');
           TmpString:= 'ФД:' + (ShopIni.ReadInteger('KKM' + SelectKKM.ToString, 'FDNumber', 0) + 1).ToString;
           while Length(TmpString) < 19 do TmpString:= TmpString + ' '; // Дополняем справа пробелами до 19 символов
           Memo5.Lines.Add(TmpString + 'ФП:2062406568');

            //  t=20220406T085600&s=260.00&fn=9960440301520380&i=4587&fp=2062406568&n=1
           Barcode2D:= SaleFrm.frxReport1.FindObject('Barcode2D1') as TfrxBarCode2DView;
           Barcode2D.Text:= 't=' + FormatDateTime('yyyymmdd"T"hhnnss', Now) + '&s=' + FloatToStrF(CheckSum, ffFixed, 15, 2)
             + 'fn=9960440301520380&i=' + (ShopIni.ReadInteger('KKM' + SelectKKM.ToString, 'FDNumber', 0) + 1).ToString
             + '&fp=2062406568&n=' + (ShopIni.ReadInteger('KKM' + SelectKKM.ToString, 'CheckNumber', 0) + 1).ToString;

           SaleFrm.frxReport1.PrintOptions.Printer:= KKM2_Name;
           SaleFrm.frxReport1.PrepareReport;
           if KKM_PrintCheck then SaleFrm.frxReport1.Print;
//           SaleFrm.frxReport1.ShowReport;
//             Печатаем чек
//           !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1

           ShopIni.WriteInteger('KKM' + SelectKKM.ToString, 'CheckNumber', ShopIni.ReadInteger('KKM' + SelectKKM.ToString, 'CheckNumber', 0) + 1); // Увеличиваем счетчик чеков
           ShopIni.WriteInteger('KKM' + SelectKKM.ToString, 'FDNumber', ShopIni.ReadInteger('KKM' + SelectKKM.ToString, 'FDNumber', 0) + 1); // Увеличиваем счетчик ФД
         end;
    end;

    if SaleFrm.SaleItem.Checked then OperID:= '0' else OperID:= '-1';
{
    case SaleFrm.ToolBar1.Tag of
      0: Price_Field:= 'SALE_PRICE';
      1: Price_Field:= 'PRICE_1';
      2: Price_Field:= 'PRICE_2';
      3: Price_Field:= 'PRICE_3';
      4: Price_Field:= 'PRICE_4';
      5: Price_Field:= 'PRICE_5';
      6: Price_Field:= 'PRICE_6';
      7: Price_Field:= 'PRICE_7';
      8: Price_Field:= 'PRICE_8';
      9: Price_Field:= 'PRICE_9';
    end;
 }
    // Перенос позиций из временной таблицы в таблицу смены
    ExecSQLStr('insert into POS_SALES(MARKET_CODE, SMENS_KOD, SALE_DATE, '
      + 'ITEM, KOLVO, SALE_PRICE, NCARD, AUTOR_KOD, NCHECK, PAY_TYPE)'
      + ' select ' + IntToStr(CurrentMarketCode) + ' MARKET_CODE, '
      + ActiveSmenKod.ToString + ' SMENS_KOD, ''' + DateTimeToStr(Now) + ''' SALE_DATE, '
//      + 'TMP.ITEM, SUM(TMP.KOLVO) KOLVO, P.' + Price_Field + ', ' + OperID + ' NCARD, '
      + 'TMP.ITEM, SUM(TMP.KOLVO) KOLVO, TMP.PRICE, ' + OperID + ' NCARD, '
      + SelectKKMNumber // Записываем в AUTOR_KOD номер ККМ
      + ', ' + CheckNumber.ToString + ' NCHEK, ' + PayType.ToString + ' PAY_TYPE'
//      + 'TMP.AUTOR_KOD, ' + CheckNumber.ToString + ' NCHEK, ' + PayType.ToString + ' PAY_TYPE'
      + ' from POS_TMP_SALES TMP left join SPR_TOVAR T on TMP.ITEM = T.ITEM'
      + ' left join PRICES P on P.ITEM = TMP.ITEM'
      + ' where TMP.AUTOR_KOD = ' + User_ID.ToString
      + ' and P.MARKET_CODE = ' + CurrentMarketCode.ToString
      + ' group by TMP.ITEM, TMP.AUTOR_KOD, TMP.PRICE');
//      + ' group by TMP.ITEM, TMP.AUTOR_KOD, P.' + Price_Field);



    // Вывод информации о чеке
    SaleFrm.Memo1.Lines.Clear;
    SaleFrm.Memo1.Lines.Add('ФД № ' + CheckNumber.ToString);
    if SaleFrm.SaleItem.Checked then SaleFrm.Memo1.Lines[0]:= SaleFrm.Memo1.Lines[0] + '(ПРОДАЖА,'
    else SaleFrm.Memo1.Lines[0]:= SaleFrm.Memo1.Lines[0] + '(ВОЗВРАТ продажи,';
    if PayType = 1 then SaleFrm.Memo1.Lines[0]:= SaleFrm.Memo1.Lines[0] + ' оплата НАЛИЧНЫМИ)'
    else SaleFrm.Memo1.Lines[0]:= SaleFrm.Memo1.Lines[0] + ' оплата КАРТОЙ)';



    with SaleFrm.TmpSales do
    begin
      First;
      SprItem:= '';
      if (Assigned(SprFrm) and not VarIsNull(SprFrm.SprTovar['ITEM']))then SprItem:= SprFrm.SprTovar['ITEM']; // Запоминаем позицию в справочнике
      while not Eof do
      begin
        if Assigned(SprFrm)then
        begin // Если справочник создан, обновляем сведения о товарах в справочнике
          SprFrm.SprTovar.Locate('ITEM', SaleFrm.TmpSales['ITEM'], []);
          SprFrm.SprTovar.Refresh;
        end;

        if SaleFrm.N17.Checked and SaleFrm.N17.Visible then
        // Скидка "в карман"
          SaleFrm.Memo1.Lines.Add(SaleFrm.TmpSales['ITEM'] + ' ' +
          SaleFrm.TmpSales['TOVAR_NAME'] + ' ' +
          FloatToStrF(SaleFrm.TmpSales['KOLVO'], ffFixed, 15, 3) + ' X ' +
          FloatToStrF(SaleFrm.TmpSales['SALE_PRICE'], ffCurrency, 15, 2))
        else
          SaleFrm.Memo1.Lines.Add(SaleFrm.TmpSales['ITEM'] + ' ' +
          SaleFrm.TmpSales['TOVAR_NAME'] + ' ' +
          FloatToStrF(SaleFrm.TmpSales['KOLVO'], ffFixed, 15, 3) + ' X ' +
//          FloatToStrF(SaleFrm.TmpSales[SaleFrm.DBGrid1.Columns[3].FieldName], ffCurrency, 15, 2));
          FloatToStrF(SaleFrm.TmpSales['PRICE'], ffCurrency, 15, 2));
        Next;
      end;
      if Assigned(SprFrm)then SprFrm.SprTovar.Locate('ITEM', SprItem, []); // Возвращаем позицию в справочнике
    end;
    SaleFrm.Memo1.Lines.Add('СУММА ЧЕКА : ' + FloatToStrF(CheckSum + Discont, ffCurrency, 15, 2));
    if Discont > 0 then
      SaleFrm.Memo1.Lines.Add('СКИДКА : ' + FloatToStrF(Discont, ffCurrency, 15, 2));
    SaleFrm.Memo1.Lines.Add('ОПЛАТА : ' + FloatToStrF(EnterCheckSum, ffCurrency, 15, 2));
    if EnterCheckSum > CheckSum then
      SaleFrm.Memo1.Lines.Add('СДАЧА : ' + FloatToStrF(EnterCheckSum - CheckSum, ffCurrency, 15, 2));


    // Добавление скидки в таблицу смены
    if SaleFrm.StaticText2.Visible then
    begin
      if SaleFrm.N17.Enabled and not SaleFrm.N17.Checked and SaleFrm.N17.Visible then Discont:= 0;
      ExecSQLStr('insert into POS_SALES(MARKET_CODE, SMENS_KOD, SALE_DATE, '
        + 'ITEM, KOLVO, SALE_PRICE, NCARD, AUTOR_KOD, COST_PRICE, VEND_PRICE, NCHECK, VENDOR_CODE, PAY_TYPE)'
        + ' values(' + IntToStr(CurrentMarketCode) + ', '
        + IntToStr(ActiveSmenKod) + ' , ''' + DateTimeToStr(Now) + ''', ''0'', 1, '
        + StringReplace(CurrToStr(Discont), ',', '.', []) + ', ''' + CardNumber + ''', '
        + SelectKKMNumber + ', 0, 0, ' + IntToStr(CheckNumber) + ', 0, '  + IntToStr(PayType) + ')');
    end;



    // Удаление позиций из временной таблицы
    ShopMainForm.pFIBDatabase1.Execute('delete from POS_TMP_SALES where AUTOR_KOD = ' + User_ID.ToString);

  finally
    if PinPadChek then // Если есть чек терминала
    begin
      if RegDone then  // Если ошибок нет
      begin
        if (PinpadOperation = OP_PURCHASE)then  PinPad.CommitTrx(EnterCheckSum, PinPad.AuthCode); // Если ОПЛАТА фиксируем транзакцию в терминале

        if ((PinPad2KKMStr.Text <> '')and((ShopIni.ReadBool('KKM'+ SelectKKM.ToString, 'PrintPinpadCheckCopy', True)or not SaleFrm.SaleItem.Checked)))then
          case CurKKMType of // Печатаем копию чека терминала на ККМ
           2: begin
              {
              ECRAdvancedMode----------------------------------------------
              0 - Бумага есть – ККТ не в фазе печати операции – может принимать от хоста
                  команды, связанные с печатью на том ленте, датчик которой сообщает о
                  наличии бумаги.
              1 - Пассивное отсутствие бумаги – ККМ не в фазе печати операции – не
                  принимает от хоста команды, связанные с печатью на том ленте, датчик
                  которой сообщает об отсутствии бумаги.
              2 - Активное отсутствие бумаги – ККМ в фазе печати операции – принимает
                  только команды, не связанные с печатью. Переход из этого подрежима
                  только в подрежим 3.
              3 - После активного отсутствия бумаги – ККМ ждет команду продолжения
                  печати. Кроме этого принимает команды, не связанные с печатью.
              4 - Фаза печати операции длинного отчета (полные фискальные отчеты, полные
                  отчеты ЭКЛЗ, печать контрольных лент из ЭКЛЗ) – ККМ не принимает от
                  хоста команды, связанные с печатью, кроме команды прерывания печати.
              5 - Фаза печати операции – ККМ не принимает от хоста команды, связанные с
                  печатью.
               }
{                for i:= 1 to 5 do
                begin
                  CurDrv.GetECRStatus;
                  if (CurDrv.ECRAdvancedMode = 0) then Break
                  else Sleep(500);
                end;
 }
                for i:= 1 to PinPad2KKMStr.Count - 1 do
                begin
                  if ShopIni.ReadBool('KKM'+ SelectKKM.ToString, 'ShiftRigth', False) then
                    CurDrv.StringForPrinting:= '  ' + PinPad2KKMStr[i]
                  else
                    CurDrv.StringForPrinting:= PinPad2KKMStr[i];
                  CurDrv.WaitForPrinting;
                  KKM_Err(CurDrv.PrintString, SelectKKM, 'PrintString; ECRAdvancedMode=' + CurDrv.ECRAdvancedMode.ToString);
                end;
                CurDrv.StringQuantity:= 5;
                CurDrv.FeedDocument;
                if ShopIni.ReadBool('KKM' + SelectKKM.ToString, 'CutCheck', False) then CurDrv.CutCheck;
                CurDrv.PrintCliche;
              end;

          100: ;//  Эмулятор ККМ

          110:begin // Нефискальный принтер
                 // Печатаем чек терминала !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              end;
          end;
      end
      else if (PinpadOperation = OP_PURCHASE)then PinPad.RollBackTrx(EnterCheckSum, PinPad.AuthCode);// Если ОПЛАТА отменяем транзакцию по терминалу
    end;

    if RegDone then
    begin
      ShopMainForm.pFIBTransaction1.CommitRetaining;
//      SaleFrm.TmpSales.CloseOpen(False);
      SaleFrm.TmpSales.ReopenLocate('ITEM');
      Result:= 0;
    end
    else
    begin
      SaleFrm.TmpSales.Locate('ITEM', ItemStr, []);
      SaleFrm.N4.Enabled:= False; // Режим
      Result:= -1;
    end;

    PinPad.Free;
    PinPad2KKMStr.Free;
    PinPadStr.Free;
    SaleFrm.TmpSales.EnableControls;
  end;
end;

procedure CloseSmen; // Закрытие кассовой смены
begin
    begin
      ShopMainForm.pFIBTransaction1.Active:= True;
      ShopMainForm.pFIBDatabase1.Execute('update HDR_SMENS'
        + ' set END_DATETIME = ''' + DateTimeToStr(Now) + ''''
        + ' where MARKET_CODE = ' + IntToStr(CurrentMarketCode)
        + ' and END_DATETIME is null');
      ShopMainForm.pFIBDatabase1.Execute('delete from QUEUE');
      ShopMainForm.pFIBDatabase1.Execute('SET GENERATOR GEN_QUEUE_NUMBER TO 0');
      ShopMainForm.pFIBTransaction1.Commit;
      SprFrmFree;
    end;
    SaleFrm.OpenSmenItem.Enabled:= True;
    SaleFrm.CloseSmenItem.Enabled:= False;
    SaleFrm.UserInputEdit.Enabled:= False;
    SaleFrm.ReportsItem.Enabled:= False;
    SaleFrm.N4.Enabled:= False;
    SaleFrm.N13.Enabled:= False;
    SaleFrm.N14.Enabled:= False;
    SaleFrm.Caption:= 'Смена закрыта';
end;


function InputBarCodeStr(var BarCodeStr: String): Boolean;
begin
{
	//Описание содержания кода:
	// - первая группа состоит из 14 цифр и содержит код товара;
	// - вторая группа состоит из 7 символов (цифр, строчных и прописных букв латинского алфавита, а также специальных символов) и содержит индивидуальный серийный номер упаковки табачной продукции;
	// - третья группа состоит из 4 символов (цифр,строчных и прописных букв латинского алфавита, а также специальных символов) и содержит в перекодированном виде максимальную розничную цену потребительской упаковки с точностью до одной копейки;
	// - четвертая группа состоит из 4 символов (цифр, строчных и прописных букв латинского алфавита, а также специальных символов) и содержит код проверки.

	//В данном случае содержание кода указано явно, для примера
	СодержаниеКодаDATAMATRIX = "046062030980264!2zVAAADD8JV/x";
	//Выделяем код товара - первые 14 символов
	ИдентификаторGTIN = Лев(СодержаниеКодаDATAMATRIX,14);
	//Выделяем серийный номер упаковки - 7 символов после кода товара
	СерийныйНомер = Сред(СодержаниеКодаDATAMATRIX,15,7);
	//Выделяем МРЦ в зашифрованном виде - 4 символа после серийного номера упаковки
	МРЦИзШтрихКода = Сред(СодержаниеКодаDATAMATRIX,22,4);
}
    BarCodeStr:= '';
    Application.CreateForm(TBarcodeInputForm, BarcodeInputForm);
    if BarcodeInputForm.ShowModal = IDOK then
    begin
      BarCodeStr:= BarcodeInputForm.BarcodeEdit.Text;
      if SaleFrm.TmpSales.Locate('BARCODE', BarCodeStr, [])then
      begin
        BarCodeStr:= '';
        MessageDlg('Товар с данным баркодом уже добавлен', mtWarning, [mbOK], 0);
        Result:= False;
      end
      else Result:= True;
    end
    else Result:= False;
end;


procedure TSaleFrm.UserInputEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var // TmpDSep: Char;
    {OperDone,} ItemInChek: Boolean;
    ColumnName, Barcode: String;
begin
  case Key of
{*****************************************************************************************}
{                                Стирание содержимого строки ввода
{*****************************************************************************************}
  VK_ESCAPE: UserInputEdit.Text:= '';

{*****************************************************************************************}
{                              Добавление позиции в чек
{*****************************************************************************************}
  VK_RETURN: if UserInputEdit.Text <> '' then
    begin

                 { Если строка не пустая производим поиск товара
                  Весовой товар бар-код 13 цифр на 23 + PLU код 5 цифр + 5 цифр вес + контрольная сумма}
                if(Length(UserInputEdit.Text) = 13)and(Copy(UserInputEdit.Text, 1, 2) = '23')then
                begin
                  PosMultiplier:= RoundEx(StrToFloat(Copy(UserInputEdit.Text, 8, 5)) / 1000, 1000);
                  UserInputEdit.Text:= IntToStr(StrToInt(Copy(UserInputEdit.Text, 3, 5)));
                end;


          ShopMainForm.pFindTovarStoredProc.ParamByName('FIND_ITEM').AsString:= UserInputEdit.Text;
          ShopMainForm.pFindTovarStoredProc.ExecProc;
          if ShopMainForm.pFindTovarStoredProc.ParamByName('RESULT').AsInteger = 0 then
          begin
            MessageDlg('Данный товар не зарегистрирован', mtInformation, [mbOK], 0);
            UserInputEdit.Text:= '';
          end
          else if ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE').AsCurrency = 0 then
            begin
             MessageDlg('Нельзя зарегистрировать продажу товара по цене 0.00р.', mtWarning, [mbOK], 0);
             UserInputEdit.Text:= '';
            end
            else
              if (ShopMainForm.pFindTovarStoredProc.ParamByName('MARKED').AsInteger = 0)
                or((ShopMainForm.pFindTovarStoredProc.ParamByName('MARKED').AsInteger = 1) and InputBarCodeStr(Barcode)) then
                with ShopMainForm.pFIBService do
                begin


                {
                04606203101184fBE'eQ5AB4U2io/
                 4606203101184
                04606203100620-jJbzOtACBUQixh
                 4606203100620
                }
                  SelectSQL.Clear;
                  SelectSQL.Add('select * from POS_TMP_SALES');
                  SelectSQL.Add('where MARKET_CODE = ' + IntToStr(CurrentMarketCode));
                  SelectSQL.Add('and ITEM = ''' + ShopMainForm.pFindTovarStoredProc.ParamByName('ITEM').AsString + '''');
                  SelectSQL.Add('and AUTOR_KOD = ' + IntToStr(User_ID));
                  Open;
                  ItemInChek:= not VarIsNull(ShopMainForm.pFIBService['ITEM']);
                  Close;

                  if not ItemInChek or(ItemInChek and(Barcode <> ''))then
                    begin
{                      ShopMainForm.pFIBDatabase1.Execute('insert into POS_TMP_SALES(MARKET_CODE, ITEM, KOLVO, AUTOR_KOD, BARCODE)'
                        + ' values (' +  IntToStr(CurrentMarketCode) + ', '''
                        + ShopMainForm.pFindTovarStoredProc.ParamByName('ITEM').AsString + ''', '
                        + FloatToStr(PosMultiplier) + ', ' + IntToStr(User_ID) + ',''' + Barcode + ''')');
 }
                      case ToolBar1.Tag of
                        0: ColumnName:= 'PRICE';
                        1: ColumnName:= 'PRICE_1';
                        2: ColumnName:= 'PRICE_2';
                        3: ColumnName:= 'PRICE_3';
                        4: ColumnName:= 'PRICE_4';
                        5: ColumnName:= 'PRICE_5';
                        6: ColumnName:= 'PRICE_6';
                        7: ColumnName:= 'PRICE_7';
                        8: ColumnName:= 'PRICE_8';
                        9: ColumnName:= 'PRICE_9';
                      end;
                      ExecSQLStr('insert into POS_TMP_SALES(MARKET_CODE, ITEM, KOLVO, AUTOR_KOD, BARCODE, PRICE)'
                        + ' values (' +  IntToStr(CurrentMarketCode) + ', '''
                        + ShopMainForm.pFindTovarStoredProc.ParamByName('ITEM').AsString + ''', '
                        + FloatToStr(PosMultiplier) + ', ' + IntToStr(User_ID) + ',''' + Barcode
                        + ''', ' + StringReplace(FloatToStr(ShopMainForm.pFindTovarStoredProc.ParamByName(ColumnName).AsCurrency), ',', '.', [rfReplaceAll]) + ')');

{

                      pFIBQuery1.ParamByName('MARKET_CODE').AsInteger:= CurrentMarketCode;
                      pFIBQuery1.ParamByName('ITEM').AsString:= ShopMainForm.pFindTovarStoredProc.ParamByName('ITEM').AsString;
                      pFIBQuery1.ParamByName('KOLVO').AsFloat:= PosMultiplier;
                      pFIBQuery1.ParamByName('AUTOR_KOD').AsInteger:= User_ID;
                      pFIBQuery1.ParamByName('BARCODE').AsString:= Barcode;
                      pFIBQuery1.ParamByName('PRICE').AsFloat:= ;
                      pFIBQuery1.ExecQuery;
 }
                    end
                  else
                    begin
                      ShopMainForm.pFIBDatabase1.Execute('update POS_TMP_SALES'
                        + ' set KOLVO = KOLVO + ' + FloatToStr(PosMultiplier)
                        + ' where ITEM = ''' + ShopMainForm.pFindTovarStoredProc.ParamByName('ITEM').AsString + ''''
                        + ' and MARKET_CODE = ' + IntToStr(CurrentMarketCode)
                        + ' and AUTOR_KOD = ' + IntToStr(User_ID));
                    end;

                  ShopMainForm.pFIBTransaction1.CommitRetaining;
                  TmpSales.CloseOpen(True);
                  TmpSales.ExtLocate('ITEM', ShopMainForm.pFindTovarStoredProc.ParamByName('ITEM').AsString, []);
                  if not(TmpSales['OSTATOK'] >= TmpSales['KOLVO'])then
                    MessageDlg('Данное количество товара больше учётного', mtWarning, [mbOK], 0);
                  PosMultiplier:= 1;
                  SaleFrm.StatusBar1.Panels[0].Text:= '';
                  UserInputEdit.Text:= '';
                end
              else
              begin
                MessageDlg('Обязательный параметр товара BARCODE не введен', mtError, [mbOK], 0);
                UserInputEdit.Text:= '';
              end;
    end
    else if not VarIsNull(TmpSales['ITEM'])then
    begin
      UserInputEdit.Text:= TmpSales['ITEM'];
      UserInputEdit.SelectAll;
    end;

{*****************************************************************************************}
{                                 Печать и закрытие чека
{*****************************************************************************************}
       VK_ADD,187{+=}: if CloseSmenItem.Enabled then
               begin
                 if DBGrid1.Visible then
                 // Если чек набран печатаем, иначе извлекаем из очереди
                 begin
//                   if ShopIni.ReadBool('KKM', 'KKM_Enable', False) then
                   if (KKM1_Enable or KKM2_Enable) then
                   // Если ККМ присутствуют закрываем чек, иначе отправляем в очередь
                   begin
                     Application.CreateForm(TEnterMoneyFrm, EnterMoneyFrm);
                    try
                     if N17.Checked then EnterMoneyFrm.MoneyEdit.Text:= FloatToStrF(CheckSum + Discont + 0.004, ffFixed, 15, 2)
                     else EnterMoneyFrm.MoneyEdit.Text:= FloatToStrF(CheckSum + 0.004, ffFixed, 15, 2);
                     EnterMoneyFrm.Label1.Visible:= not N27.Checked;   // Реквизиты покупателя
                     EnterMoneyFrm.Panel1.Visible:= N27.Checked;

                     EnterMoneyFrm.Width:= Panel5.Width;
                     CurXY.X:= UserInputEdit.Left - UserInputEdit.Margins.Left;
                     CurXY.Y:= UserInputEdit.Top + UserInputEdit.Margins.Top + UserInputEdit.Margins.Bottom;
                     CurXY:= ClientToScreen(CurXY);
                     EnterMoneyFrm.Left:= CurXY.X;
                     EnterMoneyFrm.Top:= CurXY.Y;
                     EnterMoneyFrm.MoneyEdit.ReadOnly:= not N24.Checked; // N24 Оплата НАЛИЧНЫМИ
//                     EnterMoneyFrm.SpeedButton1.Visible:= True;
//                     EnterMoneyFrm.SpeedButton1.Visible:= (Pinpad_Enabled and not N24.Checked);

                     if (EnterMoneyFrm.ShowModal = idOK) then
                       if (KKM_RegAndClose = 0) then
                       begin
                         CheckSum:= 0;
                         Discont:= 0;
                         StatusBar1.Panels[3].Text:= 'Чек закрыт';
                         SaleFrm.N4.Enabled:= True;
                         SaleFrm.N17.Checked:= False;  // Продажа без скидки
                         SaleFrm.N27.Checked:= False;    // Реквизиты покупателя
                         SaleFrm.N24.Click;  // Оплата НАЛИЧНЫМИ
                         SaleFrm.SaleItem.Click;   //  Продажа
                         KKM_PrintCheck:= True; // Печать чека
                       end;
                    finally
                     EnterMoneyFrm.Free;
                    end;
                   end
                   else N13.Click;  // Отправить чек в очередь
                 end
                 else N14.Click;  // Извлечь чек из очереди
               end;

{*****************************************************************************************}
{                      Установка количества для следующей регистрируемой позиции
{*****************************************************************************************}
  VK_MULTIPLY:
      begin
        if UserInputEdit.Text = '' then PosMultiplier:= 1
        else if StrToFloat(UserInputEdit.Text) > 0 then
              PosMultiplier:= StrToFloat(FloatToStrF(StrToFloat(UserInputEdit.Text), ffFixed, 12, 3))
             else
             begin
               MessageDlg('Количество не может быть нулевым', mtWarning, [mbOK], 0);
               UserInputEdit.Text:= '';
             end;
        if PosMultiplier <> 1 then
           SaleFrm.StatusBar1.Panels[0].Text:= 'X' + FloatToStrF(PosMultiplier, ffFixed, 12, 3)
        else SaleFrm.StatusBar1.Panels[0].Text:= '';
        UserInputEdit.Text:= '';
      end;
{*****************************************************************************************}
{                      Перемещение по позициям чека
{*****************************************************************************************}
  VK_UP: if DBGrid1.Visible then TmpSales.Prior;
VK_DOWN: if DBGrid1.Visible then TmpSales.Next;

{*****************************************************************************************}
{                      Удаление позиции чека
{*****************************************************************************************}
VK_SUBTRACT, 189: if DBGrid1.Visible then
              if TmpSales['REG'] = 1 then
                MessageDlg('Данная позиция уже зарегистрированна, удаление невозможно', mtWarning, [mbOK], 0)
              else if MessageDlg('Удалить позицию с PLU кодом : ' + TmpSales['ITEM'],
                   mtConfirmation, [mbYes,mbNo], 0) = idYes then
                 begin
                   pFIBQuery3.ParamByName('ITEM').AsString:= TmpSales['ITEM'];
                   pFIBQuery3.ParamByName('AUTOR_KOD').AsInteger:= User_ID;
                   pFIBQuery3.ParamByName('BARCODE').AsString:= TmpSales['BARCODE'];
                   pFIBQuery3.ExecQuery;
                   ShopMainForm.pFIBTransaction1.CommitRetaining;
                   DataSetReOpen(TmpSales);
                 end;
{*****************************************************************************************}
{                      Подбор по каталогу
{*****************************************************************************************}
VK_INSERT: UserInputEdit.Text:= ChangeWithCat;
{*****************************************************************************************}
{*****************************************************************************************}
{                      Скидка
{*****************************************************************************************}
VK_DIVIDE: N25.Click;
{*****************************************************************************************}
{*****************************************************************************************}
{                             Отмена чека
{*****************************************************************************************}
  VK_F8: CheckClearSpeedButton.Click;
{*****************************************************************************************}
{*****************************************************************************************}
{                         Часто используемые PLU кода товаров                             }
{*****************************************************************************************}
    VK_F5: begin
             Application.CreateForm(TOftenUseFrm, OftenUseFrm);
             if (OftenUseFrm.ShowModal = idOK) then
                UserInputEdit.Text:= OftenUseFrm.pFIBDataSet1['ITEM'];
             OftenUseFrm.Free;
           end;
{*****************************************************************************************}
  end;
end;

procedure TSaleFrm.UserInputEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in [#8, '0'..'9', ','])then Key:= #0;
  if ((Key = ',') and (Pos(',', UserInputEdit.Text) > 0))then Key:= #0;
end;

procedure TSaleFrm.TmpSalesREGGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
//        if TmpSales['REG'] = 0 then Text:= 'Нет' else Text:= 'Да';
end;

procedure TSaleFrm.ExitItemClick(Sender: TObject);
begin
  Close; // Выход
end;

procedure TSaleFrm.SmenReportItemClick(Sender: TObject);
begin
  if KKM1SpeedButton.Down then // Выбранна ККМ 1
    case KKM1_Type of // Печать Х - отчета
      2:begin
         Drv1.Password:= ShopIni.ReadInteger('KKM1', 'AdmPass', 29);
         if Drv1.PrintReportWithoutCleaning <> 0 then
          MessageDlg(Drv1.ResultCodeDescription, mtError, [mbOK], 0);
         Drv1.Password:= User_KKM_Pass;
        end;
    110:begin // Нефискальный принтер

        end;
    end
  else // Выбранна ККМ 2
    case KKM2_Type of // Печать Х - отчета
      2:begin
         Drv2.Password:= ShopIni.ReadInteger('KKM2', 'AdmPass', 29);
         if Drv2.PrintReportWithoutCleaning <> 0 then
          MessageDlg(Drv2.ResultCodeDescription, mtError, [mbOK], 0);
         Drv2.Password:= User_KKM_Pass;
        end;
    110:begin // Нефискальный принтер

        end;
    end
end;

procedure TSaleFrm.CashPaySpeedButtonClick(Sender: TObject);
begin
  N24.Click;   // Оплата НАЛИЧНЫМИ
end;

procedure TSaleFrm.CardPaySpeedButtonClick(Sender: TObject);
begin
  N23.Click;  // Оплата КАРТОЙ
end;

procedure TSaleFrm.SaleSpeedButtonClick(Sender: TObject);
begin
  SaleItem.Click;  // Продажа
end;

procedure TSaleFrm.ReturnSpeedButtonClick(Sender: TObject);
begin
  N6.Click; // Возврат
end;

procedure TSaleFrm.CheckToQueueSpeedButtonClick(Sender: TObject);
begin
  N13.Click;  // Отправить чек в очередь
end;

procedure TSaleFrm.QueueToCheckSpeedButtonClick(Sender: TObject);
begin
  N14.Click;  // Извлечь чек из очереди
end;

procedure TSaleFrm.DiscontSpeedButtonClick(Sender: TObject);
begin
  N25.Click; // N25 Скидка
end;

procedure TSaleFrm.CheckClearSpeedButtonClick(Sender: TObject);
var OperDone: Boolean;
begin    // Отмена чека
 if DBGrid1.Visible then
   if (MessageDlg('Отменить чек ?', mtConfirmation, [mbYes,mbNo], 0) = IDYES)then
   begin
     OperDone:= True;
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select * from POS_TMP_SALES');
       SelectSQL.Add('where AUTOR_KOD = ' + IntToStr(User_ID));
       SelectSQL.Add('and REG = 1');
       Open;
     end;
     if not VarIsNull(ShopMainForm.pFIBService['ITEM'])then
       if KKM1SpeedButton.Down then // Выбранна ККМ 1
         case KKM1_Type of
           2: begin
                Drv1.Password:= ShopIni.ReadInteger('KKM1', 'AdmPass', 30);
                if KKM_Err(Drv1.SysAdminCancelCheck, 1,
                   'SysAdminCancelCheck') <> 0 then
                begin
                  MessageDlg(Drv1.ResultCodeDescription, mtError, [mbOK], 0);
                  OperDone:= False;
                end;
                Drv1.Password:= User_KKM_Pass;
              end;
         end
       else  // Выбранна ККМ 2
         case KKM2_Type of
           2: begin
                Drv2.Password:= ShopIni.ReadInteger('KKM2', 'AdmPass', 30);
                if KKM_Err(Drv2.SysAdminCancelCheck, 2,
                   'SysAdminCancelCheck') <> 0 then
                begin
                  MessageDlg(Drv2.ResultCodeDescription, mtError, [mbOK], 0);
                  OperDone:= False;
                end;
                Drv2.Password:= User_KKM_Pass;
              end;
         end;

     ShopMainForm.pFIBService.Close;
//             if KKM_Type = 4 then cbClearSales;
     if OperDone then
     begin
       ShopMainForm.pFIBDatabase1.Execute('delete from POS_TMP_SALES'
         + ' where AUTOR_KOD = ' + IntToStr(User_ID));
       DataSetReOpen(TmpSales);
     end;
   end;
end;

procedure TSaleFrm.N6Click(Sender: TObject);
begin
  case (Sender as TComponent).Tag of
    1:
    begin
      StatusBar1.Panels[1].Text:= 'Продажа';
      SaleItem.Checked:= True;
      SaleSpeedButton.Down:= True;
    end;
    0: if (not N6.Checked) then
        if MessageDlg('Переключить в режим ВОЗВРАТА ?', mtConfirmation, [mbYes,mbNo], 0) = IDYES then
          begin
            StatusBar1.Panels[1].Text:= 'Возврат';
            N6.Checked:= True;
            ReturnSpeedButton.Down:= True;
          end
        else
          SaleSpeedButton.Down:= True;
  end;
end;

procedure TSaleFrm.N23Click(Sender: TObject);
begin
  case (Sender as TComponent).Tag of
    1:
    begin
      StatusBar1.Panels[2].Text:= 'Наличные';
      CashPaySpeedButton.Down:= True;
    end;
    0: if ( N23.Checked) then
        if MessageDlg('Переключить в режим оплаты КАРТОЙ ?', mtConfirmation, [mbYes,mbNo], 0) = IDYES then
          begin
            StatusBar1.Panels[2].Text:= 'Карта';
            CardPaySpeedButton.Down:= True;
          end
        else
          CashPaySpeedButton.Down:= True;
  end;
  N24.Checked:= CashPaySpeedButton.Down;
  N23.Checked:= CardPaySpeedButton.Down;
end;

procedure TSaleFrm.N25Click(Sender: TObject);
begin  // N25 Скидка
  if DBGrid1.Visible then
  begin
    if not StaticText2.Visible then
    begin
     if ShopIni.ReadBool('Main', 'CheckCard', True)then
     begin
       Application.CreateForm(TForm11, Form11);
       if Form11.ShowModal = IDOK then
       begin

         with ShopMainForm.pFIBService do
         begin
           SelectSQL.Clear;
           SelectSQL.Add('select * from CLIENTS');
           SelectSQL.Add('where NCARD = ''' + CardNumber + '''');
           Open;
           if VarIsNull(ShopMainForm.pFIBService['NCARD'])then
             MessageDlg('Данная карта не зарегистрирована', mtWarning, [mbOK], 0)
           else
           begin
             ToolButton2.Enabled:= ShopMainForm.pFIBService['PRICE'] > 0;
             ToolButton3.Enabled:= ShopMainForm.pFIBService['PRICE'] > 1;
             ToolButton4.Enabled:= ShopMainForm.pFIBService['PRICE'] > 2;
             ToolButton5.Enabled:= ShopMainForm.pFIBService['PRICE'] > 3;
             ToolButton6.Enabled:= ShopMainForm.pFIBService['PRICE'] > 4;
             ToolButton7.Enabled:= ShopMainForm.pFIBService['PRICE'] > 5;
             ToolButton8.Enabled:= ShopMainForm.pFIBService['PRICE'] > 6;
             ToolButton9.Enabled:= ShopMainForm.pFIBService['PRICE'] > 7;
             ToolButton10.Enabled:= ShopMainForm.pFIBService['PRICE'] > 8;

             StaticText2.Visible:= True;

             Panel4.Visible:= True;
             N17.Visible:= True;
             StaticText2.Caption:= 'Карта : ' + CardNumber + ' ('
                + ShopMainForm.pFIBService['FAMILIA'] + ')';
             case ShopMainForm.pFIBService['PRICE'] of
               1: ToolButton2.Click;
               2: ToolButton3.Click;
               3: ToolButton4.Click;
               4: ToolButton5.Click;
               5: ToolButton6.Click;
               6: ToolButton7.Click;
               7: ToolButton8.Click;
               8: ToolButton9.Click;
               9: ToolButton10.Click;
             end;
           end;
           Close;
         end;

       end;
       Form11.Free;
     end
     else
     begin
       CardNumber:= '000000001';
       ToolButton2.Enabled:= True;
       ToolButton3.Enabled:= True;
       ToolButton4.Enabled:= True;
       ToolButton5.Enabled:= True;
       ToolButton6.Enabled:= True;
       ToolButton7.Enabled:= True;
       ToolButton8.Enabled:= True;
       ToolButton9.Enabled:= True;
       ToolButton10.Enabled:= True;

       StaticText2.Visible:= True;
       Panel4.Visible:= True;
       N17.Visible:= True;  // N17 Режим СКИДКА
       StaticText2.Caption:= 'Карта : ' + CardNumber;
       ToolButton10.Click;
     end;
    end
    else
    begin
      StaticText2.Visible:= False;
      Panel4.Visible:= False;
      N17.Visible:= False;
      N17.Checked:= False;
      ToolButton2.Enabled:= False;
      ToolButton3.Enabled:= False;
      ToolButton4.Enabled:= False;
      ToolButton5.Enabled:= False;
      ToolButton6.Enabled:= False;
      ToolButton7.Enabled:= False;
      ToolButton8.Enabled:= False;
      ToolButton9.Enabled:= False;
      ToolButton10.Enabled:= False;
      ToolButton1.Click;
    end;
  end;
end;

procedure TSaleFrm.N28Click(Sender: TObject);
var
  PinPad: TPinPad;
  SelKKM: Integer;
begin
  try
    PinPad:= TPinPad.Create;
    if PinPad.TestPinPad = 0 then // Проверяем наличие пинпада
    begin
      if Pinpad.SberShift(MessageDlg('Короткий отчёт ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes) = 0 then
      begin
 //       MessageDlg(PinPad.Cheque, mtInformation, [mbYes,mbNo], 0); // Показать сообщение с отчетом
        if KKM1SpeedButton.Down then SelKKM:= 1 else SelKKM:= 2;
        KKM_PrintStrings(PinPad.Cheque, SelKKM, ShopIni.ReadBool('KKM' + SelKKM.ToString, 'CutCheck', False), 5, 0, 0)
      end
      else
        raise Exception.Create('Error!');
    end
    else
    begin
      MessageDlg('Ошибка при подключении терминала', mtError, [mbOK], 0);
      raise Exception.create('PinPad was not found');
    end;
  finally
    PinPad.Free;
  end;
end;

procedure TSaleFrm.N29Click(Sender: TObject);
var
  PinPad: TPinPad;
  SelKKM: Integer;
begin
  try
    PinPad:= TPinPad.Create;
    if PinPad.TestPinPad = 0 then // Проверяем наличие пинпада
    begin
      if Pinpad.CloseDay = 0 then
      begin
 //       MessageDlg(PinPad.Cheque, mtInformation, [mbYes,mbNo], 0); // Показать сообщение с отчетом
        if KKM1SpeedButton.Down then SelKKM:= 1 else SelKKM:= 2;
        KKM_PrintStrings(PinPad.Cheque, SelKKM, ShopIni.ReadBool('KKM' + SelKKM.ToString, 'CutCheck', False), 5, 0, 0);
      end
      else
      begin
        MessageDlg('Ошибка при подключении терминала', mtError, [mbOK], 0);
        raise Exception.Create('Error!');
      end;
    end
    else
      raise Exception.create('PinPad was not found');
  finally
    PinPad.Free;
  end;
end;

procedure TSaleFrm.N2Click(Sender: TObject);
var SummTmp: Currency;
begin   // N2 Сумма в кассе
  SummTmp:= GetCashInBox;
  if SummTmp > -1 then
    MessageDlg('Сумма в кассе ' + FloatToStrF(SummTmp, ffCurrency , 12, 2), mtInformation, [mbOK], 0);
end;

procedure TSaleFrm.N5Click(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin   // N5 Журнал продаж
        with ShopMainForm.frxReport1 do
        begin
          LoadFromFile(ShopIni.ReadString('Reports', 'Sales001', ReportsPath + 'SmensSale001.fr3'));
          FIBQuery1:= FindObject('SmensRepQuery') as TfrxFIBQuery;

          with FIBQuery1 do
          begin
            SQL.Clear;
            SQL.Add('select 1 as IND, cast(P.ITEM as varchar(14))as ITEM, '
                + 'cast(P.SALE_PRICE as float)as SALE_PRICE, cast(T.TOVAR_NAME as varchar(80)) as TOVAR_NAME,'
                + ' cast(SUM(P.KOLVO) as float)as SKOLVO, P.AUTOR_KOD');
            SQL.Add('from POS_SALES P left join SPR_TOVAR T on P.ITEM = T.ITEM');
            SQL.Add('where P.SMENS_KOD = ' + IntToStr(ActiveSmenKod));
//            SQL.Add('and P.AUTOR_KOD = ' + IntToStr(User_ID));
            SQL.Add('and cast(P.NCARD as integer) =  0');
            SQL.Add('group by P.ITEM, P.SALE_PRICE, T.TOVAR_NAME, P.AUTOR_KOD');
            SQL.Add('union');
            SQL.Add('select 2 as IND, cast(P.ITEM as varchar(14)), cast(P.SALE_PRICE as float)'
              + ', cast(T.TOVAR_NAME as varchar(80)), cast(SUM(P.KOLVO) as float), P.AUTOR_KOD');
            SQL.Add('from POS_SALES P left join SPR_TOVAR T on P.ITEM = T.ITEM');
            SQL.Add('where P.SMENS_KOD = ' + IntToStr(ActiveSmenKod));
{            if KKM1SpeedButton.Down then // Номер выбранной ККМ
              SQL.Add('and P.AUTOR_KOD = ' + KKM1_Number)
            else
              SQL.Add('and P.AUTOR_KOD = ' + KKM2_Number);
 }
            SQL.Add('and cast(P.NCARD as integer) =  -1');
            SQL.Add('group by P.ITEM, P.SALE_PRICE, T.TOVAR_NAME, P.AUTOR_KOD');
            SQL.Add('union');
            SQL.Add('select 3 as IND, cast('''' as varchar(14)), cast(sum(P.SALE_PRICE) as float),'
              +' cast(P.NCARD as varchar(80)), cast(SUM(P.KOLVO) as float), P.AUTOR_KOD');
            SQL.Add('from POS_SALES P');
            SQL.Add('where P.SMENS_KOD = ' + IntToStr(ActiveSmenKod));
//            SQL.Add('and P.AUTOR_KOD = ' + IntToStr(User_ID));
            SQL.Add('and cast(P.NCARD as integer) >  0');
            SQL.Add('group by P.NCARD, P.AUTOR_KOD');
            SQL.Add('order by 1, 6, 4, 2');
          end;

          with ShopMainForm.pFIBService do
          begin
            SelectSQL.Clear;
            SelectSQL.Add('select S.BEGIN_DATETIME as BegD, ''' + DateTimeToStr(Now)
                  + ''' as EndD, M.SHORT_NAME as ObjName');
            SelectSQL.Add('from HDR_SMENS S left join SPR_MARKET M on S.MARKET_CODE = M.MARKET_CODE');
            SelectSQL.Add('where SMENS_KOD = ' + IntToStr(ActiveSmenKod));
            Open;
            Script.Variables['BEGD']:= DateTimeToStr(ShopMainForm.pFIBService['BEGD']);
            Script.Variables['OBJNAME']:= ShopMainForm.pFIBService['OBJNAME'];
            Script.Variables['ENDD']:= DateTimeToStr(Now);
            Close;
          end;
          ShowReport;
        end;
end;

procedure TSaleFrm.N1Click(Sender: TObject);
begin    // N1 Help
{        Application.CreateForm(TSaleHelpFrm, SaleHelpFrm);
        SaleHelpFrm.ShowModal;
        SaleHelpFrm.Free;}
end;

function TSaleFrm.GetCashInBox : Double;
var SummTmp: Double;
begin // Накопление денег в ККМ
  SummTmp:= -1;
  if KKM1SpeedButton.Down then // Выранна ККМ 1
    case KKM1_Type of
      2: begin
           Drv1.RegisterNumber:= 241;
           if (KKM_Err(Drv1.GetCashReg, 1) <> 0) then
             MessageDlg(Drv1.ResultCodeDescription, mtError, [mbOK], 0)
           else SummTmp:= Drv1.ContentsOfCashRegister;
         end;
     100, 110: with ShopMainForm.pFIBService do
          begin
            SelectSQL.Clear;
            SelectSQL.Add('select sum(KOLVO * SALE_PRICE)as SUMMA, ');
            SelectSQL.Add('(select sum(KOLVO * SALE_PRICE)from POS_SALES where NCARD = -1 and SMENS_KOD = ' + IntToStr(ActiveSmenKod)+ ') as RETURNSUM, ');
            SelectSQL.Add('(select sum(KOLVO * SALE_PRICE)from POS_SALES where NCARD > 0 and SMENS_KOD = ' + IntToStr(ActiveSmenKod) + ') as DISKONTSUM ');
            SelectSQL.Add('from POS_SALES where NCARD = 0 and SMENS_KOD = ' + IntToStr(ActiveSmenKod));
            Open;
            SummTmp:= 0;
            if not VarIsNull(ShopMainForm.pFIBService['SUMMA'])then
              SummTmp:= SummTmp + ShopMainForm.pFIBService['SUMMA'];
            if not VarIsNull(ShopMainForm.pFIBService['RETURNSUM'])then
              SummTmp:= SummTmp - ShopMainForm.pFIBService['RETURNSUM'];

            if not VarIsNull(ShopMainForm.pFIBService['DISKONTSUM']) and N17.Enabled then
              SummTmp:= SummTmp + ShopMainForm.pFIBService['DISKONTSUM'];

            Close;
          end;
    end
  else // Выранна ККМ 2
    case KKM2_Type of
      2: begin
           Drv2.RegisterNumber:= 241;
           if (KKM_Err(Drv2.GetCashReg, 2) <> 0) then
             MessageDlg(Drv2.ResultCodeDescription, mtError, [mbOK], 0)
           else SummTmp:= Drv2.ContentsOfCashRegister;
         end;
     100,110: with ShopMainForm.pFIBService do
          begin
            SelectSQL.Clear;
            SelectSQL.Add('select sum(KOLVO * SALE_PRICE)as SUMMA, ');
            SelectSQL.Add('(select sum(KOLVO * SALE_PRICE)from POS_SALES where NCARD = -1 and SMENS_KOD = ' + IntToStr(ActiveSmenKod)+ ') as RETURNSUM, ');
            SelectSQL.Add('(select sum(KOLVO * SALE_PRICE)from POS_SALES where NCARD > 0 and SMENS_KOD = ' + IntToStr(ActiveSmenKod) + ') as DISKONTSUM ');
            SelectSQL.Add('from POS_SALES where NCARD = 0 and SMENS_KOD = ' + IntToStr(ActiveSmenKod));
            Open;
            SummTmp:= 0;
            if not VarIsNull(ShopMainForm.pFIBService['SUMMA'])then
              SummTmp:= SummTmp + ShopMainForm.pFIBService['SUMMA'];
            if not VarIsNull(ShopMainForm.pFIBService['RETURNSUM'])then
              SummTmp:= SummTmp - ShopMainForm.pFIBService['RETURNSUM'];

            if not VarIsNull(ShopMainForm.pFIBService['DISKONTSUM']) and N17.Enabled then
              SummTmp:= SummTmp + ShopMainForm.pFIBService['DISKONTSUM'];

            Close;
          end;
    end;
  Result:= SummTmp;
end;

procedure TSaleFrm.KKM1SpeedButtonClick(Sender: TObject);
begin
  KKM1Item.Click;
end;

procedure TSaleFrm.KKM2ItemClick(Sender: TObject);
begin
    case (Sender as TComponent).Tag of
      1:
      begin
        KKM1Item.Checked:= True;
        KKM1SpeedButton.Down:= True;
        OrgName:= KKM1_OrgName;
        INN:= KKM1_INN;
      end;
      0: if (not N6.Checked) then
            begin
              KKM2Item.Checked:= True;
              KKM2SpeedButton.Down:= True;
              OrgName:= KKM2_OrgName;
              INN:= KKM2_INN;
            end
          else
            KKM1SpeedButton.Down:= True;
    end;
end;

procedure TSaleFrm.KKM2SpeedButtonClick(Sender: TObject);
begin
  KKM2Item.Click;
end;

procedure TSaleFrm.N9Click(Sender: TObject);
var SelKKM: Integer;
begin
  with ShopMainForm.frxReport1 do
  begin
    if KKM1SpeedButton.Down then SelKKM:= 1 else SelKKM:= 1;  // Загружаем шаблон товарного чека для выбранной ККМ
    LoadFromFile(ShopIni.ReadString('Reports', 'TovarCheck_KKM' + SelKKM.ToString, ReportsPath + 'TovarCheck.fr3'));
    Script.Variables['Price_Col']:= ToolBar1.Tag;
    Script.Variables['User_ID']:= User_ID;

    if KKM1SpeedButton.Down then
    begin
      Script.Variables['KKM_OrgName']:= KKM1_OrgName;
      Script.Variables['KKM_INN']:= KKM1_INN;
    end
    else
    begin
      Script.Variables['KKM_OrgName']:= KKM2_OrgName;
      Script.Variables['KKM_INN']:= KKM2_INN;
    end;

    ShowReport;
  end;
end;

procedure TSaleFrm.N10Click(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
  with ShopMainForm.frxReport1 do
  begin
    LoadFromFile(ShopIni.ReadString('Reports', 'Sales001', ReportsPath + 'SmensSale003.fr3'));
    FIBQuery1:= FindObject('SmensRepQuery') as TfrxFIBQuery;

    with FIBQuery1 do
    begin
      SQL.Clear;
      SQL.Add('select P.ITEM, P.SALE_PRICE, G.GROUP_NAME, T.TOVAR_NAME, '
         + 'SUM(P.KOLVO + 2*P.KOLVO*(CAST(P.NCARD as INTEGER)))SKOLVO');
      SQL.Add('from POS_SALES P left join SPR_TOVAR T on P.ITEM = T.ITEM');
      SQL.Add('left join SPR_GROUP G on T.T_GROUP = G.T_GROUP');
      SQL.Add('where SMENS_KOD = ' + IntToStr(ActiveSmenKod));
      SQL.Add('and CAST(P.NCARD as INTEGER) <= 0');
      SQL.Add('group by G.GROUP_NAME, P.ITEM, P.SALE_PRICE, T.TOVAR_NAME');
      SQL.Add('order by G.GROUP_NAME');
    end;

    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select S.BEGIN_DATETIME as BegD, ''' + DateTimeToStr(Now)
            + ''' as EndD, M.SHORT_NAME as ObjName');
      SelectSQL.Add('from HDR_SMENS S left join SPR_MARKET M on S.MARKET_CODE = M.MARKET_CODE');
      SelectSQL.Add('where SMENS_KOD = ' + IntToStr(ActiveSmenKod));
      Open;
      Script.Variables['OBJNAME']:= ShopMainForm.pFIBService['OBJNAME'];
      Script.Variables['ENDD']:= DateTimeToStr(Now);
      Script.Variables['BEGD']:= DateTimeToStr(ShopMainForm.pFIBService['BEGD']);
      Close;
    end;
//            Title:= 'Продажи по группам';
    ShowReport;
  end;
end;

procedure TSaleFrm.N15Click(Sender: TObject);
var SelKKM: Integer;
begin // N15 Товарный чек из архива смены
  with ShopMainForm.frxReport1 do
  begin
    if KKM1SpeedButton.Down then SelKKM:= 1 else SelKKM:= 1;  // Загружаем шаблон товарного чека для выбранной ККМ
    LoadFromFile(ShopIni.ReadString('Reports', 'TovarCheckFree_KKM' + SelKKM.ToString, ReportsPath + 'TovarCheck001.fr3'));

    Script.Variables['SMENS_CODE']:= ActiveSmenKod;
    if KKM1SpeedButton.Down then
    begin
      Script.Variables['KKM_OrgName']:= KKM1_OrgName;
      Script.Variables['KKM_INN']:= KKM1_INN;
    end
    else
    begin
      Script.Variables['KKM_OrgName']:= KKM2_OrgName;
      Script.Variables['KKM_INN']:= KKM2_INN;
    end;
    ShowReport;
  end;
end;

procedure TSaleFrm.N14Click(Sender: TObject);
var i: Integer;
begin  // N14 Извлечь чек из очереди
    Application.CreateForm(TQueueFrm, QueueFrm);
    QueueFrm.pFIBDataSet1.Open;
    if not VarIsNull(QueueFrm.pFIBDataSet1['QUEUE_NUMBER'])then
    begin
      QueueFrm.pFIBDataSet2.Open;
      if QueueFrm.ShowModal = IDOK then
        begin
          i:= QueueFrm.pFIBDataSet1['QUEUE_NUMBER'];
          if DBGrid1.Visible then N13.Click;
          ShopMainForm.pFIBDatabase1.Execute('insert into POS_TMP_SALES(ITEM, KOLVO, AUTOR_KOD, MARKET_CODE, BARCODE, REG, PRICE)'
            + ' select Q.ITEM, Q.KOLVO, ' + IntToStr(User_ID) + ', Q.MARKET_CODE, Q.BARCODE, 0, P.SALE_PRICE'
            + ' from QUEUE Q  left join PRICES P on P.ITEM = Q.ITEM where Q.QUEUE_NUMBER = ' + IntToStr(i));
          ShopMainForm.pFIBDatabase1.Execute('delete from QUEUE'
            + ' where QUEUE_NUMBER = ' + IntToStr(i));
          ShopMainForm.pFIBTransaction1.CommitRetaining;
          TmpSales.CloseOpen(True);
          N27.Checked:= False; // N27  Реквизиты покупателя
        end;
    end
    else MessageDlg('Нет чеков в очереди', mtInformation, [mbOK], 0);
    QueueFrm.Free;
end;

procedure TSaleFrm.N13Click(Sender: TObject);
var i: Integer;
begin
      i:= ShopMainForm.pFIBDatabase1.Gen_Id('GEN_QUEUE_NUMBER', 1);
      ShopMainForm.pFIBDatabase1.Execute('insert into QUEUE(QUEUE_NUMBER, ITEM, KOLVO, AUTOR_KOD, MARKET_CODE, BARCODE)'
        + ' select ' + IntToStr(i) + ', ITEM, SUM(KOLVO), AUTOR_KOD, MARKET_CODE, BARCODE'
        + ' from POS_TMP_SALES where AUTOR_KOD = ' + IntToStr(User_ID)
        + ' and MARKET_CODE = ' + IntToStr(CurrentMarketCode)
        + ' group by ITEM, AUTOR_KOD, MARKET_CODE, BARCODE');

      ShopMainForm.pFIBDatabase1.Execute('delete from POS_TMP_SALES'
        + ' where AUTOR_KOD = ' + IntToStr(User_ID)
        + ' and MARKET_CODE = ' + IntToStr(CurrentMarketCode));

      ShopMainForm.pFIBTransaction1.CommitRetaining;
      TmpSales.CloseOpen(True);
      N27.Checked:= False;
      MessageDlg('Чек передан в очередь c № ' + IntToStr(i), mtInformation, [mbOK], 0);
end;

procedure TSaleFrm.FormDestroy(Sender: TObject);
begin
//    if KKM_Type = 5 then KKMOleObject.DeviceEnabled:= False;
//    WaitForm.Free;
    if ((KKM1_Type = 2)and(KKM1_Enable)) then
    begin
      Drv1.Disconnect;
      Drv1.Free;
    end;
    if ((KKM2_Type = 2)and KKM2_Enable) then
    begin
      Drv2.Disconnect;
      Drv2.Free;
    end;
end;

procedure TSaleFrm.Timer2Timer(Sender: TObject);
begin
      StatusBar1.Panels[5].Text:= FormatDateTime('dd/mm/yy h:mm', Now);
{     LS:= TStringList.Create;
     FTPFile:= '';
     Connect;
     try
      ChangeDir(FTPSendDir);
      ShopMainForm.IdFTP1.List(LS, '*.zip', True);
      for i:= 0 to ShopMainForm.IdFTP1.DirectoryListing.Count-1 do
        FTPFileLoadForm.ValueListEditor1.InsertRow(ShopMainForm.IdFTP1.DirectoryListing.Items[i].FileName,
          FormatDateTime('dd/mm/yyyy hh:mm', ShopMainForm.IdFTP1.DirectoryListing.Items[i].ModifiedDate), True);
 }
end;

procedure TSaleFrm.frTBButton1Click(Sender: TObject);
var ColumnName, CurItem: String;
begin   // Выбор колонки цены
   ToolBar1.Tag:= (Sender as TComponent).Tag;
   case (Sender as TComponent).Tag of
     0: begin
//          DBGrid1.Columns[3].FieldName:= 'SALE_PRICE';
          ColumnName:= 'SALE_PRICE';
          ToolButton1.Down:= True;
        end;
     1: begin
//          DBGrid1.Columns[3].FieldName:= 'PRICE_1';
          ColumnName:= 'PRICE_1';
          ToolButton2.Down:= True;
        end;
     2: begin
//          DBGrid1.Columns[3].FieldName:= 'PRICE_2';
          ColumnName:= 'PRICE_2';
          ToolButton3.Down:= True;
        end;
     3: begin
//          DBGrid1.Columns[3].FieldName:= 'PRICE_3';
          ColumnName:= 'PRICE_3';
          ToolButton4.Down:= True;
        end;
     4: begin
//          DBGrid1.Columns[3].FieldName:= 'PRICE_4';
          ColumnName:= 'PRICE_4';
          ToolButton5.Down:= True;
        end;
     5: begin
//          DBGrid1.Columns[3].FieldName:= 'PRICE_5';
          ColumnName:= 'PRICE_5';
          ToolButton6.Down:= True;
        end;
     6: begin
//          DBGrid1.Columns[3].FieldName:= 'PRICE_6';
          ColumnName:= 'PRICE_6';
          ToolButton7.Down:= True;
        end;
     7: begin
//          DBGrid1.Columns[3].FieldName:= 'PRICE_7';
          ColumnName:= 'PRICE_7';
          ToolButton8.Down:= True;
        end;
     8: begin
//          DBGrid1.Columns[3].FieldName:= 'PRICE_8';
          ColumnName:= 'PRICE_8';
          ToolButton9.Down:= True;
        end;
     9: begin
//          DBGrid1.Columns[3].FieldName:= 'PRICE_9';
          ColumnName:= 'PRICE_9';
          ToolButton10.Down:= True;
        end;
   end;

  with TmpSales do
  begin
    if not VarIsNull(TmpSales['ITEM']) then
      CurItem:= TmpSales['ITEM']
    else
      CurItem:= '';
    DisableControls;
    First;
    while not Eof do
    begin
     ShopMainForm.pFIBDatabase1.Execute('update POS_TMP_SALES'
       + ' set PRICE = (select ' + ColumnName + ' from PRICES where ITEM = ''' +  TmpSales['ITEM'] + ''')'
       + ' where ITEM = ''' + TmpSales['ITEM'] + ''''
       + ' and MARKET_CODE = ' + IntToStr(CurrentMarketCode)
       + ' and AUTOR_KOD = ' + IntToStr(User_ID));
      Next;
    end;
    Close;
    Open;
    Locate('ITEM', CurItem, []);
    EnableControls;
  end;

end;

procedure TSaleFrm.N18Click(Sender: TObject);
begin // Накопление по карте
  with ShopMainForm.frxReport1 do
  begin
    LoadFromFile(ShopIni.ReadString('Reports', 'MoveCard', ReportsPath + 'OTHER\Покупки по картам.fr3'));
    ShowReport;
  end;
end;

procedure TSaleFrm.N19Click(Sender: TObject);
begin
  if MessageDlg('Снять отчет с гашением ?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
  begin
    if KKM1SpeedButton.Down then // Выбранна ККМ 1
      KKM_ReportWithCleaning(1)
    else
      KKM_ReportWithCleaning(2);
  end;
end;

procedure KKM_ReportWithCleaning(KKM: Integer);
begin
  case KKM of  // Снимаем отчет с гашением на ККМ
    1:case KKM1_Type of
        2: begin
             Drv1.Password:= ShopIni.ReadInteger('KKM1', 'AdmPass', 29);
             Drv1.PrintReportWithCleaning;
             Sleep(5000);
             Drv1.GetECRStatus;
             if(Drv1.ECRMode <> 4)then  MessageDlg(Drv1.ResultCodeDescription, mtError, [mbOK], 0);
             Drv1.Password:= User_KKM_Pass;
           end;
       110: ShopIni.WriteInteger('KKM1', 'CheckNumber', 0); // Сбрасываем счетчик чеков
      end;

    2:case KKM2_Type of
        2: begin
             Drv2.Password:= ShopIni.ReadInteger('KKM2', 'AdmPass', 29);
             Drv2.PrintReportWithCleaning;
             Sleep(5000);
             Drv2.GetECRStatus;
             if(Drv2.ECRMode <> 4)then  MessageDlg(Drv2.ResultCodeDescription, mtError, [mbOK], 0);
             Drv2.Password:= User_KKM_Pass;
           end;
       110: ShopIni.WriteInteger('KKM2', 'CheckNumber', 0); // Сбрасываем счетчик чеков
      end;

  end;
end;

procedure TSaleFrm.TmpSalesAfterOpen(DataSet: TDataSet);
begin
        DBGrid1.Visible:= not VarIsNull(TmpSales['ITEM']);
        N9.Enabled:= not VarIsNull(TmpSales['ITEM']); // N9 Товарный чек
        N13.Enabled:= not VarIsNull(TmpSales['ITEM']);  // N13 отправить чек в очередь
        CheckSum:= 0;
        Discont:= 0;
        StatusBar1.Panels[3].Text:= '';

        if not DBGrid1.Visible then
        begin
          N17.Checked:= False;     // N17 Продажа без скидки
          N17.Visible:= False;
          StaticText2.Visible:= False;
          Panel4.Visible:= False;
          ToolButton1.Down:= True;
          ToolBar1.Tag:= 0;
          ToolButton2.Enabled:= False;
          ToolButton3.Enabled:= False;
          ToolButton4.Enabled:= False;
          ToolButton5.Enabled:= False;
          ToolButton6.Enabled:= False;
          ToolButton7.Enabled:= False;
          ToolButton8.Enabled:= False;
          ToolButton9.Enabled:= False;
          ToolButton10.Enabled:= False;
//          DBGrid1.Columns[3].FieldName:= 'SALE_PRICE';
          StatusBar1.Panels[3].Text:= 'Чек закрыт';
          StaticText2.Visible:= False;
          Panel4.Visible:= False;
          StaticText2.Tag:= 0;
          SaleItem.Click;   // Включаем режим ПРОДАЖА
        end;

        with TmpSales do
        begin
          DisableControls;
          First;
          while not Eof do
          begin
//            CheckSum:= CheckSum + TmpSales[DBGrid1.Columns[3].FieldName] * TmpSales['KOLVO'];
//            Discont:= Discont + (TmpSales['SALE_PRICE'] - TmpSales[DBGrid1.Columns[3].FieldName]) * TmpSales['KOLVO'];
            CheckSum:= CheckSum + TmpSales['PRICE'] * TmpSales['KOLVO'];
            if SaleFrm.N17.Visible then Discont:= Discont + (TmpSales['SALE_PRICE'] - TmpSales['PRICE']) * TmpSales['KOLVO'];
            Next;
          end;

          First;
          if DBGrid1.Visible then
          begin
            StatusBar1.Panels[3].Text:= 'Сумма чека : ' + FloatToStrF(CheckSum + 0.004, ffCurrency, 12, 2);
            if Discont <> 0 then
              StatusBar1.Panels[3].Text:= StatusBar1.Panels[3].Text
                 + ' ( Скидка : ' + FloatToStrF(Discont, ffCurrency, 12, 2) + ' )';
          end;
          EnableControls;
        end;
end;

procedure TSaleFrm.TmpSalesPOS_SUMGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
//  Text:= FloatToStrF(TmpSales['KOLVO'] * TmpSales[DBGrid1.Columns[3].FieldName], ffFixed, 12, 2);
     Text:= FloatToStrF(TmpSales['KOLVO'] * TmpSales['PRICE'], ffFixed, 12, 2);
end;

//Функция декодирования максимальной розничной цены с пачки (табачная продукция). Алгоритм кодирования.
function MrpEncoder(MRPString: String): Double;
var StrCode, CurChar: String;
  LengthStrCode, LengthPriceBarcode, i, CurPosInStrCode: Integer;
  CurMultiplier,  CurMultiplicand, MRP_Enc: Double;
begin
  StrCode:= 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!"%&''*+-./_,:;=<>?';
  LengthStrCode:= Length(StrCode);
  LengthPriceBarcode:= Length(MRPString);
  MRP_Enc:= 0;
  for i := 1 to LengthPriceBarcode do
  begin
    CurMultiplier:= Math.Power(LengthStrCode, LengthPriceBarcode - i);
    CurChar:= Copy(MRPString, i, 1);
    CurPosInStrCode:= Pos(CurChar, StrCode);
    if CurPosInStrCode = 0 then
    begin
      Result:= 0;
      Abort;
    end;
    CurMultiplicand:= CurPosInStrCode - 1;
    MRP_Enc:= MRP_Enc + CurMultiplier*CurMultiplicand;
  end;
  Result:= MRP_Enc / 100;
end;

end.
