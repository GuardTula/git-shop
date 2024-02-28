//****************************************************************************//
//                              © Guard  2002-2023                            //
//****************************************************************************//
unit NewDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, ActnList, DB, Grids,
  DBGrids, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet, Menus,
  pFIBDataSet, frxFIBComponents, ToolWin, System.Actions, Datasnap.DBClient,
  System.UITypes;

type
  TNewDocFrm = class(TForm)
    ActionList1: TActionList;
    AddNewDoc: TAction;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    AddSprBtn: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    PosItemEdit: TEdit;
    Label7: TLabel;
    NameEdit: TEdit;
    Label8: TLabel;
    Panel2: TPanel;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    Label10: TLabel;
    LMDButton1: TBitBtn;
    LMDButton2: TBitBtn;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    Bpvtybnm1: TMenuItem;
    PosKolvoEdit: TEdit;
    PosPriceEdit: TEdit;
    PosVendPriceEdit: TEdit;
    BitBtn5: TBitBtn;
    Timer2: TTimer;
    pFIBDataSet1: TpFIBDataSet;
    pFIBDataSet2: TpFIBDataSet;
    pFIBDataSet3: TpFIBDataSet;
    pFIBDataSet1KOD: TFIBIntegerField;
    pFIBDataSet1ITEM: TFIBStringField;
    pFIBDataSet1KOLVO: TFIBFloatField;
    pFIBDataSet1PRICE: TFIBFloatField;
    pFIBDataSet1VEND_PRICE: TFIBFloatField;
    pFIBDataSet1MARKET_CODE: TFIBIntegerField;
    pFIBDataSet1ITEM1: TFIBStringField;
    pFIBDataSet1TOVAR_NAME: TFIBStringField;
    pFIBDataSet1T_GROUP: TFIBIntegerField;
    pFIBDataSet1LAST_UPD: TFIBDateTimeField;
    pFIBDataSet1KKM_SECT: TFIBIntegerField;
    pFIBDataSet1VENDOR_CODE: TFIBIntegerField;
    pFIBDataSet1AUTOR_KOD: TFIBIntegerField;
    pFIBDataSet1REMARK: TFIBStringField;
    pFIBDataSet1UNIT_KOD: TFIBIntegerField;
    pFIBDataSet1ARTIKUL: TFIBStringField;
    pFIBDataSet1PRODUCER: TFIBStringField;
    pFIBDataSet1REMARK_1: TFIBStringField;
    pFIBDataSet1VEND_ITEM: TFIBStringField;
    pFIBDataSet1UNIT_NAME: TFIBStringField;
    pFIBDataSet1POS_SUM: TFIBFloatField;
    pFIBDataSet1VEND_SUM: TFIBFloatField;
    Label9: TLabel;
    BitBtn8: TBitBtn;
    SpeedButton5: TSpeedButton;
    pFIBDataSet1GROUP_NAME: TFIBStringField;
    pFIBStoredProc1: TpFIBStoredProc;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ClientDataSet1: TClientDataSet;
    N3: TMenuItem;
    XML1: TMenuItem;
    Panel4: TPanel;
    DraftCopyBtn: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    RecipientLabel: TLabel;
    Label3: TLabel;
    VendorLabel: TLabel;
    Label5: TLabel;
    Image1: TImage;
    SpeedButton4: TSpeedButton;
    DocTypeComboBox: TComboBox;
    RecipientComboBox: TComboBox;
    DateTimePicker: TDateTimePicker;
    VendorComboBox: TComboBox;
    NewDocNoBtn: TBitBtn;
    DocNoEdit: TEdit;
    Panel3: TPanel;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label12: TLabel;
    PriceTypeComboBox: TComboBox;
    Edit1: TEdit;
    StaticText1: TStaticText;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    FromXMLFileBitBtn: TBitBtn;
    ClientDataSet2: TClientDataSet;
    procedure DocTypeComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AddNewDocUpdate(Sender: TObject);
    procedure NewDocNoBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PosItemEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PosKolvoEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DraftCopyBtnClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure AddSprBtnClick(Sender: TObject);
    procedure LMDButton1Click(Sender: TObject);
    procedure LMDButton2Click(Sender: TObject);
    procedure PosVendPriceEditChange(Sender: TObject);
    procedure Bpvtybnm1Click(Sender: TObject);
    procedure PosPriceEditKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure DocTypeComboBoxChange(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RecipientComboBoxChange(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure VendorComboBoxChange(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pFIBDataSet1AfterOpen(DataSet: TDataSet);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure DocNoEditKeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure XML1Click(Sender: TObject);
    procedure FromXMLFileBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDocFrm: TNewDocFrm;
  UsrTmpCode, Market_Code, GroupCode: Integer;

    function CheckDubNakl: Boolean;

implementation

uses MoveTovar, ShopMain, VendSumFact, ActMove, Spr, frxClass, Queue;

{$R *.dfm}

function CheckDubNakl: Boolean;
begin
        NewDocFrm.pFIBDataSet3.SelectSQL.Clear;
        case NewDocFrm.DocTypeComboBox.ItemIndex of
          0: begin // Приходная накладная
               with NewDocFrm.pFIBDataSet3 do
               begin
                 SelectSQL.Add('select * from HDR_PRIHOD');
                 SelectSQL.Add('where DOC_TYPE = 1');
                 SelectSQL.Add('and DOC_NUMBER = ' + NewDocFrm.DocNoEdit.Text);
                 SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(NewDocFrm.RecipientComboBox.Text)));
               end;
             end;
          1: begin // Расходная накладная
               with NewDocFrm.pFIBDataSet3 do
               begin
                 SelectSQL.Add('select * from HDR_RASHOD');
                 SelectSQL.Add('where DOC_TYPE = 2');
                 SelectSQL.Add('and DOC_NUMBER = ' + NewDocFrm.DocNoEdit.Text);
                 SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(NewDocFrm.VendorComboBox.Text)));
               end;
             end;
        3,2: begin // Переброска расход/приход
               with NewDocFrm.pFIBDataSet3 do
               begin
                 SelectSQL.Add('select * from HDR_RASHOD');
                 SelectSQL.Add('where DOC_TYPE = 3');
                 SelectSQL.Add('and DOC_NUMBER = ' + NewDocFrm.DocNoEdit.Text);
                 SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(NewDocFrm.VendorComboBox.Text)));
                 SelectSQL.Add('union');
                 SelectSQL.Add('select * from HDR_PRIHOD');
                 SelectSQL.Add('where DOC_TYPE = 7');
                 SelectSQL.Add('and DOC_NUMBER = ' + NewDocFrm.DocNoEdit.Text);
                 SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(NewDocFrm.RecipientComboBox.Text)));
               end;
             end;
          4: begin // Возврат поставщику
               with NewDocFrm.pFIBDataSet3 do
               begin
                 SelectSQL.Add('select * from HDR_RASHOD');
                 SelectSQL.Add('where DOC_TYPE = 8');
                 SelectSQL.Add('and DOC_NUMBER = ' + NewDocFrm.DocNoEdit.Text);
                 SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(NewDocFrm.VendorComboBox.Text)));
               end;
             end;
          5: begin // Возврат поставщика
               with NewDocFrm.pFIBDataSet3 do
               begin
                 SelectSQL.Add('select * from HDR_PRIHOD');
                 SelectSQL.Add('where DOC_TYPE = 10');
                 SelectSQL.Add('and DOC_NUMBER = ' + NewDocFrm.DocNoEdit.Text);
                 SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(NewDocFrm.RecipientComboBox.Text)));
               end;
             end;
          6: if NewDocFrm.DocTypeComboBox.Items[6] = 'Резервирование товара' then // Списание, Резервирование
             begin
               with NewDocFrm.pFIBDataSet3 do
               begin
                 SelectSQL.Add('select * from HDR_RASHOD');
                 SelectSQL.Add('where DOC_TYPE = 12');
                 SelectSQL.Add('and DOC_NUMBER = ' + NewDocFrm.DocNoEdit.Text);
                 SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(NewDocFrm.VendorComboBox.Text)));
               end;
             end
             else
             begin
               with NewDocFrm.pFIBDataSet3 do
               begin
                 SelectSQL.Add('select * from HDR_RASHOD');
                 SelectSQL.Add('where DOC_TYPE = 9');
                 SelectSQL.Add('and DOC_DATE = ''' + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime) + '''');
                 SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(NewDocFrm.VendorComboBox.Text)));
                 Open;
                 if not VarIsNull(NewDocFrm.pFIBDataSet3['DOC_NUMBER'])then
                 begin
                   MessageDlg('Списание на данную дату уже существует, док-т будет пополнен',
                               mtWarning, [mbOK], 0);
                   NewDocFrm.DocNoEdit.Tag:= NewDocFrm.pFIBDataSet3['KOD'];
                 end;
               end;
             end;
        end;
        NewDocFrm.pFIBDataSet3.Open;
        Result:= not VarIsNull(NewDocFrm.pFIBDataSet3['MARKET_CODE'])and (NewDocFrm.pFIBDataSet3['KOD'] <> NewDocFrm.DocNoEdit.Tag);
        NewDocFrm.pFIBDataSet3.Close;
end;

procedure TNewDocFrm.DocTypeComboBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if ((Sender = DocNoEdit)and BitBtn1.Enabled and (Key = VK_RETURN)) then BitBtn1.SetFocus
     else
       if Key = VK_RETURN then SelectNext(Sender as TWinControl, True, True);
end;

procedure TNewDocFrm.AddNewDocUpdate(Sender: TObject);
begin
        if DocTypeComboBox.ItemIndex in [2,3]then
          AddNewDoc.Enabled:= (VendorComboBox.ItemIndex <> RecipientComboBox.ItemIndex)
                                and (DocNoEdit.Text <> '')
        else AddNewDoc.Enabled:= DocNoEdit.Text <> '';
end;

procedure TNewDocFrm.N1Click(Sender: TObject);
var i: Integer;
begin
  if MessageDlg('Очистить текущий документ и добавить позиции из очереди ?',
    mtConfirmation, [mbYes, mbNo], 0)= idYES then
    begin
      ShopMainForm.pFIBDatabase1.Execute('delete from POS_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
      Application.CreateForm(TQueueFrm, QueueFrm);
      QueueFrm.pFIBDataSet1.Open;
      if not VarIsNull(QueueFrm.pFIBDataSet1['QUEUE_NUMBER'])then
      begin
        QueueFrm.pFIBDataSet2.Open;
        if QueueFrm.ShowModal = IDOK then
          begin
            i:= QueueFrm.pFIBDataSet1['QUEUE_NUMBER'];
            ShopMainForm.pFIBDatabase1.Execute('insert into POS_TMP_DOC(KOD, ITEM, '
              + 'KOLVO, MARKET_CODE, PRICE, VEND_PRICE)'
              + 'select ' + IntToStr(UsrTmpCode) + ', Q.ITEM, Q.KOLVO, '
              + IntToStr(Market_Code) + ', P.SALE_PRICE, P.VEND_PRICE'
              + ' from QUEUE Q left join PRICES P on P.ITEM = Q.ITEM and P.MARKET_CODE = '
              + IntToStr(CurrentMarketCode) + 'where QUEUE_NUMBER = ' + IntToStr(i));

            ShopMainForm.pFIBDatabase1.Execute('delete from QUEUE'
              + ' where QUEUE_NUMBER = ' + IntToStr(i));
            ShopMainForm.pFIBTransaction1.CommitRetaining;
            DataSetReOpen(pFIBDataSet1);
            pFIBDataSet1.Last;
          end;
      end
      else MessageDlg('Нет чеков в очереди', mtInformation, [mbOK], 0);
      QueueFrm.Free;
    end;
end;

procedure TNewDocFrm.N2Click(Sender: TObject);
begin
  ShopMainForm.OpenDialog1.Filter:= 'Файлы таблиц|*.xml';
  ShopMainForm.OpenDialog1.InitialDir:= ExtractFilePath(ParamStr(0)) + 'Saves\';
  if ShopMainForm.OpenDialog1.Execute then
  begin
    ClientDataSet1.LoadFromFile(ShopMainForm.OpenDialog1.FileName);
    ClientDataSet1.Open;
//      FormatSettings.DecimalSeparator:= '.';
      ShopMainForm.pFIBService.SelectSQL.Clear;
      ShopMainForm.pFIBService.SelectSQL.Add('select ITEM from POS_TMP_DOC'
        + ' where KOD = ' + UsrTmpCode.ToString);
//        + ''' and ITEM = ''' + ClientDataSet1['ITEM']
      ShopMainForm.pFIBService.Open;
    while not ClientDataSet1.Eof do
    begin
      if(( not VarIsNull(ClientDataSet1['KOLVO']))and(ClientDataSet1['KOLVO'] > 0))then
      begin
        if ShopMainForm.pFIBService.Locate('ITEM', ClientDataSet1['ITEM'], []) then
          ExecSQLStr('update POS_TMP_DOC set KOLVO = KOLVO + '
            + StringReplace(FloatToStr(ClientDataSet1['KOLVO']), ',', '.', [])
            + ' where ITEM = ''' + ClientDataSet1['ITEM']
            + ''' and KOD = ' + IntToStr(UsrTmpCode))
        else
          ExecSQLStr('insert into POS_TMP_DOC(KOD, ITEM, '
            + 'KOLVO, MARKET_CODE, PRICE, VEND_PRICE)'
            + 'select ' + IntToStr(UsrTmpCode) + ', ''' + ClientDataSet1['ITEM'] + ''', '
            + StringReplace(FloatToStr(ClientDataSet1['KOLVO']), ',', '.', []) + ', '
            + IntToStr(Market_Code) + ', P.SALE_PRICE, P.VEND_PRICE'
            + ' from PRICES P where P.ITEM = ''' + ClientDataSet1['ITEM']
            + ''' and P.MARKET_CODE = ' + IntToStr(CurrentMarketCode));
      end;
      ClientDataSet1.Next;
    end;
    ShopMainForm.pFIBService.Close;

//      FormatSettings.DecimalSeparator:= TmpSep;
    ClientDataSet1.Close;
    ShopMainForm.pFIBTransaction1.CommitRetaining;
    pFIBDataSet1.ReopenLocate('ITEM');
    pFIBDataSet1.Last;

    if MessageDlg('Удалить добавленный файл ?',  mtWarning, [mbYes, mbNo], 0)= idYES then DelExists(ShopMainForm.OpenDialog1.FileName);
  end;
end;

procedure TNewDocFrm.NewDocNoBtnClick(Sender: TObject);
var NewDocValue, i: Integer;
begin  // Генерация нового номера документа
       pFIBDataSet3.SelectSQL.Clear;
       NewDocValue:= 1;
       case DocTypeComboBox.ItemIndex of
         0: begin // Приходная накладная
              with pFIBDataSet3 do
              begin
                SelectSQL.Add('select max(DOC_NUMBER) as MAX_DOC from HDR_PRIHOD');
                SelectSQL.Add('where DOC_TYPE = 1');
                SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(RecipientComboBox.Text)));
                Open;
                if not VarIsNull(pFIBDataSet3['MAX_DOC'])then
                  NewDocValue:= pFIBDataSet3['MAX_DOC'] + 1;
                Close;
              end;
            end;
         1: begin // Расходная накладная
              with pFIBDataSet3 do
              begin
                SelectSQL.Add('select max(DOC_NUMBER) as MAX_DOC from HDR_RASHOD');
                SelectSQL.Add('where DOC_TYPE = 2');
                SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(VendorComboBox.Text)));
                Open;
                if not VarIsNull(pFIBDataSet3['MAX_DOC'])then
                  NewDocValue:= pFIBDataSet3['MAX_DOC'] + 1;
                Close;
              end;
            end;
       2,3: begin // Переброска расход/приход
              i:= -1;
              with pFIBDataSet3 do
              begin
                SelectSQL.Add('select max(DOC_NUMBER) as MAX_DOC from HDR_RASHOD');
                SelectSQL.Add('where DOC_TYPE = 3');
                SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(VendorComboBox.Text)));
                Open;
                if not VarIsNull(pFIBDataSet3['MAX_DOC'])then
                   i:= pFIBDataSet3['MAX_DOC'];
                Close;
                SelectSQL.Clear;
                SelectSQL.Add('select max(DOC_NUMBER) as MAX_DOC from HDR_PRIHOD');
                SelectSQL.Add('where DOC_TYPE = 7');
                SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(RecipientComboBox.Text)));
                Open;
                if not VarIsNull(pFIBDataSet3['MAX_DOC'])then
                  if i < pFIBDataSet3['MAX_DOC'] then
                     i:= pFIBDataSet3['MAX_DOC'];
                Close;
                if i <> -1 then NewDocValue:= i + 1 else NewDocValue:= 1;
              end;
            end;
         4: begin // Возврат поставщику
              with pFIBDataSet3 do
              begin
                SelectSQL.Add('select max(DOC_NUMBER) as MAX_DOC from HDR_RASHOD');
                SelectSQL.Add('where DOC_TYPE = 8');
                SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(VendorComboBox.Text)));
                Open;
                if not VarIsNull(pFIBDataSet3['MAX_DOC'])then
                  NewDocValue:= pFIBDataSet3['MAX_DOC'] + 1;
                Close;
              end;
            end;
         5: begin // Возврат поставщика
              with pFIBDataSet3 do
              begin
                SelectSQL.Add('select max(DOC_NUMBER) as MAX_DOC from HDR_PRIHOD');
                SelectSQL.Add('where DOC_TYPE = 10');
                SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(RecipientComboBox.Text)));
                Open;
                if not VarIsNull(pFIBDataSet3['MAX_DOC'])then
                  NewDocValue:= pFIBDataSet3['MAX_DOC'] + 1;
                Close;
              end;
            end;
         6: begin // Списание, Резервирование
              with pFIBDataSet3 do
              begin
                SelectSQL.Add('select max(DOC_NUMBER) as MAX_DOC from HDR_RASHOD');
                if DocTypeComboBox.Items[6] = 'Резервирование товара' then SelectSQL.Add('where DOC_TYPE = 12')
                else SelectSQL.Add('where DOC_TYPE = 9');
                SelectSQL.Add('and MARKET_CODE = '
                        + IntToStr(FindMarketCode(VendorComboBox.Text)));
                Open;
                if not VarIsNull(pFIBDataSet3['MAX_DOC'])then
                  NewDocValue:= pFIBDataSet3['MAX_DOC'] + 1;
                Close;
              end;
            end;
       end;
       DocNoEdit.Text:= IntToStr(NewDocValue);
       DocNoEdit.SetFocus;
end;

procedure TNewDocFrm.BitBtn1Click(Sender: TObject);
var SQLStr: String;
begin
        if CheckDubNakl then
        begin
          MessageDlg('Документ с номером ' + DocNoEdit.Text + ' уже существует',
                               mtWarning, [mbOK], 0);
          DocNoEdit.SetFocus;
        end
        else
        begin
          DraftCopyBtn.Visible:= False;
          BitBtn1.Visible:= False;
          BitBtn2.Visible:= False;
          Panel4.Visible:= False;
          NewDocFrm.ClientHeight:= Panel1.Height + Panel5.Height;//477;
          Panel1.Visible:= True;
//          DateTimePicker.Enabled:= False;
//          DocNoEdit.Enabled:= False;
          VendorComboBox.Enabled:= False;
          RecipientComboBox.Enabled:= False;
          PosItemEdit.SetFocus;
          pFIBStoredProc1.ExecProc;
          if UsrTmpCode = -1 then
          begin
            UsrTmpCode:= pFIBStoredProc1.ParamValue('TMP_CODE');
            begin
              SQLStr:= 'insert into HDR_TMP_DOC(KOD, AUTOR_KOD, DOC_DATE, DOC_NUMBER, '
                       + ' DOC_TYPE, VENDOR_CODE, MARKET_CODE)'
                       + 'values (' + IntToStr(UsrTmpCode) + ', ' + IntToStr(User_ID) + ', '''
                       + DateTimeToStr(DateTimePicker.DateTime) + ''', ' + DocNoEdit.Text
                       + ', ';
              case DocTypeComboBox.ItemIndex of
                0: begin
                     Market_Code:= FindMarketCode(RecipientComboBox.Text);
                     SQLStr:= SQLStr + '1, ' + IntToStr(FindVendorCode(VendorComboBox.Text)) + ', '
                           + IntToStr(Market_Code) + ')';
                   end;
                1: begin
                     Market_Code:= FindMarketCode(VendorComboBox.Text);
                     SQLStr:= SQLStr + '2, ' + IntToStr(FindBuyerCode(RecipientComboBox.Text)) + ', '
                           + IntToStr(Market_Code) + ')';
                   end;
                2: begin
                     Market_Code:= FindMarketCode(VendorComboBox.Text);
                     SQLStr:= SQLStr + '3, ' + IntToStr(FindMarketCode(RecipientComboBox.Text)) + ', '
                           + IntToStr(Market_Code) + ')';
                   end;
                3: begin
                     Market_Code:= FindMarketCode(RecipientComboBox.Text);
                     SQLStr:= SQLStr + '7, ' + IntToStr(FindMarketCode(VendorComboBox.Text)) + ', '
                           + IntToStr(Market_Code) + ')';
                   end;
                4: begin
                     Market_Code:= FindMarketCode(VendorComboBox.Text);
                     SQLStr:= SQLStr + '8, ' + IntToStr(FindVendorCode(RecipientComboBox.Text)) + ', '
                           + IntToStr(Market_Code) + ')';
                   end;
                5: begin
                     Market_Code:= FindMarketCode(RecipientComboBox.Text);
                     SQLStr:= SQLStr + '10, ' + IntToStr(FindBuyerCode(VendorComboBox.Text)) + ', '
                           + IntToStr(Market_Code) + ')';
                   end;
                6: if DocTypeComboBox.Items[6] = 'Резервирование товара' then
                   begin
                     Market_Code:= FindMarketCode(VendorComboBox.Text);
                     SQLStr:= SQLStr + '12, ' + IntToStr(FindBuyerCode(RecipientComboBox.Text)) + ', '
                           + IntToStr(Market_Code) + ')';
                   end
                   else
                   begin
                     Market_Code:= FindMarketCode(VendorComboBox.Text);
                     SQLStr:= SQLStr + '9, -1, ' + IntToStr(Market_Code) + ')';
                   end;
              end;
              ShopMainForm.pFIBDatabase1.Execute(SQLStr);
            end;
          end;
          with pFIBDataSet1 do
          begin
            Close;
            SelectSQL.Clear;
            SelectSQL.Add('select D.*, T.*, G.GROUP_NAME, U.UNIT_NAME, (D.KOLVO * D.PRICE)as POS_SUM, (D.KOLVO * D.VEND_PRICE)as VEND_SUM');
            SelectSQL.Add('from POS_TMP_DOC D');
            SelectSQL.Add('left join SPR_TOVAR T on D.ITEM = T.ITEM');
            SelectSQL.Add('left join SPR_GROUP G on G.T_GROUP = T.T_GROUP');
            SelectSQL.Add('left join SPR_UNITS U on T.UNIT_KOD = U.UNIT_KOD');
            SelectSQL.Add('where KOD = ' + IntToStr(UsrTmpCode));
            SelectSQL.Add('order by T.TOVAR_NAME');
            Open;
            Last;
          end
        end;
end;

procedure TNewDocFrm.FormCreate(Sender: TObject);
begin
       NewDocFrm.ClientHeight:= Panel4.Height + Panel5.Height ; //165;
       NewDocFrm.Left:= (Screen.Width - NewDocFrm.Width) div 2;
       NewDocFrm.Top:= 50;
       UsrTmpCode:= -1;
       GroupCode:= -1;
       BitBtn1.OnClick:= BitBtn1Click;
       BitBtn4.OnClick:= BitBtn4Click;
       SpeedButton5.Down:= CurNakl > 0;
       ActiveControl:= VendorComboBox;
end;

procedure TNewDocFrm.FromXMLFileBitBtnClick(Sender: TObject);
var PosPrice: Double;
begin
  ShopMainForm.OpenDialog1.InitialDir:= ExtractFilePath(ParamStr(0)) + 'Saves\';
  ShopMainForm.OpenDialog1.Filter:= 'Таблицы|*_*_*.xml';
  if ShopMainForm.OpenDialog1.Execute then
  begin
    with ClientDataSet2 do
    begin
      LoadFromFile(ShopMainForm.OpenDialog1.FileName);
      Open;
      VendorComboBox.ItemIndex:= VendorComboBox.Items.IndexOf(FindMarket(ClientDataSet2['SENDER_MARKET_CODE']));
      RecipientComboBox.ItemIndex:= RecipientComboBox.Items.IndexOf(FindMarket(ClientDataSet2['DEST_MARKET_CODE']));
      NewDocNoBtn.Click;
      BitBtn1.Click;
      while not Eof do
      begin
        if ((not VarIsNull(ClientDataSet2['KOLVO']))and(ClientDataSet2['KOLVO'] > 0))then
        begin
          ShopMainForm.pFindTovarStoredProc.ParamByName('FIND_ITEM').AsString:= ClientDataSet2['ITEM'];
          ShopMainForm.pFindTovarStoredProc.ExecProc;
          if ShopMainForm.pFindTovarStoredProc.ParamByName('RESULT').AsInteger = 0 then
            MessageDlg('Товар с кодом ' + ClientDataSet2['ITEM'] + 'не зарегистрирован', mtInformation, [mbOK], 0)
          else
          begin
            case PriceTypeComboBox.ItemIndex of
              0: PosPrice:= ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE').AsFloat;
              1: PosPrice:= ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_1').AsFloat;
              2: PosPrice:= ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_2').AsFloat;
              3: PosPrice:= ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_3').AsFloat;
              4: PosPrice:= ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_4').AsFloat;
              5: PosPrice:= ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_5').AsFloat;
              6: PosPrice:= ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_6').AsFloat;
              7: PosPrice:= ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_7').AsFloat;
              8: PosPrice:= ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_8').AsFloat;
              9: PosPrice:= ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_9').AsFloat;
            end;

            ExecSQLStr('insert into POS_TMP_DOC(KOD, ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE) values ('
              + UsrTmpCode.ToString + ', ''' + ClientDataSet2['ITEM'] + ''', '
              + StringReplace(FloatToStr(ClientDataSet2['KOLVO']), ',', '.', []) + ', '
              + StringReplace(FloatToStr(PosPrice), ',', '.', []) + ', '
              + StringReplace(FloatToStr(ShopMainForm.pFindTovarStoredProc.ParamByName('VEND_PRICE').AsFloat), ',', '.', []) + ', '
              + IntToStr(FindMarketCode(VendorComboBox.Text)) + ')');
          end;
        end;
        Next;
      end;
      Close;
      ShopMainForm.pFIBTransaction1.CommitRetaining;
      DataSetReOpen(pFIBDataSet1);
      if MessageDlg('Удалить добавленный файл ?',  mtWarning, [mbYes, mbNo], 0)= idYES then DelExists(ShopMainForm.OpenDialog1.FileName);
    end;
  end;
  ShopMainForm.OpenDialog1.Filter:= '';
end;

procedure TNewDocFrm.pFIBDataSet1AfterOpen(DataSet: TDataSet);
begin
        with pFIBDataSet2 do
        begin
          Close;
          SelectSQL.Clear;
          SelectSQL.Add('select * from HDR_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
          Open;
          Label9.Caption:= FloatToStrF(pFIBDataSet2['DOC_SUM'], ffCurrency, 12, 2);
          Label10.Caption:= FloatToStrF(pFIBDataSet2['VEND_SUM'], ffCurrency, 12, 2);
          BitBtn4.Enabled:= pFIBDataSet2['DOC_SUM'] > 0;
          LMDButton1.Enabled:= pFIBDataSet2['DOC_SUM'] > 0;
          LMDButton2.Enabled:= pFIBDataSet2['DOC_SUM'] > 0;
          BitBtn4.Enabled:= pFIBDataSet2['DOC_SUM'] > 0;
          BitBtn5.Enabled:= pFIBDataSet2['DOC_SUM'] > 0;
          Close;
        end;
end;

procedure TNewDocFrm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
      if Panel1.Visible and NewDocNoBtn.Visible and not(ModalResult = idOK) then
        if MessageDlg('Сохранить текущий документ в черновиках',
                        mtConfirmation, [mbYes,mbNo], 0) = idNo then
          begin
              ShopMainForm.pFIBDatabase1.Execute('delete from HDR_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
              ShopMainForm.pFIBDatabase1.Execute('delete from POS_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
              CurNakl:= 0;
          end;
end;

procedure TNewDocFrm.PosItemEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//var CurItem: String;
begin
      case Key of
        VK_RETURN: if(PosItemEdit.Text <> '')then
        begin
          ShopMainForm.pFindTovarStoredProc.ParamByName('FIND_ITEM').AsString:= PosItemEdit.Text;
          ShopMainForm.pFindTovarStoredProc.ExecProc;
          if ShopMainForm.pFindTovarStoredProc.ParamByName('RESULT').AsInteger = 0 then
          begin
            MessageDlg('Данный товар не зарегистрирован', mtInformation, [mbOK], 0);
            PosItemEdit.SelectAll;
          end
          else
          begin
            PosItemEdit.Text:= ShopMainForm.pFindTovarStoredProc.ParamByName('ITEM').AsString;
            NameEdit.Text:= ShopMainForm.pFindTovarStoredProc.ParamByName('NAME').AsString;
            case PriceTypeComboBox.ItemIndex of
              0: PosPriceEdit.Text:=
                    FloatToStrF(ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE').AsCurrency, ffFixed, 14, 2);
              1: PosPriceEdit.Text:=
                    FloatToStrF(ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_1').AsCurrency, ffFixed, 14, 2);
              2: PosPriceEdit.Text:=
                    FloatToStrF(ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_2').AsCurrency, ffFixed, 14, 2);
              3: PosPriceEdit.Text:=
                    FloatToStrF(ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_3').AsCurrency, ffFixed, 14, 2);
              4: PosPriceEdit.Text:=
                    FloatToStrF(ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_4').AsCurrency, ffFixed, 14, 2);
              5: PosPriceEdit.Text:=
                    FloatToStrF(ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_5').AsCurrency, ffFixed, 14, 2);
              6: PosPriceEdit.Text:=
                    FloatToStrF(ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_6').AsCurrency, ffFixed, 14, 2);
              7: PosPriceEdit.Text:=
                    FloatToStrF(ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_7').AsCurrency, ffFixed, 14, 2);
              8: PosPriceEdit.Text:=
                    FloatToStrF(ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_8').AsCurrency, ffFixed, 14, 2);
              9: PosPriceEdit.Text:=
                    FloatToStrF(ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_9').AsCurrency, ffFixed, 14, 2);
            end;
            PosVendPriceEdit.Text:= FloatToStrF(ShopMainForm.pFindTovarStoredProc.ParamByName('VEND_PRICE').AsCurrency, ffFixed, 14, 2);
            GroupCode:= ShopMainForm.pFindTovarStoredProc.ParamByName('T_GROUP').AsInteger;
            PosKolvoEdit.Enabled:= True;
            PosKolvoEdit.Text:= '1';
            PosKolvoEdit.SetFocus;
            PosPriceEdit.Enabled:= True;
            PosVendPriceEdit.Enabled:= True;
            PosItemEdit.Enabled:= False;
            if pFIBDataSet1.Locate('ITEM', PosItemEdit.Text, []) then
              MessageDlg('Данный товар уже добавлен', mtWarning, [mbOK], 0);
          end;
        end;
        VK_INSERT: if(Sender = PosItemEdit)then AddSprBtn.Click;
        VK_ESCAPE: PosItemEdit.Text:= '';
      end;
end;

procedure TNewDocFrm.PosKolvoEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var PosPrice, PosVendPrice, PosKolvo: Double;
    TmpDSep: Char;
    i: Integer;
begin
     i:= 0;
     case Key of
      VK_RETURN : if(Sender as TComponent).Tag = 0 then
                        SelectNext(Sender as TWinControl, True, True)
                  else
                    if(StrToFloat('0' + PosKolvoEdit.Text) > 0)
                      and(StrToFloat('0' + PosPriceEdit.Text) > 0)
                      and(StrToFloat('0' + PosVendPriceEdit.Text) > 0)
                      then
                    begin
                       PosPrice:= StrToFloat('0' + PosPriceEdit.Text);
                       PosVendPrice:= StrToFloat('0' + PosVendPriceEdit.Text);
                       PosKolvo:= StrToFloat('0' + PosKolvoEdit.Text);
                       TmpDSep:= FormatSettings.DecimalSeparator;
                       FormatSettings.DecimalSeparator:= '.';
                       if pFIBDataSet1.Locate('ITEM;KOD',
                              VarArrayOf([PosItemEdit.Text,UsrTmpCode]),
                                [loCaseInsensitive])then
                         ShopMainForm.pFIBDatabase1.Execute('update POS_TMP_DOC'
                           + ' set KOLVO = ' + FloatToStr(PosKolvo) + ','
                           + ' PRICE = ' + FloatToStr(PosPrice) + ','
                           + ' VEND_PRICE = ' + FloatToStr(PosVendPrice)
                           + ' where KOD = ' + IntToStr(UsrTmpCode)
                           + ' and ITEM = ' + PosItemEdit.Text)
                       else
                         ShopMainForm.pFIBDatabase1.Execute('insert into POS_TMP_DOC(KOD, ITEM, KOLVO, PRICE, '
                           + 'VEND_PRICE, MARKET_CODE) values (' + IntToStr(UsrTmpCode)+ ', '''
                           + PosItemEdit.Text + ''', ' + FloatToStr(PosKolvo) + ', '
                           + FloatToStr(PosPrice) + ', ' + FloatToStr(PosVendPrice) + ', '
                           + IntToStr(Market_Code) + ')');
                       FormatSettings.DecimalSeparator:= TmpDSep;
                       DataSetReOpen(pFIBDataSet1);
                       pFIBDataSet1.Last;
                       NameEdit.Text:= '';
                       PosPriceEdit.Text:= '0';
                       PosVendPriceEdit.Text:= '0';
                       PosKolvoEdit.Text:= '0';
                       PosPriceEdit.Enabled:= False;
                       PosVendPriceEdit.Enabled:= False;
                       PosKolvoEdit.Enabled:= False;
                       PosItemEdit.Enabled:= True;
                       PosItemEdit.Text:= '';
                       GroupCode:= -1;
                       PosItemEdit.SetFocus;
                    end;
      VK_ESCAPE : begin
                    NameEdit.Text:= '';
                    PosPriceEdit.Text:= '0';
                    PosVendPriceEdit.Text:= '0';
                    PosKolvoEdit.Text:= '0';
                    PosPriceEdit.Enabled:= False;
                    PosVendPriceEdit.Enabled:= False;
                    PosKolvoEdit.Enabled:= False;
                    PosItemEdit.Enabled:= True;
                    PosItemEdit.Text:= '';
                    PosItemEdit.SetFocus;
                  end;
          VK_ADD: begin
                    with ShopMainForm.pFIBService do
                    begin
                      SelectSQL.Clear;
                      SelectSQL.Add('select * from SPR_CHARGE where ITEM = ''' + PosItemEdit.Text + '''');
                      Open;
                      if VarIsNull(ShopMainForm.pFIBService['EXTRA_CHARGE'])then
                        MessageDlg('Норма наценки не задана', mtWarning, [mbOK], 0)
                      else
                      begin
                        if not ShopIni.ReadBool('Main', 'PriceOKR', False) then Inc(i);
                        PosPriceEdit.Text:= FloatToStrF(StrToFloat('0' + PosVendPriceEdit.Text)
                           + StrToFloat('0' + PosVendPriceEdit.Text)/100*ShopMainForm.pFIBService['EXTRA_CHARGE'], ffFixed, 12, i);
                      end;
                      Close;
                    end;
                  end;
       VK_INSERT: begin
                    Application.CreateForm(TVendSummFactFrm, VendSummFactFrm);
                    VendSummFactFrm.Caption:= 'Расчет цены';
                    VendSummFactFrm.Label1.Caption:= 'Общая сумма позиции :';
                    VendSummFactFrm.MoneyEdit1.Text:= '0';
                    if(VendSummFactFrm.ShowModal = idOK)and(StrToFloat('0' + VendSummFactFrm.MoneyEdit1.Text) > 0)then
                      PosVendPriceEdit.Text:= FloatToStrF(StrToFloat('0' + VendSummFactFrm.MoneyEdit1.Text) / StrToFloat('0' + PosKolvoEdit.Text), ffFixed, 14, 2);
                    VendSummFactFrm.Free;
                  end;
     VK_MULTIPLY,56:if ((key = 56)and(ssShift in Shift))or(Key = VK_MULTIPLY) then
                  begin
                    if (Sender = PosPriceEdit) then
                    begin
                      if StrToFloat('0' + PosVendPriceEdit.Text) > 0 then
                      begin
                      Application.CreateForm(TVendSummFactFrm, VendSummFactFrm);
                      VendSummFactFrm.Tag:= 2;
                      VendSummFactFrm.MoneyEdit1.Visible:= False;
                      VendSummFactFrm.Edit1.Visible:= True;
                      VendSummFactFrm.Edit1.Text:= ShopIni.ReadString('Main', 'AddMultiply', '1');
                      VendSummFactFrm.ActiveControl:= VendSummFactFrm.Edit1;
                      VendSummFactFrm.Caption:= 'Цена продажи';
                      VendSummFactFrm.Label1.Caption:= 'Процент наценки :';
                      if VendSummFactFrm.ShowModal = IDOK then
                      begin
                        ShopIni.WriteString('Main', 'AddMultiply', VendSummFactFrm.Edit1.Text);
                        PosPriceEdit.Text:= FloatToStrF(StrToFloat('0' + PosVendPriceEdit.Text) * (1 + StrToInt(VendSummFactFrm.Edit1.Text)/100.00), ffFixed, 14, 0);
                        PosPriceEdit.SelectAll;
                      end;
                      VendSummFactFrm.Free;
                      end
                      else MessageDlg('Цена поставщика не задана',  mtWarning, [mbOK], 0);
                    end
                    else
                    begin
                      Application.CreateForm(TVendSummFactFrm, VendSummFactFrm);
                      VendSummFactFrm.Tag:= 2;
                      VendSummFactFrm.MoneyEdit1.Visible:= False;
                      VendSummFactFrm.Edit1.Visible:= True;
                      VendSummFactFrm.Edit1.Text:= ShopIni.ReadString('Main', 'AddMultiply', '1');
                      VendSummFactFrm.ActiveControl:= VendSummFactFrm.Edit1;
                      VendSummFactFrm.Caption:= 'Изменение цены поставщика';
                      VendSummFactFrm.Label1.Caption:= 'Процент надбавки :';
                      if VendSummFactFrm.ShowModal = IDOK then
                      begin
                        ShopIni.WriteString('Main', 'AddMultiply', VendSummFactFrm.Edit1.Text);
                        PosVendPriceEdit.Text:= FloatToStrF(StrToFloat('0' + PosVendPriceEdit.Text) * (1 + StrToInt(VendSummFactFrm.Edit1.Text)/100.00), ffFixed, 14, 2);
                      end;
                      VendSummFactFrm.Free;
                    end;
                  end;
     end;
end;

procedure TNewDocFrm.DraftCopyBtnClick(Sender: TObject);
begin
        with pFIBDataSet2 do
        begin
          Close;
          SelectSQL.Clear;
          case DocTypeComboBox.ItemIndex of
          0,4: begin
                 SelectSQL.Add('select H.*, M.SHORT_NAME, V.VENDOR_NAME V_NAME, U.NAME');
                 SelectSQL.Add('from HDR_TMP_DOC H, SPR_MARKET M, SPR_VENDORS V, SPR_USERS U');
                 if DocTypeComboBox.ItemIndex = 0 then SelectSQL.Add('where DOC_TYPE = 1')
                 else SelectSQL.Add('where DOC_TYPE = 8');
                 SelectSQL.Add('and H.VENDOR_CODE = V.VENDOR_CODE');
               end;
          1,5: begin
                 SelectSQL.Add('select H.*, M.SHORT_NAME, V.BUYER_NAME V_NAME, U.NAME');
                 SelectSQL.Add('from HDR_TMP_DOC H, SPR_MARKET M, SPR_BUYERS V, SPR_USERS U');
                 if DocTypeComboBox.ItemIndex = 1 then SelectSQL.Add('where DOC_TYPE = 2')
                 else SelectSQL.Add('where DOC_TYPE = 10');
                 SelectSQL.Add('and H.VENDOR_CODE = V.BUYER_CODE');
               end;
            2: begin
                 SelectSQL.Add('select H.*, M.SHORT_NAME V_NAME, V.SHORT_NAME, U.NAME');
                 SelectSQL.Add('from HDR_TMP_DOC H, SPR_MARKET M, SPR_MARKET V, SPR_USERS U');
                 if DocTypeComboBox.ItemIndex = 2 then SelectSQL.Add('where DOC_TYPE = 3')
                 else SelectSQL.Add('where DOC_TYPE = 7');
                 SelectSQL.Add('and H.VENDOR_CODE = V.MARKET_CODE');
               end;
            3: begin
                 SelectSQL.Add('select H.*, M.SHORT_NAME, V.SHORT_NAME V_NAME, U.NAME');
                 SelectSQL.Add('from HDR_TMP_DOC H, SPR_MARKET M, SPR_MARKET V, SPR_USERS U');
                 if DocTypeComboBox.ItemIndex = 2 then SelectSQL.Add('where DOC_TYPE = 3')
                 else SelectSQL.Add('where DOC_TYPE = 7');
                 SelectSQL.Add('and H.VENDOR_CODE = V.MARKET_CODE');
               end;
            6: if DocTypeComboBox.Items[6] = 'Резервирование товара' then
               begin
                 SelectSQL.Add('select H.*, M.SHORT_NAME, V.BUYER_NAME V_NAME');
                 SelectSQL.Add('from HDR_TMP_DOC H, SPR_MARKET M, SPR_BUYERS V, SPR_USERS U');
                 SelectSQL.Add('where DOC_TYPE = 12');
                 SelectSQL.Add('and H.VENDOR_CODE = V.BUYER_CODE');
               end
               else
               begin
                 SelectSQL.Add('select H.*, M.SHORT_NAME, '''' V_NAME');
                 SelectSQL.Add('from HDR_TMP_DOC H, SPR_MARKET M, SPR_USERS U');
                 SelectSQL.Add('where DOC_TYPE = 9');
               end;
          end;
          SelectSQL.Add('and H.MARKET_CODE = M.MARKET_CODE and H.AUTOR_KOD = U.AUTOR_KOD');
          SelectSQL.Add('order by H.DOC_DATE');
          Open;
          if VarIsNull(pFIBDataSet2['KOD'])then begin
            MessageDlg('Черновики документов не найдены', mtInformation, [mbOK], 0);
          end
          else
          begin
            NewDocFrm.ClientHeight:= Panel2.Height + Panel5.Height; //368;
            Panel2.Top:= DraftCopyBtn.Top;
            Panel2.Visible:= True;
            Panel4.Visible:= False;
            DBGrid2.SetFocus;
          end;
        end;
