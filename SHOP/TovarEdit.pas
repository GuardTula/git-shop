unit TovarEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ExtCtrls, Buttons, ActnList, DB, StdCtrls, ComCtrls, FIBDataSet,
  pFIBDataSet, System.Actions, Vcl.Mask;

type
  TTovarEditFrm = class(TForm)
    ItemEdit: TLabeledEdit;
    TovarNameEdit: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    VendorComboBox: TComboBox;
    TGroupComboBox: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    KKMComboBox: TComboBox;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    AddTovar: TAction;
    BarCodeEdit: TEdit;
    Label6: TLabel;
    RemarkEdit: TLabeledEdit;
    UnitsComboBox: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    ArtikulEdit: TLabeledEdit;
    Label9: TLabel;
    ProducerEdit: TComboBox;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Rem2Edit: TLabeledEdit;
    VendCodeEdit: TLabeledEdit;
    ExtraChargeEdit: TEdit;
    PriceEdit: TEdit;
    VendorPriceEdit: TEdit;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    IBQuery1: TpFIBDataSet;
    TovarMarkedCheckBox: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Price1Edit: TEdit;
    Price2Edit: TEdit;
    Price4Edit: TEdit;
    Price3Edit: TEdit;
    Price5Edit: TEdit;
    Tag5Edit: TEdit;
    Tag4Edit: TEdit;
    Tag3Edit: TEdit;
    Tag2Edit: TEdit;
    Tag1Edit: TEdit;
    Price6Edit: TEdit;
    Tag6Edit: TEdit;
    Price7Edit: TEdit;
    Tag7Edit: TEdit;
    Price8Edit: TEdit;
    Tag8Edit: TEdit;
    Price9Edit: TEdit;
    Tag9Edit: TEdit;
    ComboBox1: TComboBox;
    TabSheet2: TTabSheet;
    CstPriceType1ComboBox: TComboBox;
    Label19: TLabel;
    CstPrice1Edit: TEdit;
    Label20: TLabel;
    CstPrice2Edit: TEdit;
    Label21: TLabel;
    CstPrice3Edit: TEdit;
    CstPrice3TagEdit: TEdit;
    CstPrice2TagEdit: TEdit;
    CstPrice1TagEdit: TEdit;
    CstPriceType2ComboBox: TComboBox;
    CstPriceType3ComboBox: TComboBox;
    ColorBox1: TColorBox;
    Label22: TLabel;
    UseColorMarkCheckBox: TCheckBox;
    Label23: TLabel;
    ColorBox2: TColorBox;
    SaleUseColorMarkCheckBox: TCheckBox;
    procedure ItemEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AddTovarUpdate(Sender: TObject);
    procedure PriceEditKeyPress(Sender: TObject; var Key: Char);
    procedure AddTovarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VendorPriceEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TovarNameEditKeyPress(Sender: TObject; var Key: Char);
    procedure ProducerEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PriceEditChange(Sender: TObject);
    procedure VendorPriceEditKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Price1EditChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CstPriceType1ComboBoxChange(Sender: TObject);
    procedure CstPriceType2ComboBoxChange(Sender: TObject);
    procedure CstPriceType3ComboBoxChange(Sender: TObject);
    procedure CstPrice1TagEditChange(Sender: TObject);
    procedure CstPrice2TagEditChange(Sender: TObject);
    procedure CstPrice3TagEditChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TovarEditFrm: TTovarEditFrm;

implementation

uses ShopMain, Spr;

{$R *.dfm}

procedure TTovarEditFrm.ItemEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then SelectNext(Sender as TWinControl, True, True);
     if Key = VK_INSERT then SpeedButton2.Click;
     
end;

procedure TTovarEditFrm.AddTovarUpdate(Sender: TObject);
begin
        AddTovar.Enabled:= (ItemEdit.Text <> '')and(TovarNameEdit.Text <> '')
               and(StrToFloat('0' + PriceEdit.Text) > 0)
               and(StrToFloat('0' + VendorPriceEdit.Text) > 0)
                {and(ExtraChargeEdit.Text <> '')and(ExtraChargeEdit.Text <> '0')};
end;

procedure TTovarEditFrm.CstPrice1TagEditChange(Sender: TObject);
var SPrice, VPrice: Double;
begin
    if StrToFloat('0'+VendorPriceEdit.Text) > 0 then
    begin
      VPrice:= StrToFloat(VendorPriceEdit.Text);
      case CstPriceType1ComboBox.ItemIndex of
        0: begin
             if StrToInt('0'+CstPrice1TagEdit.Text) > 0 then
               CstPrice1Edit.Text:= FloatToStrF(VPrice*(1 + StrToInt(CstPrice1TagEdit.Text)/100), ffFixed, 16, 0)
             else
               CstPrice1Edit.Text:= '';
           end;
      end;
    end;
end;

procedure TTovarEditFrm.CstPrice2TagEditChange(Sender: TObject);
var SPrice, VPrice: Double;
begin
    if StrToFloat('0'+VendorPriceEdit.Text) > 0 then
    begin
      VPrice:= StrToFloat(VendorPriceEdit.Text);
      case CstPriceType2ComboBox.ItemIndex of
        0: begin
             if StrToInt('0'+CstPrice2TagEdit.Text) > 0 then
               CstPrice2Edit.Text:= FloatToStrF(VPrice*(1 + StrToInt(CstPrice2TagEdit.Text)/100), ffFixed, 16, 0)
             else
               CstPrice2Edit.Text:= '';
           end;
      end;
    end;
end;

