//****************************************************************************//
//                            © Guard  2003-2024                              //
//****************************************************************************//
unit Spr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls, Menus,
  Printers, Clipbrd, ActiveX, FIBDataSet, pFIBDataSet, DSContainer, ExcelObj,
  FIBQuery, pFIBQuery, IniFiles, frxClass, frxCross, Vcl.ToolWin, Vcl.ImgList,
  JPEG;

type
  TSprFrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet6: TTabSheet;
    EditGrBtn: TBitBtn;
    AddGrBtn: TBitBtn;
    TGroupGrid: TDBGrid;
    DataSource5: TDataSource;
    Label5: TLabel;
    TabSheet9: TTabSheet;
    DataSource7: TDataSource;
    DBGrid4: TDBGrid;
    Label15: TLabel;
    Panel2: TPanel;
    NewTovarAddBtn: TBitBtn;
    EditTovarBtn: TBitBtn;
    BarCodeEdit: TEdit;
    GrNameEdit: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    LMDButton1: TBitBtn;
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    AddBarCodeButton: TBitBtn;
    DelBarCodeButton: TBitBtn;
    ComboBox2: TComboBox;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MoveTovarBtn: TBitBtn;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    DataSource3: TDataSource;
    ZakazTovarBtn: TBitBtn;
    N2: TMenuItem;
    SpeedButton1: TSpeedButton;
    FindTBtn: TSpeedButton;
    FindEdit: TEdit;
    SpeedButton2: TSpeedButton;
    PopupMenu2: TPopupMenu;
    FND0: TMenuItem;
    FND1: TMenuItem;
    FND2: TMenuItem;
    FND3: TMenuItem;
    FND4: TMenuItem;
    FND5: TMenuItem;
    FND6: TMenuItem;
    FND7: TMenuItem;
    FND8: TMenuItem;
    FND9: TMenuItem;
    FND10: TMenuItem;
    FND11: TMenuItem;
    FND12: TMenuItem;
    FND13: TMenuItem;
    FND14: TMenuItem;
    FND15: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ComboBox1: TComboBox;
    Label7: TLabel;
    BitBtn8: TBitBtn;
    SpeedButton3: TSpeedButton;
    BitBtn9: TBitBtn;
    PopupMenu3: TPopupMenu;
    Excel1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    PopupMenu4: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    SprTovar: TpFIBDataSet;
    SprTovarINT_ITEM: TIntegerField;
    SprTovarT_GROUP: TIntegerField;
    SprTovarSALE_PRICE: TFloatField;
    SprTovarVEND_PRICE: TFloatField;
    SprTovarPRICE_1: TFloatField;
    SprTovarPRICE_2: TFloatField;
    SprTovarPRICE_3: TFloatField;
    SprTovarPRICE_4: TFloatField;
    SprTovarPRICE_5: TFloatField;
    SprTovarPRICE_6: TFloatField;
    SprTovarPRICE_7: TFloatField;
    SprTovarPRICE_8: TFloatField;
    SprTovarPRICE_9: TFloatField;
    SprTovarVENDOR_CODE: TIntegerField;
    SprTovarKKM_SECT: TIntegerField;
    SprTovarEXTRA_CHARGE: TIntegerField;
    SprTovarCHARGE: TIntegerField;
    SprTovarKOLVO: TFloatField;
    BarCode: TpFIBDataSet;
    DataSetsContainer1: TDataSetsContainer;
    DataSetsContainer2: TDataSetsContainer;
    SpeedButton4: TSpeedButton;
    BitBtn6: TBitBtn;
    SprTovarGroup: TpFIBDataSet;
    pFIBDataSet1: TpFIBDataSet;
    SprAcountGroup: TpFIBDataSet;
    SprAcountGroupKOD_ACOUNT: TFIBIntegerField;
    SprAcountGroupACOUNT_NAME: TFIBStringField;
    SprAcountGroupACOUNT_TYPE: TFIBIntegerField;
    SprAcountGroupACOUNT_TYPE_NAME: TStringField;
    SprTable: TpFIBDataSet;
    SprTovarTOVAR_NAME: TFIBStringField;
    SprTovarREMARK_1: TFIBStringField;
    SprTovarVEND_ITEM: TFIBStringField;
    SprTovarGROUP_NAME: TFIBStringField;
    SprTovarVENDOR_NAME: TFIBStringField;
    SprTovarREMARK: TFIBStringField;
    SprTovarUNIT_NAME: TFIBStringField;
    SprTovarPRODUCER: TFIBStringField;
    SprTovarITEM: TFIBStringField;
    SprTovarUNIT_CODE: TFIBIntegerField;
    frxReport2: TfrxReport;
    SprTovarARTIKUL: TFIBStringField;
    N9: TMenuItem;
    CodeForVendBtn: TSpeedButton;
    SprTovarMARKED: TFIBIntegerField;
    N10: TMenuItem;
    N11: TMenuItem;
    SprTovarSCLAD: TFIBStringField;
    FND16: TMenuItem;
    SprTovarMARK_COLOR: TFIBIntegerField;
    TabSheet4: TTabSheet;
    ColorBox1: TColorBox;
    MarkCurTovarBitBtn: TBitBtn;
    MarkAllTovarBitBtn: TBitBtn;
    ClrMarkCurTovarBitBtn: TBitBtn;
    ClrMarkAllTovarBitBtn: TBitBtn;
    SprTovarSALE_MARK_COLOR: TFIBIntegerField;
    Bevel1: TBevel;
    Bevel2: TBevel;
    SaleClrMarkAllTovarBitBtn: TBitBtn;
    SaleClrMarkCurTovarBitBtn: TBitBtn;
    SaleMarkAllTovarBitBtn: TBitBtn;
    SaleMarkCurTovarBitBtn: TBitBtn;
    ColorBox2: TColorBox;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FindEditChange(Sender: TObject);
    procedure FindEditKeyPress(Sender: TObject; var Key: Char);
    procedure FindEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FindTBtnClick(Sender: TObject);
    procedure CodeFltrEditKeyPress(Sender: TObject; var Key: Char);
    procedure CodeFltrEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NewTovarAddBtnClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LMDButton1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure INNEditKeyPress(Sender: TObject; var Key: Char);
    procedure GrNameEditChange(Sender: TObject);
    procedure AddGrBtnClick(Sender: TObject);
    procedure TGroupGridDblClick(Sender: TObject);
    procedure BarCodeEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BarCodeEditChange(Sender: TObject);
    procedure BarCodeAfterOpen(DataSet: TDataSet);
    procedure AddBarCodeButtonClick(Sender: TObject);
    procedure DelBarCodeButtonClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormDestroy(Sender: TObject);
    procedure ChangeTovarOrder(FieldNo: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure frPrintGrid1PrintColumn(ColumnNo: Integer;
      var Width: Integer);
    procedure MoveTovarBtnClick(Sender: TObject);
    procedure CodeFltrEditChange(Sender: TObject);
    procedure VendorFltrComboBoxChange(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SprTovarAfterOpen(DataSet: TDataSet);
    procedure ZakazTovarBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FND15Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure itBtn9Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure SprTovarFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SprAcountGroupACOUNT_TYPE_NAMEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure frxReport2BeforePrint(Sender: TfrxReportComponent);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CodeForVendBtnClick(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure MarkCurTovarBitBtnClick(Sender: TObject);
    procedure ClrMarkCurTovarBitBtnClick(Sender: TObject);
    procedure MarkAllTovarBitBtnClick(Sender: TObject);
    procedure SaleMarkCurTovarBitBtnClick(Sender: TObject);
    procedure SaleClrMarkCurTovarBitBtnClick(Sender: TObject);
    procedure SaleMarkAllTovarBitBtnClick(Sender: TObject);
  private
    procedure WMChangeCBChain(var Msg: TWMChangeCBChain); message WM_CHANGECBCHAIN;
    procedure WMDrawClipboard(var Msg: TWMDrawClipboard); message WM_DRAWCLIPBOARD;
    { Private declarations }
  public
    procedure UpdateCennikSheet;
    procedure AddNewBarCode(const BCodeStr, ItemStr: String);
    { Public declarations }
  end;

var
  SprFrm: TSprFrm;
  SortP, FindedRecord: Boolean;
  PrevHwnd: Hwnd;
  SprAtrFltrStr: String = '';

implementation

uses ShopMain, TovarEdit, MoveTovarShow, ChangeZakaz, TovarInfo,
  DualList, AtrChange, CheckLst, ObjChange, DelDoc;

{$R *.dfm}

procedure TSprFrm.WMChangeCBChain(var Msg: TWMChangeCBChain);
begin
  if PrevHWnd = Msg.Remove then PrevHWnd:= Msg.Next;
  if Msg.Remove <> Handle then SendMessage(PrevHWnd, WM_CHANGECBCHAIN, Msg.Remove, Msg.Next);
end;

procedure TSprFrm.WMDrawClipboard(var Msg: TWMDrawClipboard);
var P: PChar;
    H: THandle;
    Len: DWORD;
    i: Integer;
    S: String;
begin
  SendMessage(PrevHwnd, WM_DRAWCLIPBOARD, 0, 0);
  if Clipboard.HasFormat(CF_TEXT) then
  begin
{    H:= Clipboard.GetAsHandle(CF_TEXT);
    Len:= GlobalSize(H) + 1;
    P:= GlobalLock(H);}
    if SprFrm.Visible and SpeedButton3.Down then
    begin
{      GroupBox1.Tag:= 1;
      GroupBox1.Caption:= ' Поиск [' + PopupMenu2.Items[1].Caption + ']';
      if N4.Checked then GroupBox1.Caption:= GroupBox1.Caption + ' точно';
      GroupBox1.Caption:= GroupBox1.Caption + ' : ';}

      Application.BringToFront;
      FindEdit.SetFocus;
//      FindEdit.SetTextBuf(P);
      FindEdit.Text:= Clipboard.AsText;

{      S:= FindEdit.Text;
      FindEdit.Text:= '';
      for i:= 0 to Length(S) - 1 do
        if S[i] in [' ', 'Ё'..'z', 'ё'..'я'] then
          FindEdit.Text:= FindEdit.Text + P[i];
 }
      FindTBtn.Click;
    end;
    GlobalUnlock(H);
  end;
  Msg.Result:= 0;
end;

procedure TSprFrm.FormCreate(Sender: TObject);
var i,j,cst_price_kolvo: Integer;
    Field: TFloatField;
    IntField: TIntegerField;
begin
        PrevHwnd:= SetClipboardViewer(Handle);
        PageControl2.ActivePage:= TabSheet3;
        NewTovarAddBtn.Visible:= accessAllowed('SprTovar', User_ID);
        N10.Visible:= accessAllowed('NaklDelView', User_ID);
 //       EditTovarBtn.Visible:= NewTovarAddBtn.Visible;
        ZakazTovarBtn.Visible:= NewTovarAddBtn.Visible;
        TabSheet6.TabVisible:= NewTovarAddBtn.Visible;
        TabSheet2.TabVisible:= NewTovarAddBtn.Visible;
        BitBtn1.Visible:= NewTovarAddBtn.Visible;
        BitBtn6.Visible:= NewTovarAddBtn.Visible;
        BitBtn9.Visible:= ShopIni.ReadInteger('Main', 'Autocatalog', 0) > 0;
        SortP:= True;

        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select R.RDB$FIELD_NAME from RDB$FIELDS F, RDB$RELATION_FIELDS R'
            + ' where F.RDB$FIELD_NAME = R.RDB$FIELD_SOURCE and R.RDB$RELATION_NAME = ''CST_PRICES''');
          Open;
          cst_price_kolvo:= 0;
          if not VarIsNull(ShopMainForm.pFIBService['RDB$FIELD_NAME']) then
            begin
              while ShopMainForm.pFIBService.Locate('RDB$FIELD_NAME', 'CST_PRICE_' + (cst_price_kolvo + 1).ToString, [loCaseInsensitive ]) do Inc(cst_price_kolvo);
            end;
          Close;
        end;

        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select MARKET_CODE, SHORT_NAME from SPR_MARKET order by SHORT_NAME');
          Open;
        end;

        with SprTovar do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select cast(t.item as integer)as int_item, t.item, t.tovar_name, t.t_group, p.sale_price, '
            + 'p.vend_price, p.price_1, p.price_2, p.price_3, p.price_4, p.price_5, '
            + 'p.price_6, p.price_7, p.price_8, p.price_9, t.vendor_code, t.remark_1, '
            + 't.VEND_ITEM, t.kkm_sect, spr_group.group_name, spr_vendors.vendor_name, t.remark, '
            + 'spr_units.unit_name, spr_charge.extra_charge, t.artikul, t.producer, t.marked, tovar_add.sclad, tovar_add.mark_color, tovar_add.sale_mark_color,'
            + 'cast((((p.sale_price-p.vend_price)/p.vend_price)*100)as integer)charge, '
            + '(select sum(kolvo) from tovar_ost where item = t.item and market_code = (select obj_id from inf_current_obj))kolvo, '
            + 't.unit_kod UNIT_CODE');
{          SelectSQL.Add('select f.INT_ITEM, f.ITEM, f.TOVAR_NAME, f.T_GROUP, f.SALE_PRICE,'
            + ' f.VEND_PRICE, f.PRICE_1, f.PRICE_2, f.PRICE_3, f.PRICE_4, f.PRICE_5,'
            + ' f.PRICE_6, f.PRICE_7, f.PRICE_8, f.PRICE_9, f.VENDOR_CODE, f.REMARK_1,'
            + ' i.VEND_ITEM, f.KKM_SECT, f.GROUP_NAME, f.VENDOR_NAME, f.REMARK,'
            + ' f.UNIT_NAME, f.EXTRA_CHARGE, f.ARTIKUL, f.PRODUCER, f.CHARGE, f.KOLVO, f.UNIT_CODE'
            + ',(select sum(kolvo)from pos_rashod p1 right join hdr_rashod h1 on p1.kod = h1.kod where item = f.item and h1.doc_type = 12)RSRV');
//            + ',cast(0 as float) RSRV'); }

          i:= DBGrid1.Columns.Count - 1;
          while not ShopMainForm.pFIBService.Eof do
          begin
            if ShopMainForm.pFIBService['MARKET_CODE'] = CurrentMarketCode then
              DBGrid1.Columns[i].Title.Caption:= Trim(ShopMainForm.pFIBService['SHORT_NAME'])
            else
            begin
              SprTovar.SelectSQL[0]:= SprTovar.SelectSQL[0]
                    + ',(select sum(kolvo) from tovar_ost where item = t.item and market_code = '
                    + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']) + ')KOLVO'
                    + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']);

              Field:= TFloatField.Create(SprTovar);
              Field.FieldName:= 'KOLVO' + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']);
              Field.DataSet:= SprTovar;
              Field.DisplayFormat:= '### ##0.###';

              DBGrid1.Columns.Add;
              DBGrid1.Columns[DBGrid1.Columns.Count - 1].FieldName:= 'KOLVO'
                                + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']);
              with DBGrid1.Columns[DBGrid1.Columns.Count - 1].Title do
              begin
                Caption:= Trim(ShopMainForm.pFIBService['SHORT_NAME']);
                Alignment:= taCenter;
              end;
            end;
            ShopMainForm.pFIBService.Next;
          end;

          for i:= 1 to cst_price_kolvo do
          begin
              SprTovar.SelectSQL[0]:= SprTovar.SelectSQL[0]
                    + ',cp.CST_PRICE_' + i.ToString;
              Field:= TFloatField.Create(SprTovar);
              Field.FieldName:= 'CST_PRICE_' + i.ToString;
              Field.DataSet:= SprTovar;
              Field.DisplayFormat:= '### ### ##0.00';

              DBGrid1.Columns.Add;
              DBGrid1.Columns[DBGrid1.Columns.Count - 1].FieldName:= 'CST_PRICE_' + i.ToString;
              with DBGrid1.Columns[DBGrid1.Columns.Count - 1].Title do
              begin
                Caption:= 'Доп.Цена ' + i.ToString;
                Alignment:= taCenter;
              end;
            end;




          // Если пользователь КАССИР не показываем резервы
          if not accessAllowed('SprTovar', User_ID) then SprTovar.SelectSQL[0]:= SprTovar.SelectSQL[0]  + ', cast(0 as float) RSRV'
          else
            // Используем табличные значения резервов или обсчитываем
            if ShopIni.ReadBool('Main', 'TableRSRV', False) then
              SprTovar.SelectSQL[0]:= SprTovar.SelectSQL[0] + ', r.kolvo RSRV '
            else
              SprTovar.SelectSQL[0]:= SprTovar.SelectSQL[0]
                + ',(select sum(kolvo)from pos_rashod p1 right join hdr_rashod h1 on p1.kod = h1.kod where item = t.item and h1.doc_type = 12)RSRV';

          Field:= TFloatField.Create(SprTovar);
          Field.FieldName:= 'RSRV';
          Field.DataSet:= SprTovar;
          Field.DisplayFormat:= '####0.###';

          DBGrid1.Columns.Add;
          DBGrid1.Columns[DBGrid1.Columns.Count - 1].FieldName:= 'RSRV';
          with DBGrid1.Columns[DBGrid1.Columns.Count - 1].Title do
          begin
            Caption:= 'Резерв';
            Alignment:= taCenter;
          end;
{          IntField:= TIntegerField.Create(SprTovar);
          IntField.FieldName:= 'UNIT_CODE';
          IntField.DataSet:= SprTovar;
 }

          ShopMainForm.pFIBService.Close;
          SelectSQL.Add('FROM spr_tovar t '
            + 'LEFT JOIN prices p ON p.item = t.item and p.market_code = (select obj_id from inf_current_obj) '
            + 'LEFT JOIN spr_group ON spr_group.t_group = t.t_group '
            + 'LEFT JOIN spr_charge ON spr_charge.item = t.item '
            + 'LEFT JOIN spr_vendors ON spr_vendors.vendor_code = t.vendor_code '
            + 'LEFT JOIN spr_units ON t.unit_kod = spr_units.unit_kod '
            + 'LEFT JOIN tovar_add ON tovar_add.item = t.item '
            + 'LEFT JOIN tovar_rsrv r ON r.item = t.item ');

          if cst_price_kolvo > 0 then
            SprTovar.SelectSQL[SprTovar.SelectSQL.Count-1]:= SprTovar.SelectSQL[SprTovar.SelectSQL.Count-1] + 'LEFT JOIN cst_prices cp ON cp.item = t.item ';

{            + 'LEFT JOIN spr_vendor_item i ON i.item = t.item '
            + ' and i.vendor_code = (select KEY_VALUE from USER_SETINGS U'
            + ' where U.AUTOR_KOD = ' + IntToStr(User_ID) + ' and U.SECTION = ''SPR_TOVAR_GRID'''
            + ' and  U.KEY_NAME = ''VENDOR_CODE'')');
 }
{          SelectSQL.Add('from full_tovar f left join spr_vendor_item i on i.item = f.item'
            + ' and i.vendor_code = (select KEY_VALUE from USER_SETINGS U'
            + ' where U.AUTOR_KOD = ' + IntToStr(User_ID) + ' and U.SECTION = ''SPR_TOVAR_GRID'''
            + ' and  U.KEY_NAME = ''VENDOR_CODE'')');
 }
          if TmpFilterStr <> '' then
            SelectSQL.Add('where ' + TmpFilterStr)
          else
            SelectSQL.Add('');
          SelectSQL.Add('');
