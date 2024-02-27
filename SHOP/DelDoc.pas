//****************************************************************************//
//                            © Guard  2003-2022                              //
//****************************************************************************//
unit DelDoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.CheckLst, Vcl.ExtCtrls, FIBDataSet, pFIBDataSet, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Graphics, Vcl.Mask, frxClass, frxDBSet;

type
  TDelDocFrm = class(TForm)
    DBGrid1: TDBGrid;
    DelDocDataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    Panel1: TPanel;
    DocTypeCheckListBox: TCheckListBox;
    BitBtn1: TBitBtn;
    MarketCheckListBox: TCheckListBox;
    ItemEdit: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    DelDocDataSetKOLVO: TFIBFloatField;
    DelDocDataSetDOC_NUMBER: TFIBIntegerField;
    DelDocDataSetDOC_DATE: TFIBDateTimeField;
    DelDocDataSetLAST_UPD: TFIBDateTimeField;
    DelDocDataSetSHORT_NAME: TFIBStringField;
    DelDocDataSetDOC_TYPE_NAME: TFIBStringField;
    DelDocDataSetNAME: TFIBStringField;
    DelDocDataSetDOC_DEL_VENDOR: TFIBStringField;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    DelDocDataSetITEM: TFIBStringField;
    BitBtn3: TBitBtn;
    DelDocDataSetKOD: TFIBIntegerField;
    DelDocDataSetTOVAR_NAME: TFIBStringField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    DelDocDataSetPRICE: TFIBFloatField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DelDocFrm: TDelDocFrm;

implementation

uses ShopMain, Spr;

{$R *.dfm}

procedure TDelDocFrm.BitBtn1Click(Sender: TObject);
var ItemTmp: string;
    i: Integer;
begin
    with DelDocDataSet do
    begin
      Close;

      ItemTmp:= '';
      for i:= 0 to DocTypeCheckListBox.Items.Count - 1 do
      begin
        if DocTypeCheckListBox.Checked[i] then
        begin
          if ItemTmp <> '' then ItemTmp:= ItemTmp + ',';
          ItemTmp:= ItemTmp + IntToStr(i+1);
        end;
      end;
      if ItemTmp <> '' then
        SelectSQL[SelectSQL.Count - 4]:= 'where h.doc_type in (' + ItemTmp + ')'
      else
        SelectSQL[SelectSQL.Count - 4]:= '';
      ItemTmp:= '';
      for i:= 0 to MarketCheckListBox.Items.Count - 1 do
      begin
        if MarketCheckListBox.Checked[i] then
        begin
          if ItemTmp <> '' then ItemTmp:= ItemTmp + ''' ,''';
          ItemTmp:= ItemTmp + MarketCheckListBox.Items[i];
        end;
      end;
      if ItemTmp <> '' then
      begin
        SelectSQL[SelectSQL.Count - 3]:= ' m.short_name in (''' + ItemTmp + ''')';
        if CalcChecked(DocTypeCheckListBox) = 0 then
          SelectSQL[SelectSQL.Count - 3]:= 'where' + SelectSQL[SelectSQL.Count - 3]
        else
          SelectSQL[SelectSQL.Count - 3]:= 'and' + SelectSQL[SelectSQL.Count - 3]
      end
      else
        SelectSQL[SelectSQL.Count - 3]:= '';
      if ItemEdit.Text > '' then
      begin
        SelectSQL[SelectSQL.Count - 2]:= ' p.item = ''' + ItemEdit.Text + '''';
        if CalcChecked(DocTypeCheckListBox) + CalcChecked(MarketCheckListBox) = 0 then
          SelectSQL[SelectSQL.Count - 2]:= 'where' + SelectSQL[SelectSQL.Count - 2]
        else
          SelectSQL[SelectSQL.Count - 2]:= 'and' + SelectSQL[SelectSQL.Count - 2]
      end
      else
        SelectSQL[SelectSQL.Count - 2]:= '';

      Open;
    end;
    DBGrid1.Columns[0].Visible:= ItemEdit.Text = '';
    DBGrid1.Columns[1].Visible:= ItemEdit.Text = '';


    Memo1.Lines:=  DelDocDataSet.SelectSQL;
end;

procedure TDelDocFrm.BitBtn2Click(Sender: TObject);
begin
  with DelDocDataSet do
  begin
    DisableControls;
    Close;
    SelectSQL[SelectSQL.Count - 1]:= 'order by h.doc_number';
    Open;
    frxReport1.LoadFromFile(ShopIni.ReadString('Reports', 'DelDoc', ReportsPath + 'DelDoc.fr3'));
    frxReport1.ShowReport;
    Close;
    SelectSQL[SelectSQL.Count - 1]:= '';
    Open;
    EnableControls;
  end;
end;

procedure TDelDocFrm.BitBtn3Click(Sender: TObject);
var ItemTmp: String;
    i: Integer;
begin
    with DelDocDataSet do
    begin
      i:= DelDocDataSet['KOD'];
      Close;
      SelectSQL[SelectSQL.Count - 4]:= 'where p.kod = ' + IntToStr(i);
      SelectSQL[SelectSQL.Count - 3]:= '';
      SelectSQL[SelectSQL.Count - 2]:= '';
      Open;
    end;


    DBGrid1.Columns[0].Visible:= True;
    DBGrid1.Columns[1].Visible:= True;


    Memo1.Lines:=  DelDocDataSet.SelectSQL;
end;

procedure TDelDocFrm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
       BitBtn2.Enabled:= DelDocDataSet.Active and not VarIsNull(DelDocDataSet['ITEM']);
       BitBtn3.Enabled:= BitBtn2.Enabled;
end;

procedure TDelDocFrm.FormCreate(Sender: TObject);
begin
  with ShopMainForm.pFIBService do
  begin
    SelectSQL.Clear;
    SelectSQL.Add('select MARKET_CODE, SHORT_NAME from SPR_MARKET order by SHORT_NAME');
    Open;
    while not Eof do
    begin
      MarketCheckListBox.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);
      Next;
    end;
    Close;
  end;

  if (Assigned(SprFrm) and (not VarIsNull(SprFrm.SprTovar['ITEM']))) then ItemEdit.Text:= SprFrm.SprTovar['ITEM'];

end;

end.
