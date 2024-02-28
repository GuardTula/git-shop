unit SprMarkets;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, FIBDataSet,
  pFIBDataSet;

type
  TSprMarketsFrm = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    DBGrid2: TDBGrid;
    MarketCodeEdit: TEdit;
    MarketShortNameEdit: TLabeledEdit;
    MarketNameEdit: TLabeledEdit;
    MarketTypeComboBox: TComboBox;
    MarketAdresEdit: TLabeledEdit;
    AddMarketBtn: TBitBtn;
    EditMarketBtn: TBitBtn;
    DataSource3: TDataSource;
    SprMarket: TpFIBDataSet;
    SprMarketMARKET_CODE: TFIBIntegerField;
    SprMarketSHORT_NAME: TFIBStringField;
    SprMarketMARKET_NAME: TFIBStringField;
    SprMarketMARKET_ADR: TFIBStringField;
    SprMarketMARKET_TYPE: TFIBIntegerField;
    procedure DataSource3DataChange(Sender: TObject; Field: TField);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure MarketCodeEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AddMarketBtnClick(Sender: TObject);
    procedure EditMarketBtnClick(Sender: TObject);
    procedure MarketShortNameEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MarketCodeEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SprMarketsFrm: TSprMarketsFrm;

implementation

uses ShopMain;

{$R *.dfm}

procedure TSprMarketsFrm.DataSource3DataChange(Sender: TObject;
  Field: TField);
begin
        EditMarketBtn.Enabled:= not VarIsNull(SprMarket['MARKET_CODE']);
end;

procedure TSprMarketsFrm.DBGrid2DblClick(Sender: TObject);
begin
        EditMarketBtn.Click;
end;

procedure TSprMarketsFrm.MarketCodeEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = VK_RETURN then SelectNext(Sender as TWinControl, true, true);
end;

procedure TSprMarketsFrm.MarketCodeEditKeyPress(Sender: TObject; var Key: Char);
begin
      if not(Key in [#8, '0'..'9'])then Key:= #0;
end;

procedure TSprMarketsFrm.AddMarketBtnClick(Sender: TObject);
begin
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_MARKET');
          SelectSQL.Add('where MARKET_CODE = ' + MarketCodeEdit.Text);
          Open;
          if VarIsNull(ShopMainForm.pFIBService['MARKET_CODE'])then
          begin
            Close;
            ShopMainForm.pFIBDatabase1.Execute('insert into SPR_MARKET(MARKET_CODE, SHORT_NAME, MARKET_NAME,'
              + ' MARKET_ADR, MARKET_TYPE)'
              + ' values (' + MarketCodeEdit.Text + ', ''' + MarketShortNameEdit.Text
              + ''', ''' + MarketNameEdit.Text + ''', ''' + MarketAdresEdit.Text
              + ''', ' + IntToStr(MarketTypeComboBox.ItemIndex) + ')');
          end
          else if MessageDlg('Данный код объекта уже существует, обновить данные',
                 mtWarning, [mbYes,mbNo], 0) = idYes then
               begin
                Close;
                ShopMainForm.pFIBDatabase1.Execute('update SPR_MARKET'
                  + ' set SHORT_NAME = ''' + MarketShortNameEdit.Text + ''', '
                  + ' MARKET_NAME = ''' + MarketNameEdit.Text + ''', '
                  + ' MARKET_ADR = ''' + MarketAdresEdit.Text + ''', '
                  + ' MARKET_TYPE = ' + IntToStr(MarketTypeComboBox.ItemIndex)
                  + ' where MARKET_CODE = ' + MarketCodeEdit.Text);
              end;
        end;
        DataSetReOpen(SprMarket);
        MarketCodeEdit.Text:= '';
        MarketShortNameEdit.Text:= '';
        MarketNameEdit.Text:= '';
        MarketAdresEdit.Text:= '';
        MarketTypeComboBox.ItemIndex:= 0;
        MarketCodeEdit.SetFocus;
end;

procedure TSprMarketsFrm.EditMarketBtnClick(Sender: TObject);
begin
        MarketCodeEdit.Text:= IntToStr(SprMarket['MARKET_CODE']);
        MarketShortNameEdit.Text:= TrimRight(SprMarket['SHORT_NAME']);
        if not VarIsNull(SprMarket['MARKET_NAME'])then
                    MarketNameEdit.Text:= TrimRight(SprMarket['MARKET_NAME']);
        if not VarIsNull(SprMarket['MARKET_ADR'])then
                    MarketAdresEdit.Text:= TrimRight(SprMarket['MARKET_ADR']);
        MarketTypeComboBox.ItemIndex:= SprMarket['MARKET_TYPE'];
        MarketCodeEdit.SetFocus;
end;

procedure TSprMarketsFrm.MarketShortNameEditChange(Sender: TObject);
begin
        AddMarketBtn.Enabled:= (MarketCodeEdit.Text <> '')and
                               (MarketShortNameEdit.Text <> '');
end;

procedure TSprMarketsFrm.FormCreate(Sender: TObject);
begin
        SprMarket.Open;
end;

end.