//          SelectSQL.Add('ORDER BY 1');

          RefreshSQL:= SelectSQL;
          RefreshSQL[RefreshSQL.Count - 2]:= 'where t.ITEM = :OLD_ITEM';

          ChangeTovarOrder(BaseReadInteger('SPR_TOVAR_GRID', 'ORDER', 2, User_ID));
          Locate('ITEM', BaseReadString('SPR_TOVAR_GRID', 'POSITION', '0', User_ID), []);
          PopupMenu2.Items[BaseReadInteger('SPR_TOVAR_GRID', 'FIND_INDX', 0, User_ID)].Click;
        end;
        SprTovarGroup.Open;


        for j:= 0 to SprTovar.Fields.Count - 1 do
        begin
          i:= GetDBGridFieldIndex(DBGrid1, SprTovar.Fields[j].FieldName);
          if i <> -1 then
          begin
            DBGrid1.Columns[i].Visible:= BaseReadBool('SPR_TOVAR_GRID', SprTovar.Fields[j].FieldName + '_V', True, User_ID);
            DBGrid1.Columns[i].Width:= BaseReadInteger('SPR_TOVAR_GRID', SprTovar.Fields[j].FieldName + '_W', DBGrid1.Columns[i].Width, User_ID);
            DBGrid1.Columns[i].Index:= BaseReadInteger('SPR_TOVAR_GRID', SprTovar.Fields[j].FieldName + '_I', DBGrid1.Columns[i].Index, User_ID);
          end;
        end;
 {
        for i:= 0 to DBGrid1.Columns.Count - 1 do
          begin
            DBGrid1.Columns[i].Visible:= BaseReadBool('SPR_TOVAR_GRID', DBGrid1.Columns[i].FieldName + '_V', True, User_ID);
            DBGrid1.Columns[i].Width:= BaseReadInteger('SPR_TOVAR_GRID', DBGrid1.Columns[i].FieldName + '_W', DBGrid1.Columns[i].Width, User_ID);
//            DBGrid1.Columns[i].Index:= BaseReadInteger('SPR_TOVAR_GRID', SprTable.Fields[j].FieldName + '_I', DBGrid1.Columns[i].Index, User_ID);
          end;
 }

        ComboBox2.Items.Clear;
        with SprAcountGroup do
        begin
          Open;
          while not Eof do
          begin
            ComboBox2.Items.Add(SprAcountGroup['ACOUNT_NAME']);
            Next;
          end;
          First;
        end;
        ComboBox2.ItemIndex:= 0;

        SpeedButton1.Down:= BaseReadBool('SPR_TOVAR_GRID', 'REMEMBER_CONDITION', False, User_ID);
        PageControl1.ActivePage:= TabSheet1;
        BarCode.Open;