end;

procedure TNewDocFrm.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key = VK_RETURN then DBGrid2DblClick(Sender);
end;

procedure TNewDocFrm.DBGrid2DblClick(Sender: TObject);
begin
            DateTimePicker.DateTime:= pFIBDataSet2['DOC_DATE'];
            DocNoEdit.Text:= pFIBDataSet2['DOC_NUMBER'];
            case DocTypeComboBox.ItemIndex of
        0,5,2,3: begin
                   VendorComboBox.ItemIndex:=
                      FindString(pFIBDataSet2['V_NAME'], VendorComboBox.Items);
                   RecipientComboBox.ItemIndex:=
                      FindString(pFIBDataSet2['SHORT_NAME'], RecipientComboBox.Items);
                 end;
        1,4,6: begin;
                   VendorComboBox.ItemIndex:=
                      FindString(pFIBDataSet2['SHORT_NAME'], VendorComboBox.Items);
                   RecipientComboBox.ItemIndex:=
                      FindString(pFIBDataSet2['V_NAME'], RecipientComboBox.Items);
                 end;
            end;
            UsrTmpCode:= pFIBDataSet2['KOD'];
            Market_Code:= pFIBDataSet2['MARKET_CODE'];
            NewDocFrm.ClientHeight:= Panel4.Height + Panel5.Height;
            Panel2.Visible:= False;
            Panel4.Visible:= True;
            BitBtn1.Click;
