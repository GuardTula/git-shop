unit ActMove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, Buttons, FIBDataSet, pFIBDataSet,
  DSContainer, DB, frxFIBComponents, System.UITypes;

type
  TActMoveFrm = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    TabControl1: TTabControl;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    TypeDocComboBox: TComboBox;
    Label2: TLabel;
    MarketComboBox: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    UpdateChangeUsrBtn: TBitBtn;
    PrintDocBtn: TBitBtn;
    NewDocAddBtn: TBitBtn;
    SendDraftBtn: TBitBtn;
    pFIBDataSet2: TpFIBDataSet;
    PosActByDocQry: TpFIBDataSet;
    ActByDocQry: TpFIBDataSet;
    ActByDocQryKOD: TFIBIntegerField;
    ActByDocQryMARKET_CODE: TFIBIntegerField;
    ActByDocQryDOC_DATE: TFIBDateTimeField;
    ActByDocQryDOC_NUMBER: TFIBIntegerField;
    ActByDocQryVENDOR_CODE: TFIBIntegerField;
    ActByDocQryDOC_SUM: TFIBFloatField;
    ActByDocQryDOC_TYPE: TFIBIntegerField;
    ActByDocQryAUTOR_KOD: TFIBIntegerField;
    ActByDocQryLAST_UPD: TFIBDateTimeField;
    ActByDocQryVEND_SUM: TFIBFloatField;
    ActByDocQrySHORT_NAME: TFIBStringField;
    ActByDocQryNAME: TFIBStringField;
    DataSetsContainer1: TDataSetsContainer;
    DataSetsContainer2: TDataSetsContainer;
    PosActByDocQryKOD: TFIBIntegerField;
    PosActByDocQryITEM: TFIBStringField;
    PosActByDocQryKOLVO: TFIBFloatField;
    PosActByDocQryPRICE: TFIBFloatField;
    PosActByDocQryVEND_PRICE: TFIBFloatField;
    PosActByDocQryMARKET_CODE: TFIBIntegerField;
    PosActByDocQryVENDOR_CODE: TFIBIntegerField;
    PosActByDocQryTOVAR_NAME: TFIBStringField;
    PosActByDocQryUNIT_NAME: TFIBStringField;
    procedure ActByDocQryAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure UpdateChangeUsrBtnClick(Sender: TObject);
    procedure ChangeActByDocSet;
    procedure TypeDocComboBoxChange(Sender: TObject);
    procedure PrintDocBtnClick(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure NewDocAddBtnClick(Sender: TObject);
    procedure SendDraftBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ActMoveFrm: TActMoveFrm;

implementation

uses ShopMain, NewDoc, FIBQuery, frxClass;

{$R *.dfm}

procedure TActMoveFrm.FormCreate(Sender: TObject);
begin
        with ShopMainForm.pFIBService do begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_MARKET');
          Open;
          MarketComboBox.Items.Clear;
          MarketComboBox.Items.Add('!Все объекты');
          while not Eof do begin
            MarketComboBox.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);
            Next;
          end;
          Close;
          MarketComboBox.ItemIndex:= 0;
        end;
        UpdateChangeUsrBtn.Click;
end;

procedure TActMoveFrm.UpdateChangeUsrBtnClick(Sender: TObject);
begin
        ChangeActByDocSet;
end;

procedure TActMoveFrm.ActByDocQryAfterOpen(DataSet: TDataSet);
begin
  ActByDocQry.Last;
end;

