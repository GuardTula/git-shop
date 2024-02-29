//****************************************************************************//
//                              © Guard  2003-2022                            //
//****************************************************************************//
unit Zakaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Printers,
  ComCtrls, Menus, frxClass, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet,
  pFIBDataSet, ExcelObj, frxCross, frxFIBComponents, DSContainer, DateUtils,
  Datasnap.DBClient, Datasnap.Provider;

type
  TZakazFrm = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    FindEdit: TEdit;
    FindTBtn: TBitBtn;
    LMDButton1: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ZakazTovarBtn: TBitBtn;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ColorBox1: TColorBox;
    SpeedButton1: TSpeedButton;
    ColorBox2: TColorBox;
    ColorBox3: TColorBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CLRZakazBtn: TBitBtn;
    SetForNormBtn: TBitBtn;
    MoveTovarBtn: TBitBtn;
    Bevel1: TGroupBox;
    BitBtn3: TBitBtn;
    MarketComboBox: TComboBox;
    BitBtn6: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SaveZakazBtn: TBitBtn;
    PopupMenu2: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    N7: TMenuItem;
    N8: TMenuItem;
    BitBtn7: TBitBtn;
    N9: TMenuItem;
    N10: TMenuItem;
    frxUserDataSet1: TfrxUserDataSet;
    N11: TMenuItem;
    pFIBStoredProc1: TpFIBStoredProc;
    ZakazQuery: TpFIBDataSet;
    ZakazQueryITEM: TFIBStringField;
    ZakazQueryARTIKUL: TFIBStringField;
    ZakazQueryKKM_SECT: TFIBIntegerField;
    ZakazQueryPRODUCER: TFIBStringField;
    ZakazQueryREMARK: TFIBStringField;
    ZakazQuerySALE_PRICE: TFIBFloatField;
    ZakazQueryTOVAR_NAME: TFIBStringField;
    ZakazQueryVEND_PRICE: TFIBFloatField;
    ZakazQueryVENDOR_NAME: TFIBStringField;
    ZakazQueryUNIT_NAME: TFIBStringField;
    ZakazQueryGROUP_NAME: TFIBStringField;
    ZakazQueryREMARK_1: TFIBStringField;
    ZakazQueryNORM_O: TFIBFloatField;
    ZakazQueryMIN_O: TFIBFloatField;
    ZakazQueryZAK: TFIBFloatField;
    ZakazQueryOST: TFIBFloatField;
    ZakazQueryRSRV: TFIBFloatField;
    ListBox1: TListBox;
    frxReport1: TfrxReport;
    frxReport2: TfrxReport;
    PopupMenu3: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    SpeedButton2: TSpeedButton;
    ZakazQueryNITEM: TFIBIntegerField;
    DataSetsContainer1: TDataSetsContainer;
    N14: TMenuItem;
    NormOstSaveMenuItem: TMenuItem;
    NormOstLoadMenuItem: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    ZakazQueryMARK_COLOR: TFIBIntegerField;
    ZakazQuerySALE_MARK_COLOR: TFIBIntegerField;
    Excel1: TMenuItem;
    ZakazQuerySCLAD: TFIBStringField;
    ZakazQueryALL_O: TFloatField;
    ZakazQueryALL_Z: TFloatField;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    XML1: TMenuItem;
    N18: TMenuItem;
    C1: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    XML2: TMenuItem;
    XML3: TMenuItem;
    procedure LMDButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ChangeZakazOrder(FieldNo: Integer);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FindEditChange(Sender: TObject);
    procedure FindEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FindEditKeyPress(Sender: TObject; var Key: Char);
    procedure FindTBtnClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ZakazTovarBtnClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BitBtn3Click(Sender: TObject);
    procedure CLRZakazBtnClick(Sender: TObject);
    procedure SetForNormBtnClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MoveTovarBtnClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ZakazFromObj(Sender: TObject);
    procedure ZakazQueryFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure SaveZakazBtnClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure SaveLoadFromObj(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure frxUserDataSet1First(Sender: TObject);
    procedure frxUserDataSet1CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxUserDataSet1Next(Sender: TObject);
    procedure frxUserDataSet1GetValue(const VarName: String;
      var Value: Variant);
    procedure N11Click(Sender: TObject);
    procedure ZakazQueryAfterOpen(DataSet: TDataSet);
    procedure frxReport2BeforePrint(Sender: TfrxReportComponent);
    procedure N12Click(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NormOstSaveMenuItemClick(Sender: TObject);
    procedure NormOstLoadMenuItemClick(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure ZakazQueryCalcFields(DataSet: TDataSet);
    procedure XML1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure XML2Click(Sender: TObject);
    procedure XML3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateZakazQuery;
  end;

var
  ZakazFrm: TZakazFrm;
  f: TextFile;
  CurStr: String;
  frxPos: Integer;
  ZEof: Boolean;
  ZkzAtrFltrStr: String = '';

implementation

uses ShopMain, ChangeZakaz, MoveTovarShow, DualList, ZakazFilter, ZakazAuto, ZakazForPeriod;

{$R *.dfm}

procedure TZakazFrm.LMDButton1Click(Sender: TObject);
begin
        Panel3.Visible:= not Panel3.Visible;
        LMDButton1.Glyph:= nil;
        if Panel3.Visible then ShopMainForm.ImageList1.GetBitmap(17, LMDButton1.Glyph)
        else ShopMainForm.ImageList1.GetBitmap(18, LMDButton1.Glyph);
end;

procedure TZakazFrm.C1Click(Sender: TObject);
var curMarket, curItem: String;
begin
   with SaveDialog1 do
   begin
     InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
     Filter:= 'Файлы заказов (*.xml) |*.xml';
     DefaultExt:= 'xml';
   end;

   if SaveDialog1.Execute then
   begin
     curItem:= ZakazQuery['ITEM'];
     curMarket:= FindMarketCode(MarketComboBox.Text).ToString;

     with ClientDataSet1 do
     begin
       Close;
       FieldDefs.Clear;
       with FieldDefs.AddFieldDef do
       begin
         DataType := ftString;
         Size := 14;
         Name := 'item';
       end;
       with FieldDefs.AddFieldDef do
       begin
         DataType := ftString;
         Size := 80;
         Name := 'tovar_name';
       end;
       with FieldDefs.AddFieldDef do
       begin
         DataType := ftFloat;
         Name := 'kolvo';
       end;
       with FieldDefs.AddFieldDef do
       begin
         DataType := ftInteger;
         Name := 'sender_market_code';
       end;
       with FieldDefs.AddFieldDef do
       begin
         DataType := ftInteger;
         Name := 'dest_market_code';
       end;
       CreateDataSet;
       while not Eof do Delete;
     end;

     with ZakazQuery do
     begin
       DisableControls;
       First;
       while not Eof do
       begin
         if not VarIsNull(ZakazQuery['ZAK']) then
         begin
           ClientDataSet1.Append;
           ClientDataSet1['item']:= ZakazQuery['item'];
           ClientDataSet1['tovar_name']:= ZakazQuery['tovar_name'] ;
           ClientDataSet1['kolvo']:= ZakazQuery['zak'];
//           ClientDataSet1['sender_market_code']:= ;
           ClientDataSet1['dest_market_code']:= curMarket;
           ClientDataSet1.Post;
         end;
         Next;
       end;
       ZakazQuery.Locate('ITEM', curItem, []);
       EnableControls;
     end;
     ClientDataSet1.SaveToFile(SaveDialog1.FileName);
     ClientDataSet1.Close;
   end;

end;

procedure TZakazFrm.ChangeZakazOrder(FieldNo: Integer);
var TMPString, CurItem: String;
    i: Integer;
begin
       with ZakazQuery do
       begin
         if FieldNo = 2 then TMPString:= 'ORDER BY 1'
         else TMPString:= 'ORDER BY ' + IntToStr(FieldNo);
         if FieldNo = 1 then FieldNo:= 2;
         for i:= 0 to DBGrid1.Columns.Count - 1 do
           if DBGrid1.Columns[i].FieldName = ZakazQuery.Fields[FieldNo - 1].FieldName then
           begin
             DBGrid1.Columns[i].Title.Font.Color:= clRed;
             DBGrid1.Columns[i].Title.Font.Style:= [fsBold];
           end
           else
           begin
             DBGrid1.Columns[i].Title.Font.Color:= clWindowText;
             DBGrid1.Columns[i].Title.Font.Style:= [];
           end;
         if Active then
         begin
           i:= 1;
           if VarIsNull(ZakazQuery['ITEM'])then CurItem:= '0'
           else CurItem:= ZakazQuery['ITEM'];
         end
         else
         begin
           i:= 0;
           CurItem:= '0';
         end;
         DisableControls;
         Close;
         SelectSQL[SelectSQL.Count - 1]:=  TMPString;
         Open;
         if i = 1 then Locate('ITEM', CurItem, []);
         FindEdit.Text:= '';
         FindEdit.Tag:= FieldNo - 1;
         EnableControls;
       end;
end;

procedure TZakazFrm.ZakazFromObj(Sender: TObject);
var Cur_ITEM, Out_Obj: String;
    In_Obj: Integer;
    No, Co, Ho, Cz: Double;
//    TmpDSep: Char;
begin
      if (Sender as TMenuItem).Caption = MarketComboBox.Text then
        MessageDlg('Объект поставщик текущий объект', mtWarning, [mbOK], 0)
      else
      if not VarIsNull(ZakazQuery['ITEM'])then
        begin
          for In_Obj:= 11 to DBGrid1.Columns.Count - 1 do
            if 'Остаток ' + (Sender as TMenuItem).Caption = DBGrid1.Columns[In_Obj].Title.Caption then
              Out_Obj:= DBGrid1.Columns[In_Obj].FieldName;
          In_Obj:= FindMarketCode(MarketComboBox.Text);
          Cur_ITEM:= ZakazQuery['ITEM'];

          ShopMainForm.pFIBDatabase1.Execute('delete from ZAKAZ'
            + ' where MARKET_CODE = ' + In_Obj.ToString
            + ' and AUTOR_KOD = ' + User_ID.ToString);

          with ZakazQuery do
          begin
            Screen.Cursor:= crHourGlass;
            DisableControls;
            First;
            while not Eof do
            begin
              if not VarIsNull(ZakazQuery['NORM_O'])then
              begin
                No:= ZakazQuery['NORM_O'];
                if not VarIsNull(ZakazQuery['OST'])then
                  Co:= ZakazQuery['OST']
                else Co:= 0;
                if not VarIsNull(ZakazQuery[Out_Obj])then
                  Ho:= ZakazQuery[Out_Obj]
                else Ho:= 0;
                if(Ho > 0)and(No > Co)then
                begin
                  if Ho >= No - Co then Cz:= No - Co
                  else Cz:= Ho;
//                  TmpDSep:= FormatSettings.DecimalSeparator;
//                  FormatSettings.DecimalSeparator:= '.';
                  ExecSQLStr('insert into ZAKAZ(MARKET_CODE, '
                    + 'ITEM, KOLVO, AUTOR_KOD) values(' + IntToStr(In_Obj) + ', '''
                    + ZakazQuery['ITEM'] + ''', '
                    + StringReplace(FloatToStrF(Cz, ffFixed, 15, 3), ',', '.', [])
                    + ', ' + IntToStr(User_ID) + ')');
//                  FormatSettings.DecimalSeparator:= TmpDSep;
                end;
              end;
              Next;
            end;
            ShopMainForm.pFIBDatabase1.CommitRetaining;
            Close;
            Open;
            Screen.Cursor:= crDefault;
            Locate('ITEM', Cur_ITEM, []);
            EnableControls;
          end;
        end;
end;

procedure TZakazFrm.FormCreate(Sender: TObject);
var Field: TFloatField;
    NewItem: TMenuItem;
    sr: TSearchRec;
    i,j: Integer;
begin
        ZakazQuery.SelectSQL.Clear;
        ZakazQuery.SelectSQL.Add('select cast(t.item as integer)as nitem, t.item, t.artikul, t.kkm_sect, '
           + 't.producer, t.remark, pr.sale_price, t.tovar_name, pr.vend_price, tovar_add.sclad, '
           + 'v.vendor_name, u.unit_name, g.group_name, t.remark_1, tovar_add.mark_color, tovar_add.sale_mark_color,');
        ZakazQuery.SelectSQL.Add('n.norm_ost NORM_O, n.min_ost MIN_O, z.kolvo ZAK, SUM(o.kolvo)OST');

        // Используем табличные значения резервов или обсчитываем
        if ShopIni.ReadBool('Main', 'TableRSRV', False) then
          ZakazQuery.SelectSQL.Add(', r.kolvo RSRV ')
        else
          ZakazQuery.SelectSQL.Add(',(select sum(kolvo)from pos_rashod p1 '
            + 'right join hdr_rashod h1 on p1.kod = h1.kod where item = t.item and h1.doc_type = 12) RSRV');

        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_MARKET');
          Open;
          MarketComboBox.Items.Clear;
          i:= 0;
          while not Eof do
          begin
            j:= MarketComboBox.Items.Add(Trim(ShopMainForm.pFIBService['SHORT_NAME']));
            NewItem:= TMenuItem.Create(PopupMenu1);
            N2.Insert(0, NewItem);
            NewItem.Caption:= Trim(ShopMainForm.pFIBService['SHORT_NAME']);
            NewItem.OnClick:= ZakazFromObj;

            NewItem:= TMenuItem.Create(PopupMenu2);
            N8.Insert(0, NewItem);
            NewItem.Caption:= Trim(ShopMainForm.pFIBService['SHORT_NAME']);
            NewItem.OnClick:= SaveLoadFromObj;
            NewItem.Tag:= ShopMainForm.pFIBService['MARKET_CODE'];

            if ShopMainForm.pFIBService['MARKET_CODE'] = CurrentMarketCode then
            begin
              DBGrid1.Columns[15].Title.Caption:= 'Остаток ' + Trim(ShopMainForm.pFIBService['SHORT_NAME']);
              DBGrid1.Columns[19].Title.Caption:= 'Заказ ' + Trim(ShopMainForm.pFIBService['SHORT_NAME']);
              i:= j;
            end
            else
            begin
              ZakazQuery.SelectSQL[2]:= ZakazQuery.SelectSQL[2]
                    + ',(select sum(kolvo) from tovar_ost where item = t.item and market_code = '
                    + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']) + ')OST'
                    + IntToStr(ShopMainForm.pFIBService['MARKET_CODE'])
                    + ',(select sum(kolvo) from zakaz where item = t.item and market_code = '
                    + IntToStr(ShopMainForm.pFIBService['MARKET_CODE'])
                    + ' and AUTOR_KOD = ' + IntToStr(User_ID) + ')ZAK'
                    + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']);

              Field:= TFloatField.Create(ZakazQuery);
              Field.FieldName:= 'OST' + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']);
              Field.DataSet:= ZakazQuery;
              Field.DisplayFormat:= '####0.###';
              Field:= TFloatField.Create(ZakazQuery);
              Field.FieldName:= 'ZAK' + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']);
              Field.DataSet:= ZakazQuery;
              Field.DisplayFormat:= '####0.###';


              DBGrid1.Columns.Add;
              DBGrid1.Columns[DBGrid1.Columns.Count - 1].FieldName:= 'OST'
                                + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']);
              with DBGrid1.Columns[DBGrid1.Columns.Count - 1].Title do
              begin
                Caption:= 'Остаток ' + Trim(ShopMainForm.pFIBService['SHORT_NAME']);
                Alignment:= taCenter;
              end;

              DBGrid1.Columns.Add;
              DBGrid1.Columns[DBGrid1.Columns.Count - 1].FieldName:= 'ZAK'
                                + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']);
              with DBGrid1.Columns[DBGrid1.Columns.Count - 1].Title do
              begin
                Caption:= 'Заказ ' + Trim(ShopMainForm.pFIBService['SHORT_NAME']);
                Alignment:= taCenter;
              end;

            end;
            Next;
          end;
          MarketComboBox.ItemIndex:= i;
          MarketComboBox.Tag:= CurrentMarketCode;
          Close;
        end;

{        Field:= TFloatField.Create(ZakazQuery);
        Field.FieldName:= 'ALL_O';
        Field.DataSet:= ZakazQuery;
        Field.FieldKind:= fkCalculated;
//        Field.OnGetText:= ZakazQueryALL_OSTGetText;
        Field.DisplayLabel:= 'Всего остаток';
        Field.Tag:= 2;
}
        DBGrid1.Columns.Add;
        DBGrid1.Columns[DBGrid1.Columns.Count - 1].FieldName:= 'ALL_O';
        with DBGrid1.Columns[DBGrid1.Columns.Count - 1].Title do
        begin
          Caption:= 'Всего остаток';
          Alignment:= taCenter;
        end;
{
        Field:= TFloatField.Create(ZakazQuery);
        Field.FieldName:= 'ALL_Z';
        Field.Tag:= 1;
        Field.DataSet:= ZakazQuery;
//        Field.OnGetText:= ZakazQueryALL_ZAKGetText;
        Field.FieldKind:= fkCalculated;
        Field.DisplayLabel:= 'Всего заказ';
}
        DBGrid1.Columns.Add;
        DBGrid1.Columns[DBGrid1.Columns.Count - 1].FieldName:= 'ALL_Z';
        with DBGrid1.Columns[DBGrid1.Columns.Count - 1].Title do
        begin
          Caption:= 'Всего заказ';
          Alignment:= taCenter;
        end;

        with ZakazQuery do
        begin
          SelectSQL.Add('from spr_tovar t left join spr_vendors v on t.vendor_code = v.vendor_code');
          SelectSQL.Add('left join spr_units u on t.unit_kod = u.unit_kod left join tovar_rsrv r ON r.item = t.item ');
          SelectSQL.Add('left join spr_group g on t.t_group = g.t_group left join tovar_add on tovar_add.item = t.item ');
          SelectSQL.Add('left join spr_norm_ost n on n.item = t.item and n.market_code = ' + IntToStr(CurrentMarketCode));
          SelectSQL.Add('left join zakaz z on z.item = t.item and z.market_code = ' + IntToStr(CurrentMarketCode)
                      + ' and z.autor_kod = ' + IntToStr(User_ID));
          SelectSQL.Add('left join tovar_ost o on o.item = t.item and o.market_code = ' + IntToStr(CurrentMarketCode));
          SelectSQL.Add('left join prices pr on pr.item = t.item and pr.market_code = (select OBJ_ID from INF_CURRENT_OBJ)');
          SelectSQL.Add(ZakWhereFilterStr);
            if ShopIni.ReadBool('Main', 'TableRSRV', False) then
              SelectSQL.Add('group by t.item, t.artikul, t.kkm_sect, t.producer, t.remark, t.remark_1, pr.sale_price, t.tovar_name,'
              + ' pr.vend_price, v.vendor_name, u.unit_name, tovar_add.mark_color, tovar_add.sale_mark_color, tovar_add.sclad, g.group_name, n.norm_ost, n.min_ost, z.kolvo, r.kolvo')
            else
              SelectSQL.Add('group by t.item, t.artikul, t.kkm_sect, t.producer, t.remark, t.remark_1, pr.sale_price, t.tovar_name,'
              + ' pr.vend_price, v.vendor_name, u.unit_name, tovar_add.mark_color, tovar_add.sale_mark_color, tovar_add.sclad, g.group_name, n.norm_ost, n.min_ost, z.kolvo');
          SelectSQL.Add(ZakHavingFilterStr);
          SelectSQL.Add('');

          RefreshSQL:= SelectSQL;
          RefreshSQL[RefreshSQL.Count - 4]:= 'where t.item = :ITEM';
        end;
 {

        j:= 0;
        for i:= 0 to DBGrid1.Columns.Count - 1 do
        begin
          DBGrid1.Columns[i].Visible:= ShopIni.ReadBool('ZakazQuery_GRID', DBGrid1.Columns[i].FieldName + '_V', True);
          DBGrid1.Columns[i].Width:= ShopIni.ReadInteger('ZakazQuery_GRID', DBGrid1.Columns[i].FieldName + '_W', DBGrid1.Columns[i].Width);
          if DBGrid1.Columns[i].Visible then j:= j + DBGrid1.Columns[i].Width;
        end;
}
        ChangeZakazOrder(BaseReadInteger('ZakazQuery_GRID', 'ORDER', 2, User_ID));
        ZakazQuery.Locate('ITEM', BaseReadString('ZakazQuery_GRID', 'POSITION', '', User_ID), []);
        SpeedButton2.Down:= BaseReadBool('ZakazQuery_GRID', 'REMEMBER_CONDITION', False, User_ID);

        for j:= 0 to ZakazQuery.Fields.Count - 1 do
        begin
          i:= GetDBGridFieldIndex(DBGrid1, ZakazQuery.Fields[j].FieldName);
          if i <> -1 then
          begin
            DBGrid1.Columns[i].Visible:= BaseReadBool('ZakazQuery_GRID', ZakazQuery.Fields[j].FieldName + '_V', True, User_ID);
            DBGrid1.Columns[i].Width:= BaseReadInteger('ZakazQuery_GRID', ZakazQuery.Fields[j].FieldName + '_W', DBGrid1.Columns[i].Width, User_ID);
            DBGrid1.Columns[i].Index:= BaseReadInteger('ZakazQuery_GRID', ZakazQuery.Fields[j].FieldName + '_I', DBGrid1.Columns[i].Index, User_ID);
          end;
        end;



        if FindFirst(ReportsPath + 'ZAKAZ\*.fr3', faAnyFile, sr) = 0 then
        begin
          repeat
            if (sr.Attr and fadirectory) <> sr.Attr then
            begin
              NewItem:= TMenuItem.Create(PopupMenu3);
              PopupMenu3.Items.Add(NewItem);
              NewItem.Caption:= Copy(sr.Name, 1, Length(sr.Name) - 4);
              NewItem.OnClick:= MenuClick;
            end;
          until FindNext(sr) <> 0;
          FindClose(sr);
        end;
end;

procedure TZakazFrm.BitBtn1Click(Sender: TObject);
var i: Integer;
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
        for i:= 0 to DBGrid1.Columns.Count - 1 do
          DBGrid1.Columns[i].Visible:=
           FindString(DBGrid1.Columns[i].Title.Caption, DualListDlg.DstList.Items) > -1;
      end
      else MessageDlg('Колонки не выбраны', mtWarning, [mbOK], 0);
    DualListDlg.Free;
end;

procedure TZakazFrm.FormDestroy(Sender: TObject);
var i: Integer;
begin
{    for i:= 0 to DBGrid1.Columns.Count - 1 do
    begin
      ShopIni.WriteBool('ZakazQuery_GRID', DBGrid1.Columns[i].FieldName + '_V', DBGrid1.Columns[i].Visible);
      ShopIni.WriteInteger('ZakazQuery_GRID', DBGrid1.Columns[i].FieldName + '_W', DBGrid1.Columns[i].Width);
    end;
    if not VarIsNull(ZakazQuery['ITEM'])then ShopIni.WriteString('ZakazQuery_GRID', 'POSITION', ZakazQuery['ITEM']);
    ShopIni.WriteInteger('ZakazQuery_GRID', 'ORDER', StrToInt(Copy(ZakazQuery.SelectSQL[ZakazQuery.SelectSQL.Count - 1],
            10, Length(ZakazQuery.SelectSQL[ZakazQuery.SelectSQL.Count - 1]) - 8)));
 }
    for i:= 0 to DBGrid1.Columns.Count - 1 do
    begin
      BaseWriteBool('ZakazQuery_GRID', DBGrid1.Columns[i].FieldName + '_V', DBGrid1.Columns[i].Visible, User_ID);
      BaseWriteInteger('ZakazQuery_GRID', DBGrid1.Columns[i].FieldName + '_W', DBGrid1.Columns[i].Width, User_ID);
      BaseWriteInteger('ZakazQuery_GRID', DBGrid1.Columns[i].FieldName + '_I', DBGrid1.Columns[i].Index, User_ID);
    end;
    if not VarIsNull(ZakazQuery['ITEM'])then BaseWriteString('ZakazQuery_GRID', 'POSITION', ZakazQuery['ITEM'], User_ID);
    BaseWriteInteger('ZakazQuery_GRID', 'ORDER', StrToInt(Copy(ZakazQuery.SelectSQL[ZakazQuery.SelectSQL.Count - 1],
            10, Length(ZakazQuery.SelectSQL[ZakazQuery.SelectSQL.Count - 1]) - 8)), User_ID);
    BaseWriteBool('ZakazQuery_GRID', 'REMEMBER_CONDITION', SpeedButton2.Down, User_ID);
end;

procedure TZakazFrm.DBGrid1TitleClick(Column: TColumn);
begin
   if Column.Field.FieldKind = fkData then
     ChangeZakazOrder(ZakazQuery.FieldByName(Column.Field.FieldName).FieldNo);
end;

procedure TZakazFrm.Excel1Click(Sender: TObject);
var CurItem: String;
begin
  if MessageDlg('Передать в Excel ?', mtConfirmation, [mbYes,mbNo], 0) = idYes then
  begin
    Screen.Cursor:= crHourGlass;
    if not ExlActive then ExlCreate
    else if not Excel.Visible then
    begin
      ExlDestroy;
      ExlCreate;
    end;
    Excel.SheetsInNewWorkbook:= 1;
    Excel.Workbooks.Add;
    Excel.ActiveSheet.PageSetup.LeftMargin:= Excel.CentimetersToPoints(2);
    Excel.ActiveSheet.PageSetup.RightMargin:= Excel.CentimetersToPoints(1);
    Excel.Workbooks[Excel.Workbooks.Count].Worksheets[1].Name:= 'Заказ товаров';
    Excel.DisplayAlerts:= False;
    CurItem:= ZakazQuery['ITEM'];
    ExlInsertTable(1, 2, DBGrid1);
    Excel.DisplayAlerts:= True;
    Screen.Cursor:= crDefault;
    Excel.Visible:= True;
    ZakazQuery.Locate('ITEM', CurItem, []);
  end;
end;

procedure TZakazFrm.FindEditChange(Sender: TObject);
begin
        FindTBtn.Enabled:= FindEdit.Text <> '';
end;

procedure TZakazFrm.FindEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key = VK_RETURN then FindTBtn.Click;
end;

procedure TZakazFrm.FindEditKeyPress(Sender: TObject; var Key: Char);
begin
      if FindEdit.Tag = 2 then
        if not(Key in [#8, '0'..'9'])then Key:= #0;
      if Key = '''' then Key:= #0;
end;

procedure TZakazFrm.FindTBtnClick(Sender: TObject);
begin
        if ZakazQuery.Locate(ZakazQuery.Fields[FindEdit.Tag].FieldName, FindEdit.Text,
          [loCaseInsensitive, loPartialKey]) then DBGrid1.SetFocus
        else
        begin
          MessageDlg('Запись не найдена', mtInformation, [mbOK], 0);
          FindEdit.SelectAll;
        end;
end;

procedure TZakazFrm.BitBtn2Click(Sender: TObject);
begin
      PopupMenu3.Popup(ZakazFrm.Left + BitBtn2.Left + 10,
          ZakazFrm.Top + BitBtn2.Top + BitBtn2.Height + 20);
end;

procedure TZakazFrm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var N_Ost, Ost, M_Ost, Zak: Double;
begin
{
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
}
    if(gdSelected in State)then
    begin
        TDBGrid(Sender).Canvas.Brush.Color:= clHighLight;
        TDBGrid(Sender).Canvas.Font.Color := clHighLightText;
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
      if SpeedButton1.Down then
      begin
        if VarIsNull(TDBGrid(Sender).DataSource.DataSet['NORM_O'])then N_Ost:= 0
        else N_Ost:= TDBGrid(Sender).DataSource.DataSet['NORM_O'];
        if VarIsNull(TDBGrid(Sender).DataSource.DataSet['OST'])then Ost:= 0
        else Ost:= TDBGrid(Sender).DataSource.DataSet['OST'];
        if VarIsNull(TDBGrid(Sender).DataSource.DataSet['MIN_O'])then M_Ost:= 0
        else M_Ost:= TDBGrid(Sender).DataSource.DataSet['MIN_O'];
        if VarIsNull(TDBGrid(Sender).DataSource.DataSet['ZAK'])then Zak:= 0
        else Zak:= TDBGrid(Sender).DataSource.DataSet['ZAK'];
        // Меньше нормы остатков
        if CheckBox3.Checked and(N_Ost > 0)and(Ost < N_Ost)then
          TDBGrid(Sender).Canvas.Brush.Color:= ColorBox3.Selected;
        // Меньше минимума остатков
        if CheckBox2.Checked and(M_Ost > 0)and(Ost < M_Ost)then
         TDBGrid(Sender).Canvas.Brush.Color:= ColorBox2.Selected;
        // Включённые в заказ
        if CheckBox1.Checked and (Zak > 0)then
          TDBGrid(Sender).Canvas.Brush.Color:= ColorBox1.Selected;
      end
      else
      begin
        TDBGrid(Sender).Canvas.Brush.Color:= clWindow;
        TDBGrid(Sender).Canvas.Font.Color := clWindowText;
      end;
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

procedure TZakazFrm.SpeedButton1Click(Sender: TObject);
begin
        case (Sender as TComponent).Tag of
         1: ColorBox1.Enabled:= (Sender as TCheckBox).Checked;
         2: ColorBox2.Enabled:= (Sender as TCheckBox).Checked;
         3: ColorBox3.Enabled:= (Sender as TCheckBox).Checked;
        end;
      DBGrid1.Repaint;
end;

procedure TZakazFrm.ZakazTovarBtnClick(Sender: TObject);
var CurItem: String;
begin
      ChangeZakaz.CurItem:= ZakazQuery['ITEM'];
      Application.CreateForm(TChangeZakazFrm, ChangeZakazFrm);
      ChangeZakazFrm.Caption:= 'Товар с кодом : ' + ZakazQuery['ITEM'];
      ChangeZakazFrm.Tag:= FindMarketCode(MarketComboBox.Text);


      if ChangeZakazFrm.ShowModal = IDIGNORE then
        with ZakazQuery do
        begin
          CurItem:= ZakazQuery['ITEM'];
          Next;
          if CurItem = ZakazQuery['ITEM']then Prior;
          CurItem:= ZakazQuery['ITEM'];
          DisableControls;
          Close;
          Open;
          Locate('ITEM', CurItem, []);
          EnableControls;
        end;
      ZakazQuery.Refresh;
      if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.CommitRetaining;
//
      ChangeZakazFrm.Free;
end;

procedure TZakazFrm.DBGrid1DblClick(Sender: TObject);
begin
      if ZakazTovarBtn.Enabled then ZakazTovarBtn.Click;
end;

procedure TZakazFrm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
        ZakazTovarBtn.Enabled:= not VarIsNull(ZakazQuery['ITEM']);
        SetForNormBtn.Enabled:= not VarIsNull(ZakazQuery['ITEM']);
        BitBtn2.Enabled:= not VarIsNull(ZakazQuery['ITEM']);
//        BitBtn4.Enabled:= not VarIsNull(ZakazQuery['ITEM']);
        MoveTovarBtn.Enabled:= not VarIsNull(ZakazQuery['ITEM']);
end;

procedure TZakazFrm.BitBtn3Click(Sender: TObject);
begin
     UpdateZakazQuery;
end;

procedure TZakazFrm.UpdateZakazQuery;
var CurItem, TMPStr, TMPStr1: String;
    i,j,a: Integer;
    ActQuery: Boolean;
begin
    with ZakazQuery do
    begin
      Screen.Cursor:= crHourGlass;
      DisableControls;
      if not Active or VarIsNull(ZakazQuery['ITEM'])then CurItem:= ''
      else CurItem:= ZakazQuery['ITEM'];
      ActQuery:= Active;
      Active:= False;
      i:= FindMarketCode(MarketComboBox.Text);
      for a:= 6 to 8 do
      begin
        TMPStr:= ZakazQuery.SelectSQL[a];
        TMPStr:= StringReplace(TMPStr, 'market_code = ' + MarketComboBox.Tag.ToString, 'market_code = ' + i.ToString, [rfReplaceAll]); //
//6          SelectSQL.Add('left join spr_norm_ost n on n.item = t.item and n.market_code = ' + IntToStr(CurrentMarketCode));
//7          SelectSQL.Add('left join zakaz z on z.item = t.item and z.market_code = ' + IntToStr(CurrentMarketCode) + ' and z.autor_kod = ' + IntToStr(User_ID));
//8          SelectSQL.Add('left join tovar_ost o on o.item = t.item and o.market_code = ' + IntToStr(CurrentMarketCode));
//9          SelectSQL.Add('left join prices pr on pr.item = t.item and pr.market_code = (select OBJ_ID from INF_CURRENT_OBJ)');
        ZakazQuery.SelectSQL[a]:= TMPStr;
      end;

      TMPStr:= ZakazQuery.SelectSQL[2];
      TMPStr:= StringReplace(TMPStr, 'market_code = ' + i.ToString, 'market_code = ' + MarketComboBox.Tag.ToString, [rfReplaceAll]); //
      TMPStr:= StringReplace(TMPStr, 'OST' + i.ToString, 'OST' + MarketComboBox.Tag.ToString, []); // rfReplaceAll
      TMPStr:= StringReplace(TMPStr, 'ZAK' + i.ToString, 'ZAK' + MarketComboBox.Tag.ToString, []); // rfReplaceAll
      ZakazQuery.SelectSQL[2]:= TMPStr;
      ZakazQuery.RefreshSQL:= ZakazQuery.SelectSQL;
      ZakazQuery.RefreshSQL[ZakazQuery.RefreshSQL.Count - 4]:= 'where t.item = :ITEM';
      for j:= 0 to ZakazQuery.FieldCount - 1 do
      begin
        if ZakazQuery.Fields[j].FieldName = 'OST' + i.ToString then ZakazQuery.Fields[j].FieldName:= 'OST' + MarketComboBox.Tag.ToString;
        if ZakazQuery.Fields[j].FieldName = 'ZAK' + i.ToString then ZakazQuery.Fields[j].FieldName:= 'ZAK' + MarketComboBox.Tag.ToString;
      end;
{
              ZakazQuery.SelectSQL[2]:= ZakazQuery.SelectSQL[2]
                    + ',(select sum(kolvo) from tovar_ost where item = t.item and market_code = '
                    + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']) + ')OST'
                    + IntToStr(ShopMainForm.pFIBService['MARKET_CODE'])
                    + ',(select sum(kolvo) from zakaz where item = t.item and market_code = '
                    + IntToStr(ShopMainForm.pFIBService['MARKET_CODE'])
                    + ' and AUTOR_KOD = ' + IntToStr(User_ID) + ')ZAK'
                    + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']);

              Field:= TFloatField.Create(ZakazQuery);
              Field.FieldName:= 'OST' + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']);
              Field.DataSet:= ZakazQuery;
              Field.DisplayFormat:= '####0.###';
              Field:= TFloatField.Create(ZakazQuery);
              Field.FieldName:= 'ZAK' + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']);
              Field.DataSet:= ZakazQuery;
              Field.DisplayFormat:= '####0.###';
}

      for j:= 0 to DBGrid1.Columns.Count - 1 do
      begin
        if DBGrid1.Columns[j].FieldName = 'ZAK' + i.ToString  then
        begin
          DBGrid1.Columns[j].FieldName:= 'ZAK' + MarketComboBox.Tag.ToString;
          DBGrid1.Columns[j].Title.Caption:= 'Заказ ' + Trim(FindMarket(MarketComboBox.Tag));
        end;
        if DBGrid1.Columns[j].FieldName = 'OST' + i.ToString then
        begin
          DBGrid1.Columns[j].FieldName:= 'OST' + MarketComboBox.Tag.ToString;
          DBGrid1.Columns[j].Title.Caption:= 'Остаток ' + Trim(FindMarket(MarketComboBox.Tag));
        end;

        if DBGrid1.Columns[j].FieldName = 'ZAK' then
          DBGrid1.Columns[j].Title.Caption:= 'Заказ ' + Trim(FindMarket(i));
        if DBGrid1.Columns[j].FieldName = 'OST' then
          DBGrid1.Columns[j].Title.Caption:= 'Остаток ' + Trim(FindMarket(i));
      end;

      Active:= ActQuery;
      if Active then Locate('ITEM', CurItem, []);
      MarketComboBox.Tag:= i;
      EnableControls;
      Screen.Cursor:= crDefault;
    end;
end;

procedure TZakazFrm.XML1Click(Sender: TObject);
begin
   with SaveDialog1 do
   begin
     InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
     Filter:= 'Файлы заказов (*.xml) |*.xml';
     DefaultExt:= 'xml';
   end;

   if SaveDialog1.Execute then
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select Z.ITEM, T.TOVAR_NAME, Z.KOLVO, null as sender_market_code, Z.MARKET_CODE as dest_market_code from ZAKAZ Z left join SPR_TOVAR T on T.ITEM = Z.ITEM');
       SelectSQL.Add('where Z.AUTOR_KOD = ' + User_ID.ToString);
       SelectSQL.Add('order by T.TOVAR_NAME');
       Open;

       DataSetProvider1.DataSet:= ShopMainForm.pFIBService;
       ClientDataSet1.Open;
       ClientDataSet1.SaveToFile(SaveDialog1.FileName);
       ClientDataSet1.Close;
       DataSetProvider1.DataSet:= nil;

       Close;
     end;
end;

procedure TZakazFrm.XML2Click(Sender: TObject);
begin
  if MessageDlg('Текущий заказ будет очищен. Продолжить ?', mtWarning, [mbYes, mbNo], 0) = ID_YES then
  begin
    with OpenDialog1 do
    begin
      InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
      Filter:= 'Файлы заказов (*.xml) |*.xml';
      DefaultExt:= 'xml';
    end;

    if OpenDialog1.Execute then
    begin
      ExecSQLStr('delete from ZAKAZ where AUTOR_KOD = ' + User_ID.ToString);
      with ClientDataSet1 do
      begin
        LoadFromFile(OpenDialog1.FileName);
        First;
        while not Eof do
        begin
          ExecSQLStr('insert into ZAKAZ(MARKET_CODE, ITEM, KOLVO, AUTOR_KOD) values('
            + IntToStr(ClientDataSet1['dest_market_code']) + ', ''' + ClientDataSet1['item'] + ''', '
            + StringReplace(FloatToStr(ClientDataSet1['kolvo']), ',', '.', []) + ', ' + User_ID.ToString + ')');
          Next;
        end;
        Close;
        FileName:= '';
      end;
      ZakazQuery.ReopenLocate('ITEM');
    end;
  end;
end;

procedure TZakazFrm.XML3Click(Sender: TObject);
begin

    with OpenDialog1 do
    begin
      InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
      Filter:= 'Файлы заказов (*.xml) |*.xml';
      DefaultExt:= 'xml';
    end;

   if OpenDialog1.Execute then
   begin
     ListBox1.Items.LoadFromFile(OpenDialog1.FileName);

     with ClientDataSet1 do
     begin
       LoadFromFile(OpenDialog1.FileName);
       First;
       ListBox1.Items.Clear;
       while not Eof do
       begin
         ListBox1.Items.Add(';' + ClientDataSet1['item'] + ';'
                  + StringReplace(FloatToStrF(ClientDataSet1['kolvo'], ffGeneral, 15, 3), ',', '.', []) + ';'
                  + IntToStr(ClientDataSet1['dest_market_code']) + ';');
         Next;
       end;
       Close;
     end;

     for frxPos:= 0 to ListBox1.Count - 1 do
       with ShopMainForm.pFIBService do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select T.TOVAR_NAME, A.SCLAD, T.ARTIKUL, T.REMARK from SPR_TOVAR T left join TOVAR_ADD A on T.ITEM = A.ITEM');
         SelectSQL.Add('where T.ITEM = ''' + GetStrParam(ListBox1.Items[frxPos], 1) + '''');
         Open;

         if VarIsNull(ShopMainForm.pFIBService['TOVAR_NAME']) then
           ListBox1.Items[frxPos]:= ';' + ListBox1.Items[frxPos]
         else
           ListBox1.Items[frxPos]:= ';' + StringReplace(ShopMainForm.pFIBService['TOVAR_NAME'], ';', '', [rfReplaceAll]) + ListBox1.Items[frxPos];

         if VarIsNull(ShopMainForm.pFIBService['SCLAD']) then
           ListBox1.Items[frxPos]:= ';' + ListBox1.Items[frxPos]
         else
           ListBox1.Items[frxPos]:= ';' + Trim(ShopMainForm.pFIBService['SCLAD']) + ListBox1.Items[frxPos];

         if VarIsNull(ShopMainForm.pFIBService['ARTIKUL']) then
           ListBox1.Items[frxPos]:= ListBox1.Items[frxPos] + ';'
         else
           ListBox1.Items[frxPos]:= ListBox1.Items[frxPos] + ShopMainForm.pFIBService['ARTIKUL'] + ';';

         if VarIsNull(ShopMainForm.pFIBService['REMARK']) then
           ListBox1.Items[frxPos]:= ListBox1.Items[frxPos] + ';'
         else
           ListBox1.Items[frxPos]:= ListBox1.Items[frxPos] + ShopMainForm.pFIBService['REMARK'] + ';';

         Close;
       end;
     ListBox1.Sorted:= False;
     ListBox1.Sorted:= True;
//     ListBox1.Items.LoadFromFile('c:\zakaz.txt');
     frxReport1.LoadFromFile(ShopIni.ReadString('Reports', 'ZakazFile', ReportsPath + 'ZakazFile.fr3'));
     frxReport1.ShowReport;
   end;
end;

procedure TZakazFrm.CLRZakazBtnClick(Sender: TObject);
var CurItem: String;
begin
      if MessageDlg('Очистить заказ ?', mtConfirmation, [mbYes,mbNo], 0) = IDYES then
      begin
        ExecSQLStr('delete from ZAKAZ where AUTOR_KOD = ' + User_ID.ToString);
        ShopMainForm.pFIBDatabase1.CommitRetaining;
        ZakazQuery.ReopenLocate('ITEM');
      end;
end;

procedure TZakazFrm.SetForNormBtnClick(Sender: TObject);
begin
      PopupMenu1.Popup(ZakazFrm.Left + SetForNormBtn.Left + 10,
          ZakazFrm.Top + SetForNormBtn.Top + SetForNormBtn.Height + 10);
end;

procedure TZakazFrm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var CurItem: String;
begin
      case Key of
        VK_RETURN: if ZakazTovarBtn.Enabled then ZakazTovarBtn.Click;
        VK_DELETE: if not VarIsNull(ZakazQuery['ZAK'])
            and(MarketComboBox.ItemIndex > 0)then
              begin
                Screen.Cursor:= crHourGlass;
                ShopMainForm.pFIBDatabase1.Execute('delete from ZAKAZ'
                  + ' where MARKET_CODE = ' + IntToStr(FindMarketCode(MarketComboBox.Text))
                  + ' and ITEM = ''' + ZakazQuery['ITEM'] + ''''
                  + ' and AUTOR_KOD = ' + IntToStr(User_ID));
                ZakazQuery.ReopenLocate('ITEM');
                Screen.Cursor:= crDefault;
              end;
        VK_F5: if MoveTovarBtn.Enabled then MoveTovarBtn.Click;
      end;
end;

procedure TZakazFrm.MoveTovarBtnClick(Sender: TObject);
begin
  Application.CreateForm(TMoveTovarShowFrm, MoveTovarShowFrm);
  MoveTovarShowFrm.Edit1.Text:= ZakazQuery['ITEM'];
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
  MoveTovarShowFrm.ComboBox1.ItemIndex:=
      FindString(MarketComboBox.Text, MoveTovarShowFrm.ComboBox1.Items);
    Close;
  end;
  MoveTovarShowFrm.ShowModal;
  MoveTovarShowFrm.Free;
end;

procedure TZakazFrm.BitBtn4Click(Sender: TObject);
//var CurItem: String;
begin
{    if MessageDlg('Передать в Excel ?', mtConfirmation, [mbYes,mbNo], 0) = idYes then
    begin
      Screen.Cursor:= crHourGlass;
      if not ExlActive then ExlCreate
      else if not Excel.Visible then
      begin
        ExlDestroy;
        ExlCreate;
      end;
      Excel.SheetsInNewWorkbook:= 1;
      Excel.Workbooks.Add;
      Excel.ActiveSheet.PageSetup.LeftMargin:= Excel.CentimetersToPoints(2);
      Excel.ActiveSheet.PageSetup.RightMargin:= Excel.CentimetersToPoints(1);
      Excel.Workbooks[Excel.Workbooks.Count].Worksheets[1].Name:= 'Заказ товаров';
      Excel.DisplayAlerts:= False;
      CurItem:= ZakazQuery['ITEM'];
      ExlInsertTable(1, 2, DBGrid1);
      Excel.DisplayAlerts:= True;
      Screen.Cursor:= crDefault;
      Excel.Visible:= True;
      ZakazQuery.Locate('ITEM', CurItem, []);
    end;
  }
end;

procedure TZakazFrm.BitBtn6Click(Sender: TObject);
var Cur_Item: String;
begin
   if not VarIsNull(ZakazQuery['ITEM'])then Cur_Item:= ZakazQuery['ITEM']
   else Cur_Item:='';
   ZakazQuery.DisableControls;
   ChangeWithCat;
   ZakazQuery.Active:= True;
   ZakazQuery.Locate('ITEM', Cur_Item, []);
   ZakazQuery.EnableControls;
end;

procedure TZakazFrm.ZakazQueryCalcFields(DataSet: TDataSet);
var i: Integer;
    All_Sum_OST, All_Sum_ZAK: Double;
begin
    All_Sum_OST:= 0;
    All_Sum_ZAK:= 0;
    for i:= 0 to ZakazQuery.Fields.Count - 1 do
    begin
      if (Pos('ZAK', ZakazQuery.Fields[i].FieldName) > 0)
        and not VarIsNull(ZakazQuery.Fields[i].Value) then
        All_Sum_ZAK:= All_Sum_ZAK + ZakazQuery.Fields[i].AsFloat;

      if (Pos('OST', ZakazQuery.Fields[i].FieldName) > 0)
        and not VarIsNull(ZakazQuery.Fields[i].Value) then
        All_Sum_OST:= All_Sum_OST + ZakazQuery.Fields[i].AsFloat;
    end;
   ZakazQueryALL_Z.Value:= All_Sum_ZAK;
   ZakazQueryALL_O.Value:= All_Sum_OST;
end;

procedure TZakazFrm.N1Click(Sender: TObject);
var CurItem: String;
    i: Integer;
    CurKolvo: Double;
    TmpDSep: Char;
begin // Заказ товаров до нормы
    if MessageDlg('Установить заказ на выбранные товары до нормы остатков ?',
        mtConfirmation, [mbYes,mbNo], 0) = IDYES then
    with ZakazQuery do
    begin
      Screen.Cursor:= crHourGlass;
      DisableControls;
      CurItem:= ZakazQuery['ITEM'];
      First;
      i:= FindMarketCode(MarketComboBox.Text);
      while not Eof do
      begin
        if not VarIsNull(ZakazQuery['NORM_O'])then
        begin
          if VarIsNull(ZakazQuery['OST'])or(ZakazQuery['OST'] < 0)then CurKolvo:= 0
          else CurKolvo:= ZakazQuery['OST'];
          if CurKolvo < ZakazQuery['NORM_O'] then
            with ShopMainForm.pFIBService do
            begin
              SelectSQL.Clear;
              SelectSQL.Add('select * from ZAKAZ where MARKET_CODE = ' + IntToStr(i));
              SelectSQL.Add('and ITEM = ''' + ZakazQuery['ITEM'] + '''');
              SelectSQL.Add('and AUTOR_KOD = ' + IntToStr(User_ID));
              Open;
              TmpDSep:= FormatSettings.DecimalSeparator;
              FormatSettings.DecimalSeparator:= '.';
              if VarIsNull(ShopMainForm.pFIBService['ITEM']) then
                ShopMainForm.pFIBDatabase1.Execute('insert into ZAKAZ(ITEM, MARKET_CODE, '
                  + 'KOLVO, AUTOR_KOD) values(''' + ZakazQuery['ITEM'] + ''','
                  + IntToStr(i) + ', ' + FloatToStrF(ZakazQuery['NORM_O'] - CurKolvo, ffFixed, 15, 3)
                  + ', ' + IntToStr(User_ID) + ')')
              else
                ShopMainForm.pFIBDatabase1.Execute('update ZAKAZ set KOLVO = '
                  + FloatToStrF(ZakazQuery['NORM_O'] - CurKolvo, ffFixed, 15, 3)
                  + ' where ITEM = ''' + ZakazQuery['ITEM'] + ''''
                  + ' and MARKET_CODE = ' + IntToStr(i)
                  + ' and AUTOR_KOD = ' + IntToStr(User_ID));
              FormatSettings.DecimalSeparator:= TmpDSep;
              Close;
            end;
        end;
        Next;
      end;
      Close;
      Open;
      Locate('ITEM', CurItem, []);
      EnableControls;
      Screen.Cursor:= crDefault;
    end;
end;


procedure TZakazFrm.ZakazQueryFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var i: Integer;
    All_Sum: Double;
begin
      if ZakazQuery.SelectSQL[ZakazQuery.SelectSQL.Count - 4] + ZakazQuery.SelectSQL[ZakazQuery.SelectSQL.Count - 2] > '' then
        case ZakazFilterFrm.ZakazFltrComboBox.ItemIndex of
         0: Accept:= True;
         1: Accept:= not VarIsNull(ZakazQuery['ZAK']);
         2: begin
              All_Sum:= 0;
              for i:= 11 to ZakazQuery.Fields.Count - 1 do
              begin
                if (Pos('ZAK', ZakazQuery.Fields[i].FieldName) > 0)
                    and not VarIsNull(ZakazQuery.Fields[i].Value) then
                  All_Sum:= All_Sum + ZakazQuery.Fields[i].AsFloat;
              end;
              Accept:= All_Sum > 0;
            end;
        end;
end;

procedure TZakazFrm.SaveZakazBtnClick(Sender: TObject);
begin
      PopupMenu2.Popup(ZakazFrm.Left + SaveZakazBtn.Left + 10,
          ZakazFrm.Top + SaveZakazBtn.Top + SaveZakazBtn.Height + 10);
end;

procedure TZakazFrm.N5Click(Sender: TObject);
begin
   with SaveDialog1 do
   begin
     InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
     Filter:= 'Файлы заказов (*.zak)|*.zak';
     DefaultExt:= 'zak';
   end;

   if SaveDialog1.Execute then
     with ShopMainForm.pFIBService do
     begin
       SelectSQL.Clear;
       SelectSQL.Add('select Z.ITEM, Z.KOLVO, Z.MARKET_CODE from ZAKAZ Z left join SPR_TOVAR T on T.ITEM = Z.ITEM');
       SelectSQL.Add('where Z.AUTOR_KOD = ' + User_ID.ToString);
       SelectSQL.Add('order by T.TOVAR_NAME');
       Open;

       Screen.Cursor:= crHourGlass;
       AssignFile(f, SaveDialog1.FileName);
       Rewrite(f);
      try
       FormatSettings.DecimalSeparator:= '.';
       while not Eof do
       begin
         Writeln(f, ';' + ShopMainForm.pFIBService['ITEM'] + ';'
                  + FloatToStrF(ShopMainForm.pFIBService['KOLVO'], ffGeneral, 15, 3) + ';'
                  + IntToStr(ShopMainForm.pFIBService['MARKET_CODE']) + ';');
         Next;
       end;
      finally
        CloseFile(f);
        Screen.Cursor:= crDefault;
        FormatSettings.DecimalSeparator:= TmpSep;

      end;

       Close;
     end;
end;

procedure TZakazFrm.N6Click(Sender: TObject);
begin
 if MessageDlg('Текущий заказ будет очищен. Продолжить ?', mtWarning, [mbYes, mbNo], 0) = ID_YES then
 begin
   OpenDialog1.InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
   if OpenDialog1.Execute then
     begin
       ExecSQLStr('delete from ZAKAZ where AUTOR_KOD = ' + User_ID.ToString);
       AssignFile(f, OpenDialog1.FileName);
       Reset(f);
      try
       while not Eof(f) do
       begin
         Readln(f, CurStr);
         ExecSQLStr('insert into ZAKAZ(MARKET_CODE, ITEM, KOLVO, AUTOR_KOD) values('
           + GetStrParam(CurStr, 3) + ', ''' + GetStrParam(CurStr, 1) + ''', '
           + GetStrParam(CurStr, 2) + ', ' + User_ID.ToString + ')');
       end;
//       if VarIsNull(ZakazQuery['ITEM'])then CurStr:= '' else CurStr:= ZakazQuery['ITEM'];
       ZakazQuery.ReopenLocate('ITEM');
      finally
       CloseFile(f);
      end;
     end;
 end;
end;

procedure TZakazFrm.NormOstLoadMenuItemClick(Sender: TObject);
var CurItem, CurMarket, CurNorm, CurMin: String;
begin
 if MessageDlg('Нормы остатков для текущих товаров будут загруженны из файла. Продолжить ?', mtWarning, [mbYes, mbNo], 0) = ID_YES then
 begin
   OpenDialog1.InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
   OpenDialog1.Filter:= 'Файлы норм остатков|*.ost';
   if OpenDialog1.Execute then
     begin
       Screen.Cursor:= crHourGlass;
       ZakazQuery.DisableControls;
       AssignFile(f, OpenDialog1.FileName);
       Reset(f);
      try
       while not Eof(f) do
       begin
         Readln(f, CurStr);
         CurItem:= GetStrParam(CurStr, 1);
         CurNorm:= GetStrParam(CurStr, 2);
         CurMin:= GetStrParam(CurStr, 3);
         CurMarket:= GetStrParam(CurStr, 4);
         //  Если находим товар из файла в текущем просмотре товара
         if ZakazQuery.Locate('ITEM', CurItem, [])then
           // Если Norm_ost и Min_Ost равны 0, удаляем позицию из SPR_NORM_OST для текущего товара и объекта
           if StrToFloat(CurNorm) + StrToFloat(CurMin) = 0 then
             ShopMainForm.pFIBDatabase1.Execute('delete from SPR_NORM_OST where ITEM = ' + CurItem
              + ' and MARKET_CODE = ' + CurMarket)
           // Иначе добавляем или обновляем норму остатков для текущего товара и объекта
           else ShopMainForm.pFIBDatabase1.Execute('update or insert into SPR_NORM_OST(ITEM, MARKET_CODE, NORM_OST, MIN_OST)'
              + ' values(''' + CurItem + ''', ' + CurMarket + ', ' + CurNorm + ', ' + CurMin + ') matching(ITEM, MARKET_CODE)');
       end;
      finally
        CloseFile(f);
        ZakazQuery.ReopenLocate('ITEM');
        ZakazQuery.EnableControls;
        Screen.Cursor:= crDefault;
        OpenDialog1.Filter:= 'Файлы заказов|*.zak';
      end;
     end;
   end;
end;

procedure TZakazFrm.NormOstSaveMenuItemClick(Sender: TObject);
var CurItem, CurMarket, CurNorm, CurMin: String;
    AllObj: Boolean;
begin
   SaveDialog1.InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
   SaveDialog1.Filter:= 'Файлы норм остатков|*.ost';
   SaveDialog1.DefaultExt:= 'ost';
   if SaveDialog1.Execute then
       with ZakazQuery do
       begin
         Screen.Cursor:= crHourGlass;
         DisableControls;
         CurItem:= ZakazQuery['ITEM'];
         AllObj:= MessageDlg('По всем объектам', mtConfirmation, mbYesNo, 0) <> mrYes;
         First;
         AssignFile(f, SaveDialog1.FileName);
         Rewrite(f);
        try
         while not Eof do
         begin
           with ShopMainForm.pFIBService.SelectSQL do
           begin
             Clear;
             Add('select * from SPR_NORM_OST o');
             Add('where o.ITEM = ' + ZakazQuery['ITEM']);
             if (not AllObj) then Add('and o.MARKET_CODE = ' + IntToStr(FindMarketCode(MarketComboBox.Text)));
             Open;
           end;

           while not ShopMainForm.pFIBService.Eof do
           begin
             CurMarket:= IntToStr(ShopMainForm.pFIBService['MARKET_CODE']);
             if VarIsNull(ShopMainForm.pFIBService['NORM_OST']) then CurNorm:= '0'
             else CurNorm:= FloatToStrF(ShopMainForm.pFIBService['NORM_OST'], ffGeneral, 15, 3);
             if VarIsNull(ShopMainForm.pFIBService['MIN_OST']) then CurMin:= '0'
             else CurMin:= StringReplace(FloatToStrF(ShopMainForm.pFIBService['MIN_OST'], ffGeneral, 15, 3), ',', '.', []);

             Writeln(f, ';' + ShopMainForm.pFIBService['ITEM'] + ';' + CurNorm + ';' + CurMin + ';' + CurMarket + ';');

             ShopMainForm.pFIBService.Next;
           end;

           Next;
         end;
        finally
          CloseFile(f);
          Screen.Cursor:= crDefault;
          ZakazQuery.Locate('ITEM', CurItem, []);
          EnableControls;
          SaveDialog1.Filter:= 'Файлы заказов|*.zak';
          SaveDialog1.DefaultExt:= 'zak';
        end;
       end;
end;

procedure TZakazFrm.SaveLoadFromObj(Sender: TObject);
var i,j: Integer;
    Cur_Item: String;
begin
   if (Sender as TMenuItem).Caption = MarketComboBox.Text then
     MessageDlg('Нельзя произвести переброску внутри объекта', mtWarning, [mbOK], 0)
   else
   if not VarIsNull(ZakazQuery['ITEM'])then
     begin
       with ShopMainForm.pFIBService do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select max(doc_number) MAX_NUM from hdr_prihod');
         SelectSQL.Add('where doc_type = 7 and market_code = ' + IntToStr(MarketComboBox.Tag));
         Open;
         if VarIsNull(ShopMainForm.pFIBService['MAX_NUM'])then i:= 1
         else i:= ShopMainForm.pFIBService['MAX_NUM'] + 1;
         Close;
       end;
       pFIBStoredProc1.ExecProc;
       j:= pFIBStoredProc1.ParamValue('TMP_CODE');
       ShopMainForm.pFIBDatabase1.Execute('insert into HDR_TMP_DOC(KOD, AUTOR_KOD, '
         + 'DOC_DATE, DOC_NUMBER,  DOC_TYPE, VENDOR_CODE, MARKET_CODE)'
         + ' values (' + IntToStr(j) + ', ' + IntToStr(User_ID) + ', '''
         + DateTimeToStr(Now) + ''', ' + IntToStr(i) + ', 7, '
         + IntToStr(FindMarketCode((Sender as TMenuItem).Caption)) + ', '
         + IntToStr(MarketComboBox.Tag) + ')');

       with ZakazQuery do
       begin
         DisableControls;
         Cur_Item:= ZakazQuery['ITEM'];
         First;
         FormatSettings.DecimalSeparator:= '.';
         while not Eof do
         begin
           if not VarIsNull(ZakazQuery['ZAK']) then
             ShopMainForm.pFIBDatabase1.Execute('insert into POS_TMP_DOC(KOD, '
               + 'ITEM, KOLVO, PRICE, VEND_PRICE, MARKET_CODE)'
               + 'values (' + IntToStr(j)+ ', ''' + ZakazQuery['ITEM']
               + ''', ' + FloatToStr(ZakazQuery['ZAK']) + ', '
               + FloatToStr(ZakazQuery['SALE_PRICE']) + ', '
               + FloatToStr(ZakazQuery['VEND_PRICE']) + ', '
               + IntToStr(MarketComboBox.Tag) + ')');
           Next;
         end;
         FormatSettings.DecimalSeparator:= TmpSep;
         Locate('ITEM', Cur_Item, []);
         EnableControls;
       end;
     end;
end;

procedure TZakazFrm.BitBtn7Click(Sender: TObject);
begin
       with ShopMainForm.frxReport1 do
       begin
         LoadFromFile(ShopIni.ReadString('Reports', 'Reserv', ReportsPath + 'Reserv.fr3'));
         ShowReport;
       end;  
end;

procedure TZakazFrm.N10Click(Sender: TObject);
begin
   ListBox1.Items.Clear;
   OpenDialog1.InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
   if OpenDialog1.Execute then
   begin
     ListBox1.Items.LoadFromFile(OpenDialog1.FileName);
     for frxPos:= 0 to ListBox1.Count - 1 do
       with ShopMainForm.pFIBService do
       begin
         SelectSQL.Clear;
         SelectSQL.Add('select T.TOVAR_NAME, A.SCLAD, T.ARTIKUL, T.REMARK from SPR_TOVAR T left join TOVAR_ADD A on T.ITEM = A.ITEM');
         SelectSQL.Add('where T.ITEM = ''' + GetStrParam(ListBox1.Items[frxPos], 1) + '''');
         Open;

         if VarIsNull(ShopMainForm.pFIBService['TOVAR_NAME']) then
           ListBox1.Items[frxPos]:= ';' + ListBox1.Items[frxPos]
         else
           ListBox1.Items[frxPos]:= ';' + StringReplace(ShopMainForm.pFIBService['TOVAR_NAME'], ';', '', [rfReplaceAll]) + ListBox1.Items[frxPos];

         if VarIsNull(ShopMainForm.pFIBService['SCLAD']) then
           ListBox1.Items[frxPos]:= ';' + ListBox1.Items[frxPos]
         else
           ListBox1.Items[frxPos]:= ';' + Trim(ShopMainForm.pFIBService['SCLAD']) + ListBox1.Items[frxPos];

         if VarIsNull(ShopMainForm.pFIBService['ARTIKUL']) then
           ListBox1.Items[frxPos]:= ListBox1.Items[frxPos] + ';'
         else
           ListBox1.Items[frxPos]:= ListBox1.Items[frxPos] + ShopMainForm.pFIBService['ARTIKUL'] + ';';

         if VarIsNull(ShopMainForm.pFIBService['REMARK']) then
           ListBox1.Items[frxPos]:= ListBox1.Items[frxPos] + ';'
         else
           ListBox1.Items[frxPos]:= ListBox1.Items[frxPos] + ShopMainForm.pFIBService['REMARK'] + ';';

         Close;
       end;
     ListBox1.Sorted:= False;
     ListBox1.Sorted:= True;
//     ListBox1.Items.LoadFromFile('c:\zakaz.txt');
     frxReport1.LoadFromFile(ShopIni.ReadString('Reports', 'ZakazFile', ReportsPath + 'ZakazFile.fr3'));
     frxReport1.ShowReport;
   end;
end;

procedure TZakazFrm.frxUserDataSet1First(Sender: TObject);
begin
  frxPos:= 0;
  ZEof:= False;
end;

procedure TZakazFrm.frxUserDataSet1CheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
   Eof:= ZEof;
end;

procedure TZakazFrm.frxUserDataSet1Next(Sender: TObject);
begin
  Inc(frxPos);
  ZEof:= frxPos = ListBox1.Count;
  if frxPos > ListBox1.Count - 1 then frxPos:= ListBox1.Count - 1;
end;

procedure TZakazFrm.frxUserDataSet1GetValue(const VarName: String;
  var Value: Variant);
begin
  if AnsiCompareText('ITEM', VarName) = 0 then Value:= GetStrParam(ListBox1.Items[frxPos], 3);
  if AnsiCompareText('KOLVO', VarName) = 0 then Value:= GetStrParam(ListBox1.Items[frxPos], 4);
  if AnsiCompareText('TOVAR_NAME', VarName) = 0 then Value:= GetStrParam(ListBox1.Items[frxPos], 2);
  if AnsiCompareText('ARTIKUL', VarName) = 0 then Value:= GetStrParam(ListBox1.Items[frxPos], 6);
  if AnsiCompareText('REMARK', VarName) = 0 then Value:= GetStrParam(ListBox1.Items[frxPos], 7);
  if AnsiCompareText('SCLAD', VarName) = 0 then Value:= GetStrParam(ListBox1.Items[frxPos], 1);
end;

procedure TZakazFrm.N11Click(Sender: TObject);
var CurItem: String;
    i,j: Integer;
    CurKolvo, Sum_Norm: Double;
    TmpDSep: Char;
begin   // Заказ товаров до нормы по всем объектам
  if MessageDlg('Установить заказ на выбранные товары до нормы остатков по всем объектам ?',
      mtConfirmation, [mbYes,mbNo], 0) = IDYES then
    with ZakazQuery do
    begin
      Screen.Cursor:= crSQLWait;
      DisableControls;
      CurItem:= ZakazQuery['ITEM'];
      First;
      i:= FindMarketCode(MarketComboBox.Text);
      while not Eof do
      begin
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select sum(NORM_OST) as NORM_O from SPR_NORM_OST where ITEM = ''' + ZakazQuery['ITEM'] + '''');
          Open;
          if not VarIsNull(ShopMainForm.pFIBService['NORM_O'])then
          begin
            Sum_Norm:= ShopMainForm.pFIBService['NORM_O'];
            CurKolvo:= 0;
            for j:= 11 to ZakazQuery.Fields.Count - 1 do
            begin
              if (Pos('OST', ZakazQuery.Fields[j].FieldName) > 0)
                and not VarIsNull(ZakazQuery.Fields[j].Value) then
                CurKolvo:= CurKolvo + ZakazQuery.Fields[j].AsFloat;
            end;
            if CurKolvo < 0 then CurKolvo:= 0;
            if CurKolvo < Sum_Norm then
              with ShopMainForm.pFIBService do
              begin
                Close;
                SelectSQL.Clear;
                SelectSQL.Add('select * from ZAKAZ where MARKET_CODE = ' + IntToStr(i));
                SelectSQL.Add('and ITEM = ''' + ZakazQuery['ITEM'] + '''');
                SelectSQL.Add('and AUTOR_KOD = ' + IntToStr(User_ID));
                Open;
                TmpDSep:= FormatSettings.DecimalSeparator;
                FormatSettings.DecimalSeparator:= '.';
                if VarIsNull(ShopMainForm.pFIBService['ITEM']) then
                  ShopMainForm.pFIBDatabase1.Execute('insert into ZAKAZ(ITEM, MARKET_CODE, KOLVO, AUTOR_KOD)'
                    + ' values(''' + ZakazQuery['ITEM'] + ''','
                    + IntToStr(i) + ', ' + FloatToStrF(Sum_Norm - CurKolvo, ffFixed, 15, 3)
                    + ', ' + IntToStr(User_ID) + ')')
                else
                  ShopMainForm.pFIBDatabase1.Execute('update ZAKAZ set KOLVO = '
                    + FloatToStrF(Sum_Norm - CurKolvo, ffFixed, 15, 3)
                    + ' where ITEM = ''' + ZakazQuery['ITEM'] + ''''
                    + ' and MARKET_CODE = ' + IntToStr(i)
                    + ' and AUTOR_KOD = ' + IntToStr(User_ID));
                FormatSettings.DecimalSeparator:= TmpDSep;
                Close;
              end;
          end;
          Close;
        end;
        Next;
      end;

      Locate('ITEM', CurItem, []);
      ReopenLocate('ITEM');
      EnableControls;
      Screen.Cursor:= crDefault;
    end;
end;

procedure TZakazFrm.ZakazQueryAfterOpen(DataSet: TDataSet);
begin
        ZakazFrm.Caption:= 'Заказ товаров (просмотр '
            + IntToStr(ZakazQuery.RecordCountFromSrv) + ' наименований)';
end;

procedure TZakazFrm.frxReport2BeforePrint(Sender: TfrxReportComponent);
var Cross: TfrxCrossView;
    i, j, i1: Integer;
    All_Sum: Double;
    Text: String;
begin
  if Sender is TfrxCrossView then
  begin
    Cross:= TfrxCrossView(Sender);
    ZakazQuery.First;
    i:= 0;
    while not ZakazQuery.Eof do
    begin
      for j:= 0 to DBGrid1.Columns.Count - 1 do
        if DBGrid1.Columns[j].Visible then
        begin
          Cross.AddValue([i], [DBGrid1.Columns[j].Title.Caption], [ZakazQuery.FieldByName(DBGrid1.Columns[j].FieldName).AsString]);
          Cross.Width:= DBGrid1.Columns[j].Width;
        end;
      ZakazQuery.Next;
      Inc(i);
    end;
  end;
end;

procedure TZakazFrm.N12Click(Sender: TObject);
var Page1: TfrxReportPage;
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
       j:= 0;
       for i:= 0 to DBGrid1.Columns.Count - 1 do
         if DBGrid1.Columns[i].Visible then j:= j + DBGrid1.Columns[i].Width;
       if j > 718 then Page1.Orientation:= poLandscape
       else Page1.Orientation:= poPortrait;
       ShowReport;
       ZakazQuery.GotoBookmark(CurPos);
       ZakazQuery.EnableControls;
     end;
end;

procedure TZakazFrm.N15Click(Sender: TObject);
begin
  Application.CreateForm(TZakazAutoForm, ZakazAutoForm);
  ZakazAutoForm.ShowModal;
  ZakazAutoForm.Free;
end;

procedure TZakazFrm.N16Click(Sender: TObject);
var curMarket, curItem: String;
begin
   SaveDialog1.InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
   if SaveDialog1.Execute then
     with ZakazQuery do
     begin
       Screen.Cursor:= crHourGlass;
       DisableControls;
       curItem:= ZakazQuery['ITEM'];
       curMarket:= FindMarketCode(MarketComboBox.Text).ToString;
       First;
       AssignFile(f, SaveDialog1.FileName);
       Rewrite(f);
      try
       while not Eof do
       begin
         if not VarIsNull(ZakazQuery['ZAK']) then
           Writeln(f, ';' + ZakazQuery['ITEM'] + ';'
             + StringReplace(FloatToStrF(ZakazQuery['ZAK'], ffGeneral, 15, 3), ',', '.', [])
             + ';' + curMarket + ';');
         Next;
       end;
      finally
        CloseFile(f);
        Screen.Cursor:= crDefault;
        ZakazQuery.Locate('ITEM', curItem, []);
        EnableControls;
      end;
     end;
end;

procedure TZakazFrm.N17Click(Sender: TObject);
var CurItem: String;
    i,j: Integer;
    CurKolvo, Sum_Norm, SumSale, k: Double;
begin   // Заказ товаров по статистике продаж
  Application.CreateForm(TZakazForPeriodForm, ZakazForPeriodForm);
  if ZakazForPeriodForm.ShowModal = mrOK then
  begin
    Screen.Cursor:= crSQLWait;
    ZakazQuery.DisableControls;
    CurItem:= ZakazQuery['ITEM'];
    ZakazQuery.First;
    i:= FindMarketCode(MarketComboBox.Text);
    k:= StrToInt(ZakazForPeriodForm.LabeledEdit1.Text) / (DaysBetween(ZakazForPeriodForm.DateTimePicker2.Date, ZakazForPeriodForm.DateTimePicker1.Date) + 1);

    if ZakazForPeriodForm.CheckBox2.Checked then
    begin // Очистка заказа
      ExecSQLStr('delete from ZAKAZ where AUTOR_KOD = ' + User_ID.ToString);
    end;


    while not ZakazQuery.Eof do
    begin
      SumSale:= 0;
      with ShopMainForm.pFIBService do
      begin
        SelectSQL.Clear;  // Продажи
        SelectSQL.Add('select SUM(P.KOLVO + 2*P.KOLVO*(CAST(P.NCARD as INTEGER)))SKOLVO from POS_SALES P');
        SelectSQL.Add('where SALE_DATE between ''' + DateTimeToStr(ZakazForPeriodForm.DateTimePicker1.Date)
            + ' 00:00:01'' and ''' + DateTimeToStr(ZakazForPeriodForm.DateTimePicker2.Date) + ' 23:59:59''');
        SelectSQL.Add(' and P.ITEM =  ''' + ZakazQuery['ITEM'] + '''');
        Open;
        if not VarIsNull(ShopMainForm.pFIBService['SKOLVO'])then SumSale:= SumSale + ShopMainForm.pFIBService['SKOLVO'];
        Close;
//          ShowMessage('Продажи ' + FloatToStr(SumSale) + ' (' + ZakazQuery['ITEM'] + ')');

        if ZakazForPeriodForm.CheckBox1.Checked then
        begin
          SelectSQL.Clear; // Расходные накладные
          SelectSQL.Add('select sum(p.kolvo) SKOLVO from pos_rashod p left join hdr_rashod h on h.kod = p.kod');
          SelectSQL.Add('where h.doc_type = 2 and p.item = ''' + ZakazQuery['ITEM'] + '''');
          SelectSQL.Add('and h.doc_date between ''' + DateTimeToStr(ZakazForPeriodForm.DateTimePicker1.Date)
             + ' 00:00:01'' and ''' + DateTimeToStr(ZakazForPeriodForm.DateTimePicker2.Date) + ' 23:59:59''');
          Open;
          if not VarIsNull(ShopMainForm.pFIBService['SKOLVO'])then SumSale:= SumSale + ShopMainForm.pFIBService['SKOLVO'];
          Close;
//            ShowMessage('Расходные накладные ' + FloatToStr(SumSale) + ' (' + ZakazQuery['ITEM'] + ')');

          SelectSQL.Clear; // Возвраты
          SelectSQL.Add('select sum(p.kolvo) SKOLVO from pos_prihod p left join hdr_prihod h on h.kod = p.kod');
          SelectSQL.Add('where h.doc_type = 10 and p.item = ''' + ZakazQuery['ITEM'] + '''');
          SelectSQL.Add('and h.doc_date between ''' + DateTimeToStr(ZakazForPeriodForm.DateTimePicker1.Date)
             + ' 00:00:01'' and ''' + DateTimeToStr(ZakazForPeriodForm.DateTimePicker2.Date) + ' 23:59:59''');
          Open;
          if not VarIsNull(ShopMainForm.pFIBService['SKOLVO'])then SumSale:= SumSale - ShopMainForm.pFIBService['SKOLVO'];
          Close;
//            ShowMessage('Возвраты ' + FloatToStr(SumSale) + ' (' + ZakazQuery['ITEM'] + ')');
        end;

        SumSale:= Trunc(SumSale * k + 0.5);
//          ShowMessage('Trunc ' + FloatToStr(SumSale) + ' (' + ZakazQuery['ITEM'] + ')');

        if ZakazForPeriodForm.CheckBox3.Checked or ZakazForPeriodForm.CheckBox4.Checked or ZakazForPeriodForm.CheckBox5.Checked then
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select sum(NORM_OST) as NORM_O from SPR_NORM_OST where ITEM = ''' + ZakazQuery['ITEM'] + '''');
          Open;
          if not VarIsNull(ShopMainForm.pFIBService['NORM_O'])then
          begin
            Sum_Norm:= ShopMainForm.pFIBService['NORM_O'];
            CurKolvo:= 0;
            for j:= 11 to ZakazQuery.Fields.Count - 1 do
            begin
              if (Pos('OST', ZakazQuery.Fields[j].FieldName) > 0)
                and not VarIsNull(ZakazQuery.Fields[j].Value) then
                CurKolvo:= CurKolvo + ZakazQuery.Fields[j].AsFloat;
            end;
            if CurKolvo < 0 then CurKolvo:= 0;

              // Превышение нормы
            if ZakazForPeriodForm.CheckBox4.Checked and (CurKolvo > Sum_Norm) then
                SumSale:= SumSale + Sum_Norm - CurKolvo;

              // Текущий остаток
            if ZakazForPeriodForm.CheckBox5.Checked and (CurKolvo > 0) then
                SumSale:= SumSale - CurKolvo;


            if SumSale < 0 then SumSale:= 0;

              // Заказ до нормы
            if ZakazForPeriodForm.CheckBox3.Checked and (CurKolvo < Sum_Norm) then
                SumSale:= SumSale + Sum_Norm - CurKolvo;

          end;
          Close;
//            ShowMessage('Заказ до нормы ' + FloatToStr(SumSale) + ' (' + ZakazQuery['ITEM'] + ')');
        end;


      end;

      if SumSale > 0 then
      begin
        if VarIsNull(ZakazQuery['ZAK']) then
          ExecSQLStr('insert into ZAKAZ(ITEM, MARKET_CODE, KOLVO, AUTOR_KOD)'
            + ' values(''' + ZakazQuery['ITEM'] + ''','
            + IntToStr(i) + ', ' + StringReplace(FloatToStrF(SumSale, ffFixed, 15, 3), ',', '.', [])
            + ', ' + IntToStr(User_ID) + ')')
        else
          ExecSQLStr('update ZAKAZ set KOLVO = KOLVO + '
            + StringReplace(FloatToStrF(SumSale, ffFixed, 15, 3), ',', '.', [])
            + ' where ITEM = ''' + ZakazQuery['ITEM'] + ''''
            + ' and MARKET_CODE = ' + IntToStr(i)
            + ' and AUTOR_KOD = ' + IntToStr(User_ID));
      end;
      ShopMainForm.pFIBService.Close;
      ZakazQuery.Next;
    end;



    ZakazQuery.Locate('ITEM', CurItem, []);
    ShopMainForm.pFIBDatabase1.CommitRetaining;
    ZakazQuery.ReopenLocate('ITEM');
    ZakazQuery.EnableControls;
    Screen.Cursor:= crDefault;
  end;
  ZakazForPeriodForm.Free;
end;

procedure TZakazFrm.MenuClick(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
  with ShopMainForm.frxReport1 do
  begin
    LoadFromFile(ReportsPath + 'ZAKAZ\' + (Sender as TMenuItem).Caption + '.fr3');
    FIBQuery1:= FindObject('FIBQuery1') as TfrxFIBQuery;
    FIBQuery1.SQL:= ZakazQuery.SelectSQL;
    Script.Variables['MARKET']:= MarketComboBox.Text;
    ShowReport;
  end
end;

procedure TZakazFrm.FormResize(Sender: TObject);
begin
//  SpeedButton2.Left:= Panel2.Width - 39;
end;

procedure TZakazFrm.FormShow(Sender: TObject);
begin
// SpeedButton2.Left:= Panel2.Width - 39;
end;

end.
