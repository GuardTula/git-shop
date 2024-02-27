//****************************************************************************//
//                            © Guard  2003-2023                              //
//****************************************************************************//
unit IntMove;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FIBDataSet,
  pFIBDataSet, Data.DB,  Datasnap.DBClient, Datasnap.Provider, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons,  Vcl.Samples.Spin, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  System.ImageList, Vcl.ImgList, Vcl.Menus, IdBaseComponent, IdComponent, IdTCPConnection,
  IdExplicitTLSClientServerBase, IdFTP, IdFTPCommon, IdFTPList, IdTCPClient,
  IdAllFTPListParsers, frxClass, frxDBSet;

type
  TIntMoveForm = class(TForm)
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    pFIBDataSet1: TpFIBDataSet;
    dlgSave: TSaveDialog;
    dlgOpen: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    MarketComboBox: TComboBox;
    ClientDataSet2: TClientDataSet;
    ClearDocBitBtn: TBitBtn;
    IntMoveDataSet: TpFIBDataSet;
    TabSheet4: TTabSheet;
    QueueInsertXMLBitBtn: TBitBtn;
    FileInsertXMLBitBtn: TBitBtn;
    DelPosXMLBitBtn: TBitBtn;
    EditKolvoXMLBitBtn: TBitBtn;
    SprInsertXMLBitBtn: TBitBtn;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    OpenFileDocBitBtn: TBitBtn;
    SaveDocXMLBitBtn: TBitBtn;
    QueueInsertBitBtn: TBitBtn;
    FileInsertBitBtn: TBitBtn;
    SprInsertBitBtn: TBitBtn;
    DelPosBitBtn: TBitBtn;
    EditKolvoBitBtn: TBitBtn;
    SaveDocBitBtn: TBitBtn;
    IntMoveFolderBEdit: TButtonedEdit;
    ImageList1: TImageList;
    FileOpenDialog1: TFileOpenDialog;
    SavePopupMenu: TPopupMenu;
    N2: TMenuItem;
    FTP2: TMenuItem;
    FindEdit: TEdit;
    PrintZakazBtn: TBitBtn;
    StatusBar1: TStatusBar;
    ClientDataSet3: TClientDataSet;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure SaveDocBitBtnClick(Sender: TObject);
    procedure MarketComboBoxChange(Sender: TObject);
    procedure QueueInsertBitBtnClick(Sender: TObject);
    procedure SprInsertBitBtnClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DelPosBitBtnClick(Sender: TObject);
    procedure EditKolvoBitBtnClick(Sender: TObject);
    procedure FileInsertBitBtnClick(Sender: TObject);
    procedure ClearDocBitBtnClick(Sender: TObject);
    procedure OpenFileDocBitBtnClick(Sender: TObject);
    procedure SaveDocXMLBitBtnClick(Sender: TObject);
    procedure QueueInsertXMLBitBtnClick(Sender: TObject);
    procedure FileInsertXMLBitBtnClick(Sender: TObject);
    procedure SprInsertXMLBitBtnClick(Sender: TObject);
    procedure DelPosXMLBitBtnClick(Sender: TObject);
    procedure EditKolvoXMLBitBtnClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure IntMoveFolderBEditRightButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FTP2Click(Sender: TObject);
    procedure IntMoveDataSetFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FindEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IntMoveDataSetAfterOpen(DataSet: TDataSet);
    procedure PrintZakazBtnClick(Sender: TObject);
    procedure IntMoveDataSetBeforeClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IntMoveForm: TIntMoveForm;

implementation

uses ShopMain, Queue, EditEnter;

{$R *.dfm}

