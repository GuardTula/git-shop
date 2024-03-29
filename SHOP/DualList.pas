//****************************************************************************//
//                            � Guard  2003-2022                              //
//****************************************************************************//
unit DualList;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Forms, Dialogs, Controls, StdCtrls, 
  Buttons;

type
  TDualListDlg = class(TForm)
    SrcList: TListBox;
    DstList: TListBox;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure SrcListDblClick(Sender: TObject);
    procedure DstListDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  DualListDlg: TDualListDlg;

implementation

{$R *.dfm}

procedure TDualListDlg.IncludeBtnClick(Sender: TObject);
var Index: Integer;
begin
  if IncludeBtn.Enabled then
  begin
    Index:= GetFirstSelection(SrcList);
    MoveSelected(SrcList, DstList.Items);
    SetItem(SrcList, Index);
  end;
end;

procedure TDualListDlg.ExcludeBtnClick(Sender: TObject);
var Index: Integer;
begin
  if ExcludeBtn.Enabled then
  begin
    Index := GetFirstSelection(DstList);
    MoveSelected(DstList, SrcList.Items);
    SetItem(DstList, Index);
  end;
end;

procedure TDualListDlg.IncAllBtnClick(Sender: TObject);
var I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I], SrcList.Items.Objects[I]);
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
end;

procedure TDualListDlg.ExcAllBtnClick(Sender: TObject);
var I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
end;

procedure TDualListDlg.MoveSelected(List: TCustomListBox; Items: TStrings);
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

procedure TDualListDlg.SetButtons;
var SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty:= SrcList.Items.Count = 0;
  DstEmpty:= DstList.Items.Count = 0;
  IncludeBtn.Enabled := not SrcEmpty;
  IncAllBtn.Enabled := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExAllBtn.Enabled := not DstEmpty;
end;

function TDualListDlg.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure TDualListDlg.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then Index := 0
    else if Index > MaxIndex then Index := MaxIndex;
    Selected[Index] := True;
  end;
  SetButtons;
end;

procedure TDualListDlg.SrcListDblClick(Sender: TObject);
begin
    IncludeBtn.Click;
end;

procedure TDualListDlg.DstListDblClick(Sender: TObject);
begin
    ExcludeBtn.Click;
end;

procedure TDualListDlg.FormShow(Sender: TObject);
begin
    SetButtons;
end;

end.