end;

procedure TSprFrm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
{var i,j: Integer;
    curAtr: string;}
begin
        case Key of
          VK_ESCAPE : SprFrm.ModalResult:= idCancel;
          VK_INSERT: if(SprFrm.Tag = 1) and not VarIsNull(SprFrm.SprTovar['ITEM'])then SprFrm.ModalResult:= idOK;
          VK_F5 : if not VarIsNull(SprFrm.SprTovar['ITEM'])then SprFrm.MoveTovarBtn.Click;
          VK_F4 : if (ssShift in Shift) then BitBtn1Click(SprFrm);
          VK_F3 : if not VarIsNull(SprFrm.SprTovar['ITEM'])then // Атрибуты товара
            begin
              with ShopMainForm.pFIBService do
              begin
                AtrSelectStr:= '';
                SelectSQL.Clear;
                SelectSQL.Add('select ATR_ID from TOVAR_ATR');
                SelectSQL.Add('where ITEM = ''' + SprFrm.SprTovar['ITEM'] + '''');
                Open;
                while not Eof do
                begin
                  if AtrSelectStr <> '' then AtrSelectStr:= AtrSelectStr + ',';
                  AtrSelectStr:= AtrSelectStr + IntToStr(ShopMainForm.pFIBService['ATR_ID']);
                  Next;
                end;
                Close;
              end;
              Application.CreateForm(TAtrChangeFrm, AtrChangeFrm);
              if AtrChangeFrm.ShowModal = idOK then
              begin
                if AtrSelectStr <> '' then
                begin
                  ExecSQLStr('delete from TOVAR_ATR where ITEM = ''' + SprFrm.SprTovar['ITEM'] + ''' and not ATR_ID in (' + AtrSelectStr + ')');
                  ExecSQLStr('insert into TOVAR_ATR(ITEM, ATR_ID) select ''' + SprFrm.SprTovar['ITEM']
                    + ''', s.ATR_ID from spr_tovar_attr s where s.ATR_ID in (' + AtrSelectStr + ') '
                    + 'and not ATR_ID in (select ATR_ID from TOVAR_ATR where ITEM = ''' + SprFrm.SprTovar['ITEM']
                    + ''' and ATR_ID in (' + AtrSelectStr + '))');
                end
                else ExecSQLStr('delete from TOVAR_ATR where ITEM = ''' + SprFrm.SprTovar['ITEM'] + '''');
              end;
              AtrChangeFrm.Free;
            end;
        end;
end;

procedure TSprFrm.FindEditChange(Sender: TObject);
begin
        FindTBtn.Enabled:= FindEdit.Text <> '';
        FindedRecord:= False;
end;

procedure TSprFrm.FindEditKeyPress(Sender: TObject; var Key: Char);
begin
        if UpperCase(Copy(SprTovar.SelectSQL[SprTovar.SelectSQL.Count - 1],
             Pos('.', SprTovar.SelectSQL[SprTovar.SelectSQL.Count - 1]) + 1,
             Length(SprTovar.SelectSQL[SprTovar.SelectSQL.Count - 1])
             - Pos('.', SprTovar.SelectSQL[SprTovar.SelectSQL.Count - 1]))) = 'ITEM' then
          if not(Key in [#8, '0'..'9'])then Key:= #0;
        if Key = '''' then Key:= #0;
end;

procedure TSprFrm.FindEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        case Key of
         VK_RETURN: if ssShift in Shift then DBGrid1.SetFocus
                    else FindTBtn.Click;
         VK_UP: SprTovar.Prior;
         VK_DOWN: if ssShift in Shift then SpeedButton2.Click
                  else SprTovar.Next;
         VK_PRIOR: SprTovar.MoveBy(-20);
         VK_NEXT: SprTovar.MoveBy(20);
         VK_F1: N2Click(Sender);
         VK_F2: SpeedButton4.Click;
        end;
end;

procedure TSprFrm.FindTBtnClick(Sender: TObject);
var FindFields: String;
    LocateParam: set of TExtLocateOption;
begin
    if FindTBtn.Enabled then
    begin
         case GroupBox1.Tag of
          0: FindFields:= 'ITEM';
          1: FindFields:= 'ARTIKUL';
          2: FindFields:= 'TOVAR_NAME';
          3: FindFields:= 'REMARK';
          4: FindFields:= 'REMARK_1';
          5: FindFields:= 'PRODUCER';
          6: FindFields:= 'SALE_PRICE';
          7: FindFields:= 'VEND_PRICE';
          8: FindFields:= 'CHARGE';
          9: FindFields:= 'EXTRA_CHARGE';
         10: FindFields:= 'VENDOR_NAME';
         11: FindFields:= 'GROUP_NAME';
         12: FindFields:= 'VEND_ITEM';
         13: FindFields:= 'UNIT_NAME';
         14: FindFields:= 'KKM_SECT';
         15: FindFields:= 'KOLVO';
         16: FindFields:= 'SCLAD';
        end;
        if FindFields = 'ITEM' then
        begin
           with ShopMainForm.pFindTovarStoredProc do
           begin
             ParamByName('FIND_ITEM').AsString:= FindEdit.Text;
             ExecProc;
             if ParamByName('RESULT').AsInteger <> 0 then
               FindEdit.Text:= ParamByName('ITEM').AsString;
           end;
        end;
      if N4.Checked then LocateParam:= [eloCaseInsensitive, eloWildCards]
      else LocateParam:= [eloCaseInsensitive, eloPartialKey, eloWildCards];
      if FindedRecord then FindedRecord:= SprTovar.ExtLocateNext(FindFields, FindEdit.Text, LocateParam)
      else FindedRecord:= SprTovar.ExtLocate(FindFields, FindEdit.Text, LocateParam);
      if not FindedRecord then MessageDlg('Запись не найдена', mtInformation, [mbOK], 0);
      FindEdit.SelectAll;
    end;
end;

procedure TSprFrm.CodeFltrEditKeyPress(Sender: TObject; var Key: Char);
begin
          if not(Key in [#8, '0'..'9', '%', '_'])then Key:= #0;
end;

procedure TSprFrm.CodeForVendBtnClick(Sender: TObject);
begin
        CodeForVendBtn.Glyph:= nil;
        if CodeForVendBtn.Down then ShopMainForm.ImageList1.GetBitmap(48, CodeForVendBtn.Glyph)
        else ShopMainForm.ImageList1.GetBitmap(49, CodeForVendBtn.Glyph);
end;

procedure TSprFrm.CodeFltrEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then SelectNext(Sender as TWinControl, true, true);
end;

procedure TSprFrm.NewTovarAddBtnClick(Sender: TObject);
begin
      if EditTovarBtn.Visible then
      begin
        Application.CreateForm(TTovarEditFrm, TovarEditFrm);
        TovarEditFrm.Tag:= (Sender as TComponent).Tag;
        TovarEditFrm.VendorComboBox.Items:= SprShowVendor;
        TovarEditFrm.VendorComboBox.Items.AddStrings(SprHideVendor);
        TovarEditFrm.TGroupComboBox.Items:= SprShowGroup;
        TovarEditFrm.TGroupComboBox.Items.AddStrings(SprHideGroup);
        if TovarEditFrm.Tag = 1 then
        begin
          TovarEditFrm.Caption:= 'Новый товар';
          TovarEditFrm.VendorComboBox.ItemIndex:= 0;
          TovarEditFrm.TGroupComboBox.ItemIndex:= 0;
          TovarEditFrm.KKMComboBox.ItemIndex:= 0;
          TovarEditFrm.ComboBox1.ItemIndex:= 0;
          TovarEditFrm.Tag1Edit.Text:= '9';
          TovarEditFrm.Tag2Edit.Text:= '8';
          TovarEditFrm.Tag3Edit.Text:= '7';
          TovarEditFrm.Tag4Edit.Text:= '6';
          TovarEditFrm.Tag5Edit.Text:= '5';
          TovarEditFrm.Tag6Edit.Text:= '4';
          TovarEditFrm.Tag7Edit.Text:= '3';
          TovarEditFrm.Tag8Edit.Text:= '2';
          TovarEditFrm.Tag9Edit.Text:= '1';

          TovarEditFrm.CstPriceType1ComboBox.ItemIndex:= 0;
          TovarEditFrm.CstPriceType2ComboBox.ItemIndex:= 0;
          TovarEditFrm.CstPriceType3ComboBox.ItemIndex:= 0;
          TovarEditFrm.CstPrice1TagEdit.Text:= '30';
          TovarEditFrm.CstPrice2TagEdit.Text:= '50';
          TovarEditFrm.CstPrice3TagEdit.Text:= '';
          TovarEditFrm.ColorBox1.Color:= clNone;
        end
        else
        begin
          TovarEditFrm.Caption:= 'Редактирование';
          TovarEditFrm.VendorComboBox.ItemIndex:=
                FindString(SprTovar['VENDOR_NAME'], TovarEditFrm.VendorComboBox.Items);
          TovarEditFrm.ItemEdit.Enabled:= False;
          TovarEditFrm. SpeedButton2.Visible:= False;
          TovarEditFrm.TGroupComboBox.ItemIndex:=
                FindString(SprTovar['GROUP_NAME'], TovarEditFrm.TGroupComboBox.Items);
          TovarEditFrm.ItemEdit.Text:= SprTovar['ITEM'];
          TovarEditFrm.TovarNameEdit.Text:= SprTovar['TOVAR_NAME'];
          if not VarIsNull(SprTovar['ARTIKUL'])then
            TovarEditFrm.ArtikulEdit.Text:= SprTovar['ARTIKUL']
          else TovarEditFrm.ArtikulEdit.Text:= '';
          if not VarIsNull(SprTovar['PRODUCER'])then
            TovarEditFrm.ProducerEdit.Text:= SprTovar['PRODUCER']
          else TovarEditFrm.ProducerEdit.Text:= '';
          if not VarIsNull(SprTovar['SALE_PRICE'])then
            TovarEditFrm.PriceEdit.Text:= FloatToStrF(SprTovar['SALE_PRICE'], ffFixed, 14, 2);
          if not VarIsNull(SprTovar['VEND_PRICE'])then
            TovarEditFrm.VendorPriceEdit.Text:= FloatToStrF(SprTovar['VEND_PRICE'], ffFixed, 14, 2);
          TovarEditFrm.KKMComboBox.ItemIndex:= SprTovar['KKM_SECT'];
          TovarEditFrm.RemarkEdit.Text:= SprTovar['REMARK'];
          if not VarIsNull(SprTovar['EXTRA_CHARGE'])then
            TovarEditFrm.ExtraChargeEdit.Text:= IntToStr(SprTovar['EXTRA_CHARGE'])
          else TovarEditFrm.ExtraChargeEdit.Text:= '';
          TovarEditFrm.UnitsComboBox.ItemIndex:= FindString(SprTovar['UNIT_NAME'], TovarEditFrm.UnitsComboBox.Items);
          if (not VarIsNull(SprTovar['MARKED']))and(SprTovar['MARKED'] = 1)  then
              TovarEditFrm.TovarMarkedCheckBox.Checked:= True
            else TovarEditFrm.TovarMarkedCheckBox.Checked:= False;
          if not VarIsNull(SprTovar['REMARK_1'])then
           TovarEditFrm.Rem2Edit.Text:= SprTovar['REMARK_1']
          else TovarEditFrm.Rem2Edit.Text:= '';

          if not VarIsNull(SprTovar['VEND_ITEM'])then
           TovarEditFrm.VendCodeEdit.Text:= SprTovar['VEND_ITEM']
          else TovarEditFrm.VendCodeEdit.Text:= '';

          with ShopMainForm.pFIBService do
          begin
            SelectSQL.Clear;
            SelectSQL.Add('select mark_color, sale_mark_color from tovar_add');
            SelectSQL.Add('where ITEM = ''' + SprTovar['ITEM'] + '''');
            Open;
            if not VarIsNull(ShopMainForm.pFIBService['MARK_COLOR'])then
            begin
              TovarEditFrm.ColorBox1.Selected:= ShopMainForm.pFIBService['MARK_COLOR'];
              TovarEditFrm.UseColorMarkCheckBox.Checked:= True;
            end
            else
            begin
              TovarEditFrm.ColorBox1.Selected:= clBlack;
              TovarEditFrm.UseColorMarkCheckBox.Checked:= False;
            end;
            if not VarIsNull(ShopMainForm.pFIBService['SALE_MARK_COLOR'])then
            begin
              TovarEditFrm.ColorBox2.Selected:= ShopMainForm.pFIBService['SALE_MARK_COLOR'];
              TovarEditFrm.SaleUseColorMarkCheckBox.Checked:= True;
            end
            else
            begin
              TovarEditFrm.ColorBox2.Selected:= clBlack;
              TovarEditFrm.SaleUseColorMarkCheckBox.Checked:= False;
            end;
            Close;
          end;


          with ShopMainForm.pFIBService do
          begin
            SelectSQL.Clear;
            SelectSQL.Add('select * from prices');
            SelectSQL.Add('where ITEM = ''' + SprTovar['ITEM'] + '''');
            SelectSQL.Add('and MARKET_CODE = (select obj_id from inf_current_obj)');
            Open;
            if not VarIsNull(ShopMainForm.pFIBService['ITEM'])then
            begin
              if not VarIsNull(ShopMainForm.pFIBService['PRICE_1_TAG'])then
                TovarEditFrm.Tag1Edit.Text:= IntToStr(ShopMainForm.pFIBService['PRICE_1_TAG']);
              if not VarIsNull(ShopMainForm.pFIBService['PRICE_2_TAG'])then
                TovarEditFrm.Tag2Edit.Text:= IntToStr(ShopMainForm.pFIBService['PRICE_2_TAG']);
              if not VarIsNull(ShopMainForm.pFIBService['PRICE_3_TAG'])then
                TovarEditFrm.Tag3Edit.Text:= IntToStr(ShopMainForm.pFIBService['PRICE_3_TAG']);
              if not VarIsNull(ShopMainForm.pFIBService['PRICE_4_TAG'])then
                TovarEditFrm.Tag4Edit.Text:= IntToStr(ShopMainForm.pFIBService['PRICE_4_TAG']);
              if not VarIsNull(ShopMainForm.pFIBService['PRICE_5_TAG'])then
                TovarEditFrm.Tag5Edit.Text:= IntToStr(ShopMainForm.pFIBService['PRICE_5_TAG']);
              if not VarIsNull(ShopMainForm.pFIBService['PRICE_6_TAG'])then
                TovarEditFrm.Tag6Edit.Text:= IntToStr(ShopMainForm.pFIBService['PRICE_6_TAG']);
              if not VarIsNull(ShopMainForm.pFIBService['PRICE_7_TAG'])then
                TovarEditFrm.Tag7Edit.Text:= IntToStr(ShopMainForm.pFIBService['PRICE_7_TAG']);
              if not VarIsNull(ShopMainForm.pFIBService['PRICE_8_TAG'])then
                TovarEditFrm.Tag8Edit.Text:= IntToStr(ShopMainForm.pFIBService['PRICE_8_TAG']);
              if not VarIsNull(ShopMainForm.pFIBService['PRICE_9_TAG'])then
                TovarEditFrm.Tag9Edit.Text:= IntToStr(ShopMainForm.pFIBService['PRICE_9_TAG']);
            end;

            if not VarIsNull(ShopMainForm.pFIBService['PRICE_TYPE']) then
            begin
              case ShopMainForm.pFIBService.FieldByName('PRICE_TYPE').AsString[1] of
                '#': TovarEditFrm.ComboBox1.ItemIndex:= 0;
                '%': TovarEditFrm.ComboBox1.ItemIndex:= 1;
                '$': TovarEditFrm.ComboBox1.ItemIndex:= 3;
              else TovarEditFrm.ComboBox1.ItemIndex:= 2;
              end;
            end;
            Close;
          end;
          if not VarIsNull(SprTovar['PRICE_1'])then
            TovarEditFrm.Price1Edit.Text:= FloatToStrF(SprTovar['PRICE_1'], ffFixed, 14, 2);
          if not VarIsNull(SprTovar['PRICE_2'])then
            TovarEditFrm.Price2Edit.Text:= FloatToStrF(SprTovar['PRICE_2'], ffFixed, 14, 2);
          if not VarIsNull(SprTovar['PRICE_3'])then
            TovarEditFrm.Price3Edit.Text:= FloatToStrF(SprTovar['PRICE_3'], ffFixed, 14, 2);
          if not VarIsNull(SprTovar['PRICE_4'])then
            TovarEditFrm.Price4Edit.Text:= FloatToStrF(SprTovar['PRICE_4'], ffFixed, 14, 2);
          if not VarIsNull(SprTovar['PRICE_5'])then
            TovarEditFrm.Price5Edit.Text:= FloatToStrF(SprTovar['PRICE_5'], ffFixed, 14, 2);
          if not VarIsNull(SprTovar['PRICE_6'])then
            TovarEditFrm.Price6Edit.Text:= FloatToStrF(SprTovar['PRICE_6'], ffFixed, 14, 2);
          if not VarIsNull(SprTovar['PRICE_7'])then
            TovarEditFrm.Price7Edit.Text:= FloatToStrF(SprTovar['PRICE_7'], ffFixed, 14, 2);
          if not VarIsNull(SprTovar['PRICE_8'])then
            TovarEditFrm.Price8Edit.Text:= FloatToStrF(SprTovar['PRICE_8'], ffFixed, 14, 2);
          if not VarIsNull(SprTovar['PRICE_9'])then
            TovarEditFrm.Price9Edit.Text:= FloatToStrF(SprTovar['PRICE_9'], ffFixed, 14, 2);



          with ShopMainForm.pFIBService do
          begin
            SelectSQL.Clear;
            SelectSQL.Add('select * from cst_prices');
            SelectSQL.Add('where ITEM = ''' + SprTovar['ITEM'] + '''');
            Open;
            if not VarIsNull(ShopMainForm.pFIBService['ITEM'])then
            begin

              if ShopMainForm.pFIBService.FieldByName('CST_PRICE_1_TYPE').AsString > '' then
              begin
                case ShopMainForm.pFIBService.FieldByName('CST_PRICE_1_TYPE').AsString[1] of
                  '%': TovarEditFrm.CstPriceType1ComboBox.ItemIndex:= 0;
                  '$': TovarEditFrm.CstPriceType1ComboBox.ItemIndex:= 1;
                end;
              end
              else
                TovarEditFrm.CstPriceType1ComboBox.ItemIndex:= 0;

              if StrToInt('0'+ShopMainForm.pFIBService.FieldByName('CST_PRICE_1_TAG').AsString) > 0 then
                TovarEditFrm.CstPrice1TagEdit.Text:= IntToStr(ShopMainForm.pFIBService['CST_PRICE_1_TAG'])
              else
                TovarEditFrm.CstPrice1TagEdit.Text:= '30';


              if ShopMainForm.pFIBService.FieldByName('CST_PRICE_2_TYPE').AsString > '' then
              begin
                case ShopMainForm.pFIBService.FieldByName('CST_PRICE_2_TYPE').AsString[1] of
                  '%': TovarEditFrm.CstPriceType2ComboBox.ItemIndex:= 0;
                  '$': TovarEditFrm.CstPriceType2ComboBox.ItemIndex:= 1;
                end;
              end
              else
                TovarEditFrm.CstPriceType2ComboBox.ItemIndex:= 0;

              if StrToInt('0'+ShopMainForm.pFIBService.FieldByName('CST_PRICE_2_TAG').AsString) > 0 then
                TovarEditFrm.CstPrice2TagEdit.Text:= IntToStr(ShopMainForm.pFIBService['CST_PRICE_2_TAG'])
              else
                TovarEditFrm.CstPrice2TagEdit.Text:= '50';


              if ShopMainForm.pFIBService.FieldByName('CST_PRICE_3_TYPE').AsString > '' then
              begin
                case ShopMainForm.pFIBService.FieldByName('CST_PRICE_3_TYPE').AsString[1] of
                  '%': TovarEditFrm.CstPriceType3ComboBox.ItemIndex:= 0;
                  '$': TovarEditFrm.CstPriceType3ComboBox.ItemIndex:= 1;
                end;
              end
              else
                TovarEditFrm.CstPriceType3ComboBox.ItemIndex:= 0;

              if StrToInt('0'+ShopMainForm.pFIBService.FieldByName('CST_PRICE_3_TAG').AsString) > 0 then
                TovarEditFrm.CstPrice3TagEdit.Text:= IntToStr(ShopMainForm.pFIBService['CST_PRICE_3_TAG'])
              else
                TovarEditFrm.CstPrice3TagEdit.Text:= '';


            end
            else
            begin
              TovarEditFrm.CstPriceType1ComboBox.ItemIndex:= 0;
              TovarEditFrm.CstPrice1TagEdit.Text:= '30';
              TovarEditFrm.CstPriceType2ComboBox.ItemIndex:= 0;
              TovarEditFrm.CstPrice2TagEdit.Text:= '50';
              TovarEditFrm.CstPriceType3ComboBox.ItemIndex:= 0;
              TovarEditFrm.CstPrice3TagEdit.Text:= '';
            end;
            Close;
          end;

          if not VarIsNull(SprTovar['CST_PRICE_1'])then
            TovarEditFrm.CstPrice1Edit.Text:= FloatToStrF(SprTovar['CST_PRICE_1'], ffFixed, 14, 2);
          if not VarIsNull(SprTovar['CST_PRICE_2'])then
            TovarEditFrm.CstPrice2Edit.Text:= FloatToStrF(SprTovar['CST_PRICE_2'], ffFixed, 14, 2);
          if not VarIsNull(SprTovar['CST_PRICE_3'])then
            TovarEditFrm.CstPrice3Edit.Text:= FloatToStrF(SprTovar['CST_PRICE_3'], ffFixed, 14, 2);


        end;
        if (not accessAllowed('SprTovar', User_ID)) then
          with TovarEditFrm.BitBtn2 do
          begin
            TovarEditFrm.BitBtn1.Visible:= False;
            Caption:= 'Закрыть';
            Left:= 153;
            Width:= 156;
          end;
        TovarEditFrm.ShowModal;
        TovarEditFrm.Free;
      end;
end;

procedure TSprFrm.DBGrid1DblClick(Sender: TObject);
begin
        EditTovarBtn.Click;
end;

procedure TSprFrm.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if(gdSelected in State)then
    begin
        TDBGrid(Sender).Canvas.Brush.Color:= clHighLight;
        TDBGrid(Sender).Canvas.Font.Color:= clHighLightText;
        if Column.FieldName = 'MARK_COLOR' then
        begin
          if not VarIsNull(TDBGrid(Sender).DataSource.DataSet['MARK_COLOR'])then
            TDBGrid(Sender).Canvas.Brush.Color:= TDBGrid(Sender).DataSource.DataSet['MARK_COLOR'];

          TDBGrid(Sender).Canvas.Font.Color:= TDBGrid(Sender).Canvas.Brush.Color;
        end;
        if Column.FieldName = 'SALE_MARK_COLOR' then
        begin
          if not VarIsNull(TDBGrid(Sender).DataSource.DataSet['SALE_MARK_COLOR'])then
            TDBGrid(Sender).Canvas.Brush.Color:= TDBGrid(Sender).DataSource.DataSet['SALE_MARK_COLOR'];

          TDBGrid(Sender).Canvas.Font.Color:= TDBGrid(Sender).Canvas.Brush.Color;
        end;
    end
    else
    begin
        if Column.FieldName = 'MARK_COLOR' then
          if not VarIsNull(TDBGrid(Sender).DataSource.DataSet['MARK_COLOR'])then
          begin
            TDBGrid(Sender).Canvas.Brush.Color:= TDBGrid(Sender).DataSource.DataSet['MARK_COLOR'];
            TDBGrid(Sender).Canvas.Font.Color := TDBGrid(Sender).DataSource.DataSet['MARK_COLOR'];
          end
          else
          begin
            TDBGrid(Sender).Canvas.Brush.Color:= clWindow;
            TDBGrid(Sender).Canvas.Font.Color := clWindowText;
          end;

        if Column.FieldName = 'SALE_MARK_COLOR' then
          if not VarIsNull(TDBGrid(Sender).DataSource.DataSet['SALE_MARK_COLOR'])then
          begin
            TDBGrid(Sender).Canvas.Brush.Color:= TDBGrid(Sender).DataSource.DataSet['SALE_MARK_COLOR'];
            TDBGrid(Sender).Canvas.Font.Color := TDBGrid(Sender).DataSource.DataSet['SALE_MARK_COLOR'];
          end
          else
          begin
            TDBGrid(Sender).Canvas.Brush.Color:= clWindow;
            TDBGrid(Sender).Canvas.Font.Color := clWindowText;
          end;
    end;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TSprFrm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        case Key of
         VK_RETURN: if ssShift in Shift then FindEdit.SetFocus
                    else EditTovarBtn.Click;
        end;
end;

procedure TSprFrm.LMDButton1Click(Sender: TObject);
begin
        PageControl2.Visible:= not PageControl2.Visible;
        LMDButton1.Glyph:= nil;
        if PageControl2.Visible then ShopMainForm.ImageList1.GetBitmap(17, LMDButton1.Glyph)
        else ShopMainForm.ImageList1.GetBitmap(18, LMDButton1.Glyph);
end;

procedure TSprFrm.DBGrid1TitleClick(Column: TColumn);
begin
    ChangeTovarOrder(SprTovar.FieldByName(Column.Field.FieldName).Index);
end;

procedure TSprFrm.ChangeTovarOrder(FieldNo: Integer);
var i: Integer;
begin
    if FieldNo = 0 then FieldNo:= 1;
    with SprTovar do
    begin
      Active:= True;
      if SprTovar.Tag = FieldNo then SortP:= not SortP
      else SortP:= True;
      SprTovar.Tag:= FieldNo;
      if FieldNo = 1 then SprTovar.DoSortEx([0], [SortP])
      else SprTovar.DoSortEx([FieldNo], [SortP]);
      for i:= 0 to DBGrid1.Columns.Count - 1 do
        if DBGrid1.Columns[i].FieldName = SprTovar.Fields[FieldNo].FieldName then
        begin
          DBGrid1.Columns[i].Title.Font.Color:= clRed;
          DBGrid1.Columns[i].Title.Font.Style:= [fsBold];
        end
        else
        begin
          DBGrid1.Columns[i].Title.Font.Color:= clWindowText;
          DBGrid1.Columns[i].Title.Font.Style:= [];
        end;
      end;
end;

procedure TSprFrm.ClrMarkCurTovarBitBtnClick(Sender: TObject);
begin
  ExecSQLStr('update TOVAR_ADD set MARK_COLOR = null where ITEM =''' + SprTovar['ITEM'] + '''');
  SprFrm.SprTovar.Refresh;
end;

procedure TSprFrm.INNEditKeyPress(Sender: TObject; var Key: Char);
begin
        if not(Key in [#8,'0'..'9'])then Key:= #0;
end;

procedure TSprFrm.GrNameEditChange(Sender: TObject);
begin
        AddGrBtn.Enabled:= GrNameEdit.Text <> '';
        EditGrBtn.Enabled:= GrNameEdit.Text <> '';
end;

procedure TSprFrm.AddGrBtnClick(Sender: TObject);
var Next_ID: Integer;
begin
      if(not SprTovarGroup.Locate('GROUP_NAME', GrNameEdit.Text, []))
       or((Sender as TComponent).Tag = 2)then
        begin
          case (Sender as TComponent).Tag of
          1: with pFIBDataSet1 do
             begin
               SelectSQL.Clear;
               SelectSQL.Add('SELECT MAX(T_GROUP)MAXGROUP FROM SPR_GROUP');
               Open;
               if VarIsNull(pFIBDataSet1['MAXGROUP'])then Next_ID:= 0
               else Next_ID:= pFIBDataSet1['MAXGROUP'];
               Inc(Next_ID);
               Close;
               ShopMainForm.pFIBDatabase1.Execute('INSERT INTO SPR_GROUP(T_GROUP, GROUP_NAME, KOD_ACOUNT)'
                 + ' VALUES(' + IntToStr(Next_ID) + ', ''' + GrNameEdit.Text
                     + ''', ' + IntToStr(FindAcountCode(ComboBox2.Text)) + ')');
             end;
          2: ShopMainForm.pFIBDatabase1.Execute('UPDATE SPR_GROUP SET GROUP_NAME = '''
               + GrNameEdit.Text + ''','
               + ' KOD_ACOUNT = ' + IntToStr(FindAcountCode(ComboBox2.Text))
               + ' WHERE T_GROUP = ' + IntToStr(SprTovarGroup['T_GROUP']));
          end;
          DataSetReOpen(SprTovarGroup);
          GrNameEdit.Text:= '';
        end
        else
        begin
          MessageDlg('Данное название уже существует', mtWarning, [mbOK], 0);
          GrNameEdit.SetFocus;
          GrNameEdit.SelectAll;
        end;
end;

procedure TSprFrm.TGroupGridDblClick(Sender: TObject);
begin
        GrNameEdit.Text:= TrimRight(SprTovarGroup['GROUP_NAME']);
        ComboBox2.ItemIndex:= FindString(SprTovarGroup['ACOUNT_NAME'], ComboBox2.Items);
        GrNameEdit.SetFocus;
end;

procedure TSprFrm.UpdateCennikSheet;
begin

end;

procedure TSprFrm.AddNewBarCode(const BCodeStr, ItemStr: String);
begin  // Добавление нового штрих-кода
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_BARCODES where BARCODE = ''' + BCodeStr + '''');
          Open;
          if not VarIsNull(ShopMainForm.pFIBService['ITEM'])then
          begin
            if MessageDlg('Данный штрих-код зарегистрирован на товар с PLU кодом '
               + ShopMainForm.pFIBService['ITEM']
               + #13#10'                перегистрировать его на новый PLU код ?',
               mtWarning, [mbYes,mbNo], 0) = idYes then
            begin
              Close;
              ShopMainForm.pFIBDatabase1.Execute('update SPR_BARCODES set ITEM = ''' + ItemStr + ''''
                + ' where BARCODE = ''' + BCodeStr + '''');
              ShopMainForm.pFIBTransaction1.CommitRetaining;
            end;
          end
          else
          begin
            ShopMainForm.pFIBDatabase1.Execute('insert into SPR_BARCODES(ITEM, BARCODE)'
              + ' values(''' + ItemStr + ''', ''' + BCodeStr + ''')');
            ShopMainForm.pFIBTransaction1.CommitRetaining;
          end;
          Close;
        end;
end;

procedure TSprFrm.BarCodeEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if(Key = VK_RETURN)and(not VarIsNull(SprTovar['ITEM']))then AddBarCodeButton.Click;
end;

procedure TSprFrm.BarCodeEditChange(Sender: TObject);
begin
        AddBarCodeButton.Enabled:= BarCodeEdit.Text <> '';
end;

procedure TSprFrm.BarCodeAfterOpen(DataSet: TDataSet);
begin
        DelBarCodeButton.Enabled:= not VarIsNull(BarCode['ITEM']);
end;

procedure TSprFrm.AddBarCodeButtonClick(Sender: TObject);
begin
        AddNewBarCode(BarCodeEdit.Text, SprTovar['ITEM']);
        BarCodeEdit.Text:= '';
        DataSetReOpen(BarCode);
end;

procedure TSprFrm.DelBarCodeButtonClick(Sender: TObject);
begin
      if MessageDlg('Удалить штрих-код ' + BarCode['BARCODE'],
        mtConfirmation, [mbYes,mbNo], 0) = idYes then
        begin
          ShopMainForm.pFIBDatabase1.Execute('delete from SPR_BARCODES where BARCODE = ''' + BarCode['BARCODE'] + '''');
          DataSetReOpen(BarCode);
        end;
end;

procedure TSprFrm.N10Click(Sender: TObject);
begin
  Application.CreateForm(TDelDocFrm, DelDocFrm);
  DelDocFrm.ShowModal;
  DelDocFrm.Free;
end;

procedure TSprFrm.N1Click(Sender: TObject);
begin
      if not VarIsNull(SprTovar['ITEM'])then
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_OFTENUSE');
          SelectSQL.Add('where ITEM = ''' + SprTovar['ITEM'] + '''');
          Open;
          if VarIsNull(ShopMainForm.pFIBService['ITEM'])then
            ShopMainForm.pFIBDatabase1.Execute('insert into SPR_OFTENUSE(ITEM)'
              + ' values(''' + SprTovar['ITEM'] + ''')')
          else MessageDlg('Данный товар уже был добавлен в часто используемые',
                            mtWarning, [mbOK], 0);
          Close;
        end
      else MessageDlg('Добавление не возможно, т.к. товар не выбран', mtWarning, [mbOK], 0);
end;

procedure TSprFrm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
    if not VarIsNull(SprTovar['ITEM'])then
      StatusBar1.Panels[0].Text:= SprTovar['ITEM']
    else StatusBar1.Panels[0].Text:= '';
    if not VarIsNull(SprTovar['ARTIKUL'])then
      StatusBar1.Panels[1].Text:= SprTovar['ARTIKUL']
    else StatusBar1.Panels[1].Text:= '';
    if not VarIsNull(SprTovar['TOVAR_NAME'])then
      StatusBar1.Panels[2].Text:= SprTovar['TOVAR_NAME']
    else StatusBar1.Panels[2].Text:= '';
    if not VarIsNull(SprTovar['REMARK'])then
      StatusBar1.Panels[3].Text:= SprTovar['REMARK']
    else StatusBar1.Panels[3].Text:= '';
    if not VarIsNull(SprTovar['ITEM'])then DBGrid1.PopupMenu:= PopupMenu1
    else DBGrid1.PopupMenu:= nil;
    BitBtn2.Enabled:= not VarIsNull(SprTovar['ITEM']);
    BitBtn6.Enabled:= not VarIsNull(SprTovar['ITEM']);
    MoveTovarBtn.Enabled:= not VarIsNull(SprTovar['ITEM']);
    ZakazTovarBtn.Enabled:= not VarIsNull(SprTovar['ITEM']);
    BitBtn9.Enabled:= not VarIsNull(SprTovar['ARTIKUL']) and (SprTovar['ARTIKUL'] > '');

    MarkCurTovarBitBtn.Enabled:= not VarIsNull(SprTovar['ITEM']);
    MarkAllTovarBitBtn.Enabled:= not VarIsNull(SprTovar['ITEM']);
    ClrMarkCurTovarBitBtn.Enabled:= not VarIsNull(SprTovar['ITEM']);
    ClrMarkAllTovarBitBtn.Enabled:= not VarIsNull(SprTovar['ITEM']);
end;

procedure TSprFrm.FormDestroy(Sender: TObject);
var i: Integer;
begin
    ChangeClipboardChain(Handle, PrevHwnd);

    for i:= 0 to DBGrid1.Columns.Count - 1 do
    begin
      BaseWriteBool('SPR_TOVAR_GRID', DBGrid1.Columns[i].FieldName + '_V', DBGrid1.Columns[i].Visible, User_ID);
      BaseWriteInteger('SPR_TOVAR_GRID', DBGrid1.Columns[i].FieldName + '_W', DBGrid1.Columns[i].Width, User_ID);
      BaseWriteInteger('SPR_TOVAR_GRID', DBGrid1.Columns[i].FieldName + '_I', DBGrid1.Columns[i].Index, User_ID);
    end;
    if not VarIsNull(SprTovar['ITEM'])then
      BaseWriteString('SPR_TOVAR_GRID', 'POSITION', SprTovar['ITEM'], User_ID);
    BaseWriteBool('SPR_TOVAR_GRID', 'REMEMBER_CONDITION', SpeedButton1.Down, User_ID);
    BaseWriteInteger('SPR_TOVAR_GRID', 'FIND_INDX', GroupBox1.Tag, User_ID);
    BaseWriteInteger('SPR_TOVAR_GRID', 'ORDER', SprTovar.Tag, User_ID);

//    AtrChangeFrm.Free;
end;

procedure TSprFrm.BitBtn1Click(Sender: TObject);
var i,j: Integer;
begin
    Application.CreateForm(TDualListDlg, DualListDlg);
    DualListDlg.Caption:= 'Выбор колонок для просмотра';
    for i:= 0 to DBGrid1.Columns.Count - 1 do
      if DBGrid1.Columns[i].Visible then
        DualListDlg.DstList.Items.Add(DBGrid1.Columns[i].Title.Caption)
      else DualListDlg.SrcList.Items.Add(DBGrid1.Columns[i].Title.Caption);
    if DualListDlg.ShowModal = mrOK then
      if DualListDlg.DstList.Items.Count > 0 then
      begin
        j:= 0;
        for i:= 0 to DBGrid1.Columns.Count - 1 do
        begin
          DBGrid1.Columns[i].Visible:=
           FindString(DBGrid1.Columns[i].Title.Caption, DualListDlg.DstList.Items) > -1;
          if DBGrid1.Columns[i].Visible then j:= j + DBGrid1.Columns[i].Width;
        end;
//        if j > 732 then ShopMainForm.frPrintGrid1.Orientation:= poLandscape
//        else ShopMainForm.frPrintGrid1.Orientation:= poPortrait;

      end
      else MessageDlg('Колонки не выбраны', mtWarning, [mbOK], 0);
    DualListDlg.Free;
end;

procedure TSprFrm.BitBtn2Click(Sender: TObject);
begin
      PopupMenu3.Popup(SprFrm.Left + BitBtn2.Left + 10,
          SprFrm.Top + BitBtn2.Top + BitBtn2.Height + 20);
end;

procedure TSprFrm.frPrintGrid1PrintColumn(ColumnNo: Integer;
  var Width: Integer);
var i,j: Integer;
begin
     j:= 0;
     for i:= 0 to DBGrid1.Columns.Count - 1 do
     begin
       if DBGrid1.Columns[i].Visible then Inc(j);
       if j = ColumnNo then
       begin
         Width:= DBGrid1.Columns[i].Width;
         Exit;
       end;
     end;

end;

procedure TSprFrm.MarkAllTovarBitBtnClick(Sender: TObject);
var CurItem: String;
begin
  if not VarIsNull(SprTovar['ITEM']) then
  begin
    CurItem:= SprTovar['ITEM'];
    SprTovar.DisableControls;
    SprTovar.First;
    while not SprTovar.Eof do
    begin
      if (Sender as TComponent).Tag = 1 then
        ExecSQLStr('update or insert into TOVAR_ADD(ITEM, MARK_COLOR)'
          + 'values(''' + SprTovar['ITEM'] + ''', ' + IntToStr(ColorBox1.Selected)
          + ')matching(ITEM)')
      else
        ExecSQLStr('update TOVAR_ADD set MARK_COLOR = null where ITEM =''' + SprTovar['ITEM'] + '''');
      SprFrm.SprTovar.Refresh;
      SprTovar.Next;
    end;
    SprTovar.Locate('ITEM', CurItem, []);
    SprTovar.EnableControls;
  end;
end;

procedure TSprFrm.MarkCurTovarBitBtnClick(Sender: TObject);
begin
  ExecSQLStr('update or insert into TOVAR_ADD(ITEM, MARK_COLOR)'
    + 'values(''' + SprTovar['ITEM'] + ''', ' + IntToStr(ColorBox1.Selected)
    + ')matching(ITEM)');
  SprFrm.SprTovar.Refresh;
end;

procedure TSprFrm.MoveTovarBtnClick(Sender: TObject);
begin
      PopupMenu4.Popup(SprFrm.Left + MoveTovarBtn.Left + 10,
          SprFrm.Top + MoveTovarBtn.Top + MoveTovarBtn.Height + 20);
end;

procedure TSprFrm.CodeFltrEditChange(Sender: TObject);
begin
      if (Sender as TLabeledEdit).Text = '' then
        (Sender as TLabeledEdit).Color:= clWindow
      else (Sender as TLabeledEdit).Color:= clYellow;
end;

procedure TSprFrm.VendorFltrComboBoxChange(Sender: TObject);
begin
      if (Sender as TComboBox).ItemIndex = 0 then
        (Sender as TComboBox).Color:= clWindow
      else (Sender as TComboBox).Color:= clYellow;
end;

procedure TSprFrm.DBGrid2DblClick(Sender: TObject);
begin
        Edit1.Text:= TrimRight(SprAcountGroup['ACOUNT_NAME']);
        ComboBox1.ItemIndex:= SprAcountGroup['ACOUNT_TYPE'];
        Edit1.SetFocus;
end;

procedure TSprFrm.Edit1Change(Sender: TObject);
begin
        BitBtn3.Enabled:= Edit1.Text <> '';
        BitBtn4.Enabled:= Edit1.Text <> '';
end;

procedure TSprFrm.BitBtn3Click(Sender: TObject);
var Next_ID: Integer;
begin
      if(not SprAcountGroup.Locate('ACOUNT_NAME', Edit1.Text, []))
       or((Sender as TComponent).Tag = 2)then
        begin
          case (Sender as TComponent).Tag of
          1: with pFIBDataSet1 do
             begin
               SelectSQL.Clear;
               SelectSQL.Add('SELECT MAX(KOD_ACOUNT)MAXGROUP FROM SPR_ACOUNT');
               Open;
               if VarIsNull(pFIBDataSet1['MAXGROUP'])then Next_ID:= 1
               else Next_ID:= pFIBDataSet1['MAXGROUP'] + 1;
               Close;
               ShopMainForm.pFIBDatabase1.Execute('INSERT INTO SPR_ACOUNT(KOD_ACOUNT, ACOUNT_NAME, ACOUNT_TYPE)'
                 + ' VALUES(' + IntToStr(Next_ID) + ', ''' + Edit1.Text + ''', ' + IntToStr(ComboBox1.ItemIndex) + ')');
             end;
          2: ShopMainForm.pFIBDatabase1.Execute('UPDATE SPR_ACOUNT SET ACOUNT_NAME = ''' + Edit1.Text + ''','
               + ' ACOUNT_TYPE = ' + IntToStr(ComboBox1.ItemIndex)
               + ' WHERE KOD_ACOUNT = ' + IntToStr(SprAcountGroup['KOD_ACOUNT']));
          end;
          DataSetReOpen(SprAcountGroup);
          Edit1.Text:= '';
          ComboBox2.Items.Clear;
          with SprAcountGroup do
          begin
            Open;
            while not Eof do
            begin
              ComboBox2.Items.Add(SprAcountGroup['ACOUNT_NAME']);
              Next;
            end;
            First;
          end;
          ComboBox2.ItemIndex:= 0;
        end
        else
        begin
          MessageDlg('Данное название уже существует', mtWarning, [mbOK], 0);
          Edit1.SetFocus;
          Edit1.SelectAll;
        end;
end;

procedure TSprFrm.SprTovarAfterOpen(DataSet: TDataSet);
begin
        TabSheet1.Caption:= 'Товары (просмотр '
            + IntToStr(SprTovar.RecordCountFromSrv) + ' наименований)';
end;

procedure TSprFrm.ZakazTovarBtnClick(Sender: TObject);
begin
    if ZakazTovarBtn.Visible and not VarIsNull(SprTovar['ITEM'])then
    begin
      ChangeZakaz.CurItem:= SprTovar['ITEM'];
      Application.CreateForm(TChangeZakazFrm, ChangeZakazFrm);
      ChangeZakazFrm.Caption:= 'Товар с кодом : ' + SprTovar['ITEM'];
      ChangeZakazFrm.Tag:= CurrentMarketCode;

      ShopMainForm.pFIBService.Close;
      ChangeZakazFrm.ShowModal;
      ChangeZakazFrm.Free;
    end;
end;

procedure TSprFrm.FormShow(Sender: TObject);
begin
      SpeedButton1.Left:= Panel2.Width - 39;
//    if accessAllowed('SprTovar', User_ID) then SprTovar.DoSortEx([SprTovar.Tag], SortP);
//      BitBtn9.Visible:= ShopMainForm.ToolButton18.Tag = 1;//not(Vartype(MyObject) = VarDispatch); //Автокаталог

//    if accessAllowed('SprTovar', User_ID) then SprFrm.ActiveControl:= FindEdit;
      SprFrm.ActiveControl:= FindEdit;
      if SprFrm.ActiveControl = FindEdit then FindEdit.SelectAll;
//      if not(SprTovar['ITEM'] = BaseReadString('SPR_TOVAR_GRID', 'POSITION', '0', User_ID)) then
//        SprTovar.Locate('ITEM', BaseReadString('SPR_TOVAR_GRID', 'POSITION', '0', User_ID), []);
end;

procedure TSprFrm.N2Click(Sender: TObject);
begin
      Application.CreateForm(TTovarInfoFrm, TovarInfoFrm);
      with ShopMainForm.pFIBService do
      begin
        SelectSQL.Clear;
        SelectSQL.Add('select SCLAD, BIG_REMARK from TOVAR_ADD');
        SelectSQL.Add('where ITEM = ''' + SprFrm.SprTovar['ITEM'] + '''');
        Open;
        if not VarIsNull(ShopMainForm.pFIBService['SCLAD'])then
          TovarInfoFrm.Edit1.Text:= ShopMainForm.pFIBService['SCLAD'];

        if not VarIsNull(ShopMainForm.pFIBService['BIG_REMARK']) then
          TovarInfoFrm.Memo1.Lines.Text:= ShopMainForm.pFIBService['BIG_REMARK']
        else TovarInfoFrm.Memo1.Lines.Clear;
        TovarInfoFrm.Memo1.Enabled:= accessAllowed('SprTovar', User_ID);


        Close;


      end;

      if not VarIsNull(SprTovar['REMARK'])then
      begin
        if FileExists(ExtractFilePath(ParamStr(0)) + 'Picture\' + SprTovar['REMARK'] + '.jpeg') then
          TovarInfoFrm.Image1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Picture\' + SprTovar['REMARK'] + '.jpeg')
        else TovarInfoFrm.Image1.Picture:= nil;
      end;

      case TovarInfoFrm.ShowModal of
       mrOK:
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from TOVAR_ADD where ITEM = ''' + SprTovar['ITEM'] + '''');
          Open;
          if VarIsNull(ShopMainForm.pFIBService['ITEM'])then
            ShopMainForm.pFIBDatabase1.Execute('insert into TOVAR_ADD(ITEM, SCLAD, BIG_REMARK)'
              + ' values(''' + SprTovar['ITEM'] + ''', ''' + TovarInfoFrm.Edit1.Text + ''', '''
               + TovarInfoFrm.Memo1.Lines.Text + ''')')
          else
            ShopMainForm.pFIBDatabase1.Execute('update TOVAR_ADD'
              + ' set SCLAD = ''' + TovarInfoFrm.Edit1.Text
              + ''', BIG_REMARK = ''' + TovarInfoFrm.Memo1.Lines.Text + ''''
              + ' where ITEM = ''' + SprTovar['ITEM'] + '''');
          Close;
        end;

      end;

      TovarInfoFrm.Free;
end;

procedure TSprFrm.ComboBox1Change(Sender: TObject);
begin
      FindEdit.Text:= '';
end;

procedure TSprFrm.FND15Click(Sender: TObject);
begin
        if Sender <> N4 then GroupBox1.Tag:= (Sender as TMenuItem).Tag;
        GroupBox1.Caption:= ' Поиск [' + PopupMenu2.Items[GroupBox1.Tag].Caption + ']';
        if N4.Checked then GroupBox1.Caption:= GroupBox1.Caption + ' точно';
        GroupBox1.Caption:= GroupBox1.Caption + ' : '; 
end;

procedure TSprFrm.BitBtn8Click(Sender: TObject);
begin
       with ShopMainForm.frxReport1 do
       begin
         LoadFromFile(ShopIni.ReadString('Reports', 'Reserv', ReportsPath + 'Reserv.fr3'));
         ShowReport;
       end;
end;

procedure TSprFrm.SaleClrMarkCurTovarBitBtnClick(Sender: TObject);
begin
  ExecSQLStr('update TOVAR_ADD set SALE_MARK_COLOR = null where ITEM =''' + SprTovar['ITEM'] + '''');
  SprFrm.SprTovar.Refresh;
end;

procedure TSprFrm.SaleMarkAllTovarBitBtnClick(Sender: TObject);
var CurItem: String;
begin
  if not VarIsNull(SprTovar['ITEM']) then
  begin
    CurItem:= SprTovar['ITEM'];
    SprTovar.DisableControls;
    SprTovar.First;
    while not SprTovar.Eof do
    begin
      if (Sender as TComponent).Tag = 1 then
        ExecSQLStr('update or insert into TOVAR_ADD(ITEM, SALE_MARK_COLOR)'
          + 'values(''' + SprTovar['ITEM'] + ''', ' + IntToStr(ColorBox2.Selected)
          + ')matching(ITEM)')
      else
        ExecSQLStr('update TOVAR_ADD set SALE_MARK_COLOR = null where ITEM =''' + SprTovar['ITEM'] + '''');
      SprFrm.SprTovar.Refresh;
      SprTovar.Next;
    end;
    SprTovar.Locate('ITEM', CurItem, []);
    SprTovar.EnableControls;
  end;
end;

procedure TSprFrm.SaleMarkCurTovarBitBtnClick(Sender: TObject);
begin
  ExecSQLStr('update or insert into TOVAR_ADD(ITEM, SALE_MARK_COLOR)'
    + 'values(''' + SprTovar['ITEM'] + ''', ' + IntToStr(ColorBox2.Selected)
    + ')matching(ITEM)');
  SprFrm.SprTovar.Refresh;
end;

procedure TSprFrm.SpeedButton2Click(Sender: TObject);
begin
      PopupMenu2.Popup(SprFrm.Left + SpeedButton2.Left + GroupBox1.Left + 10,
          SprFrm.Top + SpeedButton2.Top + SpeedButton2.Height + GroupBox1.Top + 10);
end;

procedure TSprFrm.itBtn9Click(Sender: TObject);
var OleCommand: WideString;
    DetailNo: WideString;
begin
//     if not(Vartype(MyObject) = VarDispatch) then
       DetailNo:= SprTovar['ARTIKUL'];
       case ShopIni.ReadInteger('Main', 'Autocatalog', 0) of
       1,3: MyObject.GetDetailByNumber(DetailNo, False, False);
         2: begin
              OleCommand:= ShopIni.ReadString('Main', 'CatCommand', '/SNB:') + SprTovar['ARTIKUL'] + '#Fully';
              MyObject.SendOrder(OleCommand);
            end;
       end;

end;

procedure TSprFrm.N5Click(Sender: TObject);
var
    Page1: TfrxReportPage;
    Band1: TfrxBand;
    DataBand1: TfrxMasterData;
    Memo1: TfrxMemoView;
    i,j,k: Integer;
    CurPos: TBookmark;
begin
     with frxReport2 do
     begin
       SprTovar.DisableControls;
       CurPos:= SprTovar.GetBookmark;
       LoadFromFile(ReportsPath + 'CrossRep.fr3');
       Page1:= FindObject('Page1') as TfrxReportPage;
       for i:= 0 to DBGrid1.Columns.Count - 1 do
         if DBGrid1.Columns[i].Visible then j:= j + DBGrid1.Columns[i].Width;
       if j > 718 then Page1.Orientation:= poLandscape
       else Page1.Orientation:= poPortrait;
       ShowReport;
       SprTovar.GotoBookmark(CurPos);
       SprTovar.EnableControls;
     end;
end;

procedure TSprFrm.Excel1Click(Sender: TObject);
var CurItem: String;
begin
    if MessageDlg('Передать в Excel ?', mtConfirmation, [mbYes,mbNo], 0) = idYes then
    begin
      Screen.Cursor:= crHourGlass;
      if not ExlActive then ExlCreate
      else
        if not Excel.Visible then
        begin
          ExlDestroy;
          ExlCreate;
        end;
      Excel.SheetsInNewWorkbook:= 1;
      Excel.Workbooks.Add;
      Excel.ActiveSheet.PageSetup.LeftMargin:= Excel.CentimetersToPoints(2);
      Excel.ActiveSheet.PageSetup.RightMargin:= Excel.CentimetersToPoints(1);
      Excel.Workbooks[Excel.Workbooks.Count].Worksheets[1].Name:= 'Справочник товаров';
      Excel.DisplayAlerts:= False;
      CurItem:= SprTovar['ITEM'];
      Excel.Visible:= True;
      ExlInsertTable(1, 2, DBGrid1);
      Excel.DisplayAlerts:= True;
      Screen.Cursor:= crDefault;
      SprTovar.Locate('ITEM', CurItem, []);
    end;
end;

procedure TSprFrm.N7Click(Sender: TObject);
begin
  Application.CreateForm(TMoveTovarShowFrm, MoveTovarShowFrm);
  MoveTovarShowFrm.Edit1.Text:= SprFrm.SprTovar['ITEM'];
  MoveTovarShowFrm.DateTimePicker1.DateTime:= Now - 30;
  MoveTovarShowFrm.DateTimePicker2.DateTime:= Now;
  MoveTovarShowFrm.DateTimePicker3.DateTime:= Now;
  MoveTovarShowFrm.DateTimePicker4.DateTime:= Now;
  with ShopMainForm.pFIBService do
  begin
    SelectSQL.Clear;
    SelectSQL.Add('select * from SPR_MARKET');
    Open;
    MoveTovarShowFrm.ComboBox1.Items.Clear;
    MoveTovarShowFrm.ComboBox1.Items.Add('!Все объекты');
    while not Eof do
    begin
      MoveTovarShowFrm.ComboBox1.Items.Add(Trim(ShopMainForm.pFIBService['SHORT_NAME']));
      Next;
    end;
    MoveTovarShowFrm.ComboBox1.ItemIndex:= 0;
    Close;
  end;
  MoveTovarShowFrm.ShowModal;
  ShopIni.WriteDateTime('MoveTovar', 'MoveTovarBDATA',  MoveTovarShowFrm.DateTimePicker1.DateTime);
  ShopIni.WriteDateTime('MoveTovar', 'MoveTovarBTIME', MoveTovarShowFrm.DateTimePicker2.DateTime);
  ShopIni.WriteDateTime('MoveTovar', 'MoveTovarEDATA', MoveTovarShowFrm.DateTimePicker3.DateTime);
  ShopIni.WriteDateTime('MoveTovar', 'MoveTovarETIME', MoveTovarShowFrm.DateTimePicker4.DateTime);
  MoveTovarShowFrm.Free;
end;

procedure TSprFrm.N8Click(Sender: TObject);
begin
    with ShopMainForm.frxReport1 do
    begin
      LoadFromFile(ReportsPath + 'MoveAllTovar.fr3');
      Script.Variables['SELECT_OPT']:= SprTovar.SelectSQL[SprTovar.SelectSQL.Count - 2];
      ShowReport;
    end;
end;

procedure TSprFrm.SprTovarFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
      if FindEdit.Text > '' then
        if N9.Checked then
          Accept:= ((Pos(FindEdit.Text, SprTovar.FieldByName('ITEM').AsString) > 0)
           or (Pos(FindEdit.Text, SprTovar.FieldByName('ARTIKUL').AsString) > 0)
           or (Pos(FindEdit.Text, SprTovar.FieldByName('TOVAR_NAME').AsString) > 0)
           or (Pos(FindEdit.Text, SprTovar.FieldByName('REMARK').AsString) > 0)
           or (Pos(FindEdit.Text, SprTovar.FieldByName('REMARK_1').AsString) > 0)
           or (Pos(FindEdit.Text, SprTovar.FieldByName('PRODUCER').AsString) > 0)
           or (Pos(FindEdit.Text, SprTovar.FieldByName('VENDOR_NAME').AsString) > 0)
           or (Pos(FindEdit.Text, SprTovar.FieldByName('GROUP_NAME').AsString) > 0)
           or (Pos(FindEdit.Text, SprTovar.FieldByName('VEND_ITEM').AsString) > 0)
           or (Pos(FindEdit.Text, SprTovar.FieldByName('SCLAD').AsString) > 0)
           or (Pos(FindEdit.Text, SprTovar.FieldByName('UNIT_NAME').AsString) > 0))
        else
          case GroupBox1.Tag of
            0: Accept:= Pos(FindEdit.Text, SprTovar.FieldByName('ITEM').AsString) > 0;
            1: Accept:= Pos(FindEdit.Text, SprTovar.FieldByName('ARTIKUL').AsString) > 0;
            2: Accept:= Pos(FindEdit.Text, SprTovar.FieldByName('TOVAR_NAME').AsString) > 0;
            3: Accept:= Pos(FindEdit.Text, SprTovar.FieldByName('REMARK').AsString) > 0;
            4: Accept:= Pos(FindEdit.Text, SprTovar.FieldByName('REMARK_1').AsString) > 0;
            5: Accept:= Pos(FindEdit.Text, SprTovar.FieldByName('PRODUCER').AsString) > 0;
           10: Accept:= Pos(FindEdit.Text, SprTovar.FieldByName('VENDOR_NAME').AsString) > 0;
           11: Accept:= Pos(FindEdit.Text, SprTovar.FieldByName('GROUP_NAME').AsString) > 0;
           12: Accept:= Pos(FindEdit.Text, SprTovar.FieldByName('VEND_ITEM').AsString) > 0;
           13: Accept:= Pos(FindEdit.Text, SprTovar.FieldByName('UNIT_NAME').AsString) > 0;
           16: Accept:= Pos(FindEdit.Text, SprTovar.FieldByName('SCLAD').AsString) > 0;
          else Accept:= True;
          end
      else Accept:= True;
end;

procedure TSprFrm.SpeedButton4Click(Sender: TObject);
begin
    if FindEdit.Text > '' then
    begin
      SpeedButton4.Down:= not SprTovar.Filtered;
      SprTovar.Filtered:= SpeedButton4.Down;
    end
    else
    begin
      SpeedButton4.Down:= False;
      SprTovar.Filtered:= False;
    end;
end;

procedure TSprFrm.BitBtn6Click(Sender: TObject);
var All_Tov, Cur_Tov: Integer;
    All_Norm, Cur_Nal, Cur_Kolvo: Double;
    CurItem: String;
begin
  Application.CreateForm(TObjChangeForm, ObjChangeForm);
  if ObjChangeForm.ShowModal = mrOK then
  begin
    All_Tov:= 0;
    Cur_Tov:= 0;
    All_Norm:= 0;
    Cur_Nal:= 0;
    with SprTovar do
    begin
      Screen.Cursor:= crSQLWait;
      DisableControls;
      CurItem:= SprTovar['ITEM'];
      First;
      while not Eof do
      begin
        Inc(All_Tov);
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select sum(KOLVO) as KOLVO from TOVAR_OST');
          SelectSQL.Add('where ITEM = ''' + SprTovar['ITEM'] + '''');
          if ObjChangeForm.Tag > 0 then
            SelectSQL.Add('and MARKET_CODE = ' + IntToStr(ObjChangeForm.Tag));
          Open;
          if not VarIsNull(ShopMainForm.pFIBService['KOLVO'])and(ShopMainForm.pFIBService['KOLVO'] > 0)then
          begin
            Inc(Cur_Tov);
            Cur_Kolvo:= ShopMainForm.pFIBService['KOLVO'];
          end
          else Cur_Kolvo:= 0;
          Close;
          SelectSQL.Clear;
          SelectSQL.Add('select sum(NORM_OST) as NORM_OST from SPR_NORM_OST');
          SelectSQL.Add('where ITEM = ''' + SprTovar['ITEM'] + '''');
          if ObjChangeForm.Tag > 0 then
            SelectSQL.Add('and MARKET_CODE = ' + IntToStr(ObjChangeForm.Tag));
          Open;
          if not VarIsNull(ShopMainForm.pFIBService['NORM_OST'])and(ShopMainForm.pFIBService['NORM_OST'] > 0)then
          begin
            All_Norm:= All_Norm + ShopMainForm.pFIBService['NORM_OST'];
            if Cur_Kolvo <= ShopMainForm.pFIBService['NORM_OST'] then
              Cur_Nal:= Cur_Nal + Cur_Kolvo
            else Cur_Nal:= Cur_Nal + ShopMainForm.pFIBService['NORM_OST'];
          end;
          Close;
        end;
        Next;
      end;

      Locate('ITEM', CurItem, []);
      EnableControls;
      Screen.Cursor:= crDefault;
      MessageDlg('Ассортимент товара :' + FloatToStrF(Cur_Tov * 100 / All_Tov, ffFixed, 3, 0) + '%'
        +#13#10+'Товарный запас от нормы :' + FloatToStrF(Cur_Nal * 100 / All_Norm, ffFixed, 3, 0) + '%'
        , mtInformation, [mbOK], 0);
    end;
  end;
  ObjChangeForm.Free;
end;

procedure TSprFrm.SprAcountGroupACOUNT_TYPE_NAMEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
      if SprAcountGroup['ACOUNT_TYPE'] = 0 then Text:= 'По последней закупочной'
      else Text:= 'По цене поставки';
end;

procedure TSprFrm.frxReport2BeforePrint(Sender: TfrxReportComponent);
var Cross: TfrxCrossView;
    i, j: Integer;
begin
  if Sender is TfrxCrossView then
  begin
    Cross:= TfrxCrossView(Sender);
    SprTovar.First;
    i:= 0;
    while not SprTovar.Eof do
    begin
      for j:= 0 to DBGrid1.Columns.Count - 1 do
        if DBGrid1.Columns[j].Visible then
        begin
          Cross.AddValue([i], [DBGrid1.Columns[j].Title.Caption], [DBGrid1.Columns[j].Field.AsString]);
          Cross.Width:= DBGrid1.Columns[j].Width;
        end;
      SprTovar.Next;
      Inc(i);
    end;
  end;
end;

end.
