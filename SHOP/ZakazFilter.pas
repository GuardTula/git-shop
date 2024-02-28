//****************************************************************************//
//                              © Guard  2002-2022                            //
//****************************************************************************//
unit ZakazFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles, ComCtrls, ToolWin, Vcl.Mask;

type
  TZakazFilterFrm = class(TForm)
    Label4: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    CodeFltrEdit: TLabeledEdit;
    ArtikulFltrEdit: TLabeledEdit;
    NameFltrEdit: TLabeledEdit;
    RemarkFltrEdit: TLabeledEdit;
    StaticText1: TStaticText;
    ChangeGroupFltBtn: TBitBtn;
    StaticText2: TStaticText;
    BitBtn5: TBitBtn;
    SectionFltrComboBox: TComboBox;
    KolvoFltrComboBox: TComboBox;
    ZakazFltrComboBox: TComboBox;
    Remark_1FltrEdit: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    StaticText3: TStaticText;
    BitBtn7: TBitBtn;
    Label8: TLabel;
    ProducerFltrEdit: TLabeledEdit;
    Bevel1: TBevel;
    ColorBox1: TColorBox;
    CheckBox2: TCheckBox;
    ColorBox2: TColorBox;
    CheckBox3: TCheckBox;
    ColorBox3: TColorBox;
    CheckBox4: TCheckBox;
    Label1: TLabel;
    procedure ChangeGroupFltBtnClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SectionFltrComboBoxChange(Sender: TObject);
    procedure CodeFltrEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure SaveZakazFilter(IniFileName: TIniFile; IniSection: String = 'FILTER');
    procedure LoadZakazFilter(IniFileName: TIniFile; IniSection: String = 'FILTER');
    procedure FormHide(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
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
    procedure GetWhereFilterStr;
    procedure GetHavingFilterStr;
    { Public declarations }
  end;

var
  ZakazFilterFrm: TZakazFilterFrm;
  FilterIni: TIniFile;

implementation

uses Zakaz, ShopMain, DualList, AtrChange;

{$R *.dfm}
constructor TZakazFilterFrm.Create(AOwner: TComponent);
begin
  FAsChild:= False;
  inherited Create(AOwner);
end;

constructor TZakazFilterFrm.Create(AOwner: TComponent; AParent: TWinControl);
begin
  FAsChild:= True;
  FTempParent:= aParent;
  inherited Create(AOwner);
end;

procedure TZakazFilterFrm.Loaded;
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

procedure TZakazFilterFrm.GetWhereFilterStr;
var TmpStr: String;
begin
     ZakWhereFilterStr:= '';
     TmpStr:= '';
     if CodeFltrEdit.Text <> '' then // PLU код
       ZakWhereFilterStr:= '(t.item like ''' + CodeFltrEdit.Text + ''')';
     if NameFltrEdit.Text <> '' then
     begin // Название товара
       if ZakWhereFilterStr <> '' then ZakWhereFilterStr:= ZakWhereFilterStr + 'and';
       ZakWhereFilterStr:= ZakWhereFilterStr + '(t.tovar_name like ''' + NameFltrEdit.Text + ''')';
     end;
     if ArtikulFltrEdit.Text <> '' then
     begin // Артикул товара
       if ZakWhereFilterStr <> '' then ZakWhereFilterStr:= ZakWhereFilterStr + 'and';
       ZakWhereFilterStr:= ZakWhereFilterStr + '(t.artikul like ''' + ArtikulFltrEdit.Text + ''')';
     end;

     if StaticText3.Tag > 0 then
     begin // Атрибуты товаров
       if ZakWhereFilterStr <> '' then ZakWhereFilterStr:= ZakWhereFilterStr + 'and';
       ZakWhereFilterStr:= ZakWhereFilterStr + '(t.ITEM in (select distinct ITEM from TOVAR_ATR where ATR_ID in ('
            + ZkzAtrFltrStr + ') group by ITEM having count(*) >= ' + IntToStr(StaticText3.Tag) + '))';
{       TmpFilterStr:= TmpFilterStr + '(t.ITEM in (select distinct ITEM from TOVAR_ATR where ATR_ID in ('
            + SprAtrFltrStr + ') group by ITEM having count(*) >= ' + IntToStr(StaticText3.Tag) + '))';
}     end;


     if RemarkFltrEdit.Text <> '' then
     begin // Примечание
       if ZakWhereFilterStr <> '' then ZakWhereFilterStr:= ZakWhereFilterStr + 'and';
       ZakWhereFilterStr:= ZakWhereFilterStr + '(t.remark like ''' + RemarkFltrEdit.Text + ''')';
     end;
     if Remark_1FltrEdit.Text <> '' then
     begin // Доп.примечание
       if ZakWhereFilterStr <> '' then ZakWhereFilterStr:= ZakWhereFilterStr + 'and';
       ZakWhereFilterStr:= ZakWhereFilterStr + '(t.remark_1 like ''' + Remark_1FltrEdit.Text + ''')';
     end;
     if ZakHideGroup.Count > 0 then
     begin // Товарные группы
       if ZakWhereFilterStr <> '' then ZakWhereFilterStr:= ZakWhereFilterStr + 'and';
       ZakWhereFilterStr:= ZakWhereFilterStr + '(t.t_group in (' + GetGroupFltrStr(ZakShowGroup) + '))';
     end;
     if ZakHideVendor.Count > 0 then
     begin // Поставщик
       if ZakWhereFilterStr <> '' then ZakWhereFilterStr:= ZakWhereFilterStr + 'and';
       ZakWhereFilterStr:= ZakWhereFilterStr + '(t.vendor_code in (' + GetVendorFltrStr(ZakShowVendor) + '))';
     end;

     if(CheckBox2.Checked or CheckBox3.Checked or CheckBox4.Checked)then
     begin // Фильтрация по выделению цветом
       if ZakWhereFilterStr <> '' then ZakWhereFilterStr:= ZakWhereFilterStr + 'and';
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
       ZakWhereFilterStr:= ZakWhereFilterStr + '(tovar_add.mark_color in (' + TmpStr + '))';
     end;

     if SectionFltrComboBox.ItemIndex > 0 then
     begin // Секция ККМ
       if ZakWhereFilterStr <> '' then ZakWhereFilterStr:= ZakWhereFilterStr + 'and';
       ZakWhereFilterStr:= ZakWhereFilterStr + '(t.kkm_sect = ' + SectionFltrComboBox.Text + ')';
     end;
     if ProducerFltrEdit.Text <> '' then
     begin // Производитель
       if ZakWhereFilterStr <> '' then ZakWhereFilterStr:= ZakWhereFilterStr + 'and';
       ZakWhereFilterStr:= ZakWhereFilterStr + '(t.PRODUCER like ''' + ProducerFltrEdit.Text + ''')';
     end;
     case ZakazFltrComboBox.ItemIndex of
      1: begin // Заказ
           if ZakWhereFilterStr <> '' then ZakWhereFilterStr:= ZakWhereFilterStr + 'and';
           ZakWhereFilterStr:= ZakWhereFilterStr + '(null2zero(z.kolvo) > 0)';
         end;
      2: begin
           if ZakWhereFilterStr <> '' then ZakWhereFilterStr:= ZakWhereFilterStr + 'and';
           ZakWhereFilterStr:= ZakWhereFilterStr + '(select null2zero(SUM(kolvo)) from ZAKAZ where ITEM = t.ITEM and AUTOR_KOD = ' + IntToStr(User_ID) + ') > 0)';
         end;
     end;    
     if ZakWhereFilterStr <> '' then ZakWhereFilterStr:= 'WHERE ' + ZakWhereFilterStr;
end;

procedure TZakazFilterFrm.GetHavingFilterStr;
begin
     ZakHavingFilterStr:= '';
     if KolvoFltrComboBox.ItemIndex > 0 then
     begin // Остатки
       ZakHavingFilterStr:= '(null2zero(SUM(o.kolvo))';
       case KolvoFltrComboBox.ItemIndex of
        1: ZakHavingFilterStr:= ZakHavingFilterStr + ' > 0)'; // Наличие
        2: ZakHavingFilterStr:= ZakHavingFilterStr + ' <> 0)';// Наличие и пересортица
        3: ZakHavingFilterStr:= ZakHavingFilterStr + ' = 0)'; // Нулевые остатки
        4: ZakHavingFilterStr:= ZakHavingFilterStr + ' < 0)'; // Пересортица
        5: ZakHavingFilterStr:= ZakHavingFilterStr + ' < null2zero(n.norm_ost))and (n.norm_ost is not null)'; // Меньше нормы остатка
        6: ZakHavingFilterStr:= ZakHavingFilterStr + ' < null2zero(n.min_ost))and (n.min_ost is not null)'; // Меньше мин. остатка
        7: ZakHavingFilterStr:= ZakHavingFilterStr + ' > null2zero(n.norm_ost))'; // Больше нормы остатка    and not(n.norm_ost is null)
       end;
     end;
     if(ZakHavingFilterStr <> '')then
        if (ZakHavingFilterStr <> ' ')then ZakHavingFilterStr:= 'HAVING ' + ZakHavingFilterStr;
end;

procedure TZakazFilterFrm.CreateParams(var Params: TCreateParams);
begin
  Inherited CreateParams(Params);
  if FAsChild then
    Params.Style:= Params.Style or WS_CHILD;
end;

procedure TZakazFilterFrm.BitBtn7Click(Sender: TObject);
var i,j: Integer;
begin
  AtrSelectStr:= ZkzAtrFltrStr;

  Application.CreateForm(TAtrChangeFrm, AtrChangeFrm);
  if AtrChangeFrm.ShowModal = mrOk then
  begin
    ZkzAtrFltrStr:= AtrSelectStr;
    if AtrSelectStr <> '' then
    begin // Считаем количество элементов в строке
      j:= 1;
      for i:= 0 to Length(AtrSelectStr)-1 do
        if AtrSelectStr[i] = ',' then Inc(j);

      StaticText3.Caption:= ' Фильтр по ' + j.ToString + ' атрибутам';
      StaticText3.Color:= clYellow;
    end
    else
    begin
      j:= 0;
      StaticText3.Caption:= ' Нет фильтрации';
      StaticText3.Color:= clWindow;
    end;

    StaticText3.Tag:= j;
  end;
  AtrChangeFrm.Free;
end;

function TZakazFilterFrm.CanChange: Boolean;
begin
  Result:= True;
end;

procedure TZakazFilterFrm.ChangeGroupFltBtnClick(Sender: TObject);
var i: Integer;
begin
        Application.CreateForm(TDualListDlg, DualListDlg);
        DualListDlg.Caption:= 'Выбор групп для просмотра';
        DualListDlg.SrcList.Items:= ZakHideGroup;
        DualListDlg.DstList.Items:= ZakShowGroup;
        if DualListDlg.ShowModal = mrOK then
          if DualListDlg.DstList.Items.Count > 0 then begin
            ZakHideGroup.Clear;
            for i:= 0 to DualListDlg.SrcList.Items.Count - 1 do
              ZakHideGroup.Add(DualListDlg.SrcList.Items[i]);
            ZakShowGroup.Clear;
            for i:= 0 to DualListDlg.DstList.Items.Count - 1 do
              ZakShowGroup.Add(DualListDlg.DstList.Items[i]);
            if ZakHideGroup.Count = 0 then begin
              StaticText1.Caption:= ' Нет фильтрации';
              StaticText1.Color:= clWindow;
            end
            else begin
              StaticText1.Caption:= ' Фильтр по ' + IntToStr(ZakShowGroup.Count) + ' группам';
              StaticText1.Color:= clYellow;
            end;
          end
          else MessageDlg('Группы не выбраны', mtWarning, [mbOK], 0);
        DualListDlg.Free;
end;

procedure TZakazFilterFrm.CheckBox2Click(Sender: TObject);
begin
  ColorBox1.Enabled:= CheckBox2.Checked;
end;

procedure TZakazFilterFrm.CheckBox3Click(Sender: TObject);
begin
  ColorBox2.Enabled:= CheckBox3.Checked;
end;

procedure TZakazFilterFrm.CheckBox4Click(Sender: TObject);
begin
  ColorBox3.Enabled:= CheckBox4.Checked;
end;

procedure TZakazFilterFrm.BitBtn5Click(Sender: TObject);
var i: Integer;
begin
        Application.CreateForm(TDualListDlg, DualListDlg);
        DualListDlg.Caption:= 'Выбор поставщиков для просмотра';
        DualListDlg.SrcList.Items:= ZakHideVendor;
        DualListDlg.DstList.Items:= ZakShowVendor;
        if DualListDlg.ShowModal = mrOK then
          if DualListDlg.DstList.Items.Count > 0 then
          begin
            ZakHideVendor.Clear;
            for i:= 0 to DualListDlg.SrcList.Items.Count - 1 do
              ZakHideVendor.Add(DualListDlg.SrcList.Items[i]);
            ZakShowVendor.Clear;
            for i:= 0 to DualListDlg.DstList.Items.Count - 1 do
              ZakShowVendor.Add(DualListDlg.DstList.Items[i]);
            if ZakHideVendor.Count = 0 then
            begin
              StaticText2.Caption:= ' Нет фильтрации';
              StaticText2.Color:= clWindow;
            end
            else
            begin
              StaticText2.Caption:= ' Фильтр по ' + IntToStr(ZakShowVendor.Count) + ' поставщикам';
              StaticText2.Color:= clYellow;
            end;
          end
          else MessageDlg('Поставщики не выбраны', mtWarning, [mbOK], 0);
        DualListDlg.Free;
end;

procedure TZakazFilterFrm.SpeedButton1Click(Sender: TObject);
begin
   if SpeedButton1.Down then
   begin
     GetWhereFilterStr;
     GetHavingFilterStr;
   end
   else
   begin
     ZakWhereFilterStr:= '';
     ZakHavingFilterStr:= '';
   end;
   if FAsChild then
     with ZakazFrm.ZakazQuery do
     begin
       DisableControls;
       Close;
       SelectSQL[SelectSQL.Count - 4]:= ZakWhereFilterStr;
       SelectSQL[SelectSQL.Count - 2]:= ZakHavingFilterStr;
       Open;
       EnableControls;
     end
   else ModalResult:= mrOK;  
end;

procedure TZakazFilterFrm.SectionFltrComboBoxChange(Sender: TObject);
begin
      if (Sender as TComboBox).ItemIndex = 0 then
        (Sender as TComboBox).Color:= clWindow
      else (Sender as TComboBox).Color:= clYellow;
end;

procedure TZakazFilterFrm.CodeFltrEditChange(Sender: TObject);
begin
      if (Sender as TLabeledEdit).Text = '' then
        (Sender as TLabeledEdit).Color:= clWindow
      else (Sender as TLabeledEdit).Color:= clYellow;
end;

procedure TZakazFilterFrm.FormCreate(Sender: TObject);
begin
  LoadZakazFilter(ShopIni, 'ZAKAZFILTR');
  ToolButton5.Visible:= FAsChild;
end;

procedure TZakazFilterFrm.ToolButton4Click(Sender: TObject);
begin
    CodeFltrEdit.Text:= '';
    ArtikulFltrEdit.Text:= '';
    NameFltrEdit.Text:= '';
    RemarkFltrEdit.Text:= '';
    Remark_1FltrEdit.Text:= '';
    SectionFltrComboBox.ItemIndex:= 0;
    SectionFltrComboBox.Color:= clWindow;
    KolvoFltrComboBox.ItemIndex:= 0;
    KolvoFltrComboBox.Color:= clWindow;
    ZakazFltrComboBox.ItemIndex:= 0;
    ZakazFltrComboBox.Color:= clWindow;

    ZakShowGroup.Clear;
    ZakHideGroup.Clear;
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select GROUP_NAME from SPR_GROUP order by GROUP_NAME');
      Open;
      while not Eof do
      begin
        ZakShowGroup.Add(TrimRight(ShopMainForm.pFIBService['GROUP_NAME']));
        Next;
      end;
      Close;
    end;
    StaticText1.Caption:= ' Нет фильтрации';
    StaticText1.Color:= clWindow;

    ZakShowVendor.Clear;
    ZakHideVendor.Clear;
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select VENDOR_NAME from SPR_VENDORS');
      Open;
      while not Eof do
      begin
        ZakShowVendor.Add(TrimRight(ShopMainForm.pFIBService['VENDOR_NAME']));
        Next;
      end;
      Close;
    end;
    StaticText2.Caption:= ' Нет фильтрации';
    StaticText2.Color:= clWindow;
end;

procedure TZakazFilterFrm.ToolButton2Click(Sender: TObject);
begin
    ShopMainForm.SaveDialog1.Filter:= 'Фильтры товаров|*.tfl';
    ShopMainForm.SaveDialog1.InitialDir:= ExtractFilePath(ParamStr(0)) + 'FILTER\';
    if ShopMainForm.SaveDialog1.Execute then
    begin
      if Pos('.tfl', ShopMainForm.SaveDialog1.FileName) = 0 then
        ShopMainForm.SaveDialog1.FileName:= ShopMainForm.SaveDialog1.FileName + '.tfl';
      FilterIni:= TIniFile.Create(ShopMainForm.SaveDialog1.FileName);
      SaveZakazFilter(FilterIni);
      FilterIni.Free;
    end;
end;

procedure TZakazFilterFrm.SaveZakazFilter(IniFileName: TIniFile; IniSection: String = 'FILTER');
begin
      with IniFileName do
      begin
        WriteString(IniSection, 'ITEM', CodeFltrEdit.Text);
        WriteString(IniSection, 'ARTIKUL', ArtikulFltrEdit.Text);
        WriteString(IniSection, 'NAME', NameFltrEdit.Text);
        WriteString(IniSection, 'REMARK', RemarkFltrEdit.Text);
        WriteString(IniSection, 'REMARK_1', Remark_1FltrEdit.Text);
        WriteString(IniSection, 'ATR', ZkzAtrFltrStr);
        WriteString(IniSection, 'PRODUCER', ProducerFltrEdit.Text);
        if ZakHideGroup.Count > 0 then WriteString(IniSection, 'GROUP', GetGroupFltrStr(ZakShowGroup))
        else WriteString(IniSection, 'GROUP', '');
        if ZakHideVendor.Count > 0 then WriteString(IniSection, 'VENDOR', GetVendorFltrStr(ZakShowVendor))
        else WriteString(IniSection, 'VENDOR', '');
        WriteInteger(IniSection, 'KKM', SectionFltrComboBox.ItemIndex);
        WriteInteger(IniSection, 'KOLVO', KolvoFltrComboBox.ItemIndex);
        WriteInteger(IniSection, 'ZAKAZ', ZakazFltrComboBox.ItemIndex);

        WriteInteger(IniSection, 'ZAKAZColorBox1', ColorBox1.Selected);
        WriteBool(IniSection, 'ZAKAZCheckBox2', CheckBox2.Checked);
        WriteInteger(IniSection, 'ZAKAZColorBox2', ColorBox2.Selected);
        WriteBool(IniSection, 'ZAKAZCheckBox3', CheckBox3.Checked);
        WriteInteger(IniSection, 'ZAKAZColorBox3', ColorBox3.Selected);
        WriteBool(IniSection, 'ZAKAZCheckBox4', CheckBox4.Checked);

      end;
end;

procedure TZakazFilterFrm.ToolButton1Click(Sender: TObject);
begin
    ShopMainForm.OpenDialog1.Filter:= 'Фильтры товаров|*.tfl';
    ShopMainForm.OpenDialog1.InitialDir:= ExtractFilePath(ParamStr(0)) + 'FILTER\';
    if ShopMainForm.OpenDialog1.Execute then
    begin
      FilterIni:= TIniFile.Create(ShopMainForm.OpenDialog1.FileName);
      LoadZakazFilter(FilterIni);
      FilterIni.Free;
    end;
end;

procedure TZakazFilterFrm.LoadZakazFilter(IniFileName: TIniFile; IniSection: String = 'FILTER');
var S: String;
    i,j: Integer;
begin
      CodeFltrEdit.Text:= IniFileName.ReadString(IniSection, 'ITEM', '');
      ArtikulFltrEdit.Text:= IniFileName.ReadString(IniSection, 'ARTIKUL', '');
      NameFltrEdit.Text:= IniFileName.ReadString(IniSection, 'NAME', '');
      RemarkFltrEdit.Text:= IniFileName.ReadString(IniSection, 'REMARK', '');
      Remark_1FltrEdit.Text:= IniFileName.ReadString(IniSection, 'REMARK_1', '');
      ProducerFltrEdit.Text:=  IniFileName.ReadString(IniSection, 'PRODUCER', '');
      SectionFltrComboBox.ItemIndex:= IniFileName.ReadInteger(IniSection, 'KKM', 0);
      if SectionFltrComboBox.ItemIndex > 0 then SectionFltrComboBox.Color:= clYellow
      else SectionFltrComboBox.Color:= clWindow;
      KolvoFltrComboBox.ItemIndex:= IniFileName.ReadInteger(IniSection, 'KOLVO', 0);
      if KolvoFltrComboBox.ItemIndex > 0 then KolvoFltrComboBox.Color:= clYellow
      else KolvoFltrComboBox.Color:= clWindow;
      ZakazFltrComboBox.ItemIndex:= IniFileName.ReadInteger(IniSection, 'ZAKAZ', 0);
      if ZakazFltrComboBox.ItemIndex > 0 then ZakazFltrComboBox.Color:= clYellow
      else ZakazFltrComboBox.Color:= clWindow;

      ColorBox1.Selected:= IniFileName.ReadInteger(IniSection, 'ZAKAZColorBox1', clBlack);
      CheckBox2.Checked:= IniFileName.ReadBool(IniSection, 'ZAKAZCheckBox2', False);
      ColorBox2.Selected:= IniFileName.ReadInteger(IniSection, 'ZAKAZColorBox2', clBlack);
      CheckBox3.Checked:= IniFileName.ReadBool(IniSection, 'ZAKAZCheckBox3', False);
      ColorBox3.Selected:= IniFileName.ReadInteger(IniSection, 'ZAKAZColorBox3', clBlack);
      CheckBox4.Checked:= IniFileName.ReadBool(IniSection, 'ZAKAZCheckBox4', False);


      ZkzAtrFltrStr:= IniFileName.ReadString(IniSection, 'ATR', '');
      if ZkzAtrFltrStr > '' then
      begin
        j:= 1;
        for i:= 1 to length(ZkzAtrFltrStr) do
          if ZkzAtrFltrStr[i] = ',' then  Inc(j);
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
        StaticText3.Caption:= ' Фильтр по ' + j.ToString + ' атрибутам';
        StaticText3.Color:= clYellow;
      end;


      S:= ',' + IniFileName.ReadString(IniSection, 'GROUP', '') + ',';
      ZakShowGroup.Clear;
      ZakHideGroup.Clear;
      with ShopMainForm.pFIBService do
      begin
        SelectSQL.Clear;
        SelectSQL.Add('select T_GROUP, GROUP_NAME from SPR_GROUP');
        Open;
        while not Eof do
        begin
          if Pos(',' + IntToStr(ShopMainForm.pFIBService['T_GROUP']) + ',', S) = 0 then
            ZakHideGroup.Add(ShopMainForm.pFIBService['GROUP_NAME'])
          else
            ZakShowGroup.Add(ShopMainForm.pFIBService['GROUP_NAME']);
          Next;
        end;
        Close;
      end;
      if ZakShowGroup.Count = 0 then
      begin
        ZakShowGroup.AddStrings(ZakHideGroup);
        ZakHideGroup.Clear;
      end;
      if ZakHideGroup.Count = 0 then
      begin
        StaticText1.Caption:= ' Нет фильтрации';
        StaticText1.Color:= clWindow;
      end
      else
      begin
        StaticText1.Caption:= ' Фильтр по ' + IntToStr(ZakShowGroup.Count) + ' группам';
        StaticText1.Color:= clYellow;
      end;

      S:= ',' + IniFileName.ReadString(IniSection, 'VENDOR', '') + ',';
      ZakShowVendor.Clear;
      ZakHideVendor.Clear;
      with ShopMainForm.pFIBService do
      begin
        SelectSQL.Clear;
        SelectSQL.Add('select VENDOR_CODE, VENDOR_NAME from SPR_VENDORS');
        Open;
        while not Eof do
        begin
          if Pos(',' + IntToStr(ShopMainForm.pFIBService['VENDOR_CODE']) + ',', S) = 0 then
            ZakHideVendor.Add(ShopMainForm.pFIBService['VENDOR_NAME'])
          else
            ZakShowVendor.Add(ShopMainForm.pFIBService['VENDOR_NAME']);
          Next;
        end;
        Close;
      end;
      if ZakShowVendor.Count = 0 then
      begin
        ZakShowVendor.AddStrings(ZakHideVendor);
        ZakHideVendor.Clear;
      end;
      if ZakHideVendor.Count = 0 then
      begin
        StaticText2.Caption:= ' Нет фильтрации';
        StaticText2.Color:= clWindow;
      end
      else
      begin
        StaticText2.Caption:= ' Фильтр по ' + IntToStr(ZakShowVendor.Count) + ' поставщикам';
        StaticText2.Color:= clYellow;
      end;
end;

procedure TZakazFilterFrm.FormHide(Sender: TObject);
begin
    SaveZakazFilter(ShopIni, 'ZAKAZFILTR');
end;

procedure TZakazFilterFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not FAsChild and (Key = VK_ESCAPE) then ModalResult:= mrCancel;
end;

end.
