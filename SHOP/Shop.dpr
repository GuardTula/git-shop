//****************************************************************************//
//                            © Guard  2003-2024                              //
//****************************************************************************//
program Shop;

uses
  Forms,
  ActMove in 'ActMove.pas' {ActMoveFrm},
  AtrChange in 'AtrChange.pas' {AtrChangeFrm},
  ChangeZakaz in 'ChangeZakaz.pas' {ChangeZakazFrm},
  ClientAutoAdd in 'ClientAutoAdd.pas' {ClientAutoAddForm},
  Clients in 'Clients.pas' {ClientsFrm},
  DataSend in 'DataSend.pas' {DataSendFrm},
  DeviceCfg in 'DeviceCfg.pas' {DeviceCfgFrm},
  DualList in 'DualList.pas' {DualListDlg},
  EditEnter in 'EditEnter.pas' {EditEnterForm},
  EditPosDoc in 'EditPosDoc.pas' {EditDocPosFrm},
  EnterMoney in 'EnterMoney.pas' {EnterMoneyFrm},
  Excel_Const in 'Excel_Const.pas',
  ExcelObj in 'ExcelObj.pas',
  ExpensesAmount in 'ExpensesAmount.pas' {ExpensesAmountFrm},
  md5 in 'md5.pas',
  MoveTovar in 'MoveTovar.pas' {MoveTovarFrm},
  MoveTovarShow in 'MoveTovarShow.pas' {MoveTovarShowFrm},
  NaklPosSum in 'NaklPosSum.pas' {NaklPosSumFrm},
  NewDoc in 'NewDoc.pas' {NewDocFrm},
  NewExpenses in 'NewExpenses.pas' {NewExpensesFrm},
  NewPereocen in 'NewPereocen.pas' {NewPereocenFrm},
  ObjChange in 'ObjChange.pas' {ObjChangeForm},
  OftenUse in 'OftenUse.pas' {OftenUseFrm},
  PassEnter in 'PassEnter.pas' {PasswEnterForm},
  PayEdit in 'PayEdit.pas' {PayEditFrm},
  Payment in 'Payment.pas' {PaymentFrm},
  PereocenEdit in 'PereocenEdit.pas' {PereocenEditFrm},
  PriceLabelPrint in 'PriceLabelPrint.pas' {PriceLabelPrintFrm},
  Queue in 'Queue.pas' {QueueFrm},
  Reval in 'Reval.pas' {RevalFrm},
  Sale in 'Sale.pas' {SaleFrm},
  SALEHELP in 'SALEHELP.PAS' {SaleHelpFrm},
  Setings in 'Setings.pas' {SetingsFrm},
  ShopMain in 'ShopMain.pas' {ShopMainForm},
  SmensReports in 'SmensReports.pas' {SmensRepFrm},
  sndkey32 in 'sndkey32.pas',
  Spr in 'Spr.pas' {SprFrm},
  SprFilter in 'SprFilter.pas' {SprFiterFrm},
  SprMarkets in 'SprMarkets.pas' {SprMarketsFrm},
  SprVendors in 'SprVendors.pas' {SprVendFrm},
  TovarEdit in 'TovarEdit.pas' {TovarEditFrm},
  TovarGroupRep in 'TovarGroupRep.pas' {TovarGroupRepFrm},
  TovarInfo in 'TovarInfo.pas' {TovarInfoFrm},
  TovarRep in 'TovarRep.pas' {TovarRepFrm},
  Uchet in 'Uchet.pas' {UchetFrm},
  Unit11 in 'Unit11.pas' {Form11},
  VendSumFact in 'VendSumFact.pas' {VendSummFactFrm},
  VerbSumm in 'VerbSumm.pas',
  Zakaz in 'Zakaz.pas' {ZakazFrm},
  About in 'About.pas' {AboutBox},
  BackUp in 'BackUp.pas' {BackUpForm},
  BarcodeInput in 'BarcodeInput.pas' {BarcodeInputForm},
  DelDoc in 'DelDoc.pas' {DelDocFrm},
  XLStoNakl in 'XLStoNakl.pas' {XLStoNaklForm},
  PinPad_Pilot_nt in 'PinPad_Pilot_nt.pas',
  IntMove in 'IntMove.pas' {IntMoveForm},
  ZakazAuto in 'ZakazAuto.pas' {ZakazAutoForm},
  FTPFileLoad in 'FTPFileLoad.pas' {FTPFileLoadForm},
  ZakazCheck in 'ZakazCheck.pas' {ZakazCheckForm},
  ZakazForPeriod in 'ZakazForPeriod.pas' {ZakazForPeriodForm},
  ZakazFilter in 'ZakazFilter.pas' {ZakazFilterFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Маркет';
  Application.CreateForm(TShopMainForm, ShopMainForm);
  if User_ID = -1 then Application.Terminate;
//  Application.CreateForm(TPasswEnterForm, PasswEnterForm);
  Application.Run;
end.