procedure TActMoveFrm.ChangeActByDocSet;
begin
    Screen.Cursor:= crHourGlass;
    PosActByDocQry.DisableControls;
    PosActByDocQry.Close;
    PosActByDocQry.SelectSQL.Clear;
    case TabControl1.TabIndex of
     0: begin  // Просмотр по документам
          with ActByDocQry do
          begin
            DisableControls;
            Close;
            SelectSQL.Clear;
            SelectSQL.Add('select H.*, M.SHORT_NAME, U.NAME');
            if TypeDocComboBox.ItemIndex = 0 then
              SelectSQL.Add('from HDR_PRIHOD H left join SPR_MARKET M on H.MARKET_CODE = M.MARKET_CODE')
            else SelectSQL.Add('from HDR_RASHOD H left join SPR_MARKET M on H.MARKET_CODE = M.MARKET_CODE');
            SelectSQL.Add('left join SPR_USERS U on H.AUTOR_KOD = U.AUTOR_KOD');
            case TypeDocComboBox.ItemIndex of
              0: SelectSQL.Add('where DOC_TYPE = 6');
              1: SelectSQL.Add('where DOC_TYPE = 5');
              2: SelectSQL.Add('where DOC_TYPE = 9');
            end;
            NewDocAddBtn.Visible:= ((TypeDocComboBox.ItemIndex = 2)and accessAllowed('OperDebit', User_ID));
            SendDraftBtn.Visible:= ((TypeDocComboBox.ItemIndex = 2)and accessAllowed('OperDebitDel', User_ID));
            if MarketComboBox.ItemIndex > 0 then
              SelectSQL.Add('and H.MARKET_CODE = ' + IntToStr(FindMarketCode(MarketComboBox.Text)));
            SelectSQL.Add('order by H.DOC_DATE, H.DOC_NUMBER');
            Open;
            EnableControls;
          end;

          with PosActByDocQry do
          begin
            SelectSQL.Add('select P.*, T.TOVAR_NAME, U.UNIT_NAME');
            if TypeDocComboBox.ItemIndex = 0 then
              SelectSQL.Add('from POS_PRIHOD P left join SPR_TOVAR T on P.ITEM = T.ITEM')
            else SelectSQL.Add('from POS_RASHOD P left join SPR_TOVAR T on P.ITEM = T.ITEM');
            SelectSQL.Add('left join SPR_UNITS U on T.UNIT_KOD = U.UNIT_KOD');
            SelectSQL.Add('where P.KOD = :KOD');
            SelectSQL.Add('and P.KOLVO > 0');
            SelectSQL.Add('order by P.ITEM');
            DataSource:= DataSource1;
          end;
        end;
   1: begin // Просмотр по датам
        NewDocAddBtn.Visible:= False;
        with PosActByDocQry do
        begin
          SelectSQL.Add('select P.*, T.TOVAR_NAME, U.UNIT_NAME');
          if TypeDocComboBox.ItemIndex = 0 then
            SelectSQL.Add('from POS_PRIHOD P left join SPR_TOVAR T on P.ITEM = T.ITEM')
          else SelectSQL.Add('from POS_RASHOD P left join SPR_TOVAR T on P.ITEM = T.ITEM');
          SelectSQL.Add('left join SPR_UNITS U on T.UNIT_KOD = U.UNIT_KOD');
          SelectSQL.Add('where P.KOLVO > 0');
          SelectSQL.Add('and P.KOD in (');
          if TypeDocComboBox.ItemIndex = 0 then
            SelectSQL.Add('select H.KOD from HDR_PRIHOD H')
          else SelectSQL.Add('select H.KOD from HDR_RASHOD H');
          SelectSQL.Add('where H.DOC_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
          case TypeDocComboBox.ItemIndex of
            0: SelectSQL.Add('and H.DOC_TYPE = 6');
            1: SelectSQL.Add('and H.DOC_TYPE = 5');
            2: SelectSQL.Add('and H.DOC_TYPE = 9');
          end;
          if MarketComboBox.ItemIndex > 0 then
            SelectSQL.Add('and H.MARKET_CODE = ' + IntToStr(FindMarketCode(MarketComboBox.Text)));
          SelectSQL.Add(')');
          SelectSQL.Add('order by P.ITEM');
          DataSource:= nil;
        end;
      end;
    end;
    PosActByDocQry.Filtered:= TabControl1.TabIndex = 0;
    PosActByDocQry.Open;
    PosActByDocQry.EnableControls;
    UpdateChangeUsrBtn.Enabled:= False;
    Screen.Cursor:= crDefault;
end;

procedure TActMoveFrm.TypeDocComboBoxChange(Sender: TObject);
begin
        UpdateChangeUsrBtn.Enabled:= True;
end;

procedure TActMoveFrm.PrintDocBtnClick(Sender: TObject);
var FIBQuery1: TfrxFIBQuery;
begin
        with ShopMainForm.frxReport1 do
        begin
          LoadFromFile(ShopIni.ReadString('Reports', 'ActFR3', ReportsPath + 'Act001.fr3'));
          FIBQuery1:= FindObject('FIBQuery1') as TfrxFIBQuery;
          FIBQuery1.SQL.Clear;
          case TabControl1.TabIndex of
           0:  // Просмотр по документам
                with FIBQuery1 do
                begin
                  SQL.Add('select P.*, T.TOVAR_NAME, U.UNIT_NAME');
                  if TypeDocComboBox.ItemIndex = 0 then
                    SQL.Add('from POS_PRIHOD P left join SPR_TOVAR T on P.ITEM = T.ITEM')
                  else SQL.Add('from POS_RASHOD P left join SPR_TOVAR T on P.ITEM = T.ITEM');
                  SQL.Add('left join SPR_UNITS U on T.UNIT_KOD = U.UNIT_KOD');
                  SQL.Add('where P.KOD = ' + IntToStr(ActByDocQry['KOD']));
                  SQL.Add('and P.KOLVO > 0');
                  SQL.Add('order by P.ITEM');
                end;
         1:  // Просмотр по датам
              with FIBQuery1 do
              begin
                SQL.Add('select P.*, T.TOVAR_NAME, U.UNIT_NAME');
                if TypeDocComboBox.ItemIndex = 0 then
                  SQL.Add('from POS_PRIHOD P left join SPR_TOVAR T on P.ITEM = T.ITEM')
                else SQL.Add('from POS_RASHOD P left join SPR_TOVAR T on P.ITEM = T.ITEM');
                SQL.Add('left join SPR_UNITS U on T.UNIT_KOD = U.UNIT_KOD');
                SQL.Add('where P.KOLVO > 0');
                SQL.Add('and P.KOD in (');
                if TypeDocComboBox.ItemIndex = 0 then
                  SQL.Add('select H.KOD from HDR_PRIHOD H')
                else SQL.Add('select H.KOD from HDR_RASHOD H');
                SQL.Add('where H.DOC_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
                      + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
                case TypeDocComboBox.ItemIndex of
                  0: SQL.Add('and H.DOC_TYPE = 6');
                  1: SQL.Add('and H.DOC_TYPE = 5');
                  2: SQL.Add('and H.DOC_TYPE = 9');
                end;
                if MarketComboBox.ItemIndex > 0 then
                  SQL.Add('and H.MARKET_CODE = ' + IntToStr(FindMarketCode(MarketComboBox.Text)));
                SQL.Add(')');
                SQL.Add('order by P.ITEM');
              end;
          end;

          case TypeDocComboBox.ItemIndex of
            0: Script.Variables['DOC_TYPE']:= 6;
            1: Script.Variables['DOC_TYPE']:= 5;
            2: Script.Variables['DOC_TYPE']:= 9;
          end;
          case TabControl1.TabIndex of
            0: Script.Variables['DOC_DATE']:= ActByDocQry['DOC_DATE'];
            1: Script.Variables['DOC_DATE']:= DateTimePicker2.Date;
          end;
          ShowReport;
        end;
end;

procedure TActMoveFrm.TabControl1Change(Sender: TObject);
begin
     DBGrid1.Visible:= TabControl1.TabIndex = 0;
     DateTimePicker1.Visible:= TabControl1.TabIndex = 1;
     DateTimePicker2.Visible:= TabControl1.TabIndex = 1;
     Label3.Visible:= TabControl1.TabIndex = 1;
     Label4.Visible:= TabControl1.TabIndex = 1;
     PosActByDocQry.Close;
     ActByDocQry.Close;
     UpdateChangeUsrBtn.Enabled:= True;
     PrintDocBtn.Enabled:= False;
     NewDocAddBtn.Visible:= False;
end;

procedure TActMoveFrm.DataSource2DataChange(Sender: TObject;
  Field: TField);
begin
        PrintDocBtn.Enabled:= not VarIsNull(PosActByDocQry['KOD']);
end;

procedure TActMoveFrm.NewDocAddBtnClick(Sender: TObject);
var HdrKod, HdrMarketCode: Integer;
    TmpDSep: Char;
begin
        HdrKod:= -1;
        Application.CreateForm(TNewDocFrm, NewDocFrm);
        NewDocFrm.Tag:= 1;
        NewDocFrm.DateTimePicker.Date:= Now;
        NewDocFrm.DocTypeComboBox.Items.Clear;
        NewDocFrm.DocTypeComboBox.Items.Add('');
        NewDocFrm.DocTypeComboBox.Items.Add('');
        NewDocFrm.DocTypeComboBox.Items.Add('');
        NewDocFrm.DocTypeComboBox.Items.Add('');
        NewDocFrm.DocTypeComboBox.Items.Add('');
        NewDocFrm.DocTypeComboBox.Items.Add('');
        NewDocFrm.DocTypeComboBox.Items.Add('Списание');
        NewDocFrm.DocTypeComboBox.ItemIndex:= 6;
        NewDocFrm.VendorComboBox.Items:= MarketComboBox.Items;
        NewDocFrm.VendorComboBox.Items.Delete(0);
        if MarketComboBox.ItemIndex = 0 then NewDocFrm.VendorComboBox.ItemIndex:= 0
        else NewDocFrm.VendorComboBox.ItemIndex:= MarketComboBox.ItemIndex - 1;
        NewDocFrm.RecipientComboBox.Visible:= False;
        NewDocFrm.RecipientLabel.Visible:= False;
        NewDocFrm.Image1.Visible:= False;
        NewDocFrm.VendorLabel.Caption:= 'Объект :';
        NewDocFrm.Caption:= 'Новый документ';
        NewDocFrm.NewDocNoBtn.Visible:= True;
        NewDocFrm.DraftCopyBtn.Visible:= True;
        NewDocFrm.DocNoEdit.Tag:= -1;
        if NewDocFrm.ShowModal = idOK then
        begin
          with ShopMainForm.pFIBService do
          begin
            HdrMarketCode:= FindMarketCode(NewDocFrm.VendorComboBox.Text);
            SelectSQL.Clear;
            SelectSQL.Add('select * from HDR_RASHOD');
            SelectSQL.Add('where MARKET_CODE = ' + IntToStr(HdrMarketCode));
            SelectSQL.Add('and DOC_DATE = '''
                   + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime) + '''');
            SelectSQL.Add('and DOC_TYPE = 9' );
            Open;
            if VarIsNull(ShopMainForm.pFIBService['KOD'])then
            begin
              Close;
              with ShopMainForm.pFIBQuery1 do
              begin
                SQL.Clear;
                SQL.Add('insert into HDR_RASHOD(MARKET_CODE, DOC_DATE,'
                      + 'DOC_NUMBER, VENDOR_CODE, DOC_TYPE, AUTOR_KOD)');
                SQL.Add('values ('
                  + IntToStr(HdrMarketCode) + ', '''
                  + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime)
                  + ''', ' + NewDocFrm.DocNoEdit.Text + ', -1, 9, '
                  + IntToStr(User_ID) + ')');
                ExecQuery;
              end;
              SelectSQL.Clear;  // Определение кода присвоенного заголовку
              SelectSQL.Add('select * from HDR_RASHOD');
              SelectSQL.Add('where MARKET_CODE = ' + IntToStr(HdrMarketCode));
              SelectSQL.Add('and DOC_DATE = '''
                     + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime) + '''');
              SelectSQL.Add('and DOC_NUMBER = ' + NewDocFrm.DocNoEdit.Text);
              SelectSQL.Add('and DOC_TYPE = 9' );
              Open;
              if not VarIsNull(ShopMainForm.pFIBService['KOD'])then HdrKod:= ShopMainForm.pFIBService['KOD']
              else Abort;
              Close;
              with ShopMainForm.pFIBQuery1 do
              begin
                SQL.Clear;
                SQL.Add('insert into POS_RASHOD(KOD, ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE)');
                SQL.Add('select ' + IntToStr(HdrKod) + ' KOD, ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE');
                SQL.Add('from POS_TMP_DOC');
                SQL.Add('where KOD = ' + IntToStr(UsrTmpCode));
                ExecQuery;
              end;
            end
            else
            begin
              HdrKod:= ShopMainForm.pFIBService['KOD'];
              Close;
              SelectSQL.Clear;
              SelectSQL.Add('select ' + IntToStr(HdrKod) + ' KOD, ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE');
              SelectSQL.Add('from POS_TMP_DOC');
              SelectSQL.Add('where KOD = ' + IntToStr(UsrTmpCode));
              Open;
              while not Eof do
              begin
                pFIBDataSet2.SelectSQL.Clear;
                pFIBDataSet2.SelectSQL.Add('select * from POS_RASHOD');
                pFIBDataSet2.SelectSQL.Add('where KOD = ' + IntToStr(HdrKod));
                pFIBDataSet2.SelectSQL.Add('and ITEM = ''' + ShopMainForm.pFIBService['ITEM'] + '''');
                pFIBDataSet2.Open;
                if VarIsNull(pFIBDataSet2['KOD'])then
                begin
                  ShopMainForm.pFIBQuery1.SQL.Clear;
                  ShopMainForm.pFIBQuery1.SQL.Add('insert into POS_RASHOD(KOD, ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE)');
                  ShopMainForm.pFIBQuery1.SQL.Add('select ' + IntToStr(HdrKod) + ' KOD, ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE');
                  ShopMainForm.pFIBQuery1.SQL.Add('from POS_TMP_DOC');
                  ShopMainForm.pFIBQuery1.SQL.Add('where KOD = ' + IntToStr(UsrTmpCode));
                  ShopMainForm.pFIBQuery1.SQL.Add('and ITEM = ''' + ShopMainForm.pFIBService['ITEM'] + '''');
                  ShopMainForm.pFIBQuery1.ExecQuery;
                end
                else
                begin
                  TmpDSep:= FormatSettings.DecimalSeparator;
                  FormatSettings.DecimalSeparator:= '.';
                  ShopMainForm.pFIBQuery1.SQL.Clear;
                  ShopMainForm.pFIBQuery1.SQL.Add('update POS_RASHOD');
                  ShopMainForm.pFIBQuery1.SQL.Add('set KOLVO = ' + FloatToStr(ShopMainForm.pFIBService['KOLVO'] + pFIBDataSet2['KOLVO']));
                  ShopMainForm.pFIBQuery1.SQL.Add(',PRICE = ' + FloatToStr(ShopMainForm.pFIBService['PRICE']));
                  ShopMainForm.pFIBQuery1.SQL.Add('where KOD = ' + IntToStr(HdrKod));
                  ShopMainForm.pFIBQuery1.SQL.Add('and ITEM = ''' + ShopMainForm.pFIBService['ITEM'] + '''');
                  FormatSettings.DecimalSeparator:= TmpDSep;
                  ShopMainForm.pFIBQuery1.ExecQuery;
                end;
                Next;
              end;
            end;
            Close;
          end;
          with ShopMainForm.pFIBQuery1 do
          begin
            SQL.Clear;
            SQL.Add('delete from POS_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
            ExecQuery;
            SQL.Clear;
            SQL.Add('delete from HDR_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
            ExecQuery;
          end;
          ChangeActByDocSet;
        end;
        if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.CommitRetaining;
        NewDocFrm.Free;
end;

procedure TActMoveFrm.SendDraftBtnClick(Sender: TObject);
var i: Integer;
begin
     if MessageDlg('Передать в черновики ?', mtConfirmation,
           [mbYes,mbNo], 0) = idYes then
     begin
       ActByDocQry.DisableControls;
       PosActByDocQry.DisableControls;
       ShopMainForm.pFIBStoredProc1.StoredProcName:= 'GET_TMP_CODE';
       ShopMainForm.pFIBStoredProc1.ExecProc;
       i:= ShopMainForm.pFIBStoredProc1.ParamValue('TMP_CODE');
       with ShopMainForm.pFIBQuery1 do
       begin
         SQL.Clear;
         SQL.Add('insert into HDR_TMP_DOC(KOD, AUTOR_KOD, DOC_DATE, DOC_NUMBER,'
                                  + ' DOC_TYPE, VENDOR_CODE, MARKET_CODE)');
         SQL.Add('select ' + IntToStr(i)
                  + 'as KOD, AUTOR_KOD, DOC_DATE, DOC_NUMBER,'
                  + ' DOC_TYPE, VENDOR_CODE, MARKET_CODE');
         SQL.Add('from HDR_RASHOD');
         SQL.Add('where KOD = ' + IntToStr(ActByDocQry['KOD']));
         ExecQuery;

         SQL.Clear;
         SQL.Add('insert into POS_TMP_DOC(KOD, ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE)');
         SQL.Add('select ' + IntToStr(i)
               + ' as KOD, ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE');
         SQL.Add('from POS_RASHOD');
         SQL.Add('where KOD = ' + IntToStr(ActByDocQry['KOD']));
         ExecQuery;

         SQL.Clear;
         SQL.Add('delete from HDR_RASHOD where KOD = ' + IntToStr(ActByDocQry['KOD']));
         ExecQuery;
       end;  
       ActByDocQry.Close;
       PosActByDocQry.Close;
       ActByDocQry.Open;
       PosActByDocQry.Open;
       ActByDocQry.EnableControls;
       PosActByDocQry.EnableControls;
     end;
end;

end.
