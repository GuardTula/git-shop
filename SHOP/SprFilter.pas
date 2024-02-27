//****************************************************************************//
//                              © Guard  2002-2022                            //
//****************************************************************************//
unit SprFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ToolWin, IniFiles, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, Data.DB, FIBDataSet,
  pFIBDataSet, System.ImageList, Vcl.ImgList, Vcl.Mask;

type
  TSprFiterFrm = class(TForm)
    Label2: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    CodeFltrEdit: TLabeledEdit;
    NameFltrEdit: TLabeledEdit;
    RemarkFltrEdit: TLabeledEdit;
    ArtikulFltrEdit: TLabeledEdit;
    KolvoFltrComboBox: TComboBox;
    ChangeGroupFltBtn: TBitBtn;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    BitBtn5: TBitBtn;
    Remark_1FltrEdit: TLabeledEdit;
    StaticText3: TStaticText;
    BitBtn7: TBitBtn;
    ProducerFltrEdit: TLabeledEdit;
    SectionFltrComboBox: TComboBox;
    TecDocDataBase: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    CheckBox1: TCheckBox;
    BigRemarkFltrEdit: TMemo;
    Label1: TLabel;
    ScladFltrEdit: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ImageList1: TImageList;
    SpeedButton5: TSpeedButton;
    ColorBox1: TColorBox;
    CheckBox2: TCheckBox;
    Bevel1: TBevel;
    ColorBox2: TColorBox;
    CheckBox3: TCheckBox;
    ColorBox3: TColorBox;
    CheckBox4: TCheckBox;
    Label5: TLabel;
    Bevel2: TBevel;
    ColorBox4: TColorBox;
    CheckBox5: TCheckBox;
    ColorBox5: TColorBox;
    CheckBox6: TCheckBox;
    ColorBox6: TColorBox;
    CheckBox7: TCheckBox;
    Label6: TLabel;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ChangeGroupFltBtnClick(Sender: TObject);
    procedure CodeFltrEditChange(Sender: TObject);
    procedure SectionFltrComboBoxChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure SaveSprFilter(IniFileName: TIniFile; IniSection: String = 'FILTER');
    procedure LoadSprFilter(IniFileName: TIniFile; IniSection: String = 'FILTER');
    procedure FormHide(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Loaded; override;
  private
    FAsChild: Boolean;
    FTempParent: TWinControl;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; AParent: TWinControl); reintroduce; overload;
    function CanChange: Boolean; virtual;
    { Public declarations }
  end;

var
  SprFiterFrm: TSprFiterFrm;
  FilterIni: TIniFile;

  function GetTecDocFltrStr(const FindStr: String): String;


implementation

uses ShopMain, DualList, AtrChange, Spr;
{$R *.dfm}
constructor TSprFiterFrm.Create(AOwner: TComponent);
begin
  FAsChild:= False;
  inherited Create(AOwner);
end;

constructor TSprFiterFrm.Create(AOwner: TComponent; AParent: TWinControl);
begin
  FAsChild:= True;
  FTempParent:= aParent;
  inherited Create(AOwner);
end;

procedure TSprFiterFrm.Loaded;
begin
  inherited;
  if FAsChild then
  begin
    align:= alClient;
    BorderStyle:= bsNone;
    BorderIcons:= [];
    Parent:= FTempParent;
    Position:= poDefault;
  end;
end;

function GetTecDocFltrStr(const FindStr: String): String;
var ArtikulStr, TmpStr: String;
    i,j: Integer;
