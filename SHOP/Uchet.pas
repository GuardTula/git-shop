unit Uchet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet, pFIBDataSet,
  frxFIBComponents, DSContainer, Menus;

type
  TUchetFrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    DataSource4: TDataSource;
    DBGrid4: TDBGrid;
    DataSource5: TDataSource;
    RadioGroup2: TRadioGroup;
    Edit1: TEdit;
    Label5: TLabel;
    LMDEdit1: TEdit;
    LMDEdit2: TEdit;
    LMDEdit3: TEdit;
    LMDEdit4: TEdit;
    LMDButton7: TBitBtn;
    LMDButton1: TBitBtn;
    LMDButton2: TBitBtn;
    LMDButton3: TBitBtn;
    LMDButton4: TBitBtn;
    LMDButton5: TBitBtn;
    LMDButton6: TBitBtn;
    MarketComboBox: TComboBox;
    Label6: TLabel;
    pFIBStoredProc1: TpFIBStoredProc;
    UchetQuery: TpFIBDataSet;
    UchetQueryMARKET_CODE: TFIBIntegerField;
    UchetQueryUCHET_NUM: TFIBIntegerField;
    UchetQueryITEM: TFIBStringField;
    UchetQueryACOUNT_KOLVO: TFIBFloatField;
    UchetQueryCOUNT_KOLVO: TFIBFloatField;
    UchetQuerySAVE_DATE: TFIBDateTimeField;
    UchetQuerySALE_PRICE: TFIBFloatField;
    UchetQueryTOVAR_NAME: TFIBStringField;
    UchetQueryVEND_PRICE: TFIBFloatField;
    UchetQueryUNIT_NAME: TFIBStringField;
    DataSetsContainer1: TDataSetsContainer;
    DataSetsContainer2: TDataSetsContainer;
    HdrSaveUchet: TpFIBDataSet;
    PosSaveUchet: TpFIBDataSet;
    PosSaveUchetMARKET_CODE: TFIBIntegerField;
    PosSaveUchetUCHET_NUM: TFIBIntegerField;
    PosSaveUchetITEM: TFIBStringField;
    PosSaveUchetACOUNT_KOLVO: TFIBFloatField;
    PosSaveUchetCOUNT_KOLVO: TFIBFloatField;
    PosSaveUchetSAVE_DATE: TFIBDateTimeField;
    PosSaveUchetSALE_PRICE: TFIBFloatField;
    PosSaveUchetTOVAR_NAME: TFIBStringField;
    PosSaveUchetVEND_PRICE: TFIBFloatField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure LMDButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LMDEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure LMDEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LMDEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure LMDEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LMDButton5Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure LMDButton6Click(Sender: TObject);
    procedure LMDButton2Click(Sender: TObject);
    procedure LMDButton4Click(Sender: TObject);
    procedure LMDButton3Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DataSource4DataChange(Sender: TObject; Field: TField);
    procedure LMDButton7Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PosSaveUchetAfterOpen(DataSet: TDataSet);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UchetFrm: TUchetFrm;
  CurrUchetNum: Integer;

implementation

uses ShopMain, Spr;

{$R *.dfm}

procedure TUchetFrm.LMDButton1Click(Sender: TObject);
begin
      PopupMenu1.Popup(UchetFrm.Left + LMDButton1.Left,
          UchetFrm.Top + LMDButton1.Top + LMDButton1.Height + 20);
end;

procedure TUchetFrm.FormCreate(Sender: TObject);
begin
        HdrSaveUchet.Open;
        PosSaveUchet.Open;
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_MARKET');
          Open;
          MarketComboBox.Items.Clear;
          while not Eof do
          begin
            MarketComboBox.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);
            Next;
          end;
          MarketComboBox.ItemIndex:= 0;
          Close;
        end;

        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select max(U.UCHET_NUM) as MAXNUM, M.SHORT_NAME from UCHET U');
          SelectSQL.Add('left join SPR_MARKET M on U.MARKET_CODE = M.MARKET_CODE where SAVE_DATE is null');
          SelectSQL.Add('group by SHORT_NAME');
          Open;
          if not VarIsNull(ShopMainForm.pFIBService['MAXNUM'])then
          begin
            CurrUchetNum:= ShopMainForm.pFIBService['MAXNUM'];
            UchetQuery.SelectSQL.Clear;
            UchetQuery.SelectSQL.Add('select U.*, N.UNIT_NAME');
            UchetQuery.SelectSQL.Add('from UCHET U left join SPR_TOVAR T on U.ITEM = T.ITEM');
            UchetQuery.SelectSQL.Add('left join SPR_UNITS N on N.UNIT_KOD = T.UNIT_KOD');
            UchetQuery.SelectSQL.Add('where U.UCHET_NUM = ' + IntToStr(CurrUchetNum) + ' and SAVE_DATE is null');
            UchetQuery.SelectSQL.Add('');
            UchetQuery.SelectSQL.Add('order by U.TOVAR_NAME');
            UchetQuery.Open;

            MarketComboBox.ItemIndex:= FindString(ShopMainForm.pFIBService['SHORT_NAME'], MarketComboBox.Items);
            MarketComboBox.Enabled:= False;
            DBGrid1.Visible:= True;
            Panel1.Visible:= True;
            LMDButton1.Enabled:= True;
            LMDButton2.Enabled:= False;
            LMDButton3.Enabled:= True;
            LMDButton6.Enabled:= True;
            RadioGroup1.Visible:= True;
          end
          else
          begin
            CurrUchetNum:= -1;
            LMDButton2.Enabled:= True;
          end;
          Close;
        end;
