//****************************************************************************//
//                            © Guard  2003-2024                              //
//****************************************************************************//
unit ZakazAuto;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Forms, Dialogs, Controls, StdCtrls, 
  Buttons, Variants, Data.DB, FIBDataSet, pFIBDataSet;

type
  TZakazAutoForm = class(TForm)
    SrcList: TListBox;
    DstList: TListBox;
    DstLabel: TLabel;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    CancelSpeedButton: TSpeedButton;
    GetZakazButton: TSpeedButton;
    MoveUpBtn: TSpeedButton;
    MoveDownBtn: TSpeedButton;
    SrcObjEdit: TEdit;
    SpeedButton1: TSpeedButton;
    ClearZakazCheckBox: TCheckBox;
    Label1: TLabel;
    ZakazSelectDataSet: TpFIBDataSet;
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure SrcListDblClick(Sender: TObject);
    procedure DstListDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MoveUpBtnClick(Sender: TObject);
    procedure MoveDownBtnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CancelSpeedButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GetZakazButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
  end;

var
  ZakazAutoForm: TZakazAutoForm;

implementation

uses ShopMain, Zakaz;

{$R *.dfm}

procedure TZakazAutoForm.IncludeBtnClick(Sender: TObject);
var Index: Integer;
begin
  if IncludeBtn.Enabled then
  begin
    Index:= GetFirstSelection(SrcList);
    MoveSelected(SrcList, DstList.Items);
//    SetItem(SrcList, Index);
    SetButtons;
  end;
end;

procedure TZakazAutoForm.ExcludeBtnClick(Sender: TObject);
var Index: Integer;
begin
  if ExcludeBtn.Enabled then
  begin
    Index := GetFirstSelection(DstList);
    MoveSelected(DstList, SrcList.Items);
//    SetItem(DstList, Index);
    SetButtons;
  end;
end;

procedure TZakazAutoForm.IncAllBtnClick(Sender: TObject);
var I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I], SrcList.Items.Objects[I]);
  SrcList.Items.Clear;
//  SetItem(SrcList, 0);
  SetButtons;
end;

procedure TZakazAutoForm.SetItem(List: TListBox; Index: Integer);
var MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex:= List.Items.Count - 1;
    if Index = -1 then Index:= 0
    else if Index > MaxIndex then Index:= MaxIndex;
    ItemIndex:= Index;
//    Selected[Index]:= True;
  end;
  SetButtons;
end;

procedure TZakazAutoForm.ExcAllBtnClick(Sender: TObject);
var I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetButtons;
//  SetItem(DstList, 0);
end;

procedure TZakazAutoForm.MoveDownBtnClick(Sender: TObject);
var TmpStr: String;
begin
  if ((DstList.ItemIndex <> -1)and(DstList.ItemIndex < DstList.Items.Count-1)) then
  begin
    TmpStr:= DstList.Items[DstList.ItemIndex];
    DstList.Items[DstList.ItemIndex]:= DstList.Items[DstList.ItemIndex+1];
    DstList.Items[DstList.ItemIndex+1]:= TmpStr;
    DstList.ItemIndex:= DstList.ItemIndex + 1;
  end;
end;

procedure TZakazAutoForm.MoveSelected(List: TCustomListBox; Items: TStrings);
var
  I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
end;

procedure TZakazAutoForm.MoveUpBtnClick(Sender: TObject);
var TmpStr: String;
begin
  if DstList.ItemIndex > 0 then
  begin
    TmpStr:= DstList.Items[DstList.ItemIndex];
    DstList.Items[DstList.ItemIndex]:= DstList.Items[DstList.ItemIndex-1];
    DstList.Items[DstList.ItemIndex-1]:= TmpStr;
    DstList.ItemIndex:= DstList.ItemIndex - 1;
  end;
end;

procedure TZakazAutoForm.SetButtons;
begin
  IncludeBtn.Enabled := SrcList.Items.Count > 0;
  IncAllBtn.Enabled := SrcList.Items.Count > 0;
  ExcludeBtn.Enabled := DstList.Items.Count > 0;
  ExAllBtn.Enabled := DstList.Items.Count > 0;
end;

function TZakazAutoForm.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure TZakazAutoForm.GetZakazButtonClick(Sender: TObject);
var CurItem: String;
    SrcObj, DestObj: Integer;
    i: Integer;
    SrcKolvo, LeftKolvo, DestNorm, DestKolvo, CurZakaz: Double;