begin
  SprFiterFrm.pFIBDataSet1.ParamByName('SEARCH_NUMBER').AsString:= FindStr;
  SprFiterFrm.pFIBDataSet1.Open;
  SprFiterFrm.pFIBDataSet1.First;
  TmpStr:= '';
  j:= 0;
  while (not SprFiterFrm.pFIBDataSet1.Eof)do
  begin
    if (j < 1500) then
    begin
      TmpStr:= TmpStr + ',' + QuotedStr(SprFiterFrm.pFIBDataSet1.FieldByName('NUMBER').AsString);
    end;
    Inc(j);
    SprFiterFrm.pFIBDataSet1.Next;
  end;
  SprFiterFrm.pFIBDataSet1.Close;
  if j > 1500 then MessageDlg('Слишком много аналогов(max 1500). Найдено - ' + j.ToString, mtWarning, [mbOK], 0);
  ArtikulStr:= '';
  if TmpStr > '' then
    for i:= 2 to Length(TmpStr) do
    begin
      if not (TmpStr[i] in [' ', '.', '-', '/', '\'])then ArtikulStr:= ArtikulStr + TmpStr[i];
    end;
  Result:= ArtikulStr;
end;

procedure TSprFiterFrm.CreateParams(var Params: TCreateParams);
begin
  Inherited CreateParams(Params);
  if FAsChild then
    Params.Style:= Params.Style or WS_CHILD;
end;

function TSprFiterFrm.CanChange: Boolean;
begin
  Result:= True;
end;

procedure TSprFiterFrm.ChangeGroupFltBtnClick(Sender: TObject);
var i: Integer;
begin
        Application.CreateForm(TDualListDlg, DualListDlg);
        DualListDlg.Caption:= 'Выбор групп для просмотра';
        DualListDlg.SrcList.Items:= SprHideGroup;
        DualListDlg.DstList.Items:= SprShowGroup;
        if DualListDlg.ShowModal = mrOK then
          if DualListDlg.DstList.Items.Count > 0 then
          begin
            SprHideGroup.Clear;
            for i:= 0 to DualListDlg.SrcList.Items.Count - 1 do
              SprHideGroup.Add(DualListDlg.SrcList.Items[i]);
            SprShowGroup.Clear;
            for i:= 0 to DualListDlg.DstList.Items.Count - 1 do
              SprShowGroup.Add(DualListDlg.DstList.Items[i]);
            if SprHideGroup.Count = 0 then
            begin
              StaticText1.Caption:= ' Нет фильтрации';
              StaticText1.Color:= clWindow;
            end
            else
            begin
              StaticText1.Caption:= ' По ' + IntToStr(SprShowGroup.Count);
              StaticText1.Color:= clYellow;
            end;
          end
          else MessageDlg('Группы не выбраны', mtWarning, [mbOK], 0);
        DualListDlg.Free;
end;

procedure TSprFiterFrm.CheckBox2Click(Sender: TObject);
begin
  ColorBox1.Enabled:= CheckBox2.Checked;
end;

procedure TSprFiterFrm.CheckBox3Click(Sender: TObject);
begin
  ColorBox2.Enabled:= CheckBox3.Checked;
end;

procedure TSprFiterFrm.CheckBox4Click(Sender: TObject);
begin
  ColorBox3.Enabled:= CheckBox4.Checked;
end;

procedure TSprFiterFrm.CheckBox5Click(Sender: TObject);
begin
  ColorBox4.Enabled:= CheckBox5.Checked;
end;

procedure TSprFiterFrm.CheckBox6Click(Sender: TObject);
begin
  ColorBox5.Enabled:= CheckBox6.Checked;
end;

procedure TSprFiterFrm.CheckBox7Click(Sender: TObject);
begin
  ColorBox6.Enabled:= CheckBox7.Checked;
end;

procedure TSprFiterFrm.BitBtn5Click(Sender: TObject);
var i: Integer;
begin
  Application.CreateForm(TDualListDlg, DualListDlg);
  DualListDlg.Caption:= 'Выбор поставщиков для просмотра';
  DualListDlg.SrcList.Items:= SprHideVendor;
  DualListDlg.DstList.Items:= SprShowVendor;
  if DualListDlg.ShowModal = mrOK then
    if DualListDlg.DstList.Items.Count > 0 then
    begin
      SprHideVendor.Clear;
      for i:= 0 to DualListDlg.SrcList.Items.Count - 1 do
        SprHideVendor.Add(DualListDlg.SrcList.Items[i]);
      SprShowVendor.Clear;
      for i:= 0 to DualListDlg.DstList.Items.Count - 1 do
        SprShowVendor.Add(DualListDlg.DstList.Items[i]);
      if SprHideVendor.Count = 0 then
      begin
        StaticText2.Caption:= ' Нет фильтрации';
        StaticText2.Color:= clWindow;
      end
      else
      begin
        StaticText2.Caption:= ' По ' + IntToStr(SprShowVendor.Count);
        StaticText2.Color:= clYellow;
      end;
    end
    else MessageDlg('Поставщики не выбраны', mtWarning, [mbOK], 0);
  DualListDlg.Free;
end;

procedure TSprFiterFrm.BitBtn7Click(Sender: TObject);
var i,j: Integer;
begin
    AtrSelectStr:= SprAtrFltrStr;

    Application.CreateForm(TAtrChangeFrm, AtrChangeFrm);
    if AtrChangeFrm.ShowModal = mrOk then
    begin

      if AtrSelectStr <> '' then
      begin // Считаем количество элементов в строке
        j:= 1;
        for i:= 0 to Length(AtrSelectStr)-1 do
          if AtrSelectStr[i] = ',' then Inc(j);
      end
      else j:= 0;
      SprFiterFrm.StaticText3.Tag:= j;

      SprAtrFltrStr:= AtrSelectStr;

      if StaticText3.Tag = 0 then
      begin
        StaticText3.Caption:= ' Нет фильтрации';
        StaticText3.Color:= clWindow;
      end
      else
      begin
        StaticText3.Caption:= ' По ' + StaticText3.Tag.ToString;
        StaticText3.Color:= clYellow;
      end;
    end;

    AtrChangeFrm.Free;
end;

procedure TSprFiterFrm.ToolButton2Click(Sender: TObject);
begin
    ShopMainForm.SaveDialog1.Filter:= 'Фильтры товаров|*.tfl';
    ShopMainForm.SaveDialog1.InitialDir:= ExtractFilePath(ParamStr(0)) + 'FILTER\';
    if ShopMainForm.SaveDialog1.Execute then
    begin
      if pos('.tfl', ShopMainForm.SaveDialog1.FileName) = 0 then
        ShopMainForm.SaveDialog1.FileName:= ShopMainForm.SaveDialog1.FileName + '.tfl';
      FilterIni:= TIniFile.Create(ShopMainForm.SaveDialog1.FileName);
      SaveSprFilter(FilterIni);
      FilterIni.Free;
    end;
end;

procedure TSprFiterFrm.SaveSprFilter(IniFileName: TIniFile; IniSection: String = 'FILTER');
begin
    if IniSection = 'FILTER' then
      with IniFileName do
      begin
        WriteString(IniSection, 'ITEM', CodeFltrEdit.Text);
        WriteString(IniSection, 'ARTIKUL', ArtikulFltrEdit.Text);
        WriteBool(IniSection, 'TECDOC', CheckBox1.Checked);
        WriteString(IniSection, 'NAME', NameFltrEdit.Text);
        WriteString(IniSection, 'REMARK', RemarkFltrEdit.Text);
        WriteString(IniSection, 'REMARK_1', Remark_1FltrEdit.Text);
        WriteString(IniSection, 'PRODUCER', ProducerFltrEdit.Text);
        WriteString(IniSection, 'SCLAD', ScladFltrEdit.Text);
        WriteString(IniSection, 'BIG_REMARK', BigRemarkFltrEdit.Text);
        if SprHideGroup.Count > 0 then WriteString(IniSection, 'GROUP', GetGroupFltrStr(SprShowGroup))
        else WriteString(IniSection, 'GROUP', '');
        if SprHideVendor.Count > 0 then WriteString(IniSection, 'VENDOR', GetVendorFltrStr(SprShowVendor))
        else WriteString(IniSection, 'VENDOR', '');
        WriteString(IniSection, 'ATR', SprAtrFltrStr);
        WriteInteger(IniSection, 'KKM', SectionFltrComboBox.ItemIndex);
        WriteInteger(IniSection, 'KOLVO', KolvoFltrComboBox.ItemIndex);

        WriteInteger(IniSection, 'COLORBOX1', ColorBox1.Selected);
        WriteBool(IniSection, 'CHECKBOX2', CheckBox2.Checked);
        WriteInteger(IniSection, 'COLORBOX2', ColorBox2.Selected);
        WriteBool(IniSection, 'CHECKBOX3', CheckBox3.Checked);
        WriteInteger(IniSection, 'COLORBOX3', ColorBox3.Selected);
        WriteBool(IniSection, 'CHECKBOX4', CheckBox4.Checked);


      end
    else
      begin
        BaseWriteString(IniSection, 'ITEM', CodeFltrEdit.Text, User_ID);
        BaseWriteString(IniSection, 'ARTIKUL', ArtikulFltrEdit.Text, User_ID);
        BaseWriteBool(IniSection, 'TECDOC', CheckBox1.Checked, User_ID);
        BaseWriteString(IniSection, 'NAME', NameFltrEdit.Text, User_ID);
        BaseWriteString(IniSection, 'REMARK', RemarkFltrEdit.Text, User_ID);
        BaseWriteString(IniSection, 'REMARK_1', Remark_1FltrEdit.Text, User_ID);
        BaseWriteString(IniSection, 'PRODUCER', ProducerFltrEdit.Text, User_ID);
        BaseWriteString(IniSection, 'SCLAD', ScladFltrEdit.Text, User_ID);
        BaseWriteString(IniSection, 'BIG_REMARK', BigRemarkFltrEdit.Text, User_ID);
        if SprHideGroup.Count > 0 then BaseWriteString(IniSection, 'GROUP', GetGroupFltrStr(SprShowGroup), User_ID)
        else BaseWriteString(IniSection, 'GROUP', '', User_ID);
        if SprHideVendor.Count > 0 then BaseWriteString(IniSection, 'VENDOR', GetVendorFltrStr(SprShowVendor), User_ID)
        else BaseWriteString(IniSection, 'VENDOR', '', User_ID);
        BaseWriteString(IniSection, 'ATR', SprAtrFltrStr, User_ID);
        BaseWriteInteger(IniSection, 'KKM', SectionFltrComboBox.ItemIndex, User_ID);
        BaseWriteInteger(IniSection, 'KOLVO', KolvoFltrComboBox.ItemIndex, User_ID);

        BaseWriteInteger(IniSection, 'COLORBOX1', ColorBox1.Selected);
        BaseWriteBool(IniSection, 'CHECKBOX2', CheckBox2.Checked);
        BaseWriteInteger(IniSection, 'COLORBOX2', ColorBox2.Selected);
        BaseWriteBool(IniSection, 'CHECKBOX3', CheckBox3.Checked);
        BaseWriteInteger(IniSection, 'COLORBOX3', ColorBox3.Selected);
        BaseWriteBool(IniSection, 'CHECKBOX4', CheckBox4.Checked);
      end;
end;

procedure TSprFiterFrm.ToolButton1Click(Sender: TObject);
begin
    ShopMainForm.OpenDialog1.Filter:= 'Фильтры товаров|*.tfl';
    ShopMainForm.OpenDialog1.InitialDir:= ExtractFilePath(ParamStr(0)) + 'FILTER\';
    if ShopMainForm.OpenDialog1.Execute then
    begin
      FilterIni:= TIniFile.Create(ShopMainForm.OpenDialog1.FileName);
      LoadSprFilter(FilterIni);
      FilterIni.Free;
    end;
end;

procedure TSprFiterFrm.LoadSprFilter(IniFileName: TIniFile; IniSection: String = 'FILTER');
var G_S, V_S, A_S: String;
    i,j: Integer;
begin
      if IniSection = 'FILTER' then
      begin
        CodeFltrEdit.Text:= IniFileName.ReadString(IniSection, 'ITEM', '');
        ArtikulFltrEdit.Text:= IniFileName.ReadString(IniSection, 'ARTIKUL', '');
        CheckBox1.Checked:= IniFileName.ReadBool(IniSection, 'TECDOC', False);
        NameFltrEdit.Text:= IniFileName.ReadString(IniSection, 'NAME', '');
        RemarkFltrEdit.Text:= IniFileName.ReadString(IniSection, 'REMARK', '');
        Remark_1FltrEdit.Text:= IniFileName.ReadString(IniSection, 'REMARK_1', '');
        ProducerFltrEdit.Text:= IniFileName.ReadString(IniSection, 'PRODUCER', '');
        ScladFltrEdit.Text:= IniFileName.ReadString(IniSection, 'SCLAD', '');
        BigRemarkFltrEdit.Text:= IniFileName.ReadString(IniSection, 'BIG_REMARK', '');
        SectionFltrComboBox.ItemIndex:= IniFileName.ReadInteger(IniSection, 'KKM', 0);
        KolvoFltrComboBox.ItemIndex:= IniFileName.ReadInteger(IniSection, 'KOLVO', 0);

        ColorBox1.Selected:= IniFileName.ReadInteger(IniSection, 'COLORBOX1', 0);
        CheckBox2.Checked:= IniFileName.ReadBool(IniSection, 'CHECKBOX2', False);
        ColorBox2.Selected:= IniFileName.ReadInteger(IniSection, 'COLORBOX2', 0);
        CheckBox3.Checked:= IniFileName.ReadBool(IniSection, 'CHECKBOX3', False);
        ColorBox3.Selected:= IniFileName.ReadInteger(IniSection, 'COLORBOX3', 0);
        CheckBox4.Checked:= IniFileName.ReadBool(IniSection, 'CHECKBOX4', False);

        G_S:= ',' + IniFileName.ReadString(IniSection, 'GROUP', '') + ',';
        V_S:= ',' + IniFileName.ReadString(IniSection, 'VENDOR', '') + ',';
        A_S:= IniFileName.ReadString(IniSection, 'ATR', '');
      end
      else
      begin
        CodeFltrEdit.Text:= BaseReadString(IniSection, 'ITEM', '', User_ID);
        ArtikulFltrEdit.Text:= BaseReadString(IniSection, 'ARTIKUL', '', User_ID);
        CheckBox1.Checked:= BaseReadBool(IniSection, 'TECDOC', False, User_ID);
        NameFltrEdit.Text:= BaseReadString(IniSection, 'NAME', '', User_ID);
        RemarkFltrEdit.Text:= BaseReadString(IniSection, 'REMARK', '', User_ID);
        Remark_1FltrEdit.Text:= BaseReadString(IniSection, 'REMARK_1', '', User_ID);
        ProducerFltrEdit.Text:= BaseReadString(IniSection, 'PRODUCER', '', User_ID);
        ScladFltrEdit.Text:= BaseReadString(IniSection, 'SCLAD', '', User_ID);
        BigRemarkFltrEdit.Text:= BaseReadString(IniSection, 'BIG_REMARK', '', User_ID);
        SectionFltrComboBox.ItemIndex:= BaseReadInteger(IniSection, 'KKM', 0, User_ID);
        KolvoFltrComboBox.ItemIndex:= BaseReadInteger(IniSection, 'KOLVO', 0, User_ID);

        ColorBox1.Selected:= BaseReadInteger(IniSection, 'COLORBOX1', 0);
        CheckBox2.Checked:= BaseReadBool(IniSection, 'CHECKBOX2', False);
        ColorBox2.Selected:= BaseReadInteger(IniSection, 'COLORBOX2', 0);
        CheckBox3.Checked:= BaseReadBool(IniSection, 'CHECKBOX3', False);
        ColorBox3.Selected:= BaseReadInteger(IniSection, 'COLORBOX3', 0);
        CheckBox4.Checked:= BaseReadBool(IniSection, 'CHECKBOX4', False);

        G_S:= ',' + BaseReadString(IniSection, 'GROUP', '', User_ID) + ',';
        V_S:= ',' + BaseReadString(IniSection, 'VENDOR', '', User_ID) + ',';
        A_S:= BaseReadString(IniSection, 'ATR', '', User_ID);
      end;
      if SectionFltrComboBox.ItemIndex > 0 then SectionFltrComboBox.Color:= clYellow
      else SectionFltrComboBox.Color:= clWindow;
      if KolvoFltrComboBox.ItemIndex > 0 then KolvoFltrComboBox.Color:= clYellow
      else KolvoFltrComboBox.Color:= clWindow;

      SprShowGroup.Clear;
      SprHideGroup.Clear;


      with ShopMainForm.pFIBService do
      begin
        SelectSQL.Clear;
        SelectSQL.Add('select T_GROUP, GROUP_NAME from SPR_GROUP');
        Open;
        while not Eof do
        begin
          if Pos(',' + IntToStr(ShopMainForm.pFIBService['T_GROUP']) + ',', G_S) = 0 then
            SprHideGroup.Add(ShopMainForm.pFIBService['GROUP_NAME'])
          else
            SprShowGroup.Add(ShopMainForm.pFIBService['GROUP_NAME']);
          Next;
        end;
        Close;
      end;
      if SprShowGroup.Count = 0 then
      begin
        SprShowGroup.AddStrings(SprHideGroup);
        SprHideGroup.Clear;
      end;
      if SprHideGroup.Count = 0 then
      begin
        StaticText1.Caption:= ' Нет фильтрации';
        StaticText1.Color:= clWindow;
      end
      else
      begin
        StaticText1.Caption:= ' По ' + IntToStr(SprShowGroup.Count);
        StaticText1.Color:= clYellow;
      end;

      SprShowVendor.Clear;
      SprHideVendor.Clear;
      with ShopMainForm.pFIBService do
      begin
        SelectSQL.Clear;
        SelectSQL.Add('select VENDOR_CODE, VENDOR_NAME from SPR_VENDORS');
        Open;
        while not Eof do
        begin
          if Pos(',' + IntToStr(ShopMainForm.pFIBService['VENDOR_CODE']) + ',', V_S) = 0 then
            SprHideVendor.Add(ShopMainForm.pFIBService['VENDOR_NAME'])
          else
            SprShowVendor.Add(ShopMainForm.pFIBService['VENDOR_NAME']);
          Next;
        end;
        Close;
      end;
      if SprShowVendor.Count = 0 then
      begin
        SprShowVendor.AddStrings(SprHideVendor);
        SprHideVendor.Clear;
      end;
      if SprHideVendor.Count = 0 then
      begin
        StaticText2.Caption:= ' Нет фильтрации';
        StaticText2.Color:= clWindow;
      end
      else
      begin
        StaticText2.Caption:= ' По ' + IntToStr(SprShowVendor.Count);
        StaticText2.Color:= clYellow;
      end;


      SprAtrFltrStr:= A_S;
      if SprAtrFltrStr > '' then
      begin
        j:= 1;
        for i:= 1 to length(SprAtrFltrStr) do
          if SprAtrFltrStr[i] = ',' then  Inc(j);
      end
      else j:= 0;
      StaticText3.Tag:= j;
      if j = 0 then
      begin
        StaticText3.Caption:= ' Нет фильтрации';
        StaticText3.Color:= clWindow;
      end
      else
      begin
        StaticText3.Caption:= ' По ' + j.ToString;
        StaticText3.Color:= clYellow;
      end;
end;

procedure TSprFiterFrm.CodeFltrEditChange(Sender: TObject);
begin
      if (Sender as TLabeledEdit).Text = '' then
        (Sender as TLabeledEdit).Color:= clWindow
      else (Sender as TLabeledEdit).Color:= clYellow;
end;

procedure TSprFiterFrm.SectionFltrComboBoxChange(Sender: TObject);
begin
      if (Sender as TComboBox).ItemIndex = 0 then
        (Sender as TComboBox).Color:= clWindow
      else (Sender as TComboBox).Color:= clYellow;
end;

procedure TSprFiterFrm.SpeedButton1Click(Sender: TObject);
var TecDocFltrStr, TmpStr: String;
begin
   TmpFilterStr:= '';
   TmpStr:= '';
   if SpeedButton1.Down then
   begin
     SpeedButton1.ImageIndex:= 0;
     SpeedButton1.Hint:= 'Отменить фильтрацию';
     SpeedButton2.Enabled:= True;

     if CodeFltrEdit.Text <> '' then // Код товара
       TmpFilterStr:= '(t.ITEM like ''' + CodeFltrEdit.Text + ''')';
     if NameFltrEdit.Text <> '' then
     begin // Название товара
       if TmpFilterStr <> '' then TmpFilterStr:= TmpFilterStr + 'and';
       TmpFilterStr:= TmpFilterStr + '(t.TOVAR_NAME like ''' + NameFltrEdit.Text + ''')';
     end;
     if ArtikulFltrEdit.Text <> '' then
     begin // Артикул товара
       if TmpFilterStr <> '' then TmpFilterStr:= TmpFilterStr + 'and';
       if CheckBox1.Checked then
       begin
         TecDocFltrStr:= GetTecDocFltrStr(ArtikulFltrEdit.Text);
         if TecDocFltrStr > '' then
           TmpFilterStr:= TmpFilterStr + '(t.ARTIKUL in (' + TecDocFltrStr + '))'
         else
           TmpFilterStr:= TmpFilterStr + '(t.ARTIKUL like ''' + ArtikulFltrEdit.Text + ''')';
       end
       else
       begin
         TmpFilterStr:= TmpFilterStr + '(t.ARTIKUL like ''' + ArtikulFltrEdit.Text + ''')';
       end;
     end;
     if RemarkFltrEdit.Text <> '' then
     begin // Примечание
       if TmpFilterStr <> '' then TmpFilterStr:= TmpFilterStr + 'and';
       TmpFilterStr:= TmpFilterStr + '(t.REMARK like ''' + RemarkFltrEdit.Text + ''')';
     end;
     if Remark_1FltrEdit.Text <> '' then
     begin // Доп.примечание
       if TmpFilterStr <> '' then TmpFilterStr:= TmpFilterStr + 'and';
       TmpFilterStr:= TmpFilterStr + '(t.REMARK_1 like ''' + Remark_1FltrEdit.Text + ''')';
     end;
     if SprHideGroup.Count > 0 then
     begin // Товарные группы
       if TmpFilterStr <> '' then TmpFilterStr:= TmpFilterStr + 'and';
       TmpFilterStr:= TmpFilterStr + '(t.T_GROUP in (' + GetGroupFltrStr(SprShowGroup) + '))';
     end;
     if SprHideVendor.Count > 0 then
     begin // Поставщик
       if TmpFilterStr <> '' then TmpFilterStr:= TmpFilterStr + 'and';
       TmpFilterStr:= TmpFilterStr + '(t.VENDOR_CODE in (' + GetVendorFltrStr(SprShowVendor) + '))';
     end;
     if SectionFltrComboBox.ItemIndex > 0 then
     begin // Секция ККМ
       if TmpFilterStr <> '' then TmpFilterStr:= TmpFilterStr + 'and';
       TmpFilterStr:= TmpFilterStr + '(t.KKM_SECT = ' + SectionFltrComboBox.Text + ')';
     end;
     if KolvoFltrComboBox.ItemIndex > 0 then
     begin // Остатки
       if TmpFilterStr <> '' then TmpFilterStr:= TmpFilterStr + 'and';
       TmpFilterStr:= TmpFilterStr + '(( (select sum(kolvo) from tovar_ost where item = t.item and market_code = (select obj_id from inf_current_obj)) ';
       case KolvoFltrComboBox.ItemIndex of
        1: TmpFilterStr:= TmpFilterStr + ' > 0))';                  // Наличие
        2: TmpFilterStr:= TmpFilterStr + ' <> 0))';                 // Наличие и пересортица
        3: TmpFilterStr:= TmpFilterStr + ' is null)or((select sum(kolvo) from tovar_ost where item = t.item and market_code = (select obj_id from inf_current_obj)) = 0))'; // Нулевые остатки
        4: TmpFilterStr:= TmpFilterStr + ' < 0))';                  // Пересортица
       end;
     end;
     if ProducerFltrEdit.Text <> '' then
     begin // Производитель
       if TmpFilterStr <> '' then TmpFilterStr:= TmpFilterStr + 'and';
       TmpFilterStr:= TmpFilterStr + '(t.PRODUCER like ''' + ProducerFltrEdit.Text + ''')';
     end;
     if ScladFltrEdit.Text <> '' then
     begin // Место на складе
       if TmpFilterStr <> '' then TmpFilterStr:= TmpFilterStr + 'and';
       TmpFilterStr:= TmpFilterStr + '(tovar_add.sclad like ''' + ScladFltrEdit.Text + ''')';
     end;
     if(CheckBox2.Checked or CheckBox3.Checked or CheckBox4.Checked)then
     begin // Фильтрация по выделению цветом
       if TmpFilterStr <> '' then TmpFilterStr:= TmpFilterStr + 'and';
       if CheckBox2.Checked then TmpStr:= IntToStr(ColorBox1.Selected);
       if CheckBox3.Checked then
       begin
         if TmpStr <> '' then TmpStr:= TmpStr + ',';
         TmpStr:= TmpStr + IntToStr(ColorBox2.Selected);
       end;
       if CheckBox4.Checked then
       begin
         if TmpStr <> '' then TmpStr:= TmpStr + ',';
         TmpStr:= TmpStr + IntToStr(ColorBox3.Selected);
       end;
       TmpFilterStr:= TmpFilterStr + '(tovar_add.mark_color in (' + TmpStr + '))';
     end;
     if(CheckBox5.Checked or CheckBox6.Checked or CheckBox7.Checked)then
     begin // Фильтрация по рекомендации цветом
       if TmpFilterStr <> '' then TmpFilterStr:= TmpFilterStr + 'and';
       if CheckBox5.Checked then TmpStr:= IntToStr(ColorBox4.Selected);
       if CheckBox6.Checked then
       begin
         if TmpStr <> '' then TmpStr:= TmpStr + ',';
         TmpStr:= TmpStr + IntToStr(ColorBox5.Selected);
       end;
       if CheckBox7.Checked then
       begin
         if TmpStr <> '' then TmpStr:= TmpStr + ',';
         TmpStr:= TmpStr + IntToStr(ColorBox6.Selected);
       end;
       TmpFilterStr:= TmpFilterStr + '(tovar_add.sale_mark_color in (' + TmpStr + '))';
     end;
     if BigRemarkFltrEdit.Text <> '' then
     begin // Большое примечание
       if TmpFilterStr <> '' then TmpFilterStr:= TmpFilterStr + 'and';
       TmpFilterStr:= TmpFilterStr + '(tovar_add.BIG_REMARK like ''%' + BigRemarkFltrEdit.Text + '%'')';
     end;
     if StaticText3.Tag > 0 then
     begin // Атрибуты товаров
       if TmpFilterStr <> '' then TmpFilterStr:= TmpFilterStr + 'and';
       TmpFilterStr:= TmpFilterStr + '(t.ITEM in (select distinct ITEM from TOVAR_ATR where ATR_ID in ('
            + SprAtrFltrStr + ') group by ITEM having count(*) >= ' + IntToStr(StaticText3.Tag) + '))';
     end;
   end
   else
   begin
     SpeedButton1.ImageIndex:= 6;
     SpeedButton1.Hint:= 'Применить фильтр';
     SpeedButton2.Enabled:= False;
   end;
   if FAsChild then
     with SprFrm.SprTovar do
     begin
       DisableControls;
       Close;
       if TmpFilterStr <> '' then
         SelectSQL[SelectSQL.Count - 2]:= 'where ' + TmpFilterStr
       else
         SelectSQL[SelectSQL.Count - 2]:= '';
       Open;
       DoSortEx([SprFrm.SprTovar.Tag], SortP);
       EnableControls;
     end
   else ModalResult:= mrOK;
end;

procedure TSprFiterFrm.FormCreate(Sender: TObject);
begin
  LoadSprFilter(ShopIni, 'SPRFILTR');

  CheckBox1.Visible:= ShopIni.ReadBool('Main', 'UseTecDoc', False);
  if CheckBox1.Visible then
  begin
    ArtikulFltrEdit.Width:= 190;
    TecDocDataBase.DBName:= ShopIni.ReadString('Main', 'TecDocBasePath', ExtractFilePath(ParamStr(0)) + 'tecdoc_base.fdb');
    TecDocDataBase.Open;
  end
  else
    ArtikulFltrEdit.Width:= 209;
  SpeedButton2.Enabled:= FAsChild;
  BitBtn5.Enabled:= accessAllowed('SprTovar', User_ID);
end;

procedure TSprFiterFrm.ToolButton4Click(Sender: TObject);
var i: Integer;
begin
    CodeFltrEdit.Text:= '';
    ArtikulFltrEdit.Text:= '';
    NameFltrEdit.Text:= '';
    RemarkFltrEdit.Text:= '';
    Remark_1FltrEdit.Text:= '';
    ProducerFltrEdit.Text:= '';
    ScladFltrEdit.Text:= '';
    BigRemarkFltrEdit.Text:= '';
    SectionFltrComboBox.ItemIndex:= 0;
    SectionFltrComboBox.Color:= clWindow;
    KolvoFltrComboBox.ItemIndex:= 0;
    KolvoFltrComboBox.Color:= clWindow;

    CheckBox2.Checked:= False;
    CheckBox3.Checked:= False;
    CheckBox4.Checked:= False;

    SprShowGroup.Clear;
    SprHideGroup.Clear;
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select GROUP_NAME from SPR_GROUP order by GROUP_NAME');
      Open;
      while not Eof do
      begin
        SprShowGroup.Add(TrimRight(ShopMainForm.pFIBService['GROUP_NAME']));
        Next;
      end;
      Close;
    end;
    StaticText1.Caption:= ' Нет фильтрации';
    StaticText1.Color:= clWindow;

    SprShowVendor.Clear;
    SprHideVendor.Clear;
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select VENDOR_NAME from SPR_VENDORS');
      Open;
      while not Eof do
      begin
        SprShowVendor.Add(TrimRight(ShopMainForm.pFIBService['VENDOR_NAME']));
        Next;
      end;
      Close;
    end;
    StaticText2.Caption:= ' Нет фильтрации';
    StaticText2.Color:= clWindow;

    StaticText3.Tag:= 0;
    SprAtrFltrStr:= '';
    StaticText3.Caption:= ' Нет фильтрации';
    StaticText3.Color:= clWindow;
end;

procedure TSprFiterFrm.FormHide(Sender: TObject);
begin
    SaveSprFilter(ShopIni, 'SPRFILTR');
end;

procedure TSprFiterFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not FAsChild and (Key = VK_ESCAPE) then ModalResult:= mrCancel;
end;

end.
