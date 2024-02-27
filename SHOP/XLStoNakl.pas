unit XLStoNakl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Tabs, XLSGrid5, Vcl.Grids, Data.DB,
  Vcl.DBGrids, Datasnap.DBClient, XLSDbRead5, XLSSheetData5, XLSReadWriteII5,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Samples.Spin, Datasnap.Provider,
  FIBDataSet, pFIBDataSet, Vcl.ComCtrls, System.ImageList, Vcl.ImgList, System.UITypes;

type
  TXLStoNaklForm = class(TForm)
    DBGrid1: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    XLS: TXLSReadWriteII5;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1VENDOR_CODE: TStringField;
    ClientDataSet1VENDOR_ARTIKUL: TStringField;
    ClientDataSet1VENDOR_NAME: TStringField;
    ClientDataSet1VENDOR_PRICE: TFloatField;
    ClientDataSet1KOLVO: TFloatField;
    ClientDataSet1ITEM: TStringField;
    ClientDataSet1TOVAR_NAME: TStringField;
    ClientDataSet1SALE_PRICE: TFloatField;
    dlgOpen: TOpenDialog;
    DataSetProvider1: TDataSetProvider;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    SpinEdit7: TSpinEdit;
    SpinEdit6: TSpinEdit;
    SpinEdit5: TSpinEdit;
    BitBtn1: TBitBtn;
    edFilename: TEdit;
    Button3: TButton;
    ClientDataSet1SPR_PRICE: TFloatField;
    ClientDataSet1CHARGE: TFloatField;
    ClientDataSet1EXTRA_CHARGE: TIntegerField;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    dlgSave: TSaveDialog;
    TabSheet4: TTabSheet;
    BitBtn7: TBitBtn;
    CheckBox2: TCheckBox;
    ClientDataSet1SPR_VENDOR_PRICE: TFloatField;
    ClientDataSet1SPR_CHARGE: TFloatField;
    BitBtn8: TBitBtn;
    pFIBDataSet1: TpFIBDataSet;
    procedure Button3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ClientDataSet1CHARGEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ClientDataSet1CHARGESetText(Sender: TField; const Text: string);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientDataSet1SPR_CHARGEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  XLStoNaklForm: TXLStoNaklForm;

implementation

uses ShopMain;

{$R *.dfm}

procedure TXLStoNaklForm.BitBtn1Click(Sender: TObject);
var i: integer;
begin
  XLS.Filename := edFilename.Text;
  XLS.Read;
  XLS[0].CalcDimensions;
  ClientDataSet1.Close;
  ClientDataSet1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Saves\ImportDoc.cds');
  ClientDataSet1.Open;

  for i:= SpinEdit6.Value - 1 to SpinEdit6.Value + SpinEdit5.Value - 2 do
  begin
    ClientDataSet1.Append;
    ClientDataSet1['VENDOR_CODE']:= XLS[0].AsString[SpinEdit1.Value - 1, i];
    ClientDataSet1['VENDOR_ARTIKUL']:= XLS[0].AsString[SpinEdit7.Value - 1, i];
    ClientDataSet1['VENDOR_NAME']:= XLS[0].AsString[SpinEdit2.Value - 1, i];
    ClientDataSet1['VENDOR_PRICE']:= XLS[0].AsString[SpinEdit3.Value - 1, i];
    ClientDataSet1['KOLVO']:= XLS[0].AsString[SpinEdit4.Value - 1, i];
    ClientDataSet1.Post;
  end;
end;