begin
  if ((DstList.Count > 0)and(SrcObjEdit.Text <> '')and // Есть объекты получатели и отправитель
    (MessageDlg('Установить заказ на выбранные товары до нормы остатков для выбранных объектов ?',
      mtConfirmation, [mbYes,mbNo], 0) = IDYES))then
    with ZakazSelectDataSet do
    begin
      if ClearZakazCheckBox.Checked then   // Очищаем заказы текущего пользователя
        ExecSQLStr('delete from ZAKAZ where AUTOR_KOD = ' + User_ID.ToString);
      for i:= 0 to DstList.Count-1 do // Перебираем объекты в списке получателей
      begin
        ParamByName('SRC_MARKET').AsInteger:= FindMarketCode(SrcObjEdit.Text);
        ParamByName('DST_MARKET').AsInteger:= FindMarketCode(DstList.Items[i]);
        Filter:= 'SRC_OST > 0';
        Filtered:= True;
        Open;
      // ITEM, DST_NORM_O, DST_MIN_O, DST_OST, CUR_ZAK_KOLVO, SRC_OST, SRC_MIN_O, SRC_NORM_O, ALL_ZAK_KOLVO
        while not Eof do
        begin
          if(ZakazSelectDataSet['DST_OST'] < ZakazSelectDataSet['DST_NORM_O'])then
            begin
              if (ZakazSelectDataSet['SRC_OST'] - ZakazSelectDataSet['ALL_ZAK_KOLVO'] + ZakazSelectDataSet['CUR_ZAK_KOLVO'] < RoundEx(ZakazSelectDataSet['DST_NORM_O'] - ZakazSelectDataSet['DST_OST'], 1)) then
                CurZakaz:= ZakazSelectDataSet['SRC_OST'] - ZakazSelectDataSet['ALL_ZAK_KOLVO'] + ZakazSelectDataSet['CUR_ZAK_KOLVO'] // Остаток меньше необходимого -> заказываем все
              else
                CurZakaz:= RoundEx(ZakazSelectDataSet['DST_NORM_O'] - ZakazSelectDataSet['DST_OST'], 1); // Остаток больше или равен необходимому -> заказываем недостающее количество
              // Добавляем или обновляем заказ
              ExecSQLStr('update or insert into zakaz(ITEM, MARKET_CODE, AUTOR_KOD, KOLVO)'
                + 'values(''' + ZakazSelectDataSet['ITEM'] + ''', ' + ParamByName('DST_MARKET').AsString + ', ' + User_ID.ToString + ', '
                + StringReplace(FloatToStrF(CurZakaz, ffGeneral, 15, 3), ',', '.', [])
                + ') matching(ITEM, MARKET_CODE, AUTOR_KOD)');
            end;
          Next;
        end;
        Close;
      end;
    end;

    with ZakazFrm.ZakazQuery do
    begin
      DisableControls;
      ReopenLocate('ITEM');
      EnableControls;
      Screen.Cursor:= crDefault;
      ZakazAutoForm.ModalResult:= mrOK;
    end;
end;

procedure TZakazAutoForm.SpeedButton1Click(Sender: TObject);
var CurSrc: String;
begin
  if SrcList.ItemIndex > -1 then
  begin
    CurSrc:= SrcObjEdit.Text;
    SrcObjEdit.Text:= SrcList.Items[SrcList.ItemIndex];
    if CurSrc = '' then SrcList.DeleteSelected //  Items  [SrcList.ItemIndex]
    else SrcList.Items[SrcList.ItemIndex]:= CurSrc;
  end;

end;

procedure TZakazAutoForm.SrcListDblClick(Sender: TObject);
begin
    IncludeBtn.Click;
end;

procedure TZakazAutoForm.CancelSpeedButtonClick(Sender: TObject);
begin
  ZakazAutoForm.ModalResult:= mrCancel;
end;

procedure TZakazAutoForm.DstListDblClick(Sender: TObject);
begin
    ExcludeBtn.Click;
end;

procedure TZakazAutoForm.FormCreate(Sender: TObject);
var  SrcObjEdit_Set, SrcList_Set, DstList_Set: string;
begin
  SrcObjEdit_Set:= BaseReadString('ZAKAZ_AUTO', 'SrcObjEdit', '', User_ID);
  SrcList_Set:= BaseReadString('ZAKAZ_AUTO', 'SrcList', '', User_ID);
  DstList_Set:= BaseReadString('ZAKAZ_AUTO', 'DstList', '', User_ID);

  with ShopMainForm.pFIBService do
  begin
    SelectSQL.Clear;
    SelectSQL.Add('select * from SPR_MARKET order by SHORT_NAME');
    Open;
//    SrcList.Items.Clear;
    SrcList.Items.Clear;
    DstList.Items.Clear;
    while not Eof do
    begin

      if Pos(',' + ShopMainForm.pFIBService['SHORT_NAME'] + ',', SrcList_Set) > 0 then
        SrcList.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);

      if Pos(',' + ShopMainForm.pFIBService['SHORT_NAME'] + ',', DstList_Set) > 0 then
        DstList.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);

      if Pos(',' + ShopMainForm.pFIBService['SHORT_NAME'] + ',', SrcObjEdit_Set) > 0 then
        SrcObjEdit.Text:=  ShopMainForm.pFIBService['SHORT_NAME'];

      if Pos(',' + ShopMainForm.pFIBService['SHORT_NAME'] + ',', DstList_Set + SrcList_Set + SrcObjEdit_Set) = 0 then
        SrcList.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);


      Next;
    end;
    Close;
  end;

  with ZakazSelectDataSet do
  begin
    SelectSQL.Clear;
    SelectSQL.Add('select t.item, n.norm_ost DST_NORM_O, n.min_ost DST_MIN_O, null2zero(SUM(o.kolvo))DST_OST, null2zero(z.kolvo) CUR_ZAK_KOLVO,');
    SelectSQL.Add('null2zero((select sum(kolvo) from tovar_ost where item = t.item and market_code = :SRC_MARKET))SRC_OST,');
    SelectSQL.Add('null2zero((select min_ost from spr_norm_ost where item = t.item and market_code = :SRC_MARKET))SRC_MIN_O,');
    SelectSQL.Add('null2zero((select norm_ost  from spr_norm_ost where item = t.item and market_code = :SRC_MARKET))SRC_NORM_O,');
    SelectSQL.Add('null2zero((select sum(kolvo)from zakaz where item = t.item and autor_kod = :AUTOR_KOD))ALL_ZAK_KOLVO');
    SelectSQL.Add('from spr_tovar t left join spr_vendors v on t.vendor_code = v.vendor_code');
    SelectSQL.Add('left join spr_units u on t.unit_kod = u.unit_kod left join tovar_rsrv r ON r.item = t.item');
    SelectSQL.Add('left join spr_group g on t.t_group = g.t_group');
    SelectSQL.Add('left join spr_norm_ost n on n.item = t.item and n.market_code = :DST_MARKET');
    SelectSQL.Add('left join zakaz z on z.item = t.item and z.market_code = :DST_MARKET and z.autor_kod = :AUTOR_KOD');
    SelectSQL.Add('left join prices pr on pr.item = t.item and pr.market_code = (select OBJ_ID from INF_CURRENT_OBJ)');
    SelectSQL.Add('left join tovar_ost o on o.item = t.item and o.market_code = :DST_MARKET');
    SelectSQL.Add(ZakazFrm.ZakazQuery.SelectSQL[ZakazFrm.ZakazQuery.SelectSQL.Count - 4]); // ZakWhereFilterStr
    SelectSQL.Add('group by t.item, n.norm_ost, n.min_ost, z.kolvo');
    SelectSQL.Add(ZakazFrm.ZakazQuery.SelectSQL[ZakazFrm.ZakazQuery.SelectSQL.Count - 2]); // ZakHavingFilterStr
    ParamByName('AUTOR_KOD').AsInteger:= User_ID;

  end;
end;

procedure TZakazAutoForm.FormDestroy(Sender: TObject);
var  SrcList_Set, DstList_Set: string;
   i: Integer;
begin
  BaseWriteString('ZAKAZ_AUTO', 'SrcObjEdit', ',' + SrcObjEdit.Text + ',', User_ID);

  SrcList_Set:= '';
  for i:= 0 to SrcList.Items.Count-1 do
    SrcList_Set:= SrcList_Set + ',' + SrcList.Items[i] + ',';
  BaseWriteString('ZAKAZ_AUTO', 'SrcList', SrcList_Set, User_ID);

  DstList_Set:= '';
  for i:= 0 to DstList.Items.Count-1 do
    DstList_Set:= DstList_Set + ',' + DstList.Items[i] + ',';
  BaseWriteString('ZAKAZ_AUTO', 'DstList', DstList_Set, User_ID);
end;

procedure TZakazAutoForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
//     VK_RETURN: OKSpeedButton.Click;
     VK_ESCAPE: CancelSpeedButton.Click;
    end;
end;

procedure TZakazAutoForm.FormShow(Sender: TObject);
begin
    SetButtons;
end;

end.