procedure TIntMoveForm.EditKolvoBitBtnClick(Sender: TObject);
begin
  Application.CreateForm(TEditEnterForm, EditEnterForm);
  EditEnterForm.Edit1.PasswordChar:= #0;
  EditEnterForm.Label1.Visible:= False;
  EditEnterForm.Caption:= 'Количество';
  EditEnterForm.Edit1.Text:= FloatToStrF(IntMoveDataSet['KOLVO'], ffGeneral, 12, 2);
  EditEnterForm.Edit1.Tag:= 1; // Ввод дробного числа
  if EditEnterForm.ShowModal = idOK then
  begin
      if StrToFloat('0' + EditEnterForm.Edit1.Text) > 0 then
      begin
        ExecSQLStr('update INT_MOVE set KOLVO = '
          + StringReplace(EditEnterForm.Edit1.Text, ',', '.', [])
          + ' where ITEM = ''' + IntMoveDataSet['ITEM']
          + ''' and SENDER_MARKET_CODE = '
          + IntToStr(IntMoveDataSet['SENDER_MARKET_CODE']) + ' and DEST_MARKET_CODE = ' + IntToStr(IntMoveDataSet['DEST_MARKET_CODE']));
        IntMoveDataSet.Transaction.CommitRetaining;
        IntMoveDataSet.ReopenLocate('ITEM');
      end;
  end;
  EditEnterForm.Free;
end;

procedure TIntMoveForm.EditKolvoXMLBitBtnClick(Sender: TObject);
begin
  Application.CreateForm(TEditEnterForm, EditEnterForm);
  EditEnterForm.Edit1.PasswordChar:= #0;
  EditEnterForm.Label1.Visible:= False;
  EditEnterForm.Caption:= 'Количество';
  EditEnterForm.Edit1.Tag:= 1; // Ввод дробного числа
//  EditEnterForm.Edit1.Text:= IntToStr(ClientDataSet1['KOLVO']);
  EditEnterForm.Edit1.Text:= FloatToStrF(ClientDataSet1['KOLVO'], ffGeneral, 12, 2);
  if EditEnterForm.ShowModal = idOK then
  begin
      if StrToFloat('0' + EditEnterForm.Edit1.Text) > 0 then
      begin
        ClientDataSet1.Edit;
        ClientDataSet1['KOLVO']:= StrToFloat('0' + EditEnterForm.Edit1.Text);
        ClientDataSet1.Post;
      end;
  end;
  EditEnterForm.Free;
end;

procedure TIntMoveForm.SprInsertBitBtnClick(Sender: TObject);
var ItemFromCat: string;
   DestMarketCode: Integer;
begin
  ItemFromCat:= ChangeWithCat;
  if (ItemFromCat > '') then
  begin
    DestMarketCode:= FindMarketCode(MarketComboBox.Text);
    ShopMainForm.ServiceQuery.SQL.Clear;
    ShopMainForm.ServiceQuery.SQL.Add('select kolvo from INT_MOVE where ITEM = '''
      + ItemFromCat + ''' and SENDER_MARKET_CODE = ' + CurrentMarketCode.ToString
      + ' and DEST_MARKET_CODE = ' + DestMarketCode.ToString);
    ShopMainForm.ServiceQuery.ExecQuery;
    if (ShopMainForm.ServiceQuery.FieldByName('KOLVO').AsFloat > 0) then
      MessageDlg('Данный товар уже добавлен',  mtInformation, [mbOk], 0)
    else
      ExecSQLStr('insert into INT_MOVE(ITEM,  KOLVO, SENDER_MARKET_CODE, DEST_MARKET_CODE)'
        + 'values(''' + ItemFromCat + ''', 1, ' + CurrentMarketCode.ToString + ', ' + DestMarketCode.ToString + ')');
    ShopMainForm.ServiceQuery.Close;
    with IntMoveDataSet do
    begin
      DisableControls;
      Close;
      Transaction.CommitRetaining;
      Open;
      IntMoveDataSet.Locate('ITEM', ItemFromCat, []);
      EnableControls;
    end;
    EditKolvoBitBtn.Click;
  end;
end;

procedure TIntMoveForm.SprInsertXMLBitBtnClick(Sender: TObject);
var ItemFromCat: string;
begin
  ItemFromCat:= ChangeWithCat;
  if (ItemFromCat > '') then
  begin
    pFIBDataSet1.SelectSQL.Clear;
    pFIBDataSet1.SelectSQL.Add('select t.item, t.tovar_name, p.sale_price from spr_tovar t '
         + 'left join prices p on t.item = p.item where t.item = ''' + ItemFromCat + '''');
    pFIBDataSet1.Open;
    if ClientDataSet1.Locate('ITEM', ItemFromCat, [])then
    begin
      ClientDataSet1.Edit;
      ClientDataSet1['KOLVO']:= ClientDataSet1['KOLVO'] + 1;
      ClientDataSet1.Post;
    end
    else
    begin
      ClientDataSet1.Append;;
      ClientDataSet1['ITEM']:= pFIBDataSet1['ITEM'];
      ClientDataSet1['TOVAR_NAME']:= pFIBDataSet1['TOVAR_NAME'];
      ClientDataSet1['KOLVO']:= 1;
      ClientDataSet1.Post;
      EditKolvoBitBtn.Click;
    end;
    pFIBDataSet1.Close;
  end;
end;

procedure TIntMoveForm.SaveDocBitBtnClick(Sender: TObject);
begin
  with ClientDataSet3 do
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
{
    with IndexDefs.AddIndexDef do
    begin
      Fields := 'Field1';
      Name := 'IntIndex';
    end;
}
    CreateDataSet;
    First;
    while not Eof do Delete;
    with IntMoveDataSet do
    begin
      DisableControls;
      First;
      while not Eof do
      begin
        ClientDataSet3.Append;
        ClientDataSet3['item']:= IntMoveDataSet['item'];
        ClientDataSet3['tovar_name']:= IntMoveDataSet['tovar_name'] ;
        ClientDataSet3['kolvo']:= IntMoveDataSet['kolvo'];
        ClientDataSet3['sender_market_code']:= IntMoveDataSet['sender_market_code'];
        ClientDataSet3['dest_market_code']:= IntMoveDataSet['dest_market_code'];
        ClientDataSet3.Post;
        Next;
      end;
      First;
      EnableControls;
    end;
  end;
  CurXY.X:= SaveDocBitBtn.Left + Trunc(SaveDocBitBtn.Width / 2);
  CurXY.Y:= SaveDocBitBtn.Top + Trunc(SaveDocBitBtn.Height / 2);
  CurXY:= ClientToScreen(CurXY);
  SavePopupMenu.Popup(CurXY.X, CurXY.Y);
end;

procedure TIntMoveForm.QueueInsertBitBtnClick(Sender: TObject);
var i: Integer;
 cur_item: string;
begin
    Application.CreateForm(TQueueFrm, QueueFrm);
    QueueFrm.N3.Visible:= False;
    QueueFrm.pFIBDataSet1.Open;
    if not VarIsNull(QueueFrm.pFIBDataSet1['QUEUE_NUMBER'])then
    begin
      QueueFrm.pFIBDataSet2.Open;
      if QueueFrm.ShowModal = IDOK then
        begin
//          if VarIsNull(IntMoveDataSet['ITEM']) then cur_item:= ''
  //        else cur_item:= IntMoveDataSet['ITEM'];

          CheckToIntMove(QueueFrm.pFIBDataSet1['QUEUE_NUMBER'], CurrentMarketCode, FindMarketCode(MarketComboBox.Text));
          IntMoveDataSet.Transaction.CommitRetaining;
          IntMoveDataSet.ReopenLocate('ITEM');

          if MessageDlg('Удалить чек из очереди ?',  mtConfirmation, [mbYes, mbNo], 0)= idYES then
            ExecSQLStr('delete from QUEUE'
                        + ' where QUEUE_NUMBER = ' + IntToStr(QueueFrm.pFIBDataSet1['QUEUE_NUMBER']));
        end;
    end
    else MessageDlg('Нет чеков в очереди', mtInformation, [mbOK], 0);

    QueueFrm.Free;
end;

procedure TIntMoveForm.QueueInsertXMLBitBtnClick(Sender: TObject);
var i: Integer;
 cur_item: string;
begin
    Application.CreateForm(TQueueFrm, QueueFrm);
    QueueFrm.pFIBDataSet1.Open;
    if not VarIsNull(QueueFrm.pFIBDataSet1['QUEUE_NUMBER'])then
    begin
      QueueFrm.pFIBDataSet2.Open;
      if QueueFrm.ShowModal = IDOK then
        begin
          cur_item:= QueueFrm.pFIBDataSet2['ITEM'];
          QueueFrm.pFIBDataSet2.First;
          while not QueueFrm.pFIBDataSet2.Eof do
          begin
            if ClientDataSet1.Locate('ITEM', QueueFrm.pFIBDataSet2['ITEM'], [])then
            begin
              ClientDataSet1.Edit;
              ClientDataSet1['KOLVO']:= ClientDataSet1['KOLVO'] + QueueFrm.pFIBDataSet2['KOLVO'];
              ClientDataSet1.Post;
            end
            else
            begin
              ClientDataSet1.Append;;
              ClientDataSet1['ITEM']:= QueueFrm.pFIBDataSet2['ITEM'];
              ClientDataSet1['TOVAR_NAME']:= QueueFrm.pFIBDataSet2['TOVAR_NAME'];
              ClientDataSet1['KOLVO']:= QueueFrm.pFIBDataSet2['KOLVO'];
              ClientDataSet1.Post;
            end;
            QueueFrm.pFIBDataSet2.Next;
          end;

          if MessageDlg('Удалить чек из очереди ?',  mtConfirmation, [mbYes, mbNo], 0)= idYES then
            ShopMainForm.pFIBDatabase1.Execute('delete from QUEUE'
                        + ' where QUEUE_NUMBER = ' + IntToStr(QueueFrm.pFIBDataSet1['QUEUE_NUMBER']));

        end;
    end
    else MessageDlg('Нет чеков в очереди', mtInformation, [mbOK], 0);
    QueueFrm.Free;
end;

procedure TIntMoveForm.OpenFileDocBitBtnClick(Sender: TObject);
begin
  dlgOpen.InitialDir:= IntMoveFolderBEdit.Text;
  dlgOpen.Filter:= 'Таблицы|*.xml';
  if dlgOpen.Execute then
  begin
    ClientDataSet1.LoadFromFile(dlgOpen.FileName);
  end;
  dlgOpen.Filter:= '';
end;

procedure TIntMoveForm.PrintZakazBtnClick(Sender: TObject);
begin
  frxReport1.LoadFromFile(ShopIni.ReadString('Reports', 'IntMoveRep', ReportsPath + 'IntMoveRep.fr3'));
  frxReport1.ShowReport;
end;

procedure TIntMoveForm.SaveDocXMLBitBtnClick(Sender: TObject);
begin
  dlgSave.InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
  dlgSave.Filter:= 'Таблицы|*.xml';
  dlgSave.DefaultExt:= 'xml';
  if dlgSave.Execute then ClientDataSet1.SaveToFile(dlgSave.FileName);
  dlgSave.Filter:= '';
  dlgSave.DefaultExt:= '';
end;

procedure TIntMoveForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  DelPosBitBtn.Enabled:= not VarIsNull(IntMoveDataSet['ITEM']);
  EditKolvoBitBtn.Enabled:= not VarIsNull(IntMoveDataSet['ITEM']);
  ClearDocBitBtn.Enabled:= not VarIsNull(IntMoveDataSet['ITEM']);
  SaveDocBitBtn.Enabled:= not VarIsNull(IntMoveDataSet['ITEM']);
end;

procedure TIntMoveForm.DataSource2DataChange(Sender: TObject; Field: TField);
begin
  DelPosXMLBitBtn.Enabled:= not VarIsNull(ClientDataSet1['ITEM']);
  EditKolvoXMLBitBtn.Enabled:= not VarIsNull(ClientDataSet1['ITEM']);
  SaveDocXMLBitBtn.Enabled:= not VarIsNull(ClientDataSet1['ITEM']);
end;

procedure TIntMoveForm.DBGrid1DblClick(Sender: TObject);
begin
  EditKolvoBitBtn.Click;
end;

procedure TIntMoveForm.DBGrid2DblClick(Sender: TObject);
begin
  EditKolvoXMLBitBtn.Click;
end;

procedure TIntMoveForm.IntMoveDataSetAfterOpen(DataSet: TDataSet);
begin
//  ClientDataSet3.Open;
end;

procedure TIntMoveForm.IntMoveDataSetBeforeClose(DataSet: TDataSet);
begin
//  ClientDataSet3.Close;
end;

procedure TIntMoveForm.IntMoveDataSetFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
//  Accept:= Pos(FindEdit.Text, IntMoveDataSet.FieldByName('ITEM').AsString + IntMoveDataSet.FieldByName('TOVAR_NAME').AsString) > 0;
end;

procedure TIntMoveForm.IntMoveFolderBEditRightButtonClick(Sender: TObject);
begin
  FileOpenDialog1.FileName:= IntMoveFolderBEdit.Text;
  if FileOpenDialog1.Execute then IntMoveFolderBEdit.Text:= FileOpenDialog1.FileName + '\';
end;

procedure TIntMoveForm.ClearDocBitBtnClick(Sender: TObject);
begin
  if MessageDlg('Очистить позиции документа ?',  mtWarning, [mbYes, mbNo], 0)= idYES then
    if MessageDlg('Если вы не отправили файл, то все данные будут утерянны. Очистить ?',  mtWarning, [mbYes, mbNo], 0)= idYES then
    begin
      ExecSQLStr('delete from INT_MOVE where '
        + ' SENDER_MARKET_CODE = ' + IntToStr(IntMoveDataSet['SENDER_MARKET_CODE'])
        + 'and DEST_MARKET_CODE = ' + IntToStr(IntMoveDataSet['DEST_MARKET_CODE']));
        ShopMainForm.pFIBDatabase1.CommitRetaining;
      IntMoveDataSet.ReopenLocate('ITEM');
    end;
end;

procedure TIntMoveForm.DelPosBitBtnClick(Sender: TObject);
begin
  if MessageDlg('Удалить товар из документа ?',  mtConfirmation, [mbYes, mbNo], 0)= idYES then
  begin
    ExecSQLStr('delete from INT_MOVE where ITEM = ''' + IntMoveDataSet['ITEM']
      + ''' and SENDER_MARKET_CODE = ' + IntToStr(IntMoveDataSet['SENDER_MARKET_CODE'])
      + 'and DEST_MARKET_CODE = ' + IntToStr(IntMoveDataSet['DEST_MARKET_CODE']));
    IntMoveDataSet.Transaction.CommitRetaining;
    IntMoveDataSet.ReopenLocate('ITEM');
  end;
end;

procedure TIntMoveForm.DelPosXMLBitBtnClick(Sender: TObject);
begin
  if MessageDlg('Удалить товар из документа ?',  mtConfirmation, [mbYes, mbNo], 0)= idYES then
  begin
    ClientDataSet1.Delete;
  end;
end;

procedure TIntMoveForm.FileInsertBitBtnClick(Sender: TObject);
var DestMarketCode: Integer;
    f: TextFile;
   CurStr, CurItem: String;
begin
   dlgOpen.InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
   dlgOpen.Filter:= 'Таблицы и заказы|*.xml;*.zak';
   if dlgOpen.Execute then
   begin
     dlgOpen.Filter:= '';
     IntMoveDataSet.DisableControls;
     DestMarketCode:= FindMarketCode(MarketComboBox.Text);
     if ExtractFileExt(dlgOpen.FileName) = '.xml' then
       begin
         ClientDataSet2.LoadFromFile(dlgOpen.FileName);
         ClientDataSet2.Open;
         while not ClientDataSet2.Eof do
         begin
           if IntMoveDataSet.Locate('ITEM', ClientDataSet2['ITEM'], [])then
           begin
             ExecSQLStr('update INT_MOVE set KOLVO = KOLVO + '
               + StringReplace(FloatToStr(ClientDataSet2['KOLVO']), ',', '.', [])
               + ' where ITEM = ''' + ClientDataSet2['ITEM']
               + ''' and SENDER_MARKET_CODE = '
               + CurrentMarketCode.ToString + ' and DEST_MARKET_CODE = ' + DestMarketCode.ToString)
            end
           else
           begin
             ExecSQLStr('insert into INT_MOVE(ITEM,  KOLVO, SENDER_MARKET_CODE, DEST_MARKET_CODE)'
               + 'values(''' + ClientDataSet2['ITEM'] + ''', ' + StringReplace(FloatToStr(ClientDataSet2['KOLVO']), ',', '.', [])
               + ', ' + CurrentMarketCode.ToString + ', ' + DestMarketCode.ToString + ')');
           end;
           ClientDataSet2.Next;
         end;
         ClientDataSet2.Close;
       end
       else
         if ExtractFileExt(dlgOpen.FileName) = '.zak' then
         begin
           AssignFile(f, dlgOpen.FileName);
           Reset(f);
          try
           while not Eof(f) do
           begin
             Readln(f, CurStr);
             CurItem:= GetStrParam(CurStr, 1);   // ITEM
{
         ShopMainForm.pFIBDatabase1.Execute('insert into ZAKAZ(MARKET_CODE, ITEM, KOLVO, AUTOR_KOD)'
           + ' values(' + GetStrParam(CurStr, 3) + ', ''' + GetStrParam(CurStr, 1) + ''', '
                   + GetStrParam(CurStr, 2) + ', ' + IntToStr(User_ID) + ')');

}
             if IntMoveDataSet.Locate('ITEM', CurItem, [])then
               ExecSQLStr('update INT_MOVE set KOLVO = KOLVO + '
                 + GetStrParam(CurStr, 2)
                 + ' where ITEM = ''' + CurItem
                 + ''' and SENDER_MARKET_CODE = '
                 + CurrentMarketCode.ToString + ' and DEST_MARKET_CODE = ' + DestMarketCode.ToString)
             else
               ExecSQLStr('insert into INT_MOVE(ITEM,  KOLVO, SENDER_MARKET_CODE, DEST_MARKET_CODE)'
                 + 'values(''' + CurItem + ''', ' + GetStrParam(CurStr, 2)
                 + ', ' + CurrentMarketCode.ToString + ', ' + DestMarketCode.ToString + ')');
           end;
          finally
            CloseFile(f);
          end;
         end;
     IntMoveDataSet.Transaction.CommitRetaining;
     IntMoveDataSet.ReopenLocate('ITEM');
     IntMoveDataSet.EnableControls;
   end;
end;

procedure TIntMoveForm.FileInsertXMLBitBtnClick(Sender: TObject);
begin
   dlgOpen.InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
   dlgOpen.Filter:= 'Таблицы|???_???.xml';
   if dlgOpen.Execute then ClientDataSet2.LoadFromFile(dlgOpen.FileName);
   dlgOpen.Filter:= '';
   ClientDataSet2.Open;
   while not ClientDataSet2.Eof do
   begin
     if ClientDataSet1.Locate('ITEM', ClientDataSet2['ITEM'], [])then
     begin
       ClientDataSet1.Edit;
       ClientDataSet1['KOLVO']:= ClientDataSet1['KOLVO'] + ClientDataSet2['KOLVO'];
       ClientDataSet1.Post;
     end
     else
     begin
       ClientDataSet1.Append;;
       ClientDataSet1['ITEM']:= ClientDataSet2['ITEM'];
       ClientDataSet1['TOVAR_NAME']:= ClientDataSet2['TOVAR_NAME'];
       ClientDataSet1['KOLVO']:= ClientDataSet2['KOLVO'];
       ClientDataSet1.Post;
     end;
     ClientDataSet2.Next;
   end;
end;

procedure TIntMoveForm.FindEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = VK_RETURN)and(FindEdit.Text > '')) then IntMoveDataSet.Locate('ITEM', FindEdit.Text, []);
end;

procedure TIntMoveForm.FormCreate(Sender: TObject);
begin
  with ShopMainForm.pFIBService do
  begin
    SelectSQL.Clear;
    SelectSQL.Add('select * from SPR_MARKET ORDER BY SHORT_NAME');
    Open;
    MarketComboBox.Items.Clear;
    while not Eof do
    begin
      if CurrentMarketCode <> ShopMainForm.pFIBService['MARKET_CODE'] then
        MarketComboBox.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);
      Next;
    end;
    Close;

    IntMoveDataSet.Open;
    PageControl1.ActivePage:= TabSheet1;
    MarketComboBox.ItemIndex:= 0;
    MarketComboBoxChange(Sender);
  end;
  IntMoveFolderBEdit.Text:= ShopIni.ReadString('Main', 'IntMoveFolderPath', ExtractFilePath(ParamStr(0))+ 'SAVES\');
end;

procedure TIntMoveForm.FormDestroy(Sender: TObject);
begin
  ShopIni.WriteString('Main', 'IntMoveFolderPath', IntMoveFolderBEdit.Text);
end;

procedure TIntMoveForm.FTP2Click(Sender: TObject);
var CurFileName: string;
begin

//  CurFileName:= GetSYSTempPath + '\' + CurrentMarketCode.ToString + '_' + FindMarketCode(MarketComboBox.Text).ToString + '.xml';
  CurFileName:= GetSYSTempPath + '\' +  TranslitRus2Lat(Copy(FindMarket(CurrentMarketCode), 0, 3)) + '_' + TranslitRus2Lat(Copy(MarketComboBox.Text, 0, 3))
    + FormatDateTime('_yymmddhhnn', Now) + '.xml';


{  DataSetProvider1.DataSet:= IntMoveDataSet;
  ClientDataSet2.ProviderName:= 'DataSetProvider1';
  ClientDataSet2.Open;
  ClientDataSet2.SaveToFile(CurFileName);
  ClientDataSet2.Close;
  ClientDataSet2.ProviderName:= '';
}
  with ClientDataSet3  do
  begin
    SaveToFile(dlgSave.FileName);
    Close;
    FieldDefs.Clear;
  end;


  with ShopMainForm.IdFTP1 do
  begin
    TransferType:= ftBinary;
    Connect;
    try
     ChangeDir('/files/Move');
     Put(CurFileName, ExtractFileName(CurFileName), False);
    finally
     Disconnect;
    end;
  end;
  ClearDocBitBtn.Click;
end;

procedure TIntMoveForm.MarketComboBoxChange(Sender: TObject);
//var FileName: String;
begin
  with IntMoveDataSet do
  begin
    DisableControls;
    Filtered:= True;
    Filter:= 'SENDER_MARKET_CODE = ' + CurrentMarketCode.ToString + ' and DEST_MARKET_CODE = ' + FindMarketCode(MarketComboBox.Text).ToString;
    EnableControls;
  end;

{      FileName:= ExtractFilePath(ParamStr(0)) + 'Saves\' + CurrentMarketCode.ToString + '_' + FindMarketCode(MarketComboBox.Text).ToString + '.xml';
      if FileExists(FileName) then
      begin
        ClientDataSet1.LoadFromFile(FileName);
        edFilename.Color:= clLime;
        EditDocBitBtn.Caption:= 'Изменить';
        DeleteDocFileBitBtn.Enabled:= True;
      end
      else
      begin
        ClientDataSet1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Saves\IntMoveTemplate.xml');
        edFilename.Color:= clYellow;
        EditDocBitBtn.Caption:= 'Создать и изменить';
        DeleteDocFileBitBtn.Enabled:= False;
      end;
      edFilename.Text:= FileName;
      ClientDataSet1.Open;
      }
end;

procedure TIntMoveForm.N2Click(Sender: TObject);
begin
  dlgSave.InitialDir:= IntMoveFolderBEdit.Text;
  dlgSave.Filter:= 'Таблицы|*.xml';
  dlgSave.FileName:= TranslitRus2Lat(Copy(StringReplace(FindMarket(CurrentMarketCode), '!', '', [rfReplaceAll]), 0, 3) + '_'
     + Copy(StringReplace(MarketComboBox.Text, '!', '', [rfReplaceAll]), 0, 3))
      + FormatDateTime('_yymmddhhnn', Now) + '.xml';
  dlgSave.DefaultExt:= 'xml';
  if dlgSave.Execute then
  begin

    with ClientDataSet3  do
    begin
      SaveToFile(dlgSave.FileName);
      Close;
    end;

{    DataSetProvider1.DataSet:= IntMoveDataSet;
    ClientDataSet2.ProviderName:= 'DataSetProvider1';
    ClientDataSet2.Open;

//    ClientDataSet3.SaveToFile(dlgSave.FileName);


    ClientDataSet2.Close;
    ClientDataSet2.ProviderName:= '';
    DataSetProvider1.DataSet:= nil;
 }
  end;
  dlgSave.Filter:= '';
  dlgSave.DefaultExt:= '';
  ClearDocBitBtn.Click;
end;

end.