procedure TTovarEditFrm.CstPrice3TagEditChange(Sender: TObject);
var SPrice, VPrice: Double;
begin
    if StrToFloat('0'+VendorPriceEdit.Text) > 0 then
    begin
      VPrice:= StrToFloat(VendorPriceEdit.Text);
      case CstPriceType3ComboBox.ItemIndex of
        0: begin
             if StrToInt('0'+CstPrice3TagEdit.Text) > 0 then
               CstPrice3Edit.Text:= FloatToStrF(VPrice*(1 + StrToInt(CstPrice3TagEdit.Text)/100), ffFixed, 16, 0)
             else
               CstPrice3Edit.Text:= '';
           end;
      end;
    end;
end;

procedure TTovarEditFrm.CstPriceType1ComboBoxChange(Sender: TObject);
begin
  CstPrice1Edit.Enabled:= CstPriceType1ComboBox.ItemIndex = 1;
end;

procedure TTovarEditFrm.CstPriceType2ComboBoxChange(Sender: TObject);
begin
  CstPrice2Edit.Enabled:= CstPriceType2ComboBox.ItemIndex = 1;
end;

procedure TTovarEditFrm.CstPriceType3ComboBoxChange(Sender: TObject);
begin
  CstPrice3Edit.Enabled:= CstPriceType3ComboBox.ItemIndex = 1;
end;

