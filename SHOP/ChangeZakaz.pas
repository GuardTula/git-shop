//  ****************************************************************************//
//                            © Guard  2002-2007                              //
//****************************************************************************//
unit ChangeZakaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, FIBDataSet, pFIBDataSet,
  DSContainer, Grids, DBGrids, ComCtrls;

type
  TChangeZakazFrm = class(TForm)
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    pFIBDataSet1ITEM: TFIBStringField;
    pFIBDataSet1MARKET_CODE: TFIBIntegerField;
    pFIBDataSet1AUTOR_KOD: TFIBIntegerField;
    pFIBDataSet1KOLVO: TFIBFloatField;
    pFIBDataSet1SHORT_NAME: TFIBStringField;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    HeaderControl1: THeaderControl;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    pFIBDataSet2: TpFIBDataSet;
    procedure pFIBDataSet2AfterPost(DataSet: TDataSet);
    procedure pFIBDataSet1AfterPost(DataSet: TDataSet);
    procedure pFIBDataSet2AfterEdit(DataSet: TDataSet);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure pFIBDataSet1AfterOpen(DataSet: TDataSet);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BitBtn4Click(Sender: TObject);
    procedure pFIBDataSet1AfterDelete(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangeZakazFrm: TChangeZakazFrm;
  CurItem: String;

implementation

uses ShopMain, Zakaz;

{$R *.dfm}

procedure TChangeZakazFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if Key = VK_ESCAPE then Close;
end;

procedure TChangeZakazFrm.BitBtn4Click(Sender: TObject);
begin
      with ShopMainForm.pFIBQuery1 do
      begin
        SQL.Clear;
        SQL.Add('delete from ZAKAZ');
        SQL.Add('where MARKET_CODE = ' + IntToStr(pFIBDataSet1['MARKET_CODE']));
        SQL.Add('and ITEM = ''' + CurItem + '''');
        SQL.Add('and AUTOR_KOD = ' + IntToStr(pFIBDataSet1['AUTOR_KOD']));
        ExecQuery;
        if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.CommitRetaining;
        pFIBDataSet1.Refresh;
      end;
end;

procedure TChangeZakazFrm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  BitBtn4.Enabled:= not VarIsNull(pFIBDataSet1['KOLVO']);
end;

procedure TChangeZakazFrm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
//      if not(Key in [#8, '0'..'9', DecimalSeparator])then Key:= #0;
{      if(Key = DecimalSeparator)and
        (Pos(DecimalSeparator, (Sender as TEdit).Text) > 0)then Key:= #0;}
end;

procedure TChangeZakazFrm.FormCreate(Sender: TObject);
begin
  pFIBDataSet1.Params.ParamByName('USER_ID').AsInteger:= User_ID;
  pFIBDataSet1.Params.ParamByName('CUR_ITEM').AsString:= CurItem;
  pFIBDataSet1.Open;
  pFIBDataSet2.Params.ParamByName('ITEM').AsString:= CurItem;
  pFIBDataSet2.Open;
end;

procedure TChangeZakazFrm.pFIBDataSet1AfterDelete(DataSet: TDataSet);
begin
  BitBtn4.Click;
end;

procedure TChangeZakazFrm.pFIBDataSet1AfterOpen(DataSet: TDataSet);
begin
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select sum(KOLVO)as SUM_KOLVO from zakaz');
      SelectSQL.Add('where AUTOR_KOD = ' + IntToStr(USER_ID));
      SelectSQL.Add('and ITEM = ''' + CurItem + '''');
      Open;
      if not VarIsNull(ShopMainForm.pFIBService['SUM_KOLVO']) then
        Label1.Caption:= FloatToStr(ShopMainForm.pFIBService['SUM_KOLVO'])
      else Label1.Caption:= '0';
      Close;
    end;
end;

procedure TChangeZakazFrm.pFIBDataSet1AfterPost(DataSet: TDataSet);
var CurPos: Integer;
begin
    if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.CommitRetaining;
    with pFIBDataSet1 do
    begin
      DisableControls;
      CurPos:= pFIBDataSet1['MARKET_CODE'];
      CloseOpen(True);
      Locate('MARKET_CODE', CurPos, []);
      EnableControls;
    end;
end;

procedure TChangeZakazFrm.pFIBDataSet2AfterEdit(DataSet: TDataSet);
begin
  pFIBDataSet2['ITEM']:= CurItem;
end;

procedure TChangeZakazFrm.pFIBDataSet2AfterPost(DataSet: TDataSet);
var CurPos: Integer;
begin
  if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.CommitRetaining;
  with pFIBDataSet2 do
  begin
    DisableControls;
    CurPos:= pFIBDataSet2['MARKET_CODE'];
    CloseOpen(True);
    Locate('MARKET_CODE', CurPos, []);
    EnableControls;
  end;
end;

end.
