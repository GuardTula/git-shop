//****************************************************************************//
//                            © Guard  2003-2022                              //
//****************************************************************************//
unit Queue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ComCtrls, DSContainer, FIBDataSet, pFIBDataSet,
  Vcl.Menus, Datasnap.DBClient, Datasnap.Provider;

type
  TQueueFrm = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    HeaderControl1: THeaderControl;
    pFIBDataSet1: TpFIBDataSet;
    pFIBDataSet2: TpFIBDataSet;
    DataSetsContainer1: TDataSetsContainer;
    DataSetsContainer2: TDataSetsContainer;
    pFIBDataSet1QUEUE_NUMBER: TFIBIntegerField;
    pFIBDataSet1NAME: TFIBStringField;
    pFIBDataSet1QUEUE_SUM: TFIBFloatField;
    pFIBDataSet2QUEUE_NUMBER: TFIBIntegerField;
    pFIBDataSet2ITEM: TFIBStringField;
    pFIBDataSet2KOLVO: TFIBFloatField;
    pFIBDataSet2AUTOR_KOD: TFIBIntegerField;
    pFIBDataSet2MARKET_CODE: TFIBIntegerField;
    pFIBDataSet2TOVAR_NAME: TFIBStringField;
    pFIBDataSet2SALE_PRICE: TFIBFloatField;
    ClientDataSet1: TClientDataSet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1ITEM: TStringField;
    ClientDataSet1KOLVO: TFloatField;
    ClientDataSet2: TClientDataSet;
    pFIBDataSet3: TpFIBDataSet;
    SaveDialog1: TSaveDialog;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure IntMoveClick(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueueFrm: TQueueFrm;

implementation

uses ShopMain;

{$R *.dfm}

procedure TQueueFrm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      case Key of
        VK_RETURN: ModalResult:= mrOk;
        VK_ESCAPE: ModalResult:= mrCancel;
      end;
end;

procedure TQueueFrm.FormCreate(Sender: TObject);
var NewItem: TMenuItem;
begin
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select * from SPR_MARKET where MARKET_CODE <> ' + CurrentMarketCode.ToString
        + ' order by SHORT_NAME');
      Open;
      while not Eof do
      begin
        NewItem:= TMenuItem.Create(PopupMenu1);
        N3.Add(NewItem);
        NewItem.Caption:= ShopMainForm.pFIBService['SHORT_NAME'];
        NewItem.OnClick:= IntMoveClick;

        Next;
      end;
      Close;
    end;
end;

procedure TQueueFrm.IntMoveClick(Sender: TObject);
begin
    CheckToIntMove(QueueFrm.pFIBDataSet1['QUEUE_NUMBER'], CurrentMarketCode, FindMarketCode((Sender as TMenuItem).Caption));
    N2.Click;
end;


procedure TQueueFrm.N1Click(Sender: TObject);
var cur_item: string;
begin
    SaveDialog1.Filter:= 'Файлы таблиц|*.xml';
    SaveDialog1.InitialDir:= ExtractFilePath(ParamStr(0)) + 'Saves\';
    if SaveDialog1.Execute then
    begin
      if pos('.xml', SaveDialog1.FileName) = 0 then
        SaveDialog1.FileName:= SaveDialog1.FileName + '.xml';
      if FileExists(SaveDialog1.FileName)then
      begin
        ClientDataSet2.LoadFromFile(SaveDialog1.FileName);
        ClientDataSet2.Open;
        pFIBDataSet2.DisableControls;
        cur_item:= pFIBDataSet2['ITEM'];
        pFIBDataSet2.First;
        while not pFIBDataSet2.Eof do
        begin
          if ClientDataSet2.Locate('ITEM', pFIBDataSet2['ITEM'], [])then
          begin
            ClientDataSet2.Edit;
            ClientDataSet2['KOLVO']:= ClientDataSet2['KOLVO'] + pFIBDataSet2['KOLVO'];
            ClientDataSet2.Post;
          end
          else
          begin
            ClientDataSet2.Append;;
            ClientDataSet2['ITEM']:= pFIBDataSet2['ITEM'];
            ClientDataSet2['KOLVO']:= pFIBDataSet2['KOLVO'];
            ClientDataSet2.Post;
          end;
          pFIBDataSet2.Next;
        end;
        ClientDataSet2.SaveToFile(SaveDialog1.FileName);
        ClientDataSet2.Close;
        pFIBDataSet2.Locate('ITEM', cur_item, []);
        pFIBDataSet2.EnableControls;
      end
      else
      begin
        ClientDataSet1.Active:= True;
        ClientDataSet1.SaveToFile(SaveDialog1.FileName);
        ClientDataSet1.Active:= False;
      end;
    end;
    N2.Click;
end;

procedure TQueueFrm.N2Click(Sender: TObject);
begin
    if MessageDlg('Удалить чек из очереди ?',  mtConfirmation, [mbYes, mbNo], 0)= idYES then
    begin
      ShopMainForm.pFIBDatabase1.Execute('delete from QUEUE'
                + ' where QUEUE_NUMBER = ' + IntToStr(pFIBDataSet1['QUEUE_NUMBER']));
      DataSetReOpen(pFIBDataSet1);
    end;
end;

procedure TQueueFrm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
    if VarIsNull(pFIBDataSet1['QUEUE_NUMBER'])then DBGrid1.PopupMenu:= nil
    else DBGrid1.PopupMenu:= PopupMenu1;
end;

procedure TQueueFrm.DataSource2DataChange(Sender: TObject; Field: TField);
begin
    N1.Visible:= not VarIsNull(pFIBDataSet2['ITEM']);
end;

procedure TQueueFrm.DBGrid1DblClick(Sender: TObject);
begin
        ModalResult:= mrOK;
end;

end.
