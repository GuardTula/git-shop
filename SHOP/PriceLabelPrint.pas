//****************************************************************************//
//                            © Guard  2003-2013                              //
//****************************************************************************//
unit PriceLabelPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, Buttons, ComCtrls, FIBDataSet,
  pFIBDataSet, frxFIBComponents, System.UITypes;

type
  TPriceLabelPrintFrm = class(TForm)
    Panel6: TPanel;
    CennikDBGrid: TDBGrid;
    Panel5: TPanel;
    Shape1: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    CennikTypeComboBox: TComboBox;
    DataSource6: TDataSource;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    CennikItemNameLabel: TLabel;
    CennikInsertBtn: TBitBtn;
    PrintCennikBtn: TBitBtn;
    CennikPriorBtn: TBitBtn;
    CennikNextBtn: TBitBtn;
    DeleteCennikBtn: TBitBtn;
    EraseCennikBtn: TBitBtn;
    CennikItemEdit: TEdit;
    CennikKolvoEdit: TEdit;
    ProducerEdit: TEdit;
    ArtikulEdit: TEdit;
    Memo1: TRichEdit;
    BitBtn2: TBitBtn;
    pCennikTable: TpFIBDataSet;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GR_nameEditEnter(Sender: TObject);
    procedure ProducerEditExit(Sender: TObject);
    procedure GR_nameEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CennikPriorBtnClick(Sender: TObject);
    procedure DeleteCennikBtnClick(Sender: TObject);
    procedure CennikNextBtnClick(Sender: TObject);
    procedure CennikItemEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CennikItemEditKeyPress(Sender: TObject; var Key: Char);
    procedure CennikKolvoEditChange(Sender: TObject);
    procedure CennikKolvoEditEnter(Sender: TObject);
    procedure CennikKolvoEditExit(Sender: TObject);
    procedure CennikKolvoEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CennikInsertBtnClick(Sender: TObject);
    procedure EraseCennikBtnClick(Sender: TObject);
    procedure PrintCennikBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSource6DataChange(Sender: TObject; Field: TField);
    procedure Name1EditChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure PriceGroupUpdate;
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ProducerEditChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateCennikSheet;
  end;

var
  PriceLabelPrintFrm: TPriceLabelPrintFrm;

implementation

uses ShopMain, Spr;

{$R *.dfm}

procedure TPriceLabelPrintFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        case Key of
         VK_ESCAPE: Close;
         VK_F5: BitBtn1.Click;
        end;
end;

procedure TPriceLabelPrintFrm.GR_nameEditEnter(Sender: TObject);
begin
        (Sender as TEdit).Color:= clYellow;
end;

procedure TPriceLabelPrintFrm.ProducerEditExit(Sender: TObject);
begin
        (Sender as TEdit).Color:= clWhite;
end;

procedure TPriceLabelPrintFrm.GR_nameEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = VK_RETURN then SelectNext(Sender as TWinControl, true, true);
end;

procedure TPriceLabelPrintFrm.UpdateCennikSheet;
var CennEn: Boolean;
begin
      CennEn:= not VarIsNull(pCennikTable['ITEM']);
      CennikDBGrid.Visible:= CennEn;
      DeleteCennikBtn.Enabled:= CennEn;
      PrintCennikBtn.Enabled:= CennEn;
      EraseCennikBtn.Enabled:= CennEn;
      BitBtn2.Enabled:= CennEn;
      Label11.Visible:= CennEn;
      Label9.Visible:= CennEn;
      Memo1.Visible:= CennEn;
      ArtikulEdit.Visible:= CennEn;
      ProducerEdit.Visible:= CennEn;

      CennikPriorBtn.Enabled:= not pCennikTable.Bof;
      CennikNextBtn.Enabled:= not pCennikTable.Eof;
      Panel5.Enabled:= False;
      if CennEn then begin
        Label11.Caption:= FloatToStrF(pCennikTable['SALE_PRICE'], ffCurrency, 12, 2);
        Label9.Caption:= pCennikTable['ITEM'];
        ArtikulEdit.Text:= '';
        ProducerEdit.Text:= '';
        Memo1.Lines.Clear;
        if not VarIsNull(pCennikTable['TOVAR_NAME'])then Memo1.Lines.Add(pCennikTable['TOVAR_NAME']);
        if not VarIsNull(pCennikTable['ARTIKUL'])then ArtikulEdit.Text:= pCennikTable['ARTIKUL'];
        if not VarIsNull(pCennikTable['PRODUCER'])then ArtikulEdit.Text:= pCennikTable['PRODUCER'];
      end;
