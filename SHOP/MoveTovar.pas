//****************************************************************************//
//                            © Guard  2003-2023                              //
//****************************************************************************//
unit MoveTovar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, Grids, DBGrids,  StdCtrls, Menus, Buttons, ComCtrls,
  ToolWin, ActnList, ActnMan, XPStyleActnCtrls, FIBQuery, pFIBQuery,
  pFIBStoredProc, DSContainer, FIBDataSet, pFIBDataSet, System.Actions, Vcl.Mask,
  Vcl.PlatformDefaultStyleActnCtrls, System.UITypes;

type
  TMoveTovarFrm = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    MarketComboBox: TComboBox;
    Label2: TLabel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    VendorComboBox: TComboBox;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    PopupMenu2: TPopupMenu;
    ActionManager1: TActionManager;
    NewDocAction: TAction;
    PrintDocAction: TAction;
    Label1: TLabel;
    TypeDocComboBox: TComboBox;
    N5: TMenuItem;
    EditDocACT: TAction;
    PayDocACT: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    pFIBStoredProc1: TpFIBStoredProc;
    PosTable: TpFIBDataSet;
    HdrTable: TpFIBDataSet;
    DataSetsContainer1: TDataSetsContainer;
    DataSetsContainer2: TDataSetsContainer;
    HdrTableKOD: TFIBIntegerField;
    HdrTableMARKET_CODE: TFIBIntegerField;
    HdrTableDOC_DATE: TFIBDateTimeField;
    HdrTableDOC_NUMBER: TFIBIntegerField;
    HdrTableVENDOR_CODE: TFIBIntegerField;
    HdrTableDOC_SUM: TFIBFloatField;
    HdrTableDOC_TYPE: TFIBIntegerField;
    HdrTableAUTOR_KOD: TFIBIntegerField;
    HdrTableLAST_UPD: TFIBDateTimeField;
    HdrTableVEND_SUM: TFIBFloatField;
    HdrTableSHORT_NAME: TFIBStringField;
    HdrTableNAME: TFIBStringField;
    HdrTableV_NAME: TFIBStringField;
    PosTableKOD: TFIBIntegerField;
    PosTableITEM: TFIBStringField;
    PosTableKOLVO: TFIBFloatField;
    PosTablePRICE: TFIBFloatField;
    PosTableVEND_PRICE: TFIBFloatField;
    PosTableMARKET_CODE: TFIBIntegerField;
    PosTableVENDOR_CODE: TFIBIntegerField;
    PosTableITEM1: TFIBStringField;
    PosTableTOVAR_NAME: TFIBStringField;
    PosTableT_GROUP: TFIBIntegerField;
    PosTableLAST_UPD: TFIBDateTimeField;
    PosTableKKM_SECT: TFIBIntegerField;
    PosTableVENDOR_CODE1: TFIBIntegerField;
    PosTableAUTOR_KOD: TFIBIntegerField;
    PosTableREMARK: TFIBStringField;
    PosTableUNIT_KOD: TFIBIntegerField;
    PosTableARTIKUL: TFIBStringField;
    PosTablePRODUCER: TFIBStringField;
    PosTableREMARK_1: TFIBStringField;
    PosTableVEND_ITEM: TFIBStringField;
    PosTableUNIT_NAME: TFIBStringField;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    LabeledEdit1: TLabeledEdit;
    UpdateChangeUsrBtn: TBitBtn;
    HdrTableREMARK: TFIBStringField;
    N8: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure UpdateChangeUsrBtnClick(Sender: TObject);
    procedure TypeDocComboBoxChange(Sender: TObject);
    procedure EditDocBtnClick(Sender: TObject);
    procedure TypeDocComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PrintDocBtnClick(Sender: TObject);
    procedure HdrTableAfterOpen(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure AddPosActionUpdate(Sender: TObject);
    procedure PrintDocActionUpdate(Sender: TObject);
    procedure EditDocACTExecute(Sender: TObject);
    procedure NewDocFormCreate;
    procedure VendorComboBoxChange(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure FormDestroy(Sender: TObject);
    procedure LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MoveTovarFrm: TMoveTovarFrm;
  SortHdr: Boolean = True;

procedure UpdateUsrChange;

implementation

uses ShopMain, NewDoc, VendSumFact, EditPosDoc, TovarRep, Spr, EditEnter, TovarInfo;


{$R *.dfm}

procedure TMoveTovarFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key = VK_ESCAPE then ModalResult:= idCancel;
end;

procedure TMoveTovarFrm.FormCreate(Sender: TObject);
var NewItem: TMenuItem;
    sr: TSearchRec;
//    Ext: String;
begin
        TypeDocComboBox.ItemIndex:= BaseReadInteger('MoveTovar', 'DocType', 0);
        MoveTovarFrm.DBGrid2.Tag:= BaseReadInteger('MoveTovar', 'DocSort', 0);
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_MARKET');
          Open;
          MarketComboBox.Items.Clear;
          MarketComboBox.Items.Add('!Все объекты');
          while not Eof do
          begin
            MarketComboBox.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);
            Next;
          end;
          MarketComboBox.ItemIndex:= 0;
          Close;
        end;
        MoveTovarFrm.TypeDocComboBoxChange(Sender);
        UpdateUsrChange;

        if FindFirst(ReportsPath + 'NAKL\*.fr3', faAnyFile, sr) = 0 then
        begin
          repeat
            if (sr.Attr and fadirectory) <> sr.Attr then
            begin
              NewItem:= TMenuItem.Create(PopupMenu2);
              PopupMenu2.Items.Add(NewItem);
              NewItem.Caption:= Copy(sr.Name, 1, Length(sr.Name) - 4);
              NewItem.OnClick:= MenuClick;
            end;
          until FindNext(sr) <> 0;
          FindClose(sr);
        end;
end;

procedure TMoveTovarFrm.FormDestroy(Sender: TObject);
begin
  BaseWriteInteger('MoveTovar', 'DocType', TypeDocComboBox.ItemIndex);
  BaseWriteInteger('MoveTovar', 'DocSort', MoveTovarFrm.DBGrid2.Tag);
end;

procedure UpdateUsrChange;
var MCode, VCode: String;
    CurSort: Integer;
begin
        Screen.Cursor:= crHourGlass;
//        MoveTovarFrm.N2.Visible:= MoveTovarFrm.TypeDocComboBox.ItemIndex = 0;
        MoveTovarFrm.Caption:= 'Движение товара [' + MoveTovarFrm.TypeDocComboBox.Text
                             + '(' + TrimRight(MoveTovarFrm.MarketComboBox.Text)
                             + ') ('+ TrimRight(MoveTovarFrm.VendorComboBox.Text) + ')]';
    // Фильтр по объекту
        if MoveTovarFrm.MarketComboBox.ItemIndex = 0 then
        begin
          MCode:= '';
        end
        else
        begin
          with ShopMainForm.pFIBService do
          begin
            SelectSQL.Clear;
            SelectSQL.Add('select * from SPR_MARKET where SHORT_NAME = ''' +
                        MoveTovarFrm.MarketComboBox.Text + '''');
            Open;
            if VarIsNull(ShopMainForm.pFIBService['MARKET_CODE'])then
            begin
              MessageDlg('Данный объект не найден', mtError, [mbOK], 0);
              Close;
              Screen.Cursor:= crDefault;
              Abort;
            end
            else MCode:= 'MARKET_CODE = '
                + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']);
            Close;
          end;
        end;
  // Фильтр по поставщику
        if MoveTovarFrm.VendorComboBox.ItemIndex = 0 then
        begin
          VCode:= '';
        end
        else
        begin
          case MoveTovarFrm.TypeDocComboBox.ItemIndex of
          0,4:  // Приходная накладная
                VCode:= IntToStr(FindVendorCode(MoveTovarFrm.VendorComboBox.Text));
        1,5,6:  // Расходная накладная
                VCode:= IntToStr(FindBuyerCode(MoveTovarFrm.VendorComboBox.Text));
          2,3:  // Переброска расход/приход
                VCode:= IntToStr(FindMarketCode(MoveTovarFrm.VendorComboBox.Text));
          end;
          VCode:= 'VENDOR_CODE = ' + VCode;
        end;
        if MoveTovarFrm.TypeDocComboBox.ItemIndex in [2,3,6] then
        begin
          MoveTovarFrm.DBGrid2.Columns[4].Visible:= False;
        end
        else
        begin
          MoveTovarFrm.DBGrid2.Columns[4].Visible:= True;
        end;
        MoveTovarFrm.HdrTable.DisableControls;
        MoveTovarFrm.HdrTable.Close;
        MoveTovarFrm.HdrTable.SelectSQL.Clear;
        MoveTovarFrm.PosTable.DisableControls;
        MoveTovarFrm.PosTable.Close;
        MoveTovarFrm.PosTable.SelectSQL.Clear;
        MoveTovarFrm.PosTable.SelectSQL.Add('select P.*, T.*, U.UNIT_NAME');
        case MoveTovarFrm.TypeDocComboBox.ItemIndex of
         0: begin // Приходная накладная
              with MoveTovarFrm.HdrTable.SelectSQL do
              begin
                Add('select H.*, M.SHORT_NAME, U.NAME, V.VENDOR_NAME V_NAME');
                Add('from HDR_PRIHOD H,  SPR_MARKET M,  SPR_USERS U, SPR_VENDORS V');
                Add('where DOC_TYPE = 1');
                Add('and H.VENDOR_CODE = V.VENDOR_CODE');
              end;
              MoveTovarFrm.DBGrid2.Columns[5].Title.Caption:= 'Объект получатель';
              MoveTovarFrm.DBGrid2.Columns[6].Title.Caption:= 'Поставщик';
              MoveTovarFrm.PosTable.SelectSQL.Add('from POS_PRIHOD P, SPR_TOVAR T, SPR_UNITS U');
            end;
         1: begin  // Расходная накладная
              with MoveTovarFrm.HdrTable.SelectSQL do
              begin
                Add('select H.*, M.SHORT_NAME, U.NAME, B.BUYER_NAME V_NAME');
                Add('from HDR_RASHOD H,  SPR_MARKET M,  SPR_USERS U, SPR_BUYERS B');
                Add('where DOC_TYPE = 2');
                Add('and H.VENDOR_CODE = B.BUYER_CODE');
              end;
              MoveTovarFrm.DBGrid2.Columns[5].Title.Caption:= 'Объект отправитель';
              MoveTovarFrm.DBGrid2.Columns[6].Title.Caption:= 'Покупатель';
              MoveTovarFrm.PosTable.SelectSQL.Add('from POS_RASHOD P, SPR_TOVAR T, SPR_UNITS U');
            end;
         2: begin // Переброска расход
              with MoveTovarFrm.HdrTable.SelectSQL do
              begin
                Add('select H.*, M.SHORT_NAME, U.NAME, V.SHORT_NAME V_NAME');
                Add('from HDR_RASHOD H,  SPR_MARKET M,  SPR_USERS U,  SPR_MARKET V');
                Add('where DOC_TYPE = 3');
                Add('and H.VENDOR_CODE = V.MARKET_CODE');
              end;
              MoveTovarFrm.DBGrid2.Columns[6].Title.Caption:= 'Объект получатель';
              MoveTovarFrm.DBGrid2.Columns[5].Title.Caption:= 'Объект отправитель';
              MoveTovarFrm.PosTable.SelectSQL.Add('from POS_RASHOD P, SPR_TOVAR T, SPR_UNITS U');
            end;
         3: begin // Переброска приход
              with MoveTovarFrm.HdrTable.SelectSQL do
              begin
                Add('select H.*, M.SHORT_NAME, U.NAME, V.SHORT_NAME V_NAME');
                Add('from HDR_PRIHOD H,  SPR_MARKET M,  SPR_USERS U,  SPR_MARKET V');
                Add('where DOC_TYPE = 7');
                Add('and H.VENDOR_CODE = V.MARKET_CODE');
              end;
              MoveTovarFrm.DBGrid2.Columns[5].Title.Caption:= 'Объект получатель';
              MoveTovarFrm.DBGrid2.Columns[6].Title.Caption:= 'Объект отправитель';
              MoveTovarFrm.PosTable.SelectSQL.Add('from POS_PRIHOD P, SPR_TOVAR T, SPR_UNITS U');
            end;
         4: begin // Возврат поставщику
              with MoveTovarFrm.HdrTable.SelectSQL do
              begin
                Add('select H.*, M.SHORT_NAME, U.NAME, V.VENDOR_NAME V_NAME');
                Add('from HDR_RASHOD H,  SPR_MARKET M,  SPR_USERS U, SPR_VENDORS V');
                Add('where DOC_TYPE = 8');
                Add('and H.VENDOR_CODE = V.VENDOR_CODE');
              end;
              MoveTovarFrm.DBGrid2.Columns[5].Title.Caption:= 'Объект отправитель';
              MoveTovarFrm.DBGrid2.Columns[6].Title.Caption:= 'Поставщик';
              MoveTovarFrm.PosTable.SelectSQL.Add('from POS_RASHOD P, SPR_TOVAR T, SPR_UNITS U');
            end;
         5: begin // Возврат покупателя
              with MoveTovarFrm.HdrTable.SelectSQL do
              begin
                Add('select H.*, M.SHORT_NAME, U.NAME, B.BUYER_NAME V_NAME');
                Add('from HDR_PRIHOD H,  SPR_MARKET M,  SPR_USERS U, SPR_BUYERS B');
                Add('where DOC_TYPE = 10');
                Add('and H.VENDOR_CODE = B.BUYER_CODE');
              end;
              MoveTovarFrm.DBGrid2.Columns[5].Title.Caption:= 'Объект отправитель';
              MoveTovarFrm.DBGrid2.Columns[6].Title.Caption:= 'Покупатель';
              MoveTovarFrm.PosTable.SelectSQL.Add('from POS_PRIHOD P, SPR_TOVAR T, SPR_UNITS U');
            end;
         6: begin  // Резервирование товара
              with MoveTovarFrm.HdrTable.SelectSQL do
              begin
                Add('select H.*, M.SHORT_NAME, U.NAME, B.BUYER_NAME V_NAME');
                Add('from HDR_RASHOD H,  SPR_MARKET M,  SPR_USERS U, SPR_BUYERS B');
                Add('where DOC_TYPE = 12');
                Add('and H.VENDOR_CODE = B.BUYER_CODE');
              end;
              MoveTovarFrm.DBGrid2.Columns[5].Title.Caption:= 'Объект отправитель';
              MoveTovarFrm.DBGrid2.Columns[6].Title.Caption:= 'Покупатель';
              MoveTovarFrm.PosTable.SelectSQL.Add('from POS_RASHOD P, SPR_TOVAR T, SPR_UNITS U');
            end;
        end;
        with MoveTovarFrm.HdrTable.SelectSQL do
        begin
          Add('and H.MARKET_CODE = M.MARKET_CODE');
          Add('and H.AUTOR_KOD  = U.AUTOR_KOD');
        end;
        MoveTovarFrm.PosTable.SelectSQL.Add('where P.ITEM = T.ITEM and T.UNIT_KOD = U.UNIT_KOD');
        if not(MCode = '')then
        begin
          MoveTovarFrm.HdrTable.SelectSQL.Add(' and H.' + MCode);
          MoveTovarFrm.PosTable.SelectSQL.Add(' and P.' + MCode);
        end;
        MoveTovarFrm.PosTable.SelectSQL.Add(' and P.KOD = :KOD');
        MoveTovarFrm.PosTable.SelectSQL.Add('order by T.TOVAR_NAME');
        if VCode <> '' then MoveTovarFrm.HdrTable.SelectSQL.Add(' and H.' + VCode);
        MoveTovarFrm.HdrTable.SelectSQL.Add('order by H.DOC_DATE, H.MARKET_CODE, H.DOC_NUMBER');
{        MoveTovarFrm.HdrTable.Open;
         MoveTovarFrm.PosTable.Open;
}
        CurSort:= MoveTovarFrm.DBGrid2.Tag;
        MoveTovarFrm.DBGrid2.Tag:= -1;
        MoveTovarFrm.DBGrid2TitleClick(MoveTovarFrm.DBGrid2.Columns[CurSort]);
        MoveTovarFrm.HdrTable.EnableControls;
        MoveTovarFrm.PosTable.EnableControls;
        Screen.Cursor:= crDefault;
end;

procedure TMoveTovarFrm.UpdateChangeUsrBtnClick(Sender: TObject);
begin
        UpdateChangeUsrBtn.Enabled:= False;
        NewDocAction.Enabled:= True;
        UpdateUsrChange;
end;

procedure TMoveTovarFrm.TypeDocComboBoxChange(Sender: TObject);
begin
        UpdateChangeUsrBtn.Enabled:= True;

        case TypeDocComboBox.ItemIndex of
        0,4: begin // Приходная накладная, Возврат поставщику
               with ShopMainForm.pFIBService do
               begin
                 SelectSQL.Clear;
                 SelectSQL.Add('select VENDOR_NAME from SPR_VENDORS');
                 Open;
                 VendorComboBox.Items.Clear;
                 VendorComboBox.Items.Add('!Все поставщики');
                 while not Eof do
                 begin
                   VendorComboBox.Items.Add(ShopMainForm.pFIBService['VENDOR_NAME']);
                   Next;
                 end;
                 Close;
               end;
               Label3.Caption:= 'Поставщик :';
             end;
       1,5,6: begin // Расходная накладная, Возврат покупателя, Резервирование товара
               with ShopMainForm.pFIBService do
               begin
                 SelectSQL.Clear;
                 SelectSQL.Add('select BUYER_NAME from SPR_BUYERS');
                 Open;
                 VendorComboBox.Items.Clear;
                 VendorComboBox.Items.Add('!Все покупатели');
                 while not Eof do
                 begin
                   VendorComboBox.Items.Add(ShopMainForm.pFIBService['BUYER_NAME']);
                   Next;
                 end;
                 Close;
               end;
               Label3.Caption:= 'Покупатель :';
              end;
         2,3: begin // Переброска расход/приход
               with ShopMainForm.pFIBService do
               begin
                 SelectSQL.Clear;
                 SelectSQL.Add('select SHORT_NAME from SPR_MARKET');
                 Open;
                 VendorComboBox.Items.Clear;
                 VendorComboBox.Items.Add('!Все объекты');
                 while not Eof do
                 begin
                   VendorComboBox.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);
                   Next;
                 end;
                 Close;
               end;
               if TypeDocComboBox.ItemIndex = 2 then Label3.Caption:= 'Получатель :'
               else Label3.Caption:= 'Отправитель :';
              end;
        end;
        VendorComboBox.ItemIndex:= 0;
end;

procedure TMoveTovarFrm.NewDocFormCreate;
begin
        Application.CreateForm(TNewDocFrm, NewDocFrm);
        NewDocFrm.DateTimePicker.Date:= Now;
        NewDocFrm.DocTypeComboBox.Items:= TypeDocComboBox.Items;
        NewDocFrm.DocTypeComboBox.ItemIndex:= TypeDocComboBox.ItemIndex;
        NewDocFrm.BitBtn6.Visible:= NewDocFrm.DocTypeComboBox.ItemIndex = 1;
        NewDocFrm.BitBtn7.Visible:= NewDocFrm.DocTypeComboBox.ItemIndex = 0;
        NewDocFrm.FromXMLFileBitBtn.Visible:= NewDocFrm.DocTypeComboBox.ItemIndex in [2, 3];
        case TypeDocComboBox.ItemIndex of
         0: begin  // Приходная накладная
              NewDocFrm.RecipientComboBox.Items:= MarketComboBox.Items;
              NewDocFrm.RecipientComboBox.Items.Delete(0);
              if MarketComboBox.ItemIndex = 0 then
                      NewDocFrm.RecipientComboBox.ItemIndex:= 0
              else
                NewDocFrm.RecipientComboBox.ItemIndex:= MarketComboBox.ItemIndex - 1;
              with ShopMainForm.pFIBService do
              begin
                SelectSQL.Clear;
                SelectSQL.Add('select VENDOR_NAME from SPR_VENDORS');
                Open;
                NewDocFrm.VendorComboBox.Items.Clear;
                while not Eof do
                begin
                  NewDocFrm.VendorComboBox.Items.Add(ShopMainForm.pFIBService['VENDOR_NAME']);
                  Next;
                end;
                NewDocFrm.VendorComboBox.ItemIndex:= 0;
                Close;
              end;
              NewDocFrm.VendorLabel.Caption:= 'Поставщик :';
              NewDocFrm.RecipientLabel.Caption:= 'Объект получатель :';
            end;
       1,6: begin  // Расходная накладная, Резервирование товара
              NewDocFrm.VendorComboBox.Items:= MarketComboBox.Items;
              NewDocFrm.VendorComboBox.Items.Delete(0);
              if MarketComboBox.ItemIndex = 0 then
                      NewDocFrm.VendorComboBox.ItemIndex:= 0
              else
                NewDocFrm.VendorComboBox.ItemIndex:= MarketComboBox.ItemIndex - 1;
              with ShopMainForm.pFIBService do
              begin
                SelectSQL.Clear;
                SelectSQL.Add('select BUYER_NAME from SPR_BUYERS');
                Open;
                NewDocFrm.RecipientComboBox.Items.Clear;
                while not Eof do
                begin
                  NewDocFrm.RecipientComboBox.Items.Add(ShopMainForm.pFIBService['BUYER_NAME']);
                  Next;
                end;
                NewDocFrm.RecipientComboBox.ItemIndex:= 0;
                Close;
              end;
              NewDocFrm.VendorLabel.Caption:= 'Объект продавец :';
              NewDocFrm.RecipientLabel.Caption:= 'Покупатель :';
            end;
       2,3: begin // Переброска расход/приход
              NewDocFrm.RecipientComboBox.Items:= MarketComboBox.Items;
              NewDocFrm.RecipientComboBox.Items.Delete(0);
              NewDocFrm.VendorComboBox.Items:= NewDocFrm.RecipientComboBox.Items;
              NewDocFrm.VendorComboBox.ItemIndex:= 0;
              NewDocFrm.RecipientComboBox.ItemIndex:= 0;
              if MarketComboBox.ItemIndex > 0 then
                if TypeDocComboBox.ItemIndex = 2 then
                  NewDocFrm.VendorComboBox.ItemIndex:= MarketComboBox.ItemIndex - 1
                else NewDocFrm.RecipientComboBox.ItemIndex:= MarketComboBox.ItemIndex - 1;
              NewDocFrm.VendorLabel.Caption:= 'Объект отправитель :';
              NewDocFrm.RecipientLabel.Caption:= 'Объект получатель :';
            end;
         4: begin // Возврат поставщику
              NewDocFrm.VendorComboBox.Items:= MarketComboBox.Items;
              NewDocFrm.VendorComboBox.Items.Delete(0);
              if MarketComboBox.ItemIndex = 0 then
                      NewDocFrm.VendorComboBox.ItemIndex:= 0
              else
                NewDocFrm.VendorComboBox.ItemIndex:= MarketComboBox.ItemIndex - 1;
              with ShopMainForm.pFIBService do
              begin
                SelectSQL.Clear;
                SelectSQL.Add('select VENDOR_NAME from SPR_VENDORS');
                Open;
                NewDocFrm.RecipientComboBox.Items.Clear;
                while not Eof do
                begin
                  NewDocFrm.RecipientComboBox.Items.Add(ShopMainForm.pFIBService['VENDOR_NAME']);
                  Next;
                end;
                NewDocFrm.RecipientComboBox.ItemIndex:= 0;
                Close;
              end;
              NewDocFrm.VendorLabel.Caption:= 'Объект отправитель :';
              NewDocFrm.RecipientLabel.Caption:= 'Поставщик :';
            end;
         5: begin  // Возврат от покупателя
              NewDocFrm.RecipientComboBox.Items:= MarketComboBox.Items;
              NewDocFrm.RecipientComboBox.Items.Delete(0);
              if MarketComboBox.ItemIndex = 0 then
                      NewDocFrm.RecipientComboBox.ItemIndex:= 0
              else
                NewDocFrm.RecipientComboBox.ItemIndex:= MarketComboBox.ItemIndex - 1;
              with ShopMainForm.pFIBService do
              begin
                SelectSQL.Clear;
                SelectSQL.Add('select BUYER_NAME from SPR_BUYERS');
                Open;
                NewDocFrm.VendorComboBox.Items.Clear;
                while not Eof do
                begin
                  NewDocFrm.VendorComboBox.Items.Add(ShopMainForm.pFIBService['BUYER_NAME']);
                  Next;
                end;
                NewDocFrm.VendorComboBox.ItemIndex:= 0;
                Close;
              end;
              NewDocFrm.VendorLabel.Caption:= 'Покупатель :';
              NewDocFrm.RecipientLabel.Caption:= 'Объект :';
            end;
        end;
        NewDocFrm.NewDocNoBtn.Visible:= True;
        NewDocFrm.DraftCopyBtn.Visible:= True;
        NewDocFrm.DocNoEdit.Tag:= -1;
end;

procedure TMoveTovarFrm.EditDocBtnClick(Sender: TObject);
var HdrKod, HdrMarketCode: Integer;
    SQLStr: String;
begin
        NewDocFormCreate;
        NewDocFrm.Caption:= 'Новый документ';
        HdrKod:= -1;
        if NewDocFrm.ShowModal = idOK then
        begin
          if(TypeDocComboBox.ItemIndex = 0)and // Запускаем переоценку
            (MessageDlg('Провести переоценку товаров ?', mtConfirmation,
                  [mbYes,mbNo], 0) = idYes)then
          begin
            ShopMainForm.pFIBDatabase1.Execute('EXECUTE PROCEDURE UPD_TOVAR_INF ('
              + IntToStr(UsrTmpCode) + ')');
          end;

          HdrTable.DisableControls;
          PosTable.DisableControls;
          HdrTable.Close;
          PosTable.Close;

          case TypeDocComboBox.ItemIndex of
            0: begin // Приходная накладная заголовок
                 with ShopMainForm.pFIBService do
                 begin
                   HdrMarketCode:= FindMarketCode(NewDocFrm.RecipientComboBox.Text);
                   ShopMainForm.pFIBDatabase1.Execute('insert into HDR_PRIHOD(MARKET_CODE, DOC_DATE,'
                     + 'DOC_NUMBER, VENDOR_CODE, DOC_TYPE, AUTOR_KOD)'
                     + ' values (' + IntToStr(HdrMarketCode) + ', '''
                     + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime)
                     + ''', ' + NewDocFrm.DocNoEdit.Text + ', '
                     + IntToStr(FindVendorCode(NewDocFrm.VendorComboBox.Text))
                     + ', 1, ' + IntToStr(User_ID) + ')');
                   SelectSQL.Clear; // Определение кода присвоеного заголовку
                   SelectSQL.Add('select * from HDR_PRIHOD');
                   SelectSQL.Add('where MARKET_CODE = ' + IntToStr(HdrMarketCode));
                   SelectSQL.Add('and DOC_DATE = '''
                          + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime) + '''');
                   SelectSQL.Add('and DOC_NUMBER = ' + NewDocFrm.DocNoEdit.Text);
                   SelectSQL.Add('and DOC_TYPE = 1' );
                   Open;
                   if not VarIsNull(ShopMainForm.pFIBService['KOD'])then HdrKod:= ShopMainForm.pFIBService['KOD']
                   else
                   begin
                     Close;
                     Abort;
                   end;
                   Close;
 {                  SelectSQL.Clear;
                   SelectSQL.Add(' select * from POS_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
                   Open;
                   DecimalSeparator:= '.';
                   // Приходная накладная позиции
                   while not Eof do
                   begin
                     ShopMainForm.pFIBDatabase1.Execute('insert into POS_PRIHOD(KOD, ITEM, KOLVO, PRICE, '
                       + 'VEND_PRICE, MARKET_CODE)values(' + IntToStr(HdrKod) + ','''
                       + ShopMainForm.pFIBService['ITEM'] + ''','
                       + FloatToStrF(ShopMainForm.pFIBService['KOLVO'], ffFixed, 16, 3) + ','
                       + FloatToStrF(ShopMainForm.pFIBService['PRICE'], ffFixed, 16, 2) + ','
                       + FloatToStrF(ShopMainForm.pFIBService['VEND_PRICE'], ffFixed, 16, 2) + ','
                       + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']) + ')');
                     Next;
                   end;
                   Close;
                   DecimalSeparator:= TmpSep;
                   // Приходная накладная позиции
}                  ShopMainForm.pFIBDatabase1.Execute('insert into POS_PRIHOD(KOD, ITEM, KOLVO, PRICE, '
                     + 'VEND_PRICE, MARKET_CODE)'
                     + ' select ' + IntToStr(HdrKod) + ' KOD, ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE'
                     + ' from POS_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
                 end;
               end;
          1,6: begin // Расходная накладная заголовок, Резервирование товара
                 with ShopMainForm.pFIBService do
                 begin
                   HdrMarketCode:= FindMarketCode(NewDocFrm.VendorComboBox.Text);
                   SQLStr:= 'insert into HDR_RASHOD(MARKET_CODE, DOC_DATE,'
                     + ' DOC_NUMBER, VENDOR_CODE, DOC_TYPE, AUTOR_KOD)'
                     + ' values (' + IntToStr(HdrMarketCode) + ', '''
                     + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime)
                     + ''', ' + NewDocFrm.DocNoEdit.Text + ', '
                     + IntToStr(FindBuyerCode(NewDocFrm.RecipientComboBox.Text));
                   if TypeDocComboBox.ItemIndex = 1 then SQLStr:= SQLStr + ', 2,'
                   else SQLStr:= SQLStr + ', 12,';
                   SQLStr:= SQLStr + IntToStr(User_ID) + ')';
                   ShopMainForm.pFIBDatabase1.Execute(SQLStr);
                   SelectSQL.Clear;  // Определение кода присвоеного заголовку
                   SelectSQL.Add('select * from HDR_RASHOD');
                   SelectSQL.Add('where MARKET_CODE = ' + IntToStr(HdrMarketCode));
                   SelectSQL.Add('and DOC_DATE = '''
                          + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime) + '''');
                   SelectSQL.Add('and DOC_NUMBER = ' + NewDocFrm.DocNoEdit.Text);
                   if TypeDocComboBox.ItemIndex = 1 then SelectSQL.Add('and DOC_TYPE = 2')
                   else SelectSQL.Add('and DOC_TYPE = 12');
                   Open;
                   if not VarIsNull(ShopMainForm.pFIBService['KOD'])then HdrKod:= ShopMainForm.pFIBService['KOD']
                   else
                   begin
                     Close;
                     Abort;
                   end;
                   Close;
{                   SelectSQL.Clear;
                   SelectSQL.Add(' select * from POS_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
                   Open;
                   DecimalSeparator:= '.';
                   // Расходная, Резервирование позиции
                   while not Eof do
                   begin
                     ShopMainForm.pFIBDatabase1.Execute('insert into POS_RASHOD(KOD, ITEM, KOLVO, PRICE, '
                       + 'VEND_PRICE, MARKET_CODE)values(' + IntToStr(HdrKod) + ','''
                       + ShopMainForm.pFIBService['ITEM'] + ''','
                       + FloatToStrF(ShopMainForm.pFIBService['KOLVO'], ffFixed, 16, 3) + ','
                       + FloatToStrF(ShopMainForm.pFIBService['PRICE'], ffFixed, 16, 2) + ','
                       + FloatToStrF(ShopMainForm.pFIBService['VEND_PRICE'], ffFixed, 16, 2) + ','
                       + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']) + ')');
                     Next;
                   end;
                   Close;
                   DecimalSeparator:= TmpSep;
}                   ShopMainForm.pFIBDatabase1.Execute('insert into POS_RASHOD(KOD, ITEM, '
                     + 'KOLVO, PRICE, VEND_PRICE, MARKET_CODE)'
                     + ' select ' + IntToStr(HdrKod) + ' KOD, ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE'
                     + ' from POS_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
                 end;
               end;
          2,3: begin // Переброска приход/расход  заголовок
                 with ShopMainForm.pFIBService do
                 begin
                     // Расход заголовок
                   HdrMarketCode:= FindMarketCode(NewDocFrm.VendorComboBox.Text);
                   ShopMainForm.pFIBDatabase1.Execute('insert into HDR_RASHOD(MARKET_CODE, DOC_DATE,'
                     + ' DOC_NUMBER, VENDOR_CODE, DOC_TYPE, AUTOR_KOD)'
                     + ' values (' + IntToStr(HdrMarketCode) + ', '''
                     + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime)
                     + ''', ' + NewDocFrm.DocNoEdit.Text + ', '
                     + IntToStr(FindMarketCode(NewDocFrm.RecipientComboBox.Text))
                     + ', 3, ' + IntToStr(User_ID) + ')');
                   SelectSQL.Clear;  // Определение кода присвоеного заголовку
                   SelectSQL.Add('select * from HDR_RASHOD');
                   SelectSQL.Add('where MARKET_CODE = ' + IntToStr(HdrMarketCode));
                   SelectSQL.Add('and DOC_DATE = '''
                          + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime) + '''');
                   SelectSQL.Add('and DOC_NUMBER = ' + NewDocFrm.DocNoEdit.Text);
                   SelectSQL.Add('and DOC_TYPE = 3' );
                   Open;
                   if not VarIsNull(ShopMainForm.pFIBService['KOD'])then HdrKod:= ShopMainForm.pFIBService['KOD']
                   else
                   begin
                     Close;
                     Abort;
                   end;
                   Close;
                    // Расход позиции
                   ShopMainForm.pFIBDatabase1.Execute('insert into POS_RASHOD(KOD, ITEM, '
                     + 'KOLVO, PRICE, VEND_PRICE, MARKET_CODE)'
                     + ' select ' + IntToStr(HdrKod) + ' KOD, ITEM, KOLVO, PRICE, VEND_PRICE, '
                     + IntToStr(HdrMarketCode) + ' from POS_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));

                    // Приход заголовок
                   HdrMarketCode:= FindMarketCode(NewDocFrm.RecipientComboBox.Text);
                   ShopMainForm.pFIBDatabase1.Execute('insert into HDR_PRIHOD(MARKET_CODE, DOC_DATE,'
                     + 'DOC_NUMBER, VENDOR_CODE, DOC_TYPE, AUTOR_KOD)'
                     + ' values (' + IntToStr(HdrMarketCode) + ', '''
                     + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime)
                     + ''', ' + NewDocFrm.DocNoEdit.Text + ', '
                     + IntToStr(FindMarketCode(NewDocFrm.VendorComboBox.Text))
                     + ', 7, ' + IntToStr(User_ID) + ')');
                   SelectSQL.Clear;  // Определение кода присвоеного заголовку
                   SelectSQL.Add('select * from HDR_PRIHOD');
                   SelectSQL.Add('where MARKET_CODE = ' + IntToStr(HdrMarketCode));
                   SelectSQL.Add('and DOC_DATE = '''
                          + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime) + '''');
                   SelectSQL.Add('and DOC_NUMBER = ' + NewDocFrm.DocNoEdit.Text);
                   SelectSQL.Add('and DOC_TYPE = 7' );
                   Open;
                   if not VarIsNull(ShopMainForm.pFIBService['KOD'])then HdrKod:= ShopMainForm.pFIBService['KOD']
                   else
                   begin
                     Close;
                     Abort;
                   end;
                   Close;
                     // Приход позиции
                   ShopMainForm.pFIBDatabase1.Execute('insert into POS_PRIHOD(KOD, ITEM, KOLVO, '
                     + 'PRICE, VEND_PRICE, MARKET_CODE)'
                     + ' select ' + IntToStr(HdrKod) + ' KOD, ITEM, KOLVO, PRICE, VEND_PRICE, '
                     + IntToStr(HdrMarketCode) + ' from POS_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
                end;
               end;
            4: begin // Возврат поставщику заголовок
                 with ShopMainForm.pFIBService do
                 begin
                   HdrMarketCode:= FindMarketCode(NewDocFrm.VendorComboBox.Text);
                   ShopMainForm.pFIBDatabase1.Execute('insert into HDR_RASHOD(MARKET_CODE, DOC_DATE,'
                     + ' DOC_NUMBER, VENDOR_CODE, DOC_TYPE, AUTOR_KOD)'
                     + ' values (' + IntToStr(HdrMarketCode) + ', '''
                     + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime)
                     + ''', ' + NewDocFrm.DocNoEdit.Text + ', '
                     + IntToStr(FindVendorCode(NewDocFrm.RecipientComboBox.Text))
                     + ', 8, ' + IntToStr(User_ID) + ')');
                   SelectSQL.Clear;  // Определение кода присвоеного заголовку
                   SelectSQL.Add('select * from HDR_RASHOD');
                   SelectSQL.Add('where MARKET_CODE = ' + IntToStr(HdrMarketCode));
                   SelectSQL.Add('and DOC_DATE = '''
                          + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime) + '''');
                   SelectSQL.Add('and DOC_NUMBER = ' + NewDocFrm.DocNoEdit.Text);
                   SelectSQL.Add('and DOC_TYPE = 8' );
                   Open;
                   if not VarIsNull(ShopMainForm.pFIBService['KOD'])then HdrKod:= ShopMainForm.pFIBService['KOD']
                   else
                   begin
                     Close;
                     Abort;
                   end;
                   Close;
                     // Возврат поставщику позиции
{                   SelectSQL.Clear;
                   SelectSQL.Add(' select * from POS_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
                   Open;
                   DecimalSeparator:= '.';
                   while not Eof do
                   begin
                     ShopMainForm.pFIBDatabase1.Execute('insert into POS_RASHOD(KOD, ITEM, KOLVO, PRICE, '
                       + 'VEND_PRICE, MARKET_CODE)values(' + IntToStr(HdrKod) + ','''
                       + ShopMainForm.pFIBService['ITEM'] + ''','
                       + FloatToStrF(ShopMainForm.pFIBService['KOLVO'], ffFixed, 16, 3) + ','
                       + FloatToStrF(ShopMainForm.pFIBService['PRICE'], ffFixed, 16, 2) + ','
                       + FloatToStrF(ShopMainForm.pFIBService['VEND_PRICE'], ffFixed, 16, 2) + ','
                       + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']) + ')');
                     Next;
                   end;
                   Close;
                   DecimalSeparator:= TmpSep;
}                   ShopMainForm.pFIBDatabase1.Execute('insert into POS_RASHOD(KOD, '
                     + 'ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE)'
                     + ' select ' + IntToStr(HdrKod) + ' KOD, ITEM, KOLVO, PRICE, VEND_PRICE, ' + HdrMarketCode.ToString
                     + ' from POS_TMP_DOC where KOD = ' + UsrTmpCode.ToString);
                 end;
               end;
            5: begin // Возврат покупателя заголовок
                 with ShopMainForm.pFIBService do
                 begin
                   HdrMarketCode:= FindMarketCode(NewDocFrm.RecipientComboBox.Text);
                   ShopMainForm.pFIBDatabase1.Execute('insert into HDR_PRIHOD(MARKET_CODE, DOC_DATE,'
                     + ' DOC_NUMBER, VENDOR_CODE, DOC_TYPE, AUTOR_KOD)'
                     + ' values (' + IntToStr(HdrMarketCode) + ', '''
                     + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime)
                     + ''', ' + NewDocFrm.DocNoEdit.Text + ', '
                     + IntToStr(FindBuyerCode(NewDocFrm.VendorComboBox.Text))
                     + ', 10, ' + IntToStr(User_ID) + ')');
                   SelectSQL.Clear; // Определение кода присвоеного заголовку
                   SelectSQL.Add('select * from HDR_PRIHOD');
                   SelectSQL.Add('where MARKET_CODE = ' + IntToStr(HdrMarketCode));
                   SelectSQL.Add('and DOC_DATE = '''
                          + DateTimeToStr(NewDocFrm.DateTimePicker.DateTime) + '''');
                   SelectSQL.Add('and DOC_NUMBER = ' + NewDocFrm.DocNoEdit.Text);
                   SelectSQL.Add('and DOC_TYPE = 10' );
                   Open;
                   if not VarIsNull(ShopMainForm.pFIBService['KOD'])then HdrKod:= ShopMainForm.pFIBService['KOD']
                   else
                   begin
                     Close;
                     Abort;
                   end;
                   Close;
                    // Возврат покупателя позиции
 {                  SelectSQL.Clear;
                   SelectSQL.Add(' select * from POS_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
                   Open;
                   DecimalSeparator:= '.';
                   while not Eof do
                   begin
                     ShopMainForm.pFIBDatabase1.Execute('insert into POS_PRIHOD(KOD, ITEM, KOLVO, PRICE, '
                       + 'VEND_PRICE, MARKET_CODE)values(' + IntToStr(HdrKod) + ','''
                       + ShopMainForm.pFIBService['ITEM'] + ''','
                       + FloatToStrF(ShopMainForm.pFIBService['KOLVO'], ffFixed, 16, 3) + ','
                       + FloatToStrF(ShopMainForm.pFIBService['PRICE'], ffFixed, 16, 2) + ','
                       + FloatToStrF(ShopMainForm.pFIBService['VEND_PRICE'], ffFixed, 16, 2) + ','
                       + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']) + ')');
                     Next;
                   end;
                   Close;
                   DecimalSeparator:= TmpSep;
}                  ShopMainForm.pFIBDatabase1.Execute('insert into POS_PRIHOD(KOD, ITEM, KOLVO,'
                     + ' PRICE, VEND_PRICE, MARKET_CODE)'
                     + ' select ' + IntToStr(HdrKod) + ' KOD, ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE'
                     + ' from POS_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
                 end;
               end;
          end;

          if MessageDlg('Удалить документ из черновиков ?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
          begin
            ShopMainForm.pFIBDatabase1.Execute('delete from POS_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
            ShopMainForm.pFIBDatabase1.Execute('delete from HDR_TMP_DOC where KOD = ' + IntToStr(UsrTmpCode));
          end;

          if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.CommitRetaining;
          HdrTable.Open;
          HdrTable.Locate('KOD', HdrKod, []);
          PosTable.Open;
          HdrTable.EnableControls;

          if Assigned(SprFrm) and (not VarIsNull(SprFrm.SprTovar['ITEM'])) then
            with PosTable do
            begin // Обновляем справочник товаров, если форма существует
              First;
              while not Eof do
              begin
                if SprFrm.SprTovar.Locate('ITEM', PosTable['ITEM'], [])then
                  SprFrm.SprTovar.Refresh;
                Next;
              end;
              First;
            end;

          PosTable.EnableControls;
        end;
        NewDocFrm.Free;
end;

procedure TMoveTovarFrm.TypeDocComboBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then SelectNext(Sender as TWinControl, true, true);
end;

procedure TMoveTovarFrm.PrintDocBtnClick(Sender: TObject);
begin
      PopupMenu2.Popup(MoveTovarFrm.Left + 30
        ,(MoveTovarFrm.Height - MoveTovarFrm.ClientHeight) + MoveTovarFrm.Top);
end;

procedure TMoveTovarFrm.HdrTableAfterOpen(DataSet: TDataSet);
begin
  if VarIsNull(HdrTable['KOD'])then DBGrid2.PopupMenu:= nil
  else DBGrid2.PopupMenu:= PopupMenu1;
  HdrTable.Last;
end;

procedure TMoveTovarFrm.LabeledEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = VK_RETURN) and (LabeledEdit1.Text <> '')and( not VarIsNull(HdrTable['DOC_NUMBER']))) then
    HdrTable.Locate('DOC_NUMBER', LabeledEdit1.Text, []);
end;

procedure TMoveTovarFrm.LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
begin
      if not(Key in [#8, '0'..'9'])then Key:= #0;
end;

procedure TMoveTovarFrm.N1Click(Sender: TObject);
var TmpDSep: Char;
    TmpValue: Double;
begin
   Application.CreateForm(TVendSummFactFrm, VendSummFactFrm);
  VendSummFactFrm.MoneyEdit1.Text:= FloatToStr(HdrTable['VEND_SUM']);
  if VendSummFactFrm.ShowModal = idOK then
  begin
    TmpValue:= StrToFloat(VendSummFactFrm.MoneyEdit1.Text);
    TmpDSep:= FormatSettings.DecimalSeparator;
    FormatSettings.DecimalSeparator:= '.';
    ShopMainForm.pFIBDatabase1.Execute('update HDR_PRIHOD'
      + ' set VEND_SUM = ' + FloatToStr(TmpValue)
      + ' where KOD = ' + IntToStr(HdrTable['KOD']));
    FormatSettings.DecimalSeparator:= TmpDSep;
    DataSetReOpen(HdrTable);
  end;
  VendSummFactFrm.Free;
end;

procedure TMoveTovarFrm.N2Click(Sender: TObject);
var SQLStr: String;
begin
  SQLStr:= 'insert into CENNIK_PRN';
  case TypeDocComboBox.ItemIndex of
    0,3,5 : SQLStr:= SQLStr + ' select ITEM from POS_PRIHOD';
    1,2,4 : SQLStr:= SQLStr + ' select ITEM from POS_RASHOD';
  end;
  SQLStr:= SQLStr + ' where KOD = ' + IntToStr(HdrTable['KOD']);
  ShopMainForm.pFIBDatabase1.Execute(SQLStr);
end;

procedure TMoveTovarFrm.N3Click(Sender: TObject);
var i: Integer;
  SQLStr: String;
begin  // Изменение поставщика в приходном документе
        Application.CreateForm(TTovarRepFrm, TovarRepFrm);
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_VENDORS');
          Open;
          TovarRepFrm.ComboBox1.Items.Clear;
          while not Eof do
          begin
            TovarRepFrm.ComboBox1.Items.Add(ShopMainForm.pFIBService['VENDOR_NAME']);
            Next;
          end;
          TovarRepFrm.ComboBox1.ItemIndex:=
                                FindString(HdrTable['V_NAME'], TovarRepFrm.ComboBox1.Items);
          Close;
        end;
        with TovarRepFrm do
        begin
          Caption:= 'Выберите поставщика';
          Label2.Visible:= False;
          DateTimePicker1.Visible:= False;
          DateTimePicker2.Visible:= False;
          TovarRepFrm.ComboBox1.Sorted:= True;
          LMDButton1.Top:= 56;
          Height:= 116;
          Application.CreateForm(TEditEnterForm, EditEnterForm);
          LMDButton1.Caption:= 'OK';
          LMDButton1.Glyph:= nil;
          EditEnterForm.Free;
          LMDButton1.Tag:= 1;
          Label1.Caption:= 'Поставщик:';
        end;
        if TovarRepFrm.ShowModal = mrOK then
        begin
          i:= FindVendorCode(TovarRepFrm.ComboBox1.Text);
          if TypeDocComboBox.ItemIndex = 0 then SQLStr:= 'update HDR_PRIHOD'
          else SQLStr:= 'update HDR_RASHOD';
          SQLStr:= SQLStr + ' set VENDOR_CODE = ' + IntToStr(i);
          i:= HdrTable['KOD'];
          SQLStr:= SQLStr + ' where KOD = ' + IntToStr(HdrTable['KOD']);
          ShopMainForm.pFIBDatabase1.Execute(SQLStr);
          DataSetReOpen(HdrTable);
          HdrTable.Locate('KOD', i, []);
        end;
        TovarRepFrm.Free;
end;

procedure TMoveTovarFrm.PopupMenu1Popup(Sender: TObject);
begin
      N3.Visible:= TypeDocComboBox.ItemIndex in [0,4];
      N4.Visible:= accessAllowed('OperNaklDel', User_ID); // Удаление накладных
      N5.Visible:= N4.Visible;  // разделитель
      N6.Visible:= (TypeDocComboBox.ItemIndex = 6)and(not VarIsNull(HdrTable['KOD']));
      N7.Visible:= (TypeDocComboBox.ItemIndex = 6)and(not VarIsNull(HdrTable['KOD']));
end;

procedure TMoveTovarFrm.N4Click(Sender: TObject);
var i: Integer;
   SQLStr: String;
begin
        if MessageDlg('Удалить текущую накладную ?',
                mtConfirmation, [mbYes,mbNo], 0) = IDYES then
        begin
          if TypeDocComboBox.ItemIndex in [0, 5, 3]then SQLStr:= 'delete from HDR_PRIHOD'
          else SQLStr:= 'delete from HDR_RASHOD';
          SQLStr:= SQLStr + ' where KOD = ' + IntToStr(HdrTable['KOD']);
          ShopMainForm.pFIBDatabase1.Execute(SQLStr);
          with HdrTable do
          begin
            DisableControls;
            i:= HdrTable['KOD'];
            Next;
            if i = HdrTable['KOD'] then Prior;
            i:= HdrTable['KOD'];
            Close;
            Open;
            HdrTable.Locate('KOD', i, []);
            EnableControls
          end;
        end;
end;

procedure TMoveTovarFrm.MenuClick(Sender: TObject);
var i: Integer;
    KodStr: String;
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

      KodStr:= '';
      if DBGrid2.SelectedRows.Count > 0 then
        with DBGrid2.DataSource.DataSet do
          for i:= 0 to DBGrid2.SelectedRows.Count - 1 do
          begin
            GotoBookmark(DBGrid2.SelectedRows.Items[i]);
            if KodStr > '' then KodStr:= KodStr + ',';
            KodStr:= KodStr + IntToStr(HdrTable['KOD']);
          end;
      if KodStr = '' then KodStr:= IntToStr(HdrTable['KOD']);

      with ShopMainForm.frxReport1 do
      begin
        LoadFromFile(ReportsPath + 'Nakl\' + (Sender as TMenuItem).Caption + '.fr3');
        Script.Variables['DOC_TYPE']:= HdrTable['DOC_TYPE'];
        Script.Variables['KOD']:= KodStr;
        ShowReport;
      end;
end;

procedure TMoveTovarFrm.AddPosActionUpdate(Sender: TObject);
begin
  (Sender as TAction).Visible:= accessAllowed('OperNaklDel', User_ID);
  (Sender as TAction).Enabled:= not VarIsNull(HdrTable['KOD']);
end;

procedure TMoveTovarFrm.PrintDocActionUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= not VarIsNull(HdrTable['KOD']);
end;

procedure TMoveTovarFrm.DBGrid2TitleClick(Column: TColumn);
var i: Integer;
begin
  if ((Column.Index in [0, 1, 8])and(MoveTovarFrm.DBGrid2.Tag <> Column.Index)) then
  begin
    HdrTable.DisableControls;
    if HdrTable.Active and not VarIsNull(HdrTable['KOD']) then i:= HdrTable['KOD']
    else i:= -1;

    PosTable.DisableControls;
    PosTable.Close;
    HdrTable.Close;
    HdrTable.SelectSQL[HdrTable.SelectSQL.Count-1]:= 'order by H.' + Column.FieldName;
    MoveTovarFrm.DBGrid2.Tag:= Column.Index;
    HdrTable.Open;
    HdrTable.Locate('KOD', i, []);
    PosTable.Open;
    HdrTable.EnableControls;
    PosTable.EnableControls;
    for i:= 0 to MoveTovarFrm.DBGrid2.Columns.Count - 1 do
      if Column.Index = i then
      begin
        MoveTovarFrm.DBGrid2.Columns[i].Title.Font.Color:= clRed;
        MoveTovarFrm.DBGrid2.Columns[i].Title.Font.Style:= [fsBold];
      end
      else
        if (i in [0, 1, 8]) then
        begin
          MoveTovarFrm.DBGrid2.Columns[i].Title.Font.Color:= clBlue;
          MoveTovarFrm.DBGrid2.Columns[i].Title.Font.Style:= [fsBold];
        end
        else
        begin
          MoveTovarFrm.DBGrid2.Columns[i].Title.Font.Color:= clWindowText;
          MoveTovarFrm.DBGrid2.Columns[i].Title.Font.Style:= [];
        end;
  end;
end;

procedure TMoveTovarFrm.EditDocACTExecute(Sender: TObject);
var i: Integer;
   SQLStr: String;
begin
      if MessageDlg('Передать накладную в черновики ?', mtConfirmation,
            [mbYes,mbNo], 0) = idYes then
      begin
        HdrTable.DisableControls;
        PosTable.DisableControls;
        pFIBStoredProc1.StoredProcName:= 'GET_TMP_CODE';
        pFIBStoredProc1.ExecProc;
        i:= pFIBStoredProc1.ParamValue('TMP_CODE');
        pFIBStoredProc1.StoredProcName:= 'UPD_TOVAR_INF';
        SQLStr:= 'insert into HDR_TMP_DOC(KOD, AUTOR_KOD, DOC_DATE, DOC_NUMBER,'
                                  + ' DOC_TYPE, VENDOR_CODE, MARKET_CODE)';
        case MoveTovarFrm.TypeDocComboBox.ItemIndex of
        0,5:   begin // Приходная
                 SQLStr:= SQLStr + ' select ' + IntToStr(i)
                    + 'as KOD, AUTOR_KOD, DOC_DATE, DOC_NUMBER,'
                    + ' DOC_TYPE, VENDOR_CODE, MARKET_CODE'
                    + ' from HDR_PRIHOD where KOD = ' + IntToStr(HdrTable['KOD']);
                 ShopMainForm.pFIBDatabase1.Execute(SQLStr);

                 ShopMainForm.pFIBDatabase1.Execute('insert into POS_TMP_DOC(KOD, '
                   + 'ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE)'
                   + ' select ' + IntToStr(i)
                   + ' as KOD, ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE'
                   + ' from POS_PRIHOD where KOD = ' + IntToStr(HdrTable['KOD']));

//                 ShopMainForm.pFIBDatabase1.Execute('delete from HDR_PRIHOD where KOD = ' + IntToStr(HdrTable['KOD']));
               end;
            2: begin // Расходная переброска
                 SQLStr:= SQLStr + ' select ' + IntToStr(i)
                    + 'as KOD, AUTOR_KOD, DOC_DATE, DOC_NUMBER,'
                    + ' DOC_TYPE, VENDOR_CODE, MARKET_CODE'
                    + ' from HDR_RASHOD where KOD = ' + IntToStr(HdrTable['KOD']);
                 ShopMainForm.pFIBDatabase1.Execute(SQLStr);

                 ShopMainForm.pFIBDatabase1.Execute('insert into POS_TMP_DOC(KOD, '
                   + 'ITEM, KOLVO, PRICE, MARKET_CODE)'
                   + ' select ' + IntToStr(i) + ', ITEM, sum(KOLVO), PRICE, MARKET_CODE'
                   + ' from POS_RASHOD where KOD = ' + IntToStr(HdrTable['KOD'])
                   + ' group by ITEM, PRICE, MARKET_CODE');

                 ShopMainForm.pFIBDatabase1.Execute('delete from HDR_PRIHOD'
                   + ' where KOD = (select KOD from HDR_PRIHOD'
                   + ' where DOC_NUMBER = ' + IntToStr(HdrTable['DOC_NUMBER'])
                   + ' and MARKET_CODE = ' + IntToStr(HdrTable['VENDOR_CODE'])
                   + ' and DOC_TYPE = ' + IntToStr(HdrTable['DOC_TYPE']) + ')');

//                 ShopMainForm.pFIBDatabase1.Execute('delete from HDR_RASHOD where KOD = ' + IntToStr(HdrTable['KOD']));
               end;
            3: begin // Приходная переброска
                 SQLStr:= SQLStr + ' select ' + IntToStr(i)
                    + 'as KOD, AUTOR_KOD, DOC_DATE, DOC_NUMBER,'
                    + ' DOC_TYPE, VENDOR_CODE, MARKET_CODE'
                    + ' from HDR_PRIHOD where KOD = ' + IntToStr(HdrTable['KOD']);
                 ShopMainForm.pFIBDatabase1.Execute(SQLStr);

                 ShopMainForm.pFIBDatabase1.Execute('insert into POS_TMP_DOC(KOD,'
                   + ' ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE)'
                   + ' select ' + IntToStr(i)
                   + ' as KOD, ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE'
                   + ' from POS_PRIHOD where KOD = ' + IntToStr(HdrTable['KOD']));

                 ShopMainForm.pFIBDatabase1.Execute('delete from HDR_RASHOD'
                   + ' where KOD = (select KOD from HDR_RASHOD'
                   + ' where DOC_NUMBER = ' + IntToStr(HdrTable['DOC_NUMBER'])
                   + ' and MARKET_CODE = ' + IntToStr(HdrTable['VENDOR_CODE'])
                   + ' and DOC_TYPE = ' + IntToStr(HdrTable['DOC_TYPE']) + ')');

//                 ShopMainForm.pFIBDatabase1.Execute('delete from HDR_PRIHOD where KOD = ' + IntToStr(HdrTable['KOD']));
               end;
        1,4,6: begin // Расходная, Резервирование
                 SQLStr:= SQLStr + ' select ' + IntToStr(i)
                    + 'as KOD, AUTOR_KOD, DOC_DATE, DOC_NUMBER,'
                    + ' DOC_TYPE, VENDOR_CODE, MARKET_CODE '
                    + ' from HDR_RASHOD where KOD = ' + IntToStr(HdrTable['KOD']);
                 ShopMainForm.pFIBDatabase1.Execute(SQLStr);

                 ShopMainForm.pFIBDatabase1.Execute('insert into POS_TMP_DOC(KOD, '
                   + 'ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE)'
                   + ' select ' + IntToStr(i) + ', ITEM, sum(KOLVO), PRICE, VEND_PRICE, MARKET_CODE'
                   + ' from POS_RASHOD where KOD = ' + IntToStr(HdrTable['KOD'])
                   + ' group by ITEM, PRICE, VEND_PRICE, MARKET_CODE');

//                 ShopMainForm.pFIBDatabase1.Execute('delete from HDR_RASHOD where KOD = ' + IntToStr(HdrTable['KOD']));
               end;
        end;


        case MoveTovarFrm.TypeDocComboBox.ItemIndex of
        0,5,3: // Приход
             ShopMainForm.pFIBDatabase1.Execute('delete from HDR_PRIHOD where KOD = ' + IntToStr(HdrTable['KOD']));
        1,2,4,6: // Расход
             ShopMainForm.pFIBDatabase1.Execute('delete from HDR_RASHOD where KOD = ' + IntToStr(HdrTable['KOD']));
        end;

        if Assigned(SprFrm) and (not VarIsNull(SprFrm.SprTovar['ITEM'])) then
          with PosTable do
          begin // Обновляем справочник товаров, если форма существует
            First;
            while not Eof do
            begin
              if SprFrm.SprTovar.Locate('ITEM', PosTable['ITEM'], [])then
                SprFrm.SprTovar.Refresh;
              Next;
            end;
          end;

       if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.CommitRetaining;
        PosTable.Close;
        i:= HdrTable['KOD'];
        HdrTable.Next;
        if i = HdrTable['KOD'] then HdrTable.Prior;
        i:= HdrTable['KOD'];
        HdrTable.Close;
        HdrTable.Open;
        HdrTable.Locate('KOD', i, []);
        HdrTable.EnableControls;
        PosTable.Open;
        PosTable.EnableControls;
      end;
end;

procedure TMoveTovarFrm.VendorComboBoxChange(Sender: TObject);
begin
        UpdateChangeUsrBtn.Enabled:= True;
end;

procedure TMoveTovarFrm.N6Click(Sender: TObject);
var i: Integer;
begin
    if MessageDlg('Сохранить выбранную накладную как расходную ?', mtConfirmation, [mbYes, mbNo], 0) = ID_YES then
    begin
      with ShopMainForm.pFIBService do
      begin
        SelectSQL.Clear;
        SelectSQL.Add('select * from HDR_RASHOD');
        SelectSQL.Add('where DOC_TYPE = 2 and MARKET_CODE = ' + IntToStr(HdrTable['MARKET_CODE']));
        SelectSQL.Add('and DOC_NUMBER = ' + IntToStr(HdrTable['DOC_NUMBER']));
        Open;
        if VarIsNull(ShopMainForm.pFIBService['KOD'])then
        begin
          HdrTable.DisableControls;
          PosTable.DisableControls;
          ShopMainForm.pFIBDatabase1.Execute('update HDR_RASHOD set DOC_TYPE = 2'
            + ' where KOD = ' + IntToStr(HdrTable['KOD']));

          if Assigned(SprFrm) and (not VarIsNull(SprFrm.SprTovar['ITEM'])) then
            with PosTable do
            begin // Обновляем справочник товаров, если форма существует
              First;
              while not Eof do
              begin
                if SprFrm.SprTovar.Locate('ITEM', PosTable['ITEM'], [])then
                  SprFrm.SprTovar.Refresh;
                Next;
              end;
            end;

          if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.CommitRetaining;
          PosTable.Close;
          i:= HdrTable['KOD'];
          HdrTable.Next;
          if i = HdrTable['KOD'] then HdrTable.Prior;
          i:= HdrTable['KOD'];
          HdrTable.Close;
          HdrTable.Open;
          HdrTable.Locate('KOD', i, []);
          HdrTable.EnableControls;
          PosTable.Open;
          PosTable.EnableControls;
        end
        else MessageDlg('Расходная накладная с №' + IntToStr(HdrTable['DOC_NUMBER'])
          + ' уже существует', mtWarning, [mbOK], 0);
        Close;
      end;
    end;
end;

procedure TMoveTovarFrm.N7Click(Sender: TObject);
begin
   Application.CreateForm(TVendSummFactFrm, VendSummFactFrm);
   VendSummFactFrm.Tag:= 2;
   VendSummFactFrm.MoneyEdit1.Visible:= False;
   VendSummFactFrm.Edit1.Visible:= True;
   VendSummFactFrm.Edit1.Text:= IntToStr(HdrTable['DOC_NUMBER']);
   VendSummFactFrm.ActiveControl:= VendSummFactFrm.Edit1;
   VendSummFactFrm.Caption:= 'Изменение номера накладной';
   VendSummFactFrm.Label1.Caption:= 'Новый номер :';
   if VendSummFactFrm.ShowModal = IDOK then
   begin
     ShopMainForm.pFIBDatabase1.Execute('update HDR_RASHOD'
       + ' set DOC_NUMBER = ' + VendSummFactFrm.Edit1.Text
       + ' where KOD = ' + IntToStr(HdrTable['KOD']));
     if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.CommitRetaining;
     HdrTable.ReopenLocate('KOD');
     PosTable.ReopenLocate('KOD');
   end;
   VendSummFactFrm.Free;
end;

procedure TMoveTovarFrm.N8Click(Sender: TObject);
var i: Integer;
    SQLStr: String;
begin
  Application.CreateForm(TTovarInfoFrm, TovarInfoFrm);
  TovarInfoFrm.Label1.Visible:= False;
  TovarInfoFrm.Edit1.Visible:= False;
  TovarInfoFrm.Edit1.Text:= ' ';
  TovarInfoFrm.BitBtn3.Visible:= False;
  TovarInfoFrm.Image1.Visible:= False;
  TovarInfoFrm.Caption:= '';
  TovarInfoFrm.Width:= TovarInfoFrm.Memo1.Width + 30;
  if not VarIsNull(HdrTable['REMARK']) then TovarInfoFrm.Memo1.Text:= HdrTable['REMARK'];
  TovarInfoFrm.ActiveControl:= TovarInfoFrm.Memo1;
  if TovarInfoFrm.ShowModal = mrOK then
  begin
    i:= HdrTable['KOD'];
    case MoveTovarFrm.TypeDocComboBox.ItemIndex of
     0,3,5: SQLStr:= 'update HDR_PRIHOD';
     1,2,4,6: SQLStr:= 'update HDR_RASHOD';
    end;
    SQLStr:= SQLStr + ' set REMARK = ''' + TovarInfoFrm.Memo1.Text + '''';
    SQLStr:= SQLStr + ' where KOD = ' + IntToStr(HdrTable['KOD']);
    ExecSQLStr(SQLStr);
    DataSetReOpen(HdrTable);
    HdrTable.Locate('KOD', i, []);
  end;

  TovarInfoFrm.Free;
end;

end.