end;

procedure TNewDocFrm.BitBtn4Click(Sender: TObject);
begin
      if CheckDubNakl then
      begin
        MessageDlg('Документ с номером ' + DocNoEdit.Text + ' уже существует', mtWarning, [mbOK], 0);
        DocNoEdit.SetFocus;
      end
      else
        if(DocNoEdit.Tag = -1)then
        begin
         if MessageDlg('Провести текущий документ',
                  mtConfirmation, [mbYes,mbNo], 0) = idYes then ModalResult:= idOK;
        end
        else if MessageDlg('Изменить текущий документ',
                  mtConfirmation, [mbYes,mbNo], 0) = idYes then ModalResult:= idOK;
end;

procedure TNewDocFrm.AddSprBtnClick(Sender: TObject);
var i: Integer;
begin
       i:= -1;
       if Assigned(MoveTovarFrm)then
         if not VarIsNull(MoveTovarFrm.HdrTable['KOD'])then i:= MoveTovarFrm.HdrTable['KOD'];
       PosItemEdit.Text:= ChangeWithCat;
       if Assigned(MoveTovarFrm)then
       begin
         MoveTovarFrm.HdrTable.Active:= True;
         MoveTovarFrm.HdrTable.Locate('KOD', i, []);
         MoveTovarFrm.PosTable.Active:= True;
       end;
       pFIBDataSet1.Active:= True;
       pFIBDataSet1.Last;

       PosItemEdit.SetFocus;
       PosItemEdit.SelectAll;