end;

procedure TPriceLabelPrintFrm.CennikPriorBtnClick(Sender: TObject);
begin
        pCennikTable.Prior;
end;

procedure TPriceLabelPrintFrm.DeleteCennikBtnClick(Sender: TObject);
begin
  if MessageDlg('Удалить позицию с кодом ' + pCennikTable['ITEM'],
        mtConfirmation, [mbYes,mbNo], 0) = idYes then
    begin
      ShopMainForm.pFIBDatabase1.Execute('delete from CENNIK_PRN where ITEM =  ''' + pCennikTable['ITEM'] + '''');
      DataSetReOpen(pCennikTable);
      PriceGroupUpdate;
    end;
end;

procedure TPriceLabelPrintFrm.CennikNextBtnClick(Sender: TObject);
begin
        pCennikTable.Next;
end;

procedure TPriceLabelPrintFrm.CennikItemEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var i: String;
begin
      case Key of
 VK_RETURN: if(CennikItemEdit.Text <> '')then
        begin
          ShopMainForm.pFindTovarStoredProc.ParamByName('FIND_ITEM').AsString:= CennikItemEdit.Text;
          ShopMainForm.pFindTovarStoredProc.ExecProc;
          if ShopMainForm.pFindTovarStoredProc.ParamByName('RESULT').AsInteger = 0 then
          begin
            MessageDlg('Данный товар не зарегистрирован', mtInformation, [mbOK], 0);
            CennikItemEdit.SelectAll;
          end
          else
          begin
            CennikItemEdit.Text:= ShopMainForm.pFindTovarStoredProc.ParamByName('ITEM').AsString;
            CennikItemEdit.Enabled:= False;
            CennikItemNameLabel.Caption:= ShopMainForm.pFindTovarStoredProc.ParamByName('NAME').AsString;
            CennikItemNameLabel.Visible:= True;
            CennikInsertBtn.Enabled:= True;
            CennikKolvoEdit.Text:= '1';
            CennikKolvoEdit.Enabled:= True;
            CennikKolvoEdit.SetFocus;
          end;
        end;
 VK_INSERT:
        begin
           if VarIsNull(pCennikTable['ITEM'])then i:= ''else i:= pCennikTable['ITEM'];
           CennikItemEdit.Text:= ChangeWithCat;
           pCennikTable.Active:= True;
           pCennikTable.Locate('ITEM', i, []);
        end;
     end;
end;

procedure TPriceLabelPrintFrm.CennikItemEditKeyPress(Sender: TObject;
  var Key: Char);
begin
        if not(Key in [#8,'0'..'9'])then Key:= #0;
end;

procedure TPriceLabelPrintFrm.CennikKolvoEditChange(Sender: TObject);
begin
        if StrToInt('0' + CennikKolvoEdit.Text) > 10 then
        begin
          MessageDlg('Максимальное число одинаковых ценников равно 10', mtWarning, [mbOK], 0);
          CennikKolvoEdit.Text:= '10';
        end;
end;

procedure TPriceLabelPrintFrm.CennikKolvoEditEnter(Sender: TObject);
begin
        PriceLabelPrintFrm.KeyPreview:= False;
end;

procedure TPriceLabelPrintFrm.CennikKolvoEditExit(Sender: TObject);
begin
        PriceLabelPrintFrm.KeyPreview:= True;
end;

procedure TPriceLabelPrintFrm.CennikKolvoEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        case Key of
          VK_RETURN: CennikInsertBtn.Click;
          VK_ESCAPE:
          begin
            CennikItemNameLabel.Visible:= False;
            CennikKolvoEdit.Text:= '1';
            CennikKolvoEdit.Enabled:= False;
            CennikInsertBtn.Enabled:= False;
            CennikItemEdit.Enabled:= True;
            CennikItemEdit.SetFocus;
            Key:= 0;
          end;
        end;
end;

procedure TPriceLabelPrintFrm.CennikInsertBtnClick(Sender: TObject);
var i: Integer;
begin  // Добавление позиции для печати ценников
  if pCennikTable.Locate('ITEM', CennikItemEdit.Text, [loCaseInsensitive])then
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select count(ITEM) CNT from CENNIK_PRN where ITEM =  ''' + CennikItemEdit.Text + '''');
      Open;
      if ShopMainForm.pFIBService['CNT'] <> StrToInt(CennikKolvoEdit.Text)then
        if MessageDlg('  Данный товар уже добавлен,'+#13#10+'изменить количество ценников ?',
           mtConfirmation, [mbYes,mbNo], 0) = idYes then
          begin
            ShopMainForm.pFIBDatabase1.Execute('delete from CENNIK_PRN where ITEM =  ''' + CennikItemEdit.Text + '''');
            for i:= 1 to StrToInt(CennikKolvoEdit.Text)do
              ShopMainForm.pFIBDatabase1.Execute('insert into CENNIK_PRN(ITEM)'
                + ' values(''' + CennikItemEdit.Text + ''')');
            DataSetReOpen(pCennikTable);
          end;
      Close;
    end
  else
    begin
      for i:= 1 to StrToInt(CennikKolvoEdit.Text)do
        ShopMainForm.pFIBDatabase1.Execute('insert into CENNIK_PRN(ITEM)'
          + ' values(''' + CennikItemEdit.Text + ''')');
      DataSetReOpen(pCennikTable);
      PriceGroupUpdate;
    end;
   CennikItemNameLabel.Visible:= False;
   CennikKolvoEdit.Text:= '1';
   CennikKolvoEdit.Enabled:= False;
   CennikInsertBtn.Enabled:= False;
   pCennikTable.Locate('ITEM', CennikItemEdit.Text, [loCaseInsensitive]);
   CennikItemEdit.Text:= '';
   CennikItemEdit.Enabled:= True;
   CennikItemEdit.SetFocus;
end;

procedure TPriceLabelPrintFrm.EraseCennikBtnClick(Sender: TObject);
begin // Очистка таблицы ценников
     if MessageDlg('Очистить таблицу ценников ?',
        mtConfirmation, [mbYes,mbNo], 0) = idYes then
        begin
          ShopMainForm.pFIBDatabase1.Execute('delete from CENNIK_PRN');
          DataSetReOpen(pCennikTable);
          PriceGroupUpdate;
        end;
end;

procedure TPriceLabelPrintFrm.PrintCennikBtnClick(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
        with ShopMainForm.frxReport1 do
        begin
          LoadFromFile(ReportsPath + 'CENNIK\' + CennikTypeComboBox.Text + '.fr3');
          if ComboBox1.ItemIndex > 0 then
          begin
            FIBQuery1:= FindObject('CennikPRNDataTable') as TfrxFIBQuery;
            FIBQuery1.SQL[5]:= 'and A.PRICE_GROUP = ' + ComboBox1.Text;
          end;
          ShowReport;
        end;  
end;

procedure TPriceLabelPrintFrm.FormCreate(Sender: TObject);
var sr: TSearchRec;
begin
        PriceGroupUpdate;
        pCennikTable.Open;
        Label7.Caption:= OrgName;
        Label8.Caption:= DateToStr(Date);

        CennikTypeComboBox.Items.Clear;
        if FindFirst(ReportsPath + 'CENNIK\*.fr3', faanyfile, sr) = 0 then
        begin
          repeat
            if (sr.Attr and fadirectory) <> sr.Attr then
              CennikTypeComboBox.Items.Add(copy(sr.Name, 1, Length(sr.Name) - 4));
          until FindNext(sr) <> 0;
          FindClose(sr);
          CennikTypeComboBox.ItemIndex:= 0;
        end;
end;

procedure TPriceLabelPrintFrm.PriceGroupUpdate;
var CurGroup: String;
begin
        if ComboBox1.Items.Count > 0 then CurGroup:= ComboBox1.Text
        else CurGroup:= '';
        ComboBox1.Items.Clear;
        ComboBox1.Items.Add('Все группы');
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select distinct C.PRICE_GROUP');
          SelectSQL.Add('from CENNIK_PRN P left join TOVAR_ADD C on C.ITEM = P.ITEM');
          Open;
          while not Eof do
          begin
            if not VarIsNull(ShopMainForm.pFIBService['PRICE_GROUP'])then
              ComboBox1.Items.Add(IntToStr(ShopMainForm.pFIBService['PRICE_GROUP']));
            Next;
          end;
          Close;
          if CurGroup = '' then ComboBox1.ItemIndex:= 0
          else if FindString(CurGroup, ComboBox1.Items) > 0 then
                 ComboBox1.ItemIndex:= FindString(CurGroup, ComboBox1.Items)
               else
               begin
                 ComboBox1.ItemIndex:= 0;
                 ComboBox1Change(ComboBox1);
               end;
        end;
end;

procedure TPriceLabelPrintFrm.DataSource6DataChange(Sender: TObject;
  Field: TField);
begin
        UpdateCennikSheet;
        Edit1Change(Edit1);
end;

procedure TPriceLabelPrintFrm.Name1EditChange(Sender: TObject);
begin
        (Sender as TEdit).Text:= AnsiUpperCase((Sender as TEdit).Text);
end;

procedure TPriceLabelPrintFrm.Edit1Change(Sender: TObject);
begin
      BitBtn1.Enabled:= (Edit1.Text <> '')and(not VarIsNull(pCennikTable['ITEM']));
end;

procedure TPriceLabelPrintFrm.BitBtn1Click(Sender: TObject);
var CurItem: String;
begin
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from TOVAR_ADD where ITEM = ''' + pCennikTable['ITEM'] + '''');
          Open;
          if VarIsNull(ShopMainForm.pFIBService['ITEM'])then
            ShopMainForm.pFIBDatabase1.Execute('insert into TOVAR_ADD(ITEM, SCLAD, PRICE_GROUP)'
              + ' values(''' + pCennikTable['ITEM'] + ''', '''', ' + Edit1.Text + ')')
          else
          ShopMainForm.pFIBDatabase1.Execute('update TOVAR_ADD'
            + ' set PRICE_GROUP = ' + Edit1.Text
            + ' where ITEM = ''' + pCennikTable['ITEM'] + '''');
          Close;
        end;
        CurItem:= pCennikTable['ITEM'];
        with pCennikTable do
        begin
          DisableControls;
          Close;
          PriceGroupUpdate;
          Open;
          Locate('ITEM', CurItem, []);
          EnableControls;
        end;
end;

procedure TPriceLabelPrintFrm.ComboBox1Change(Sender: TObject);
begin
        with pCennikTable do
        begin
          DisableControls;
          Close;
          if ComboBox1.ItemIndex > 0 then
            SelectSQL[5]:= 'and A.PRICE_GROUP = ' + ComboBox1.Text
          else SelectSQL[5]:= '';
          Open;
          EnableControls;
        end;
end;

procedure TPriceLabelPrintFrm.ProducerEditChange(Sender: TObject);
begin
//    (Sender as TGEdit).Text:= AnsiUpperCase((Sender as TGEdit).Text);
end;

procedure TPriceLabelPrintFrm.BitBtn2Click(Sender: TObject);
begin
  with pCennikTable do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      if not VarIsNull(pCennikTable['ITEM'])then
      begin
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select sum(KOLVO)as KOLVO from TOVAR_OST');
          SelectSQL.Add('where ITEM = ''' + pCennikTable['ITEM'] + '''');
          SelectSQL.Add('and MARKET_CODE = ' + IntToStr(CurrentMarketCode));
          Open;
          if(VarIsNull(ShopMainForm.pFIBService['KOLVO']))or(ShopMainForm.pFIBService['KOLVO'] = 0)then
            ShopMainForm.pFIBDatabase1.Execute('delete from CENNIK_PRN where ITEM =  ''' + pCennikTable['ITEM'] + '''');
          Close;
        end;
      end;
      Next;
    end;
    DataSetReOpen(pCennikTable);
    PriceGroupUpdate;
    EnableControls;
  end;
end;

end.
