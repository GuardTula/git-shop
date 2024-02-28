//****************************************************************************//
//                            © Guard  2003-2022                              //
//****************************************************************************//
unit ZakazCheck;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FIBDataSet, pFIBDataSet, Data.DB, Vcl.Graphics,
  Datasnap.DBClient, Datasnap.Provider, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Samples.Spin, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, System.ImageList,
  Vcl.ImgList, Vcl.Menus,  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, IdFTPCommon, IdFTPList, IdAllFTPListParsers,
  frxClass, Vcl.Mask, frxDBSet, System.UITypes;

type
  TZakazCheckForm = class(TForm)
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    dlgSave: TSaveDialog;
    dlgOpen: TOpenDialog;
    ZakazCheckDataSet: TpFIBDataSet;
    FileOpenDialog1: TFileOpenDialog;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    EditKolvoBitBtn: TBitBtn;
    SaveDocBitBtn: TBitBtn;
    InsertBitBtn: TBitBtn;
    OpenFileDocBitBtn: TBitBtn;
    OpenPopupMenu: TPopupMenu;
    OpenFileZakazMenuItem: TMenuItem;
    FTPLoadZakazMenuItem: TMenuItem;
    PrintZakazBtn: TBitBtn;
    FindEdit: TLabeledEdit;
    pFIBDataSet1: TpFIBDataSet;
    ClientDataSet2: TClientDataSet;
    OKCheckCheckBox: TCheckBox;
    NoCheckCheckBox: TCheckBox;
    SavePopupMenu: TPopupMenu;
    SaveZakazFileMenuItem: TMenuItem;
    FTP1: TMenuItem;
    BlankPosCheckBox: TCheckBox;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    N1: TMenuItem;
    N2: TMenuItem;
    FTP2: TMenuItem;
    N3: TMenuItem;
    FTP3: TMenuItem;
    N4: TMenuItem;
    FileSaveDialog1: TFileSaveDialog;
    OverCheckCheckBox: TCheckBox;
    procedure EditKolvoBitBtnClick(Sender: TObject);
    procedure SaveDocBitBtnClick(Sender: TObject);
    procedure EditKolvoXMLBitBtnClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure OpenFileDocBitBtnClick(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure PrintZakazBtnClick(Sender: TObject);
    procedure ClientDataSet1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FindEditChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure OKCheckCheckBoxClick(Sender: TObject);
    procedure AddItem2Zakaz(const AddItem: String; AddZakazKolvo: Integer);
    procedure AddFromFile(const FileName: String);
    procedure SaveZakazFileMenuItemClick(Sender: TObject);
    procedure FTP1Click(Sender: TObject);
    procedure OpenFileZakazMenuItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FTPLoadZakazMenuItemClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure InsertBitBtnClick(Sender: TObject);
    procedure FTP3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FTP2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZakazCheckForm: TZakazCheckForm;

implementation

uses ShopMain, Queue, EditEnter, FTPFileLoad;

{$R *.dfm}


{
// Новый заказ
  if MessageDlg('Если вы не сохранили файл, то все данные будут утерянны. Продолжить ?',  mtWarning, [mbYes, mbNo], 0)= idYES then
    ClientDataSet1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Zakaz\' + 'zakaz_template.xml');

// Все по заказу
procedure TZakazCheckForm.AllCheckBitBtnClick(Sender: TObject);
var CurItem: String;
begin
  if MessageDlg('Установить все позиции по заказу ?',  mtConfirmation, [mbYes, mbNo], 0)= idYES then
  with ClientDataSet1 do
  begin
    CurItem:= ClientDataSet1.FieldByName('ITEM').AsString;
    DisableControls;
    First;
    while not Eof do
    begin
      Edit;
      ClientDataSet1['KOLVO']:= ClientDataSet1['ZAKAZ_KOLVO'];
      Post;
      Next;
    end;
    Locate('ITEM', CurItem, []);
    EnableControls;
  end;
end;

// Удалить позицию
    if MessageDlg('Удалить позицию ?',  mtConfirmation, [mbYes, mbNo], 0)= idYES then
    begin
      ClientDataSet1.Delete;
    end;

// Добавить из очереди
  Application.CreateForm(TQueueFrm, QueueFrm);
  QueueFrm.pFIBDataSet1.Open;
  if not VarIsNull(QueueFrm.pFIBDataSet1['QUEUE_NUMBER'])then
  begin
    QueueFrm.pFIBDataSet2.Open;
    if QueueFrm.ShowModal = IDOK then
      begin
        QueueFrm.pFIBDataSet2.First;
        while not QueueFrm.pFIBDataSet2.Eof do
        begin
          AddItem2Zakaz(QueueFrm.pFIBDataSet2['ITEM'], QueueFrm.pFIBDataSet2['KOLVO']);
          QueueFrm.pFIBDataSet2.Next;
        end;

        if MessageDlg('Удалить чек из очереди ?',  mtConfirmation, [mbYes, mbNo], 0)= idYES then
          ExecSQLStr('delete from QUEUE where QUEUE_NUMBER = '
            + IntToStr(QueueFrm.pFIBDataSet1['QUEUE_NUMBER']));

      end;
  end
  else MessageDlg('Нет чеков в очереди', mtInformation, [mbOK], 0);
  QueueFrm.Free;

// Добавить из файла с FTP
procedure TZakazCheckForm.AddfromFileFTPClick(Sender: TObject);
var LS: TStringList;
    i: Integer;
    FTPFile: String;
begin
   Application.CreateForm(TFTPFileLoadForm, FTPFileLoadForm);

   with ShopMainForm.IdFTP1 do
   begin
     TransferType:= ftASCII;

     LS:= TStringList.Create;
     FTPFile:= '';
     Connect;
     try
      ChangeDir('/files/Zakaz');
      ShopMainForm.IdFTP1.List(LS, '*.xml', True);
      for i:= 0 to ShopMainForm.IdFTP1.DirectoryListing.Count-1 do
        FTPFileLoadForm.ValueListEditor1.InsertRow(ShopMainForm.IdFTP1.DirectoryListing.Items[i].FileName,
          FormatDateTime('dd/mm/yyyy hh:mm', ShopMainForm.IdFTP1.DirectoryListing.Items[i].ModifiedDate), True);
      ShopMainForm.IdFTP1.List(LS, '*.zak', True);
      for i:= 0 to ShopMainForm.IdFTP1.DirectoryListing.Count-1 do
        FTPFileLoadForm.ValueListEditor1.InsertRow(ShopMainForm.IdFTP1.DirectoryListing.Items[i].FileName,
          FormatDateTime('dd/mm/yyyy hh:mm', ShopMainForm.IdFTP1.DirectoryListing.Items[i].ModifiedDate), True);

      if FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row] = '' then
        MessageDlg('Нет файлов в папке заказов FTP', mtWarning, [mbOK], 0)
      else
        if FTPFileLoadForm.ShowModal = mrOK then
        begin
          FTPFile:= GetSYSTempPath + '\' + FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row];
//          FTPFile:= ExtractFilePath(ParamStr(0)) + 'Zakaz\' + FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row];
          DelExists(FTPFile);
          ShopMainForm.IdFTP1.TransferType:= ftBinary;
          ShopMainForm.idFTP1.Get(FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row], FTPFile, True);
        end;

     finally
      Disconnect;
      LS.Free;
      FTPFileLoadForm.Free;
     end;
   end;
   if FTPFile <> '' then
   begin
     AddFromFile(FTPFile);
     DelExists(FTPFile);
   end;