end;

procedure TUchetFrm.LMDEdit1KeyPress(Sender: TObject; var Key: Char);
begin
        if not (Key in [#8, '0'..'9'])then Key:= #0;
end;

procedure TUchetFrm.LMDEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i: Integer;
   cur_kolvo: Double;
begin
        case Key of
          VK_INSERT: LMDEdit1.Text:= ChangeWithCat;
          VK_ESCAPE:
          begin
            LMDEdit1.Text:= '';
            LMDEdit2.Text:= '';
            LMDEdit3.Text:= '';
            LMDEdit4.Text:= '';
            LMDEdit4.Enabled:= False;
          end;
          VK_RETURN: if LMDEdit1.Text <> '' then
          begin
            pFIBStoredProc1.StoredProcName:= 'GET_TOVAR';
            pFIBStoredProc1.ParamByName('FIND_ITEM').AsString:= LMDEdit1.Text;
            pFIBStoredProc1.ExecProc;
            if pFIBStoredProc1.ParamByName('RESULT').AsInteger = 0 then
            begin
              MessageDlg('Данный товар не зарегистрирован', mtInformation, [mbOK], 0);
              LMDEdit1.Text:= '';
              LMDEdit2.Text:= '';
              LMDEdit3.Text:= '';
              LMDEdit4.Text:= '';
              LMDEdit4.Enabled:= False;
            end
            else
            begin
              LMDEdit1.Enabled:= False;
              LMDEdit1.Text:= pFIBStoredProc1.ParamByName('ITEM').AsString;
              UchetQuery.Locate('ITEM', LMDEdit1.Text, []);
              LMDEdit2.Text:= pFIBStoredProc1.ParamByName('NAME').AsString;
              LMDEdit3.Text:= FloatToStrF(pFIBStoredProc1.ParamByName('PRICE').AsFloat, ffCurrency, 12, 2);
              with ShopMainForm.pFIBService do
              begin
                i:= FindMarketCode(MarketComboBox.Text);
                cur_kolvo:= 0;
                SelectSQL.Clear;
                SelectSQL.Add('select sum(kolvo) KOLVO from TOVAR_OST');
                SelectSQL.Add('where ITEM = ''' + pFIBStoredProc1.ParamByName('ITEM').AsString + '''');
                SelectSQL.Add('and MARKET_CODE = ' + IntToStr(i));
                Open;
                if not VarIsNull(ShopMainForm.pFIBService['KOLVO'])then cur_kolvo:= ShopMainForm.pFIBService['KOLVO'];
                Close;

                SelectSQL.Clear;
                SelectSQL.Add('select sum(kolvo) KOLVO from POS_RASHOD P left join HDR_RASHOD H on H.KOD = P.KOD');
                SelectSQL.Add('where P.ITEM = ''' + pFIBStoredProc1.ParamByName('ITEM').AsString + '''');
                SelectSQL.Add('and H.DOC_TYPE = 12 and H.MARKET_CODE = ' + IntToStr(i));
                Open;
                if not VarIsNull(ShopMainForm.pFIBService['KOLVO'])then cur_kolvo:= cur_kolvo + ShopMainForm.pFIBService['KOLVO'];
                Close;

                LMDEdit4.Text:= FloatToStrF(cur_kolvo, ffGeneral, 15, 3);
              end;
              LMDEdit4.Enabled:= True;
              LMDEdit4.SetFocus;
            end;
          end;
        end;
end;

procedure TUchetFrm.LMDEdit4KeyPress(Sender: TObject; var Key: Char);
begin
     if(Key = ',')and(Pos(',', LMDEdit4.Text) <> 0)then Key:= #0;
     if not (Key in[#8,',','0'..'9'])then Key:= #0;
end;

procedure TUchetFrm.N1Click(Sender: TObject);
begin
      if CurrUchetNum <> -1 then
      begin
        pFIBStoredProc1.StoredProcName:= 'ADD_EMPTY_UCHET';
        pFIBStoredProc1.ParamByName('UCHET_NUM').AsInteger:= CurrUchetNum;
        pFIBStoredProc1.ParamByName('MARKET_CODE').AsInteger:= FindMarketCode(MarketComboBox.Text);
        pFIBStoredProc1.ExecProc;
        DataSetReOpen(UchetQuery);
      end;
end;

procedure TUchetFrm.N2Click(Sender: TObject);
var UchItem, SprItem: String;
    CurMarketCode: Integer;
begin
  if not VarIsNull(SprFrm.SprTovar['ITEM'])then
  begin
    SprItem:= SprFrm.SprTovar['ITEM'];
    if not VarIsNull(UchetQuery['ITEM'])then
      UchItem:= UchetQuery['ITEM']
    else
      UchItem:= '0';
    UchetQuery.DisableControls;
    SprFrm.SprTovar.First;
    CurMarketCode:= FindMarketCode(MarketComboBox.Text);
    while not SprFrm.SprTovar.Eof do
    begin
      if not UchetQuery.Locate('ITEM', SprFrm.SprTovar['ITEM'], []) then
      begin
        pFIBStoredProc1.StoredProcName:= 'ADD_UCHET_ITEM';
        pFIBStoredProc1.ParamByName('ITEM').AsString:= SprFrm.SprTovar['ITEM'];
        pFIBStoredProc1.ParamByName('COUNT_KOLVO').AsFloat:= 0;
        pFIBStoredProc1.ParamByName('UCHET_NUM').AsInteger:= CurrUchetNum;
        pFIBStoredProc1.ParamByName('MARKET_CODE').AsInteger:= CurMarketCode;
        pFIBStoredProc1.ExecProc;
      end;
      SprFrm.SprTovar.Next;
    end;
    ShopMainForm.pFIBTransaction1.CommitRetaining;
    ShopMainForm.pFIBDatabase1.Execute('delete from UCHET where COUNT_KOLVO = 0 and ACOUNT_KOLVO = 0');
    UchetQuery.CloseOpen(False);
    UchetQuery.Locate('ITEM', UchItem, []);
    UchetQuery.EnableControls;
    SprFrm.SprTovar.Locate('ITEM', SprItem, []);
  end;
end;

procedure TUchetFrm.LMDEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        case Key of
          VK_ESCAPE:
          begin
            LMDEdit2.Text:= '';
            LMDEdit3.Text:= '';
            LMDEdit4.Text:= '';
            LMDEdit4.Enabled:= False;
            LMDEdit1.Enabled:= True;
            LMDEdit1.Text:= '';
            LMDEdit1.SetFocus;
          end;
          VK_RETURN:
          begin // Добавление товара в учёт
            pFIBStoredProc1.StoredProcName:= 'ADD_UCHET_ITEM';
            pFIBStoredProc1.ParamByName('ITEM').AsString:= LMDEdit1.Text;
            pFIBStoredProc1.ParamByName('COUNT_KOLVO').AsFloat:= StrToFloat(LMDEdit4.Text);
            pFIBStoredProc1.ParamByName('UCHET_NUM').AsInteger:= CurrUchetNum;
            pFIBStoredProc1.ParamByName('MARKET_CODE').AsInteger:= FindMarketCode(MarketComboBox.Text);
            pFIBStoredProc1.ExecProc;
            ShopMainForm.pFIBTransaction1.CommitRetaining;
            UchetQuery.CloseOpen(False);
            UchetQuery.Locate('ITEM', LMDEdit1.Text, []);
            LMDEdit2.Text:= '';
            LMDEdit3.Text:= '';
            LMDEdit4.Text:= '';
            LMDEdit4.Enabled:= False;
            LMDEdit1.Enabled:= True;
            LMDEdit1.Text:= '';
            LMDEdit1.SetFocus;
          end;
        end;
end;

procedure TUchetFrm.LMDButton5Click(Sender: TObject);
var cur_item: String;
begin
       if MessageDlg('Удалить позицию с кодом : ' + UchetQuery['ITEM']
         , mtConfirmation, [mbYes,mbNo], 0) = idYes then
        begin
          ShopMainForm.pFIBDatabase1.Execute('delete from UCHET'
            + ' where MARKET_CODE = ' + IntToStr(UchetQuery['MARKET_CODE'])
            + ' and UCHET_NUM = ' + IntToStr(UchetQuery['UCHET_NUM'])
            + ' and ITEM = ''' + UchetQuery['ITEM'] + '''');
          with UchetQuery do
          begin
            DisableControls;
            cur_item:= UchetQuery['ITEM'];
            Next;
            if cur_item = UchetQuery['ITEM'] then Prior;
            cur_item:= UchetQuery['ITEM'];
            Close;
            Open;
            Locate('ITEM', cur_item, []);
            EnableControls;
          end;
        end;
end;

procedure TUchetFrm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
       LMDButton4.Enabled:= not VarIsNull(UchetQuery['ITEM']);
       LMDButton5.Enabled:= not VarIsNull(UchetQuery['ITEM']);
end;

procedure TUchetFrm.LMDButton6Click(Sender: TObject);
begin
      if MessageDlg('Отменить текущий учёт', mtConfirmation, [mbYes,mbNo], 0) = idYes then
        begin
          ShopMainForm.pFIBDatabase1.Execute('delete from UCHET where SAVE_DATE is null');
          DBGrid1.Visible:= False;
          Panel1.Visible:= False;
          RadioGroup1.Visible:= False;
          LMDButton1.Enabled:= False;
          LMDButton2.Enabled:= True;
          LMDButton3.Enabled:= False;
          LMDButton4.Enabled:= False;
          LMDButton5.Enabled:= False;
          LMDButton6.Enabled:= False;
          MarketComboBox.Enabled:= True;
          CurrUchetNum:= -1;
          UchetQuery.Close;
          ShopMainForm.pFIBTransaction1.Commit;SprFrmFree;
          PosSaveUchet.Close;
          HdrSaveUchet.Close;
          HdrSaveUchet.Open;
          PosSaveUchet.Open;
        end;
end;

procedure TUchetFrm.LMDButton2Click(Sender: TObject);
begin
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select max(UCHET_NUM) as MAXNUM from UCHET');
          Open;
          if not VarIsNull(ShopMainForm.pFIBService['MAXNUM'])then
            CurrUchetNum:= ShopMainForm.pFIBService['MAXNUM'] + 1
          else CurrUchetNum:= 1;
          Close;
        end;
        with UchetQuery.SelectSQL do
        begin
          Clear;
          Add('select U.*, T.TOVAR_NAME, N.UNIT_NAME');
          Add('from UCHET U left join SPR_TOVAR T on U.ITEM = T.ITEM');
          Add('left join SPR_UNITS N on N.UNIT_KOD = T.UNIT_KOD');
          Add('where U.UCHET_NUM = ' + IntToStr(CurrUchetNum));
          Add('');
          Add('order by T.TOVAR_NAME');
        end;
        MarketComboBox.Enabled:= False;
        UchetQuery.Open;
        DBGrid1.Visible:= True;
        Panel1.Visible:= True;
        RadioGroup1.Visible:= True;
        LMDButton1.Enabled:= True;
        LMDButton2.Enabled:= False;
        LMDButton3.Enabled:= True;
        LMDButton6.Enabled:= True;
end;

procedure TUchetFrm.LMDButton4Click(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
      with ShopMainForm.frxReport1 do
      begin
        LoadFromFile(ShopIni.ReadString('Reports', 'Uchet001', ReportsPath + 'Uchet001.fr3'));
        FIBQuery1:= FindObject('UchetRepQuery') as TfrxFIBQuery;
        FIBQuery1.SQL:= UchetQuery.SelectSQL;
        Script.Variables['ObjName']:= MarketComboBox.Text;
        Script.Variables['SaveDate']:= DateToStr(Now);
        ShowReport;
      end;
end;

procedure TUchetFrm.LMDButton3Click(Sender: TObject);
begin
        if(MessageDlg('Сохранить данные ревизии товарного запаса',
           mtWarning, [mbYes,mbNo], 0) = idYes)and(CurrUchetNum <> -1)then
        begin
          Screen.Cursor:= crHourGlass;
          pFIBStoredProc1.StoredProcName:= 'SAVE_UCHET_DATA';
          pFIBStoredProc1.ParamByName('UCHET_NUM').AsInteger:= CurrUchetNum;
          pFIBStoredProc1.ParamByName('MARKET_CODE').AsInteger:= FindMarketCode(MarketComboBox.Text);
          pFIBStoredProc1.ParamByName('AUTOR_KOD').AsInteger:= User_ID;
          pFIBStoredProc1.ExecProc;
          if pFIBStoredProc1.ParamByName('RESULT').AsInteger = -1 then
            MessageDlg('Данного учёта не существует или данные уже сохранены', mtError, [mbOK], 0)
          else
          begin
            DBGrid1.Visible:= False;
            Panel1.Visible:= False;
            RadioGroup1.Visible:= False;
            LMDButton1.Enabled:= False;
            LMDButton2.Enabled:= True;
            LMDButton3.Enabled:= False;
            LMDButton4.Enabled:= False;
            LMDButton5.Enabled:= False;
            LMDButton6.Enabled:= False;
            MarketComboBox.Enabled:= True;
            CurrUchetNum:= -1;
            UchetQuery.Close;
            ShopMainForm.pFIBTransaction1.Commit;SprFrmFree;
            MessageDlg('Данные учёта успешно сохранены', mtInformation, [mbOK], 0);
            PosSaveUchet.Close;
            HdrSaveUchet.Close;
            HdrSaveUchet.Open;
            PosSaveUchet.Open;
          end;
          Screen.Cursor:= crDefault;
        end;
end;

procedure TUchetFrm.RadioGroup1Click(Sender: TObject);
begin
       UchetQuery.Close;
       case RadioGroup1.ItemIndex of
         0: UchetQuery.SelectSQL[4]:= '';
         1: UchetQuery.SelectSQL[4]:= 'and U.ACOUNT_KOLVO <> U.COUNT_KOLVO';
         2: UchetQuery.SelectSQL[4]:= 'and U.ACOUNT_KOLVO < 0';
       end;
       UchetQuery.Open;
end;

procedure TUchetFrm.DataSource4DataChange(Sender: TObject; Field: TField);
begin
       LMDButton7.Enabled:= not VarIsNull(PosSaveUchet['ITEM']);
end;

procedure TUchetFrm.LMDButton7Click(Sender: TObject);
var  FIBQuery1: TfrxFIBQuery;
begin
      with ShopMainForm.frxReport1 do
      begin
        LoadFromFile(ShopIni.ReadString('Reports', 'Uchet001', ReportsPath + 'Uchet001.fr3'));
        FIBQuery1:= FindObject('UchetRepQuery') as TfrxFIBQuery;
        with FIBQuery1 do
        begin
          SQL.Clear;
          SQL.Add('select U.*, N.UNIT_NAME');
          SQL.Add('from UCHET U left join SPR_TOVAR T on U.ITEM = T.ITEM');
          SQL.Add('left join SPR_UNITS N on N.UNIT_KOD = T.UNIT_KOD');
          SQL.Add('where U.UCHET_NUM = ' + IntToStr(HdrSaveUchet['UCHET_NUM']));
          SQL.Add('and U.MARKET_CODE = ' + IntToStr(HdrSaveUchet['MARKET_CODE']));
          case RadioGroup2.ItemIndex of
            1: SQL.Add('and U.ACOUNT_KOLVO <> U.COUNT_KOLVO');
            2: SQL.Add('and U.ACOUNT_KOLVO < 0');
          end;
          SQL.Add('order by U.TOVAR_NAME');
        end;  
      Script.Variables['ObjName']:= HdrSaveUchet['SHORT_NAME'];
      Script.Variables['SaveDate']:= DateToStr(HdrSaveUchet['SAVE_DATE']);
      ShowReport;
     end;
end;

procedure TUchetFrm.RadioGroup2Click(Sender: TObject);
begin
       PosSaveUchet.Close;
       case RadioGroup2.ItemIndex of
         0: PosSaveUchet.SelectSQL[3]:= '';
         1: PosSaveUchet.SelectSQL[3]:= 'and ACOUNT_KOLVO <> COUNT_KOLVO';
         2: PosSaveUchet.SelectSQL[3]:= 'and ACOUNT_KOLVO < 0';
       end;
       PosSaveUchet.Open;
end;

procedure TUchetFrm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
      if not PosSaveUchet.Locate('ITEM', Edit1.Text, []) then
      begin
        MessageDlg('Позиция с кодом: ' + Edit1.Text + ' не найдена', mtInformation, [mbOK], 0);
        Edit1.SelectAll;
      end
      else Edit1.Text:= '';
end;

procedure TUchetFrm.PopupMenu1Popup(Sender: TObject);
begin
  N2.Enabled:= Assigned(SprFrm);
end;

procedure TUchetFrm.PosSaveUchetAfterOpen(DataSet: TDataSet);
begin
       LMDButton7.Enabled:= not VarIsNull(PosSaveUchet['ITEM']);
end;

end.