end;

procedure TNewDocFrm.DocNoEditKeyPress(Sender: TObject; var Key: Char);
begin
      if not(Key in [#8, '0'..'9'])then Key:= #0;
end;

procedure TNewDocFrm.LMDButton1Click(Sender: TObject);
var Del_Item, Cur_Item: String;
begin
      if MessageDlg('Удалить позицию с кодом : ' + pFIBDataSet1['ITEM']
                , mtWarning, [mbYes,mbNo], 0) = idYes then
      begin
        ShopMainForm.pFIBDatabase1.Execute('delete from POS_TMP_DOC'
          + ' where KOD = ' + IntToStr(UsrTmpCode)
          + ' and ITEM = ''' + pFIBDataSet1['ITEM'] + '''');
        Cur_Item:= pFIBDataSet1['ITEM'];
        ShopMainForm.pFIBDatabase1.Execute('delete from POS_TMP_DOC'
          + ' where KOD = ' + IntToStr(UsrTmpCode)
          + ' and ITEM = ''' + pFIBDataSet1['ITEM'] + '''');
        pFIBDataSet1.Next;
        if Cur_Item = pFIBDataSet1['ITEM'] then
          pFIBDataSet1.Prior;
        Cur_Item:= pFIBDataSet1['ITEM'];
        with pFIBDataSet1 do
        begin
          DisableControls;
          Close;
          Open;
          Locate('ITEM', Cur_Item, []);
          EnableControls;
        end;
      end;
end;

procedure TNewDocFrm.LMDButton2Click(Sender: TObject);
var FIBQuery1: TfrxFIBQuery;
begin
        with ShopMainForm.frxReport1 do
        begin
          LoadFromFile(ShopIni.ReadString('Reports', 'NaklDraft', ReportsPath + 'NaklDraft.fr3'));
          FIBQuery1:= FindObject('FIBQuery1') as TfrxFIBQuery;
          FIBQuery1.SQL:= pFIBDataSet1.SelectSQL;
          ShowReport;
        end;
end;

procedure TNewDocFrm.PosVendPriceEditChange(Sender: TObject);
begin
      if(StrToFloat('0' + PosVendPriceEdit.Text) > 0)and(StrToFloat('0' + PosPriceEdit.Text) > 0)then
        StatusBar1.Panels[2].Text:= 'Наценка ' +
          FloatToStrF((StrToFloat('0' + PosPriceEdit.Text)
            - StrToFloat('0' + PosVendPriceEdit.Text))/StrToFloat('0' + PosVendPriceEdit.Text)*100, ffFixed, 10, 0)
          + '%'
      else StatusBar1.Panels[2].Text:= '';
end;

procedure TNewDocFrm.Bpvtybnm1Click(Sender: TObject);
var i: Integer;
begin
       Application.CreateForm(TVendSummFactFrm, VendSummFactFrm);
       VendSummFactFrm.Tag:= 2;
       VendSummFactFrm.MoneyEdit1.Visible:= False;
       VendSummFactFrm.Edit1.Visible:= True;
       VendSummFactFrm.Edit1.Text:= IntToStr(pFIBDataSet2['DOC_NUMBER']);
       VendSummFactFrm.ActiveControl:= VendSummFactFrm.Edit1;
       VendSummFactFrm.Caption:= 'Изменение номера накладной';
       VendSummFactFrm.Label1.Caption:= 'Новый номер :';
       if VendSummFactFrm.ShowModal = IDOK then
       begin
         ShopMainForm.pFIBDatabase1.Execute('update HDR_TMP_DOC'
           + ' set DOC_NUMBER = ' + VendSummFactFrm.Edit1.Text
           + ' where KOD = ' + IntToStr(pFIBDataSet2['KOD']));
         i:= pFIBDataSet2['KOD'];
         with pFIBDataSet2 do
         begin
           DisableControls;
           Close;
           Open;
           Locate('KOD', i, []);
           EnableControls;
         end;
       end;
       VendSummFactFrm.Free;
end;

procedure TNewDocFrm.PosPriceEditKeyPress(Sender: TObject; var Key: Char);
begin
      if not(Key in [#8, '0'..'9', FormatSettings.DecimalSeparator])then Key:= #0;
      if(Key = FormatSettings.DecimalSeparator)and
        (Pos(FormatSettings.DecimalSeparator,(Sender as TEdit).Text) > 0)then Key:= #0;
end;

procedure TNewDocFrm.BitBtn5Click(Sender: TObject);
var CurItem: String;
  FIBQuery1: TfrxFIBQuery;
begin
      if not VarIsNull(pFIBDataSet1['ITEM']) then
      begin
        if ShopIni.ReadBool('Main', 'ChangeNDS', True) then
        begin
          Application.CreateForm(TVendSummFactFrm, VendSummFactFrm);
          VendSummFactFrm.Tag:= 2;
          VendSummFactFrm.MoneyEdit1.Visible:= False;
          VendSummFactFrm.Edit1.Visible:= True;
          VendSummFactFrm.Edit1.MaxLength:= 2;
          VendSummFactFrm.Edit1.Text:= IntToStr(NDC);
          VendSummFactFrm.ActiveControl:= VendSummFactFrm.Edit1;
          VendSummFactFrm.Caption:= 'Изменение НДС';
          VendSummFactFrm.Label1.Caption:= 'Новое значение :';
          if VendSummFactFrm.ShowModal = IDOK then
          begin
            NDC:= StrToInt('0' + VendSummFactFrm.Edit1.Text);
            ShopIni.WriteInteger('Main', 'NDC', NDC);
          end;
        end;
        with ShopMainForm.frxReport1 do
        begin
          LoadFromFile(ReportsPath + 'SchetDraft.fr3');
          FIBQuery1:= FindObject('FIBQuery1') as TfrxFIBQuery;
          FIBQuery1.SQL:= pFIBDataSet1.SelectSQL;

          with ShopMainForm.pFIBService do
          begin
            SelectSQL.Clear;
            SelectSQL.Add('select BUYER_NAME as SHORT_NAME, '
               + 'NAME, PHONE, INN, OKOHX, OKPO, ADRES, REMARK');
            SelectSQL.Add('from SPR_BUYERS');
            SelectSQL.Add('where BUYER_NAME = ''' + RecipientComboBox.Text + '''');
            Open;
            Script.Variables['NAME']:= ShopMainForm.pFIBService['NAME'];
            Close;
          end;
          ShowReport;
        end;
      end
      else MessageDlg('Документ пуст', mtWarning, [mbOK], 0)
end;

procedure TNewDocFrm.BitBtn6Click(Sender: TObject);
var j: Integer;
begin
  case (Sender as TComponent).Tag of
    0: VendorComboBox.ItemIndex:= FindString(Spr_Vendors_Buyers_Edit(j,(Sender as TComponent).Tag), VendorComboBox.Items);
    1: RecipientComboBox.ItemIndex:= FindString(Spr_Vendors_Buyers_Edit(j,(Sender as TComponent).Tag), RecipientComboBox.Items);
  end;

{        case DocTypeComboBox.ItemIndex of
          0: begin // Приходная накладная
             end;
          1: begin // Расходная накладная
             end;
        3,2: begin // Переброска расход/приход
             end;
          4: begin // Возврат поставщику
             end;
          5: begin // Возврат поставщика
             end;
          6: if DocTypeComboBox.Items[6] = 'Резервирование товара' then // Списание, Резервирование
             end}
end;

procedure TNewDocFrm.BitBtn8Click(Sender: TObject);
begin
  PopupMenu2.Popup(NewDocFrm.Left + BitBtn8.Left + 15, NewDocFrm.Top + BitBtn8.Top + 125);
end;

procedure TNewDocFrm.DocTypeComboBoxChange(Sender: TObject);
begin
      BitBtn5.Visible:= DocTypeComboBox.ItemIndex = 1;
end;

procedure TNewDocFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
      if not(Key in [#8, '0'..'9', FormatSettings.DecimalSeparator])then Key:= #0;
end;

procedure TNewDocFrm.Edit1Change(Sender: TObject);
begin
      SpeedButton3.Enabled:= Edit1.Text > '';
end;

procedure TNewDocFrm.SpeedButton3Click(Sender: TObject);
var CurItem: String;
begin
    if MessageDlg('Изменить цены ?', mtWarning, [mbYes, mbNo], 0) = idYes then
    begin
      CurItem:= pFIBDataSet1['ITEM'];
      if SpeedButton2.Down then
      begin // Наценка
        ExecSQLStr('update POS_TMP_DOC set price = cast(price * '
         + StringReplace(FloatToStrF(1 + StrToInt(Edit1.Text) / 100, ffFixed, 15, 2), ',', '.', [])
         + ' as numeric(13,0))  where  KOD = ' + IntToStr(UsrTmpCode));
      end
      else // Уценка
        with pFIBDataSet1 do
        begin
          First;
          while not pFIBDataSet1.Eof do
          begin

            ShopMainForm.pFindTovarStoredProc.ParamByName('FIND_ITEM').AsString:= pFIBDataSet1['ITEM'];
            ShopMainForm.pFindTovarStoredProc.ExecProc;
//            if ShopMainForm.pFindTovarStoredProc.ParamByName('RESULT').AsInteger = 1 then
//              if ShopMainForm.pFindTovarStoredProc.ParamByName('VEND_PRICE').AsCurrency >= pFIBDataSet1['PRICE']*(1 - StrToInt(Edit1.Text) / 100) then

              if ShopMainForm.pFindTovarStoredProc.ParamByName('PRICE_3').AsCurrency>= pFIBDataSet1['PRICE']*(1 - StrToInt(Edit1.Text) / 100) then
                MessageDlg('Цена ниже рекомендуемого порога. ' + pFIBDataSet1['ITEM'] + ' ' + pFIBDataSet1['TOVAR_NAME'] , mtError, [mbOK], 0)
              else
                ExecSQLStr('update POS_TMP_DOC set price = cast(price * '
                  + StringReplace(FloatToStrF(1 - StrToInt(Edit1.Text) / 100, ffFixed, 15, 2), ',', '.', [])
                  + ' as numeric(13,0)) where  KOD = ' + IntToStr(UsrTmpCode)
                  + ' and ITEM = ''' + pFIBDataSet1['ITEM'] + '''');
            Next;
          end;
        end;
      pFIBDataSet1.DisableControls;
      pFIBDataSet1.Close;
      ShopMainForm.pFIBDatabase1.CommitRetaining;
      pFIBDataSet1.Open;
      pFIBDataSet1.Locate('ITEM', CurItem, []);
      pFIBDataSet1.EnableControls;
    end;
end;

procedure TNewDocFrm.SpeedButton4Click(Sender: TObject);
begin
      Panel3.Visible:= SpeedButton4.Down;
end;

procedure TNewDocFrm.SpeedButton5Click(Sender: TObject);
begin
  if SpeedButton5.Down then CurNakl:= UsrTmpCode
  else CurNakl:= 0;
end;

procedure TNewDocFrm.RecipientComboBoxChange(Sender: TObject);
begin
    if DocTypeComboBox.ItemIndex = 1 then
      with ShopMainForm.pFIBService do
      begin
        SelectSQL.Clear;
        SelectSQL.Add('select * from SPR_BUYERS');
        SelectSQL.Add('where BUYER_NAME = ''' + RecipientComboBox.Text + '''');
        Open;
        if not VarIsNull(ShopMainForm.pFIBService['REMARK'])then
          StaticText1.Caption:= TrimRight(ShopMainForm.pFIBService['REMARK']);
          StaticText1.Left:= RecipientComboBox.Left;
          StaticText1.Visible:= True;
          Timer2.Enabled:= True;
        Close;  
      end;
end;

procedure TNewDocFrm.Timer2Timer(Sender: TObject);
begin
      StaticText1.Visible:= False;
      Timer2.Enabled:= False;
end;

procedure TNewDocFrm.VendorComboBoxChange(Sender: TObject);
begin
    if DocTypeComboBox.ItemIndex = 0 then
      with ShopMainForm.pFIBService do
      begin
        SelectSQL.Clear;
        SelectSQL.Add('select * from SPR_VENDORS');
        SelectSQL.Add('where VENDOR_NAME = ''' + VendorComboBox.Text + '''');
        Open;
        if not VarIsNull(ShopMainForm.pFIBService['REMARK'])then
          StaticText1.Caption:= TrimRight(ShopMainForm.pFIBService['REMARK']);
        StaticText1.Left:= VendorComboBox.Left;
        StaticText1.Visible:= True;
        Timer2.Enabled:= True;
        Close;
      end;
end;

procedure TNewDocFrm.XML1Click(Sender: TObject);
begin
 if MessageDlg('Текущий позиции документа будут очищены. Продолжить ?', mtWarning, [mbYes, mbNo], 0) = ID_YES then
 begin
    ShopMainForm.OpenDialog1.Filter:= 'Файлы таблиц|*.xml';
    ShopMainForm.OpenDialog1.InitialDir:= ExtractFilePath(ParamStr(0)) + 'Saves\';
    if ShopMainForm.OpenDialog1.Execute then
    begin
      ClientDataSet1.LoadFromFile(ShopMainForm.OpenDialog1.FileName);
      ClientDataSet1.Open;
      ShopMainForm.pFIBDatabase1.Execute('delete POS_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
      while not ClientDataSet1.Eof do
      begin
        if not VarIsNull(ClientDataSet1['ITEM']) and not VarIsNull(ClientDataSet1['VENDOR_PRICE'])
          and not VarIsNull(ClientDataSet1['SALE_PRICE']) and not VarIsNull(ClientDataSet1['KOLVO'])then
            ShopMainForm.pFIBDatabase1.Execute('insert into POS_TMP_DOC(KOD, ITEM, '
              + 'KOLVO, MARKET_CODE, PRICE, VEND_PRICE)'
              + 'values(' + IntToStr(UsrTmpCode) + ', ''' + ClientDataSet1['ITEM']
              + ''', ' + StringReplace(FloatToStr(ClientDataSet1['KOLVO']), ',', '.', [])
              + ', ' + IntToStr(Market_Code)
              + ', ' + StringReplace(FloatToStr(ClientDataSet1['SALE_PRICE']), ',', '.', [])
              + ', ' + StringReplace(FloatToStr(ClientDataSet1['VENDOR_PRICE']), ',', '.', []) + ')');
        ClientDataSet1.Next;
      end;
      ClientDataSet1.Close;
      ShopMainForm.pFIBTransaction1.CommitRetaining;
      pFIBDataSet1.ReopenLocate('ITEM');
    end;
 end;
end;

procedure TNewDocFrm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if Key = VK_DELETE then LMDButton1.Click;
end;

end.