end;


}
procedure TZakazCheckForm.AddItem2Zakaz(const AddItem: String; AddZakazKolvo: Integer);
var CurItem: String;
begin
  pFIBDataSet1.SelectSQL.Clear;
  pFIBDataSet1.SelectSQL.Add('select s.item, s.tovar_name, s.artikul, s.remark,'
    + ' a.sclad from spr_tovar s left join tovar_add a on a.item = s.item'
    + ' where s.item = ''' + AddItem + '''');
  pFIBDataSet1.Open;
  if not VarIsNull(pFIBDataSet1['ITEM']) then
  begin
    if ClientDataSet1.Locate('ITEM', AddItem, [])then
    begin
      ClientDataSet1.Edit;
      ClientDataSet1['ZAKAZ_KOLVO']:= ClientDataSet1['ZAKAZ_KOLVO'] + AddZakazKolvo;
      ClientDataSet1['KOLVO']:= ClientDataSet1['KOLVO'] + AddZakazKolvo;
      ClientDataSet1.Post;
    end
    else
    begin
      ClientDataSet1.Append;
      ClientDataSet1['ITEM']:= pFIBDataSet1.FieldByName('ITEM').AsString;
      ClientDataSet1['TOVAR_NAME']:= pFIBDataSet1.FieldByName('TOVAR_NAME').AsString;
      ClientDataSet1['ARTIKUL']:= pFIBDataSet1.FieldByName('ARTIKUL').AsString;
      ClientDataSet1['REMARK']:= pFIBDataSet1.FieldByName('REMARK').AsString;
      ClientDataSet1['SCLAD']:= pFIBDataSet1.FieldByName('SCLAD').AsString;
      ClientDataSet1['KOLVO']:= AddZakazKolvo;
      ClientDataSet1['ZAKAZ_KOLVO']:= AddZakazKolvo;
      ClientDataSet1.Post;
    end;
  end
  else MessageDlg('Товар с кодом' + AddItem + ' не найден в справочнике', mtWarning, [mbOK], 0);
  pFIBDataSet1.Close;
end;

procedure TZakazCheckForm.EditKolvoBitBtnClick(Sender: TObject);
begin
        Application.CreateForm(TEditEnterForm, EditEnterForm);
        EditEnterForm.Edit1.PasswordChar:= #0;
        EditEnterForm.Label1.Visible:= False;
        EditEnterForm.Caption:= 'Количество';
        EditEnterForm.Edit1.Text:= IntToStr(ZakazCheckDataSet['KOLVO']);
        EditEnterForm.Edit1.NumbersOnly:= True;
        if EditEnterForm.ShowModal = idOK then
        begin
            if StrToInt('0' + EditEnterForm.Edit1.Text) > 0 then
            begin
              ShopMainForm.pFIBDatabase1.Execute('update INT_MOVE set KOLVO = '
                + StringReplace(EditEnterForm.Edit1.Text, ',', '.', [])
                + ' where ITEM = ''' + ZakazCheckDataSet['ITEM']
                + ''' and SENDER_MARKET_CODE = '
                + IntToStr(ZakazCheckDataSet['SENDER_MARKET_CODE']) + ' and DEST_MARKET_CODE = ' + IntToStr(ZakazCheckDataSet['DEST_MARKET_CODE']));
              ZakazCheckDataSet.ReopenLocate('ITEM');
            end;
        end;
        EditEnterForm.Free;
end;

procedure TZakazCheckForm.EditKolvoXMLBitBtnClick(Sender: TObject);
begin
  Application.CreateForm(TEditEnterForm, EditEnterForm);
  EditEnterForm.Edit1.PasswordChar:= #0;
  EditEnterForm.Label1.Visible:= False;
  EditEnterForm.Caption:= 'Количество';
  if ClientDataSet1['KOLVO'] = 0 then
    EditEnterForm.Edit1.Text:= IntToStr(ClientDataSet1['ZAKAZ_KOLVO'])
  else
    EditEnterForm.Edit1.Text:= IntToStr(ClientDataSet1['KOLVO']);
  if EditEnterForm.ShowModal = idOK then
  begin
      if StrToInt('0' + EditEnterForm.Edit1.Text) >= 0 then
      begin
        ClientDataSet1.Edit;
        ClientDataSet1['KOLVO']:= StrToInt('0' + EditEnterForm.Edit1.Text);
        ClientDataSet1.Post;
      end;
  end;
  EditEnterForm.Free;
end;

procedure TZakazCheckForm.FindEditChange(Sender: TObject);
begin
  ClientDataSet1.Filtered:= False;
  ClientDataSet1.Filtered:= FindEdit.Text > '';
end;

procedure TZakazCheckForm.FormCreate(Sender: TObject);
begin
  ClientDataSet1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Zakaz\' + 'zakaz_template.xml');
end;

procedure TZakazCheckForm.FTP1Click(Sender: TObject);
var CurFileName: String;
begin
  Application.CreateForm(TEditEnterForm, EditEnterForm);
  EditEnterForm.Edit1.PasswordChar:= #0;
  EditEnterForm.Label1.Visible:= False;
  EditEnterForm.Caption:= 'Имя файла';
  EditEnterForm.Edit1.Text:= ZakazCheckForm.Caption;
  if ((EditEnterForm.ShowModal = idOK)and(EditEnterForm.Edit1.Text <> '')) then
  begin
    CurFileName:= GetSYSTempPath + '\' + EditEnterForm.Edit1.Text + '.xml';
    ClientDataSet1.SaveToFile(CurFileName);
    with ShopMainForm.IdFTP1 do
    begin
      TransferType:= ftBinary;
      Connect;
      try
       ChangeDir('/files/Zakaz');
       Put(CurFileName, ExtractFileName(CurFileName), False);
      finally
       Disconnect;
      end;
    end;
  end;
  EditEnterForm.Free;
end;

procedure TZakazCheckForm.FTP2Click(Sender: TObject);
var CurFileName: String;
begin
    CurFileName:= GetSYSTempPath + '\' + ZakazCheckForm.Caption + '.xml';

    ClientDataSet1.SaveToFile(CurFileName);
    with ShopMainForm.IdFTP1 do
    begin
      TransferType:= ftBinary;
      Connect;
      try
       ChangeDir('/files/Zakaz');
       Put(CurFileName, ExtractFileName(CurFileName), False);
      finally
       Disconnect;
      end;
    end;
end;

procedure TZakazCheckForm.FTP3Click(Sender: TObject);
var LS: TStringList;
    i: Integer;
    FTPFile: String;
begin
  if MessageDlg('Если вы не сохранили файл, то все данные будут утерянны. Продолжить ?',  mtWarning, [mbYes, mbNo], 0)= idYES then
    begin
      Application.CreateForm(TFTPFileLoadForm, FTPFileLoadForm);
      with ShopMainForm.IdFTP1 do
      begin
        TransferType:= ftASCII;
        LS:= TStringList.Create;
        FTPFile:= '';
        Connect;
        try
         ChangeDir('/files/Zakaz');
         ShopMainForm.IdFTP1.List(LS, '*.zak', True);
         for i:= 0 to ShopMainForm.IdFTP1.DirectoryListing.Count-1 do
           FTPFileLoadForm.ValueListEditor1.InsertRow(ShopMainForm.IdFTP1.DirectoryListing.Items[i].FileName,
             FormatDateTime('dd/mm/yyyy hh:mm', ShopMainForm.IdFTP1.DirectoryListing.Items[i].ModifiedDate), True);
          if FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row] = '' then
           MessageDlg('Нет файлов в папке заказов FTP', mtWarning, [mbOK], 0)
         else
           if FTPFileLoadForm.ShowModal = mrOK then
           begin
             FTPFile:= GetSYSTempPath + '\' + FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row];
   //          FTPFile:= ExtractFilePath(ParamStr(0)) + 'Zakaz\' + FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row];
             DelExists(FTPFile);
             ShopMainForm.IdFTP1.TransferType:= ftBinary;
             ShopMainForm.idFTP1.Get(FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row], FTPFile, True);
           end;

        finally
         Disconnect;
         LS.Free;
         FTPFileLoadForm.Free;
        end;
       end;
      if FTPFile <> '' then
      begin
        ClientDataSet1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Zakaz\' + 'zakaz_template.xml');
        AddFromFile(FTPFile);
        DelExists(FTPFile);
        ZakazCheckForm.Caption:= Copy(ExtractFileName(FTPFile), 0, Pos(ExtractFileExt(FTPFile), ExtractFileName(FTPFile))-1);
      end;
    end;

end;

procedure TZakazCheckForm.FTPLoadZakazMenuItemClick(Sender: TObject);
var LS: TStringList;
    i: Integer;
    FTPFile: String;
begin
   Application.CreateForm(TFTPFileLoadForm, FTPFileLoadForm);

   with ShopMainForm.IdFTP1 do
   begin
{
     Username:= FTPUsername;
     Password:= FTPPassword;
     Host:= FTPHost;
     Passive:= True;
}
     TransferType:= ftASCII;

     LS:= TStringList.Create;
     FTPFile:= '';
     Connect;
     try
      ChangeDir('/files/Zakaz');
      ShopMainForm.IdFTP1.List(LS, '*.xml', True);
      for i:= 0 to ShopMainForm.IdFTP1.DirectoryListing.Count-1 do
        FTPFileLoadForm.ValueListEditor1.InsertRow(ShopMainForm.IdFTP1.DirectoryListing.Items[i].FileName,
          FormatDateTime('dd/mm/yyyy hh:mm', ShopMainForm.IdFTP1.DirectoryListing.Items[i].ModifiedDate), True);

      if FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row] = '' then
        MessageDlg('Нет файлов в папке заказов FTP', mtWarning, [mbOK], 0)
      else
        if FTPFileLoadForm.ShowModal = mrOK then
        begin
          FTPFile:= GetSYSTempPath + '\' + FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row];
//          FTPFile:= ExtractFilePath(ParamStr(0)) + 'Zakaz\' + FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row];
          DelExists(FTPFile);
          ShopMainForm.IdFTP1.TransferType:= ftBinary;
          ShopMainForm.idFTP1.Get(FTPFileLoadForm.ValueListEditor1.Keys[FTPFileLoadForm.ValueListEditor1.Row], FTPFile, True);
        end;

     finally
      Disconnect;
      LS.Free;
      FTPFileLoadForm.Free;
     end;
   end;
   if FTPFile <> '' then
   begin
     ClientDataSet1.LoadFromFile(FTPFile);
     DelExists(FTPFile);
     ZakazCheckForm.Caption:= Copy(ExtractFileName(FTPFile), 0, Pos(ExtractFileExt(FTPFile), ExtractFileName(FTPFile))-1);
   end;
end;

procedure TZakazCheckForm.InsertBitBtnClick(Sender: TObject);
var ItemFromCat: string;
begin
  ItemFromCat:= ChangeWithCat;
  if (ItemFromCat > '') then
  begin
    Application.CreateForm(TEditEnterForm, EditEnterForm);
    EditEnterForm.Edit1.PasswordChar:= #0;
    EditEnterForm.Label1.Visible:= False;
    EditEnterForm.Caption:= 'Количество';
    EditEnterForm.Edit1.Text:= '1';
    EditEnterForm.Edit1.SelectAll;
    if EditEnterForm.ShowModal = idOK then
    begin
        if StrToInt('0' + EditEnterForm.Edit1.Text) > 0 then
        AddItem2Zakaz(ItemFromCat, StrToInt('0' + EditEnterForm.Edit1.Text));
    end;
    EditEnterForm.Free;
  end;
end;

procedure TZakazCheckForm.N2Click(Sender: TObject);
begin
//  if FileOpenDialog1.Execute then
  FileSaveDialog1.DefaultFolder:= ExtractFilePath(ParamStr(0)) + 'Zakaz\';
  FileSaveDialog1.FileName:= ZakazCheckForm.Caption + '.xml';
  FileSaveDialog1.DefaultExtension:= 'xml';
  FileSaveDialog1.FileTypes.Clear;
  FileSaveDialog1.FileTypes.Add;
  FileSaveDialog1.FileTypes[0].DisplayName:= 'Таблицы';
  FileSaveDialog1.FileTypes[0].FileMask:= '*.xml';

  if FileSaveDialog1.Execute then
    if ExtractFileName(FileSaveDialog1.FileName) <> ZakazCheckForm.Caption + '.xml' then
      MessageDlg('Изменение имени файла заказа не возможно !!!',  mtWarning, [mbOK], 0)
    else
      ClientDataSet1.SaveToFile(FileSaveDialog1.FileName);

  FileSaveDialog1.FileName:= '';
  FileSaveDialog1.DefaultExtension:= '';
  FileSaveDialog1.FileTypes.Clear;
end;

procedure TZakazCheckForm.N3Click(Sender: TObject);
begin
  if MessageDlg('Если вы не сохранили файл, то все данные будут утерянны. Продолжить ?',  mtWarning, [mbYes, mbNo], 0) = idYES then
    begin
      ClientDataSet1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Zakaz\' + 'zakaz_template.xml');
      dlgOpen.InitialDir:= ExtractFilePath(ParamStr(0)) + 'Zakaz\';
      dlgOpen.Filter:= 'Заказы|*.zak';
      if dlgOpen.Execute then AddFromFile(dlgOpen.FileName);
      dlgOpen.Filter:= '';
      ZakazCheckForm.Caption:= Copy(ExtractFileName(dlgOpen.FileName), 0, Pos(ExtractFileExt(dlgOpen.FileName), ExtractFileName(dlgOpen.FileName))-1);
    end;
end;

procedure TZakazCheckForm.SaveDocBitBtnClick(Sender: TObject);
begin
  CurXY.X:= SaveDocBitBtn.Left + Trunc(SaveDocBitBtn.Width / 2);
  CurXY.Y:= SaveDocBitBtn.Top + Trunc(SaveDocBitBtn.Height / 2);
  CurXY:= ClientToScreen(CurXY);
  SavePopupMenu.Popup(CurXY.X, CurXY.Y);

{   dlgSave.InitialDir:= ExtractFilePath(ParamStr(0)) + 'SAVES\';
   dlgSave.Filter:= 'Таблицы|*.xml';
   dlgSave.DefaultExt:= 'xml';
   if dlgSave.Execute then ClientDataSet1.SaveToFile(dlgSave.FileName);
   dlgSave.Filter:= '';
   dlgSave.DefaultExt:= '';}
end;

procedure TZakazCheckForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  EditKolvoBitBtn.Enabled:= not VarIsNull(ClientDataSet1['ITEM']);
  SaveDocBitBtn.Enabled:= EditKolvoBitBtn.Enabled;
  DBGrid2.Visible:= EditKolvoBitBtn.Enabled;
  PrintZakazBtn.Enabled:= EditKolvoBitBtn.Enabled;
end;

procedure TZakazCheckForm.DBGrid2DblClick(Sender: TObject);
begin
  EditKolvoBitBtn.Click;
end;

procedure TZakazCheckForm.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if(gdSelected in State)then
  begin
    TDBGrid(Sender).Canvas.Brush.Color:= clHighLight;
    TDBGrid(Sender).Canvas.Font.Color := clHighLightText;
  end
  else
    if (OKCheckCheckBox.Checked and(ClientDataSet1.FieldByName('ZAKAZ_KOLVO').AsInteger = ClientDataSet1.FieldByName('KOLVO').AsInteger)) then
      TDBGrid(Sender).Canvas.Brush.Color:= clMoneyGreen
    else
      if (NoCheckCheckBox.Checked and(ClientDataSet1.FieldByName('ZAKAZ_KOLVO').AsInteger > ClientDataSet1.FieldByName('KOLVO').AsInteger)
        and(ClientDataSet1.FieldByName('KOLVO').AsInteger > 0)) then
        TDBGrid(Sender).Canvas.Brush.Color:= $008080FF
      else
         if (BlankPosCheckBox.Checked and (ClientDataSet1.FieldByName('KOLVO').AsInteger = 0)) then
           TDBGrid(Sender).Canvas.Brush.Color:= clSkyBlue
         else
           if (OverCheckCheckBox.Checked and(ClientDataSet1.FieldByName('ZAKAZ_KOLVO').AsInteger < ClientDataSet1.FieldByName('KOLVO').AsInteger)) then
              TDBGrid(Sender).Canvas.Brush.Color:= clAqua
           else
             TDBGrid(Sender).Canvas.Brush.Color:= clWindow;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TZakazCheckForm.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   VK_RETURN: if ((ssShift in Shift)and not VarIsNull(ClientDataSet1['ZAKAZ_KOLVO']))then
              begin
                ClientDataSet1.Edit;
                ClientDataSet1['KOLVO']:= ClientDataSet1['ZAKAZ_KOLVO'];
                ClientDataSet1.Post;
              end
              else EditKolvoBitBtn.Click;
  end;
end;

procedure TZakazCheckForm.DBGrid2TitleClick(Column: TColumn);
var i: Integer;
begin
  ClientDataSet1.IndexFieldNames:= Column.FieldName;
  for i:= 0 to DBGrid2.Columns.Count - 1 do
    if ClientDataSet1.IndexFieldNames =  DBGrid2.Columns[i].FieldName then
    begin
      DBGrid2.Columns[i].Title.Font.Color:= clRed;
      DBGrid2.Columns[i].Title.Font.Style:= [fsBold];
    end
    else
    begin
      DBGrid2.Columns[i].Title.Font.Color:= clWindowText;
      DBGrid2.Columns[i].Title.Font.Style:= [];
    end;
end;

procedure TZakazCheckForm.SaveZakazFileMenuItemClick(Sender: TObject);
begin
//  if FileOpenDialog1.Execute then
  FileSaveDialog1.DefaultFolder:= ExtractFilePath(ParamStr(0)) + 'Zakaz\';
  FileSaveDialog1.FileName:= ZakazCheckForm.Caption + '.xml';
  FileSaveDialog1.DefaultExtension:= 'xml';
  FileSaveDialog1.FileTypes.Clear;
  FileSaveDialog1.FileTypes.Add;
  FileSaveDialog1.FileTypes[0].DisplayName:= 'Таблицы';
  FileSaveDialog1.FileTypes[0].FileMask:= '*.xml';

  if FileSaveDialog1.Execute then
    ClientDataSet1.SaveToFile(FileSaveDialog1.FileName);

  FileSaveDialog1.FileName:= '';
  FileSaveDialog1.DefaultExtension:= '';
  FileSaveDialog1.FileTypes.Clear;
end;

procedure TZakazCheckForm.OKCheckCheckBoxClick(Sender: TObject);
begin
  DBGrid2.Repaint;
end;

procedure TZakazCheckForm.OpenFileDocBitBtnClick(Sender: TObject);
begin
  CurXY.X:= OpenFileDocBitBtn.Left + Trunc(OpenFileDocBitBtn.Width / 2);
  CurXY.Y:= OpenFileDocBitBtn.Top + Trunc(OpenFileDocBitBtn.Height / 2);
  CurXY:= ClientToScreen(CurXY);
  OpenPopupMenu.Popup(CurXY.X, CurXY.Y);
end;

procedure TZakazCheckForm.OpenFileZakazMenuItemClick(Sender: TObject);
begin
  dlgOpen.InitialDir:= ExtractFilePath(ParamStr(0)) + 'Zakaz\';
  dlgOpen.Filter:= 'Таблицы|*.xml';
  if dlgOpen.Execute then
  begin
    ClientDataSet1.LoadFromFile(dlgOpen.FileName);
    ZakazCheckForm.Caption:= Copy(ExtractFileName(dlgOpen.FileName), 0, Pos(ExtractFileExt(dlgOpen.FileName), ExtractFileName(dlgOpen.FileName))-1);
  end;
  dlgOpen.Filter:= '';
end;

procedure TZakazCheckForm.PrintZakazBtnClick(Sender: TObject);
begin
  frxReport1.LoadFromFile(ShopIni.ReadString('Reports', 'CheckZakaz', ReportsPath + 'CheckZakaz.fr3'));
  frxReport1.ShowReport;
end;

procedure TZakazCheckForm.ClientDataSet1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:= Pos(FindEdit.Text, ClientDataSet1.FieldByName('ITEM').AsString
    + ClientDataSet1.FieldByName('TOVAR_NAME').AsString
    + ClientDataSet1.FieldByName('SCLAD').AsString
    + ClientDataSet1.FieldByName('ARTIKUL').AsString
    + ClientDataSet1.FieldByName('REMARK').AsString) > 0;
end;

procedure TZakazCheckForm.AddFromFile(const FileName: String);
var f: TextFile;
   CurStr, CurItem: String;
begin
   ClientDataSet1.DisableControls;
   CurItem:= ClientDataSet1.FieldByName('ITEM').AsString;
   if ExtractFileExt(FileName) = '.xml' then
     begin
       ClientDataSet2.LoadFromFile(FileName);
       ClientDataSet2.Open;
       while not ClientDataSet2.Eof do
       begin
         AddItem2Zakaz(ClientDataSet2['ITEM'], ClientDataSet2['KOLVO']);
         ClientDataSet2.Next;
       end;
       ClientDataSet2.Close;
     end
     else
       if ExtractFileExt(FileName) = '.zak' then
       begin
         AssignFile(f, FileName);
         Reset(f);
        try
         while not Eof(f) do
         begin
           Readln(f, CurStr);
           AddItem2Zakaz(GetStrParam(CurStr, 1), GetStrParam(CurStr, 2).ToInteger);
         end;
        finally
          CloseFile(f);
        end;
       end;
   ClientDataSet1.Locate('ITEM', CurItem, []);
   ClientDataSet1.EnableControls;
end;


end.
