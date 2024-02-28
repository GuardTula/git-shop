unit OftenUse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, FIBDataSet, pFIBDataSet;

type
  TOftenUseFrm = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    pFIBDataSet1: TpFIBDataSet;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OftenUseFrm: TOftenUseFrm;

implementation

uses ShopMain;

{$R *.dfm}

procedure TOftenUseFrm.BitBtn1Click(Sender: TObject);
begin
    if not VarIsNull(pFIBDataSet1['ITEM'])then ModalResult:= idOK;
end;

procedure TOftenUseFrm.FormCreate(Sender: TObject);
begin
      pFIBDataSet1.Open;
end;

procedure TOftenUseFrm.BitBtn2Click(Sender: TObject);
begin
    if not VarIsNull(pFIBDataSet1['ITEM'])then
      if MessageDlg('Удалить из списка товар с PLU кодом: ' + pFIBDataSet1['ITEM']
          , mtConfirmation, [mbYes,mbNo], 0) = idYes then
          begin
            ShopMainForm.pFIBDatabase1.Execute('delete from SPR_OFTENUSE'
              + ' where ITEM = ''' + pFIBDataSet1['ITEM'] + '''');
            DataSetReOpen(pFIBDataSet1);
          end;
end;

end.