procedure TXLStoNaklForm.BitBtn2Click(Sender: TObject);
var SQLStr, Vend_Field, Spr_Field: string;
begin
   case RadioGroup1.ItemIndex of
     0: Vend_Field:= 'VENDOR_CODE';
     1: Vend_Field:= 'VENDOR_ARTIKUL';
   end;
   case RadioGroup2.ItemIndex of
     0: Spr_Field:= 'REMARK';
     1: Spr_Field:= 'ARTIKUL';
     2: Spr_Field:= 'REMARK_1';
   end;
   ClientDataSet1.First;

   while not ClientDataSet1.Eof do
   begin
     if not CheckBox1.Checked or (CheckBox1.Checked and VarIsNull(ClientDataSet1['ITEM']))then
       if not VarIsNull(ClientDataSet1[Vend_Field]) and (ClientDataSet1[Vend_Field] > '') then
       begin
         SQLStr:= 'select t.item, t.tovar_name, p.sale_price, p.vend_price, c.extra_charge from spr_tovar t '
           + 'left join prices p on t.item = p.item '
           + 'left join spr_charge c on t.item = c.item where ';
         if CheckBox2.Checked then
           SQLStr:= SQLStr + 'replace(replace(replace(' + Spr_Field + ', ''-'', ''''), ''.'', ''''), '' '', '''')'
           + ' like ''%' + StringReplace(StringReplace(StringReplace(ClientDataSet1[Vend_Field], '-', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), ' ', '', [rfReplaceAll]) + '%'''
         else
           SQLStr:= SQLStr + Spr_Field + ' like ''' + ClientDataSet1[Vend_Field] + '''';
         pFIBDataSet1.SelectSQL.Clear;
         pFIBDataSet1.SelectSQL.Add(SQLStr);
         pFIBDataSet1.Open;
         if not VarIsNull(pFIBDataSet1['ITEM']) then
         begin
           ClientDataSet1.Edit;
           ClientDataSet1['ITEM']:= pFIBDataSet1['ITEM'];
           ClientDataSet1['TOVAR_NAME']:= pFIBDataSet1['TOVAR_NAME'];
           ClientDataSet1['SALE_PRICE']:= pFIBDataSet1['SALE_PRICE'];
           ClientDataSet1['SPR_PRICE']:= pFIBDataSet1['SALE_PRICE'];
           ClientDataSet1['SPR_VENDOR_PRICE']:= pFIBDataSet1['VEND_PRICE'];
           if not VarIsNull(pFIBDataSet1['EXTRA_CHARGE']) and pFIBDataSet1['EXTRA_CHARGE'] > 0 then

           ClientDataSet1['EXTRA_CHARGE']:= pFIBDataSet1['EXTRA_CHARGE'];
           ClientDataSet1.Post;
         end;
         pFIBDataSet1.Close;
       end;
     ClientDataSet1.Next;
   end;
end;

procedure TXLStoNaklForm.BitBtn3Click(Sender: TObject);
var ItemFromCat: string;
begin
  ItemFromCat:= ChangeWithCat;
  if (ItemFromCat > '') then
  begin
    pFIBDataSet1.SelectSQL.Clear;
    pFIBDataSet1.SelectSQL.Add('select t.item, t.tovar_name, p.sale_price from spr_tovar t '
         + 'left join prices p on t.item = p.item where t.item = ''' + ItemFromCat + '''');
    pFIBDataSet1.Open;
    ClientDataSet1.Edit;
    ClientDataSet1['ITEM']:= pFIBDataSet1['ITEM'];
    ClientDataSet1['TOVAR_NAME']:= pFIBDataSet1['TOVAR_NAME'];
    ClientDataSet1['SALE_PRICE']:= pFIBDataSet1['SALE_PRICE'];
    ClientDataSet1['SPR_PRICE']:= pFIBDataSet1['SALE_PRICE'];
    ClientDataSet1.Post;
    pFIBDataSet1.Close;
  end;
end;

procedure TXLStoNaklForm.BitBtn4Click(Sender: TObject);
begin
 if MessageDlg('Текущие цены будут заменены. Продолжить ?', mtWarning, [mbYes, mbNo], 0) = ID_YES then
 begin
   ClientDataSet1.First;
   while not ClientDataSet1.Eof do
   begin
     if not VarIsNull(ClientDataSet1['ITEM']) and not VarIsNull(ClientDataSet1['EXTRA_CHARGE'])
       and not VarIsNull(ClientDataSet1['VENDOR_PRICE'])then
     begin
       ClientDataSet1.Edit;
       ClientDataSet1['SALE_PRICE']:= ClientDataSet1['VENDOR_PRICE'] + ClientDataSet1['VENDOR_PRICE'] * ClientDataSet1['EXTRA_CHARGE'] / 100;
       ClientDataSet1.Post;
     end;
     ClientDataSet1.Next;
   end;
 end;
end;

procedure TXLStoNaklForm.BitBtn5Click(Sender: TObject);
begin
 if MessageDlg('Текущие нормы в справочнике будут заменены. Продолжить ?', mtWarning, [mbYes, mbNo], 0) = ID_YES then
 begin
   ClientDataSet1.First;
   while not ClientDataSet1.Eof do
   begin
     if not VarIsNull(ClientDataSet1['EXTRA_CHARGE']) and not VarIsNull(ClientDataSet1['ITEM']) then
       ShopMainForm.pFIBDatabase1.Execute('update or insert into spr_charge(item, extra_charge)values('''
         + ClientDataSet1['ITEM'] + ''', ' + IntToStr(ClientDataSet1['EXTRA_CHARGE'])
         + ') matching(item)');
     ClientDataSet1.Next;
   end;
 end;
end;

procedure TXLStoNaklForm.BitBtn6Click(Sender: TObject);
begin
 if MessageDlg('Текущий документ будет заменен. Продолжить ?', mtWarning, [mbYes, mbNo], 0) = ID_YES then
   dlgOpen.InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
   dlgOpen.Filter:= 'Таблицы|*.xml';
   if dlgOpen.Execute then ClientDataSet1.LoadFromFile(dlgOpen.FileName);
   dlgOpen.Filter:= '';
end;

procedure TXLStoNaklForm.BitBtn7Click(Sender: TObject);
begin
   dlgSave.InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
   dlgSave.Filter:= 'Таблицы|*.xml';
   dlgSave.DefaultExt:= 'xml';
   if dlgSave.Execute then ClientDataSet1.SaveToFile(dlgSave.FileName);
   dlgSave.Filter:= '';
   dlgSave.DefaultExt:= '';
end;

procedure TXLStoNaklForm.BitBtn8Click(Sender: TObject);
begin
 if MessageDlg('Текущие цены будут заменены. Продолжить ?', mtWarning, [mbYes, mbNo], 0) = ID_YES then
 begin
   ClientDataSet1.First;
   while not ClientDataSet1.Eof do
   begin
     if not VarIsNull(ClientDataSet1['ITEM']) and not VarIsNull(ClientDataSet1['SPR_VENDOR_PRICE'])
       and not VarIsNull(ClientDataSet1['VENDOR_PRICE']) and not VarIsNull(ClientDataSet1['SPR_PRICE'])then
     begin
       ClientDataSet1.Edit;
       ClientDataSet1['SALE_PRICE']:= RoundEx(ClientDataSet1['VENDOR_PRICE']
        + ClientDataSet1['VENDOR_PRICE'] * ((((ClientDataSet1['SPR_PRICE'])-ClientDataSet1['SPR_VENDOR_PRICE'])/ClientDataSet1['SPR_VENDOR_PRICE'])*100) / 100 + 0.5, 1);
       ClientDataSet1.Post;
     end;
     ClientDataSet1.Next;
   end;
 end;
end;

procedure TXLStoNaklForm.Button3Click(Sender: TObject);
begin
  dlgOpen.FileName := edFilename.Text;
  if dlgOpen.Execute then
    edFilename.Text := dlgOpen.FileName;
end;

procedure TXLStoNaklForm.ClientDataSet1CHARGEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if VarIsNull(ClientDataSet1['SALE_PRICE']) or VarIsNull(ClientDataSet1['VENDOR_PRICE'])then
    Text:= ''
  else Text:= IntToStr((((ClientDataSet1['SALE_PRICE'])-ClientDataSet1['VENDOR_PRICE'])/ClientDataSet1['VENDOR_PRICE'])*100);


end;

procedure TXLStoNaklForm.ClientDataSet1CHARGESetText(Sender: TField;
  const Text: string);
begin
  if Text > '' then
  begin
    ClientDataSet1.Edit;
    ClientDataSet1['SALE_PRICE']:= ClientDataSet1['VENDOR_PRICE'] + ClientDataSet1['VENDOR_PRICE'] * StrToInt(Text) / 100;
    ClientDataSet1.Post;
  end;
end;

procedure TXLStoNaklForm.ClientDataSet1SPR_CHARGEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if VarIsNull(ClientDataSet1['SPR_PRICE']) or VarIsNull(ClientDataSet1['SPR_VENDOR_PRICE'])then
    Text:= ''
  else Text:= IntToStr((((ClientDataSet1['SPR_PRICE'])-ClientDataSet1['SPR_VENDOR_PRICE'])/ClientDataSet1['SPR_VENDOR_PRICE'])*100);
end;

procedure TXLStoNaklForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ShopIni.WriteString('XLSToNakl', 'XLSFileName', edFilename.Text);
  ShopIni.WriteInteger('XLSToNakl', 'Code', SpinEdit1.Value);
  ShopIni.WriteInteger('XLSToNakl', 'Name', SpinEdit2.Value);
  ShopIni.WriteInteger('XLSToNakl', 'Price', SpinEdit3.Value);
  ShopIni.WriteInteger('XLSToNakl', 'Kolvo', SpinEdit4.Value);
  ShopIni.WriteInteger('XLSToNakl', 'Count', SpinEdit5.Value);
  ShopIni.WriteInteger('XLSToNakl', 'Begin', SpinEdit6.Value);
  ShopIni.WriteInteger('XLSToNakl', 'Artikul', SpinEdit7.Value);
end;

procedure TXLStoNaklForm.FormCreate(Sender: TObject);
begin
  PageControl1Change(Sender);

  edFilename.Text:= ShopIni.ReadString('XLSToNakl', 'XLSFileName', '');
  SpinEdit1.Value:= ShopIni.ReadInteger('XLSToNakl', 'Code', 4);
  SpinEdit2.Value:= ShopIni.ReadInteger('XLSToNakl', 'Name', 19);
  SpinEdit3.Value:= ShopIni.ReadInteger('XLSToNakl', 'Price', 40);
  SpinEdit4.Value:= ShopIni.ReadInteger('XLSToNakl', 'Kolvo', 36);
  SpinEdit5.Value:= ShopIni.ReadInteger('XLSToNakl', 'Count', 37);
  SpinEdit6.Value:= ShopIni.ReadInteger('XLSToNakl', 'Begin', 10);
  SpinEdit7.Value:= ShopIni.ReadInteger('XLSToNakl', 'Artikul', 11);
end;

procedure TXLStoNaklForm.PageControl1Change(Sender: TObject);
begin
  DBGrid1.Columns[0].Visible:= PageControl1.ActivePageIndex < 2;
  DBGrid1.Columns[1].Visible:= PageControl1.ActivePageIndex < 2;
  DBGrid1.Columns[2].Visible:= PageControl1.ActivePageIndex < 2;
  DBGrid1.Columns[7].Visible:= PageControl1.ActivePageIndex >= 2;
  DBGrid1.Columns[9].Visible:= PageControl1.ActivePageIndex >= 2;
  DBGrid1.Columns[10].Visible:= PageControl1.ActivePageIndex >= 2;
end;

procedure TXLStoNaklForm.SpinEdit1Change(Sender: TObject);
begin
   if (Sender as TSpinEdit).Value <= 0 then (Sender as TSpinEdit).Value:= 1;
end;

end.