procedure TTovarEditFrm.PriceEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in [#8, '0'..'9'])then Key:= #0;
end;

procedure TTovarEditFrm.AddTovarExecute(Sender: TObject);
var Group_C, Vend_C, Unit_C: Integer;
    P, Vend_P, P1, P2, P3, P4, P5, P6, P7, P8, P9: Double;
    TmpDSep: Char;
    SQLStr: String;
begin
        Timer1.Enabled:= False;
        with IBQuery1 do
        begin
            Close;
            SelectSQL.Clear;
            SelectSQL.Add('select * from SPR_GROUP ');
            SelectSQL.Add('where GROUP_NAME = ''' + TGroupComboBox.Text + '''');
            Open;
            if VarIsNull(IBQuery1['T_GROUP'])then
            begin
              MessageDlg('Данная группа не найдена', mtError, [mbOK], 0);
              Abort;
            end;
            Group_C:= IBQuery1['T_GROUP'];
            Close;
            SelectSQL.Clear;
            SelectSQL.Add('select * from SPR_VENDORS ');
            SelectSQL.Add('where VENDOR_NAME = ''' + VendorComboBox.Text + '''');
            Open;
            if VarIsNull(IBQuery1['VENDOR_CODE'])then
            begin
              MessageDlg('Данный поставщик не найден', mtError, [mbOK], 0);
              Abort;
            end;
            Vend_C:= IBQuery1['VENDOR_CODE'];
            Close;
            SelectSQL.Clear;
            SelectSQL.Add('select * from SPR_UNITS');
            SelectSQL.Add('where UNIT_NAME = ''' + UnitsComboBox.Text + '''');
            Open;
            if VarIsNull(IBQuery1['UNIT_KOD'])then
            begin
              MessageDlg('Данная ед.измерения не найдена', mtError, [mbOK], 0);
              Abort;
            end;
            Unit_C:= IBQuery1['UNIT_KOD'];
            Close;
        end;
        P:= StrToFloat(PriceEdit.Text);
        Vend_P:= StrToFloat(VendorPriceEdit.Text);
        P1:= StrToFloat('0' + Price1Edit.Text);
        P2:= StrToFloat('0' + Price2Edit.Text);
        P3:= StrToFloat('0' + Price3Edit.Text);
        P4:= StrToFloat('0' + Price4Edit.Text);
        P5:= StrToFloat('0' + Price5Edit.Text);
        P6:= StrToFloat('0' + Price6Edit.Text);
        P7:= StrToFloat('0' + Price7Edit.Text);
        P8:= StrToFloat('0' + Price8Edit.Text);
        P9:= StrToFloat('0' + Price9Edit.Text);

        TmpDSep:= FormatSettings.DecimalSeparator;
        FormatSettings.DecimalSeparator:= '.';

        if TovarMarkedCheckBox.Checked then TovarMarkedCheckBox.Tag:= 1
        else TovarMarkedCheckBox.Tag:= 0;

     try
      if TovarEditFrm.Tag = 1 then
        with IBQuery1 do
        begin
          Close;
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_TOVAR where ITEM = ''' + ItemEdit.Text + '''');
          Open;
          if not VarIsNull(IBQuery1['ITEM'])then
          begin
            MessageDlg('Товар с данным кодом уже существует', mtWarning, [mbOK], 0);
            Abort;
          end
          else
          begin
//            ShopMainForm.pFIBDatabase1.Execute('insert into SPR_TOVAR ('
            ExecSQLStr('insert into SPR_TOVAR ('
              + ' ITEM, TOVAR_NAME, T_GROUP, VENDOR_CODE, KKM_SECT,'
              + ' AUTOR_KOD, REMARK, UNIT_KOD, ARTIKUL, PRODUCER, REMARK_1, VEND_ITEM, MARKED)'
              + ' values(''' + ItemEdit.Text + ''', ''' + TovarNameEdit.Text + ''', '
              + IntToStr(Group_C) + ', ' + IntToStr(Vend_C)
              + ', ' + IntToStr(KKMComboBox.ItemIndex) + ', '
              + IntToStr(User_ID) + ', '''+ RemarkEdit.Text + ''', '
              + IntToStr(Unit_C) + ', ''' + ArtikulEdit.Text + ''', '''
              + ProducerEdit.Text + ''', ''' + Rem2Edit.Text + ''', '''
              + VendCodeEdit.Text + ''', ' + IntToStr(TovarMarkedCheckBox.Tag) + ')');
{            with SprFrm.SprTovar do
            begin
              Insert;
              FieldByName('ITEM').AsString:= ItemEdit.Text;
              FieldByName('TOVAR_NAME').AsString:= TovarNameEdit.Text;
              FieldByName('T_GROUP').AsInteger:= Group_C;
              FieldByName('VENDOR_CODE').AsInteger:= Vend_C;
              FieldByName('KKM_SECT').AsInteger:= KKMComboBox.ItemIndex;
              FieldByName('AUTOR_KOD').AsInteger:= User_ID;
              FieldByName('REMARK').AsString:= RemarkEdit.Text;
              FieldByName('UNIT_KOD').AsInteger:= Unit_C;
              FieldByName('ARTIKUL').AsString:= ArtikulEdit.Text;
              FieldByName('PRODUCER').AsString:= ProducerEdit.Text;
              FieldByName('REMARK_1').AsString:= Rem2Edit.Text;
              FieldByName('VEND_ITEM').AsString:= VendCodeEdit.Text;
              Post;
            end;}

            SQLStr:= 'insert into PRICES('
              + ' MARKET_CODE, ITEM, SALE_PRICE, PRICE_1, PRICE_1_TAG,'
              + ' PRICE_2, PRICE_2_TAG, PRICE_3, PRICE_3_TAG, PRICE_4, PRICE_4_TAG,'
              + ' PRICE_5, PRICE_5_TAG, PRICE_6, PRICE_6_TAG, PRICE_7, PRICE_7_TAG,'
              + ' PRICE_8, PRICE_8_TAG, PRICE_9, PRICE_9_TAG, VEND_PRICE, PRICE_TYPE)'
              + ' values(' + IntToStr(CurrentMarketCode) + ', '''
              + ItemEdit.Text + ''', ' + FloatToStr(P) + ', '
              + FloatToStr(P1) + ', 0' + Tag1Edit.Text + ', '
              + FloatToStr(P2) + ', 0' + Tag2Edit.Text + ', '
              + FloatToStr(P3) + ', 0' + Tag3Edit.Text + ', '
              + FloatToStr(P4) + ', 0' + Tag4Edit.Text + ', '
              + FloatToStr(P5) + ', 0' + Tag5Edit.Text + ', '
              + FloatToStr(P6) + ', 0' + Tag6Edit.Text + ', '
              + FloatToStr(P7) + ', 0' + Tag7Edit.Text + ', '
              + FloatToStr(P8) + ', 0' + Tag8Edit.Text + ', '
              + FloatToStr(P9) + ', 0' + Tag9Edit.Text + ', '
              + FloatToStr(Vend_P) + ', ''';
            case ComboBox1.ItemIndex of
              0: SQLStr:= SQLStr + '#'')';
              1: SQLStr:= SQLStr + '%'')';
              2: SQLStr:= SQLStr + ''')';
              3: SQLStr:= SQLStr + '$'')';
            end;
            ShopMainForm.pFIBDatabase1.Execute(SQLStr);

            P1:= StrToFloat('0' + StringReplace(CstPrice1Edit.Text, ',', '.', []));
            P2:= StrToFloat('0' + StringReplace(CstPrice2Edit.Text, ',', '.', []));
            P3:= StrToFloat('0' + StringReplace(CstPrice3Edit.Text, ',', '.', []));
            SQLStr:= 'update or insert into CST_PRICES(ITEM, '
              + 'CST_PRICE_1, CST_PRICE_1_TAG, CST_PRICE_1_TYPE,'
              + 'CST_PRICE_2, CST_PRICE_2_TAG, CST_PRICE_2_TYPE,'
              + 'CST_PRICE_3, CST_PRICE_3_TAG, CST_PRICE_3_TYPE)'
              + ' values(''' + ItemEdit.Text + ''', '
              + FloatToStr(P1) + ', 0' + CstPrice1TagEdit.Text + ', ''';
            case CstPriceType1ComboBox.ItemIndex of
              0: SQLStr:= SQLStr + '%'', ';
              1: SQLStr:= SQLStr + '$'', ';
            end;
            SQLStr:= SQLStr + FloatToStr(P2) + ', 0' + CstPrice2TagEdit.Text + ', ''';
            case CstPriceType2ComboBox.ItemIndex of
              0: SQLStr:= SQLStr + '%'', ';
              1: SQLStr:= SQLStr + '$'', ';
            end;
            SQLStr:= SQLStr + FloatToStr(P3) + ', 0' + CstPrice3TagEdit.Text + ', ''';
            case CstPriceType3ComboBox.ItemIndex of
              0: SQLStr:= SQLStr + '%'')matching(ITEM)';
              1: SQLStr:= SQLStr + '$'')matching(ITEM)';
            end;
//            ShopMainForm.pFIBDatabase1.Execute(SQLStr);
            ExecSQLStr(SQLStr);

// Добавляем выделение цветом
            if TovarEditFrm.UseColorMarkCheckBox.Checked then
            begin
              ExecSQLStr('update or insert into TOVAR_ADD(ITEM, MARK_COLOR)'
                + 'values(''' + ItemEdit.Text + ''', ' + IntToStr(ColorBox1.Selected)
                + ')matching(ITEM)');
            end;

// Добавляем рекомендацию цветом
            if TovarEditFrm.SaleUseColorMarkCheckBox.Checked then
            begin
              ExecSQLStr('update or insert into TOVAR_ADD(ITEM, SALE_MARK_COLOR)'
                + 'values(''' + ItemEdit.Text + ''', ' + IntToStr(ColorBox2.Selected)
                + ')matching(ITEM)');
            end;

            MessageDlg('Новый товар добавлен', mtInformation, [mbOK], 0);
          end;
        end
        else
        with IBQuery1 do
        begin
          Close;
          SelectSQL.Clear;
          SelectSQL.Add('select SPR_TOVAR.*, PRICES.SALE_PRICE from SPR_TOVAR '
           + ' left join PRICES on SPR_TOVAR.ITEM = PRICES.ITEM and PRICES.MARKET_CODE = ' + IntToStr(CurrentMarketCode)
           + ' where SPR_TOVAR.ITEM = ''' + ItemEdit.Text + '''');
          Open;
          if not VarIsNull(IBQuery1['ITEM'])and(IBQuery1['ITEM'] <> SprFrm.SprTovar['ITEM'])then
          begin
            MessageDlg('Товар с данным кодом уже существует', mtWarning, [mbOK], 0);
            Abort;
          end
          else
          begin
            ShopMainForm.pFIBDatabase1.Execute('update SPR_TOVAR'
              + ' set TOVAR_NAME = ''' + TovarNameEdit.Text + ''','
              + ' T_GROUP = ' + IntToStr(Group_C) + ','
              + ' VENDOR_CODE = ' + IntToStr(Vend_C) + ','
              + ' KKM_SECT = ' + IntToStr(KKMComboBox.ItemIndex) + ','
              + ' AUTOR_KOD = ' + IntToStr(User_ID) + ','
              + ' REMARK = ''' + RemarkEdit.Text + ''','
              + ' UNIT_KOD = ' + IntToStr(Unit_C) + ','
              + ' ARTIKUL = ''' + ArtikulEdit.Text + ''','
              + ' PRODUCER = ''' + ProducerEdit.Text + ''','
              + ' REMARK_1 = ''' + Rem2Edit.Text + ''','
              + ' VEND_ITEM = ''' + VendCodeEdit.Text + ''','
              + ' MARKED = ' + IntToStr(TovarMarkedCheckBox.Tag)
              + ' where ITEM = ''' + ItemEdit.Text + '''');

            SQLStr:= 'update or insert into PRICES('
              + ' MARKET_CODE, ITEM, SALE_PRICE, PRICE_1, PRICE_1_TAG,'
              + ' PRICE_2, PRICE_2_TAG, PRICE_3, PRICE_3_TAG, PRICE_4, PRICE_4_TAG,'
              + ' PRICE_5, PRICE_5_TAG, PRICE_6, PRICE_6_TAG, PRICE_7, PRICE_7_TAG,'
              + ' PRICE_8, PRICE_8_TAG, PRICE_9, PRICE_9_TAG, VEND_PRICE, PRICE_TYPE)'
              + ' values(' + IntToStr(CurrentMarketCode) + ', '''
              + ItemEdit.Text + ''', ' + FloatToStr(P) + ', '
              + FloatToStr(P1) + ', 0' + Tag1Edit.Text + ', '
              + FloatToStr(P2) + ', 0' + Tag2Edit.Text + ', '
              + FloatToStr(P3) + ', 0' + Tag3Edit.Text + ', '
              + FloatToStr(P4) + ', 0' + Tag4Edit.Text + ', '
              + FloatToStr(P5) + ', 0' + Tag5Edit.Text + ', '
              + FloatToStr(P6) + ', 0' + Tag6Edit.Text + ', '
              + FloatToStr(P7) + ', 0' + Tag7Edit.Text + ', '
              + FloatToStr(P8) + ', 0' + Tag8Edit.Text + ', '
              + FloatToStr(P9) + ', 0' + Tag9Edit.Text + ', '
              + FloatToStr(Vend_P) + ', ''';
            case ComboBox1.ItemIndex of
              0: SQLStr:= SQLStr + '#'')matching(ITEM, MARKET_CODE)';
              1: SQLStr:= SQLStr + '%'')matching(ITEM, MARKET_CODE)';
              2: SQLStr:= SQLStr + ''')matching(ITEM, MARKET_CODE)';
              3: SQLStr:= SQLStr + '$'')matching(ITEM, MARKET_CODE)';
            end;
            ShopMainForm.pFIBDatabase1.Execute(SQLStr);


            P1:= StrToFloat('0' + StringReplace(CstPrice1Edit.Text, ',', '.', []));
            P2:= StrToFloat('0' + StringReplace(CstPrice2Edit.Text, ',', '.', []));
            P3:= StrToFloat('0' + StringReplace(CstPrice3Edit.Text, ',', '.', []));
            SQLStr:= 'update or insert into CST_PRICES(ITEM, '
              + 'CST_PRICE_1, CST_PRICE_1_TAG, CST_PRICE_1_TYPE, '
              + 'CST_PRICE_2, CST_PRICE_2_TAG, CST_PRICE_2_TYPE, '
              + 'CST_PRICE_3, CST_PRICE_3_TAG, CST_PRICE_3_TYPE)'
              + ' values(''' + ItemEdit.Text + ''', '
              + FloatToStr(P1) + ', 0' + CstPrice1TagEdit.Text + ', ''';
            case CstPriceType1ComboBox.ItemIndex of
              0: SQLStr:= SQLStr + '%'', ';
              1: SQLStr:= SQLStr + '$'', ';
            end;
            SQLStr:= SQLStr + FloatToStr(P2) + ', 0' + CstPrice2TagEdit.Text + ', ''';
            case CstPriceType2ComboBox.ItemIndex of
              0: SQLStr:= SQLStr + '%'', ';
              1: SQLStr:= SQLStr + '$'', ';
            end;
            SQLStr:= SQLStr + FloatToStr(P3) + ', 0' + CstPrice3TagEdit.Text + ', ''';
            case CstPriceType3ComboBox.ItemIndex of
              0: SQLStr:= SQLStr + '%'')matching(ITEM)';
              1: SQLStr:= SQLStr + '$'')matching(ITEM)';
            end;
            ShopMainForm.pFIBDatabase1.Execute(SQLStr);

// Обновляем выделение цветом
            if TovarEditFrm.UseColorMarkCheckBox.Checked then
            begin
              ExecSQLStr('update or insert into TOVAR_ADD(ITEM, MARK_COLOR)'
                + 'values(''' + ItemEdit.Text + ''', ' + IntToStr(ColorBox1.Selected)
                + ')matching(ITEM)');
            end
            else
              ExecSQLStr('update TOVAR_ADD set MARK_COLOR = null where ITEM =''' + ItemEdit.Text + '''');

// Обновляем рекомендацию цветом
            if TovarEditFrm.SaleUseColorMarkCheckBox.Checked then
            begin
              ExecSQLStr('update or insert into TOVAR_ADD(ITEM, SALE_MARK_COLOR)'
                + 'values(''' + ItemEdit.Text + ''', ' + IntToStr(ColorBox2.Selected)
                + ')matching(ITEM)');
            end
            else
              ExecSQLStr('update TOVAR_ADD set SALE_MARK_COLOR = null where ITEM =''' + ItemEdit.Text + '''');

//            MessageDlg('Сведения о товаре обновлены', mtInformation, [mbOK], 0);
          end;
        end;
        if ExtraChargeEdit.Text = '' then
            ShopMainForm.pFIBDatabase1.Execute('delete from SPR_CHARGE where ITEM = ''' + ItemEdit.Text + '''')
        else
        with IBQuery1 do
        begin
          Close;
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_CHARGE where ITEM = ''' + ItemEdit.Text + '''');
          Open;
          if VarIsNull(IBQuery1['ITEM']) then
            ShopMainForm.pFIBDatabase1.Execute('insert into SPR_CHARGE(ITEM, EXTRA_CHARGE)'
              + ' values(''' + ItemEdit.Text + ''', ' + ExtraChargeEdit.Text + ')')
          else
            ShopMainForm.pFIBDatabase1.Execute('update SPR_CHARGE'
              + ' set EXTRA_CHARGE = ' + ExtraChargeEdit.Text
              + ' where ITEM = ''' + ItemEdit.Text + '''');
          Close;
        end;
        if BarCodeEdit.Text <> '' then SprFrm.AddNewBarCode(BarCodeEdit.Text, ItemEdit.Text);
        if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.CommitRetaining;
        if TovarEditFrm.Tag = 1 then
          with SprFrm.SprTovar do
          begin
            DisableControls;
            Close;
            Open;
            Locate('ITEM', ItemEdit.Text, []);
            EnableControls;
          end
        else SprFrm.SprTovar.Refresh;
        SprFrm.SprTovar.DoSortEx([SprFrm.SprTovar.Tag], SortP);
        DataSetReOpen(SprFrm.BarCode);
        SprFrm.SprAcountGroup.Active:= True;
        SprFrm.SprTovarGroup.Active:= True;
        ModalResult:= idOK;
     finally
       FormatSettings.DecimalSeparator:= TmpDSep;
     end;
     Timer1.Enabled:= True;
end;

procedure TTovarEditFrm.FormCreate(Sender: TObject);
begin
        TovarEditFrm.ClientWidth:= SpeedButton1.Left + SpeedButton1.Width;//496;
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_UNITS');
          Open;
          UnitsComboBox.Items.Clear;
          while not Eof do
          begin
            UnitsComboBox.Items.Add(ShopMainForm.pFIBService['UNIT_NAME']);
            Next;
          end;
          UnitsComboBox.ItemIndex:= 0;

          Close;
          SelectSQL.Clear;
          SelectSQL.Add('select distinct PRODUCER from SPR_TOVAR');
          Open;
          ProducerEdit.Items.Clear;
          while not Eof do
          begin
            if not VarIsNull(ShopMainForm.pFIBService['PRODUCER'])then
              ProducerEdit.Items.Add(ShopMainForm.pFIBService['PRODUCER']);
            Next;
          end;
          ProducerEdit.ItemIndex:= 0;
          Close;
        end;
        PageControl1.ActivePageIndex:= BaseReadInteger('TOVAR_EDIT', 'PRICE_PAGE_INDX', 0, User_ID);
end;

procedure TTovarEditFrm.FormDestroy(Sender: TObject);
begin
     BaseWriteInteger('TOVAR_EDIT', 'PRICE_PAGE_INDX', PageControl1.ActivePageIndex, User_ID);
end;

procedure TTovarEditFrm.FormShow(Sender: TObject);
begin
  CstPriceType1ComboBoxChange(Sender);
  CstPriceType2ComboBoxChange(Sender);
  CstPriceType3ComboBoxChange(Sender);
end;

procedure TTovarEditFrm.VendorPriceEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     case Key of
       VK_RETURN: SelectNext(Sender as TWinControl, True, True);
          VK_ADD: if(ItemEdit.Text <> '')and(StrToFloat('0' + VendorPriceEdit.Text) > 0)then
               if StrToFloat('0' + ExtraChargeEdit.Text) > 0 then
                 PriceEdit.Text:= FloatToStrF(StrToFloat('0' + VendorPriceEdit.Text)
                   + StrToFloat('0' + VendorPriceEdit.Text) / 100
                   * StrToFloat('0' + ExtraChargeEdit.Text), ffFixed, 12, 1)
                else with ShopMainForm.pFIBService do
                begin
                  SelectSQL.Clear;
                  SelectSQL.Add('select * from SPR_CHARGE where ITEM = ''' + ItemEdit.Text + '''');
                  Open;
                  if not VarIsNull(ShopMainForm.pFIBService['EXTRA_CHARGE'])then
                    PriceEdit.Text:= FloatToStrF(StrToFloat('0' + VendorPriceEdit.Text)
                       + StrToFloat('0' + VendorPriceEdit.Text) / 100
                       * ShopMainForm.pFIBService['EXTRA_CHARGE'], ffFixed, 12, 1);
                  Close;
                end;
     end;
end;

procedure TTovarEditFrm.TovarNameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = '''' then Key:= #0;
end;

procedure TTovarEditFrm.ProducerEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if(Key = VK_RETURN)and not ProducerEdit.DroppedDown then
                                  SelectNext(Sender as TWinControl, True, True);
end;

procedure TTovarEditFrm.PriceEditChange(Sender: TObject);
begin
      if(StrToFloat('0' + VendorPriceEdit.Text) > 0)and(StrToFloat('0' + PriceEdit.Text) > 0)then
        StatusBar1.Panels[1].Text:= 'Наценка ' +
          FloatToStrF((StrToFloat('0' + PriceEdit.Text)
           - StrToFloat('0' + VendorPriceEdit.Text))
           / StrToFloat('0' + VendorPriceEdit.Text)*100, ffFixed, 10, 0) + '%'
      else StatusBar1.Panels[1].Text:= '';
      Price1EditChange(Sender);

      CstPrice1TagEditChange(Sender);
      CstPrice2TagEditChange(Sender);
      CstPrice3TagEditChange(Sender);
end;

procedure TTovarEditFrm.VendorPriceEditKeyPress(Sender: TObject;
  var Key: Char);
begin
      if not(Key in [#8, '0'..'9', FormatSettings.DecimalSeparator])then Key:= #0;
      if(Key = FormatSettings.DecimalSeparator)and
        (Pos(FormatSettings.DecimalSeparator, (Sender as TEdit).Text) > 0)then Key:= #0;
end;

procedure TTovarEditFrm.SpeedButton1Click(Sender: TObject);
begin
     Panel1.Visible:= SpeedButton1.Down;
     if SpeedButton1.Down then
     begin
        TovarEditFrm.ClientWidth:= SpeedButton1.Left + SpeedButton1.Width + Panel1.Width;//496;
//       TovarEditFrm.Width:= 798;
       SpeedButton1.Caption:= '<';
     end
     else
     begin
        TovarEditFrm.ClientWidth:= SpeedButton1.Left + SpeedButton1.Width;//496;
//       TovarEditFrm.Width:= 496;
       SpeedButton1.Caption:= '>';
     end;
end;

procedure TTovarEditFrm.Price1EditChange(Sender: TObject);
var SPrice, VPrice: Double;
begin
    if StrToFloat('0'+VendorPriceEdit.Text) > 0 then
    begin
      VPrice:= StrToFloat(VendorPriceEdit.Text);
      if StrToFloat('0'+PriceEdit.Text) > 0 then
        SPrice:= StrToFloat(PriceEdit.Text)
      else SPrice:= 0;
      case ComboBox1.ItemIndex of
        0: if (SPrice > 0) then // Часть наценки
           begin
             if Tag1Edit.Text > '' then
               Price1Edit.Text:= FloatToStrF(VPrice + (SPrice - VPrice)/10*StrToInt(Tag1Edit.Text), ffFixed, 16, 2);
             if Tag2Edit.Text > '' then
               Price2Edit.Text:= FloatToStrF(VPrice + (SPrice - VPrice)/10*StrToInt(Tag2Edit.Text), ffFixed, 16, 2);
             if Tag3Edit.Text > '' then
               Price3Edit.Text:= FloatToStrF(VPrice + (SPrice - VPrice)/10*StrToInt(Tag3Edit.Text), ffFixed, 16, 2);
             if Tag4Edit.Text > '' then
               Price4Edit.Text:= FloatToStrF(VPrice + (SPrice - VPrice)/10*StrToInt(Tag4Edit.Text), ffFixed, 16, 2);
             if Tag5Edit.Text > '' then
               Price5Edit.Text:= FloatToStrF(VPrice + (SPrice - VPrice)/10*StrToInt(Tag5Edit.Text), ffFixed, 16, 2);
             if Tag6Edit.Text > '' then
               Price6Edit.Text:= FloatToStrF(VPrice + (SPrice - VPrice)/10*StrToInt(Tag6Edit.Text), ffFixed, 16, 2);
             if Tag7Edit.Text > '' then
               Price7Edit.Text:= FloatToStrF(VPrice + (SPrice - VPrice)/10*StrToInt(Tag7Edit.Text), ffFixed, 16, 2);
             if Tag8Edit.Text > '' then
               Price8Edit.Text:= FloatToStrF(VPrice + (SPrice - VPrice)/10*StrToInt(Tag8Edit.Text), ffFixed, 16, 2);
             if Tag9Edit.Text > '' then
               Price9Edit.Text:= FloatToStrF(VPrice + (SPrice - VPrice)/10*StrToInt(Tag9Edit.Text), ffFixed, 16, 2);
           end;
        1: begin  // Процент наценки
             if Tag1Edit.Text > '' then
               Price1Edit.Text:= FloatToStrF(VPrice*(1 + StrToInt(Tag1Edit.Text)/100), ffFixed, 16, 2);
             if Tag2Edit.Text > '' then
               Price2Edit.Text:= FloatToStrF(VPrice*(1 + StrToInt(Tag2Edit.Text)/100), ffFixed, 16, 2);
             if Tag3Edit.Text > '' then
               Price3Edit.Text:= FloatToStrF(VPrice*(1 + StrToInt(Tag3Edit.Text)/100), ffFixed, 16, 2);
             if Tag4Edit.Text > '' then
               Price4Edit.Text:= FloatToStrF(VPrice*(1 + StrToInt(Tag4Edit.Text)/100), ffFixed, 16, 2);
             if Tag5Edit.Text > '' then
               Price5Edit.Text:= FloatToStrF(VPrice*(1 + StrToInt(Tag5Edit.Text)/100), ffFixed, 16, 2);
             if Tag6Edit.Text > '' then
               Price6Edit.Text:= FloatToStrF(VPrice*(1 + StrToInt(Tag6Edit.Text)/100), ffFixed, 16, 2);
             if Tag7Edit.Text > '' then
               Price7Edit.Text:= FloatToStrF(VPrice*(1 + StrToInt(Tag7Edit.Text)/100), ffFixed, 16, 2);
             if Tag8Edit.Text > '' then
               Price8Edit.Text:= FloatToStrF(VPrice*(1 + StrToInt(Tag8Edit.Text)/100), ffFixed, 16, 2);
             if Tag9Edit.Text > '' then
               Price9Edit.Text:= FloatToStrF(VPrice*(1 + StrToInt(Tag9Edit.Text)/100), ffFixed, 16, 2);
           end;
        3: begin  // Процент скидки
             if Tag1Edit.Text > '' then
               Price1Edit.Text:= FloatToStrF(SPrice*(1 - StrToInt(Tag1Edit.Text)/100), ffFixed, 16, 2);
             if Tag2Edit.Text > '' then
               Price2Edit.Text:= FloatToStrF(SPrice*(1 - StrToInt(Tag2Edit.Text)/100), ffFixed, 16, 2);
             if Tag3Edit.Text > '' then
               Price3Edit.Text:= FloatToStrF(SPrice*(1 - StrToInt(Tag3Edit.Text)/100), ffFixed, 16, 2);
             if Tag4Edit.Text > '' then
               Price4Edit.Text:= FloatToStrF(SPrice*(1 - StrToInt(Tag4Edit.Text)/100), ffFixed, 16, 2);
             if Tag5Edit.Text > '' then
               Price5Edit.Text:= FloatToStrF(SPrice*(1 - StrToInt(Tag5Edit.Text)/100), ffFixed, 16, 2);
             if Tag6Edit.Text > '' then
               Price6Edit.Text:= FloatToStrF(SPrice*(1 - StrToInt(Tag6Edit.Text)/100), ffFixed, 16, 2);
             if Tag7Edit.Text > '' then
               Price7Edit.Text:= FloatToStrF(SPrice*(1 - StrToInt(Tag7Edit.Text)/100), ffFixed, 16, 2);
             if Tag8Edit.Text > '' then
               Price8Edit.Text:= FloatToStrF(SPrice*(1 - StrToInt(Tag8Edit.Text)/100), ffFixed, 16, 2);
             if Tag9Edit.Text > '' then
               Price9Edit.Text:= FloatToStrF(SPrice*(1 - StrToInt(Tag9Edit.Text)/100), ffFixed, 16, 2);
           end;
      end;
    end;
end;

procedure TTovarEditFrm.RadioGroup1Click(Sender: TObject);
var SPrice, VPrice: Double;
begin

     if VendorPriceEdit.Text > '' then VPrice:= StrToFloat(VendorPriceEdit.Text)
     else VPrice:= 0;
     if (PriceEdit.Text > '') then SPrice:= StrToFloat(PriceEdit.Text)
     else SPrice:= 0;

     if ComboBox1.ItemIndex = 2 then
     begin
       Price1Edit.Enabled:= True;
       Tag1Edit.Enabled:= False;
       Tag1Edit.Text:= '';
       Price2Edit.Enabled:= True;
       Tag2Edit.Enabled:= False;
       Tag2Edit.Text:= '';
       Price3Edit.Enabled:= True;
       Tag3Edit.Enabled:= False;
       Tag3Edit.Text:= '';
       Price4Edit.Enabled:= True;
       Tag4Edit.Enabled:= False;
       Tag4Edit.Text:= '';
       Price5Edit.Enabled:= True;
       Tag5Edit.Enabled:= False;
       Tag5Edit.Text:= '';
       Price6Edit.Enabled:= True;
       Tag6Edit.Enabled:= False;
       Tag6Edit.Text:= '';
       Price7Edit.Enabled:= True;
       Tag7Edit.Enabled:= False;
       Tag7Edit.Text:= '';
       Price8Edit.Enabled:= True;
       Tag8Edit.Enabled:= False;
       Tag8Edit.Text:= '';
       Price9Edit.Enabled:= True;
       Tag9Edit.Enabled:= False;
       Tag9Edit.Text:= '';
     end
     else
     begin
       Price1Edit.Enabled:= False;
       Tag1Edit.Enabled:= True;
       Price2Edit.Enabled:= False;
       Tag2Edit.Enabled:= True;
       Price3Edit.Enabled:= False;
       Tag3Edit.Enabled:= True;
       Price4Edit.Enabled:= False;
       Tag4Edit.Enabled:= True;
       Price5Edit.Enabled:= False;
       Tag5Edit.Enabled:= True;
       Price6Edit.Enabled:= False;
       Tag6Edit.Enabled:= True;
       Price7Edit.Enabled:= False;
       Tag7Edit.Enabled:= True;
       Price8Edit.Enabled:= False;
       Tag8Edit.Enabled:= True;
       Price9Edit.Enabled:= False;
       Tag9Edit.Enabled:= True;

       Tag1Edit.OnChange:= nil;
       Tag2Edit.OnChange:= nil;
       Tag3Edit.OnChange:= nil;
       Tag4Edit.OnChange:= nil;
       Tag5Edit.OnChange:= nil;
       Tag6Edit.OnChange:= nil;
       Tag7Edit.OnChange:= nil;
       Tag8Edit.OnChange:= nil;
       Tag9Edit.OnChange:= nil;

       if(ComboBox1.ItemIndex = 0)and(SPrice <> VPrice)then
       begin
         Tag1Edit.Text:= FloatToStrF(10*(StrToFloat(Price1Edit.Text)-VPrice)/(SPrice - VPrice), ffFixed, 16, 0);
         Tag2Edit.Text:= FloatToStrF(10*(StrToFloat(Price2Edit.Text)-VPrice)/(SPrice - VPrice), ffFixed, 16, 0);
         Tag3Edit.Text:= FloatToStrF(10*(StrToFloat(Price3Edit.Text)-VPrice)/(SPrice - VPrice), ffFixed, 16, 0);
         Tag4Edit.Text:= FloatToStrF(10*(StrToFloat(Price4Edit.Text)-VPrice)/(SPrice - VPrice), ffFixed, 16, 0);
         Tag5Edit.Text:= FloatToStrF(10*(StrToFloat(Price5Edit.Text)-VPrice)/(SPrice - VPrice), ffFixed, 16, 0);
         Tag6Edit.Text:= FloatToStrF(10*(StrToFloat(Price6Edit.Text)-VPrice)/(SPrice - VPrice), ffFixed, 16, 0);
         Tag7Edit.Text:= FloatToStrF(10*(StrToFloat(Price7Edit.Text)-VPrice)/(SPrice - VPrice), ffFixed, 16, 0);
         Tag8Edit.Text:= FloatToStrF(10*(StrToFloat(Price8Edit.Text)-VPrice)/(SPrice - VPrice), ffFixed, 16, 0);
         Tag9Edit.Text:= FloatToStrF(10*(StrToFloat(Price9Edit.Text)-VPrice)/(SPrice - VPrice), ffFixed, 16, 0);
       end;
       if(ComboBox1.ItemIndex = 1)and(VPrice <> 0)then
       begin
         Tag1Edit.Text:= FloatToStrF((StrToFloat(Price1Edit.Text) - VPrice)*100/VPrice, ffFixed, 16, 0);
         Tag2Edit.Text:= FloatToStrF((StrToFloat(Price2Edit.Text) - VPrice)*100/VPrice, ffFixed, 16, 0);
         Tag3Edit.Text:= FloatToStrF((StrToFloat(Price3Edit.Text) - VPrice)*100/VPrice, ffFixed, 16, 0);
         Tag4Edit.Text:= FloatToStrF((StrToFloat(Price4Edit.Text) - VPrice)*100/VPrice, ffFixed, 16, 0);
         Tag5Edit.Text:= FloatToStrF((StrToFloat(Price5Edit.Text) - VPrice)*100/VPrice, ffFixed, 16, 0);
         Tag6Edit.Text:= FloatToStrF((StrToFloat(Price6Edit.Text) - VPrice)*100/VPrice, ffFixed, 16, 0);
         Tag7Edit.Text:= FloatToStrF((StrToFloat(Price7Edit.Text) - VPrice)*100/VPrice, ffFixed, 16, 0);
         Tag8Edit.Text:= FloatToStrF((StrToFloat(Price8Edit.Text) - VPrice)*100/VPrice, ffFixed, 16, 0);
         Tag9Edit.Text:= FloatToStrF((StrToFloat(Price9Edit.Text) - VPrice)*100/VPrice, ffFixed, 16, 0);
       end;

       Tag1Edit.OnChange:= Price1EditChange;
       Tag2Edit.OnChange:= Price1EditChange;
       Tag3Edit.OnChange:= Price1EditChange;
       Tag4Edit.OnChange:= Price1EditChange;
       Tag5Edit.OnChange:= Price1EditChange;
       Tag6Edit.OnChange:= Price1EditChange;
       Tag7Edit.OnChange:= Price1EditChange;
       Tag8Edit.OnChange:= Price1EditChange;
       Tag9Edit.OnChange:= Price1EditChange;
     end;
end;

procedure TTovarEditFrm.SpeedButton2Click(Sender: TObject);
var i: Integer;
begin
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select distinct cast(ITEM as integer) ITEM from SPR_TOVAR');
      SelectSQL.Add('order by 1');
      Open;
      if not VarIsNull(ShopMainForm.pFIBService['ITEM'])then
      begin
        i:= ShopMainForm.pFIBService['ITEM'];
        while (not Eof)and(i = ShopMainForm.pFIBService['ITEM']) do
        begin
          Next;
          Inc(i);
        end;
        if i = ShopMainForm.pFIBService['ITEM'] then ItemEdit.Text:= IntToStr(i + 1)
        else ItemEdit.Text:= IntToStr(i);
      end;
      Close;
    end;
end;

end.
