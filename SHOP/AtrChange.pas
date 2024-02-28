//****************************************************************************//
//                            © Guard  2003-2024                              //
//****************************************************************************//
unit AtrChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, Buttons, ComCtrls, ToolWin, VirtualTrees,
  Data.DB, FIBDataSet, pFIBDataSet, ActiveX, FIBQuery, pFIBQuery, Vcl.ImgList,
  System.ImageList, VirtualTrees.BaseAncestorVCL, VirtualTrees.BaseTree,
  VirtualTrees.AncestorVCL, VirtualTrees.Types;

type
  TAtrChangeFrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    CheckListBox1: TCheckListBox;
    TabSheet3: TTabSheet;
    AtrVT: TVirtualStringTree;
    pFIBQuery1: TpFIBQuery;
    ImageList2: TImageList;
    ToolBar1: TToolBar;
    ToolButton11: TToolButton;
    ToolButton10: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton5: TToolButton;
    ToolBar2: TToolBar;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton1: TToolButton;
    CancelSpeedButton: TSpeedButton;
    OKSpeedButton: TSpeedButton;
    pFIBDataSet1: TpFIBDataSet;
    procedure ToolButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure AtrVTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure AtrVTFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    function FindNode(const APattern: Integer): PVirtualNode;
    procedure AtrVTDragDrop(Sender: TBaseVirtualTree; Source: TObject;
      DataObject: IDataObject; Formats: TFormatArray; Shift: TShiftState;
      Pt: TPoint; var Effect: Integer; Mode: TDropMode);
    procedure AtrVTDragOver(Sender: TBaseVirtualTree; Source: TObject;
      Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode;
      var Effect: Integer; var Accept: Boolean);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure CancelSpeedButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AtrVTChecked(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure OKSpeedButtonClick(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure AtrVTDblClick(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure AtrVTCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
type
  TAtrRec = record
    AtrName: string; // Текст, отображаемый узлом
    AtrId: Integer; // Идентификатор данных, который может быть идентификатором записи базы данных
    ParentAtrId: Integer;
    AtrChecked: Boolean;
    Initialized: Boolean; // True, если узел был заполнен начальными данными
end;

  PAtrRec = ^TAtrRec;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AtrChangeFrm: TAtrChangeFrm;

implementation

uses ShopMain, EditEnter;

{$R *.dfm}
procedure TAtrChangeFrm.AtrVTChecked(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var i: Integer;
  NextNode: PVirtualNode;
  Data, NextData: PAtrRec;
begin
    Data:= AtrVT.GetNodeData(Node);
    Data^.AtrChecked:= AtrVT.CheckState[Node] = csCheckedNormal;

    NextNode:= AtrVT.GetFirstChild(Node);
    while Assigned(NextNode) do
    begin
      NextData:= AtrVT.GetNodeData(NextNode);

      if NextData^.ParentAtrId = Data^.AtrId then
      begin
        if AtrVT.CheckState[NextNode] = AtrVT.CheckState[Node] then
          if AtrVT.CheckState[NextNode] = csCheckedNormal then
            AtrVT.CheckState[NextNode]:= csUncheckedNormal
          else
            AtrVT.CheckState[NextNode]:= csCheckedNormal;

        NextData^.AtrChecked:= Data^.AtrChecked;
        AtrVT.CheckState[NextNode]:= AtrVT.CheckState[Node];
      end;
      NextNode:= AtrVT.GetNextSibling(NextNode);
    end;
end;

procedure TAtrChangeFrm.AtrVTCompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var Dbrec1, Dbrec2: PAtrRec;
begin
   Dbrec1:= Sender.GetNodeData(Node1);
   Dbrec2:= Sender.GetNodeData(Node2);

   Result:= CompareText(DBrec1^.AtrName, DBrec2^.AtrName);
end;

procedure TAtrChangeFrm.AtrVTDblClick(Sender: TObject);
begin
  ToolButton11.Click;
end;

procedure TAtrChangeFrm.AtrVTDragDrop(Sender: TBaseVirtualTree; Source: TObject;
  DataObject: IDataObject; Formats: TFormatArray; Shift: TShiftState;
  Pt: TPoint; var Effect: Integer; Mode: TDropMode);
var nodes: TNodeArray;
    d, cat: PAtrRec;
    i: integer;
    Attachmode: TVTNodeAttachMode;
begin
    if not (Source is TVirtualStringTree) then exit;
    Effect:= DROPEFFECT_MOVE;

    if MessageDlg('Переместить элемент ?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
    begin
      case Mode of
        dmAbove: AttachMode:= amInsertBefore;
        dmOnNode: AttachMode:= amAddChildLast;
        dmBelow: AttachMode:= amInsertAfter;
      else
        AttachMode:= amNowhere;
      end;

      nodes:= Sender.GetSortedSelection(True);
      cat:= AtrVT.GetNodeData(AtrVT.DropTargetNode);
      for i:= 0 to high(nodes) do
      begin
        Sender.MoveTo(nodes[i], AtrVT.DropTargetNode, AttachMode, false);
        d:= sender.GetNodeData(nodes[i]);
        d.ParentAtrId:= cat.AtrId;
      end;
    end;
end;

procedure TAtrChangeFrm.AtrVTDragOver(Sender: TBaseVirtualTree; Source: TObject;
  Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode;
  var Effect: Integer; var Accept: Boolean);
var
  i: Integer;
  SelectNodes: TNodeArray;
begin
  Accept:= True;
  SelectNodes:= Sender.GetSortedSelection(True);
  for i:= low(SelectNodes) to high(SelectNodes) do
  begin
    if Sender.HasAsParent(Sender.DropTargetNode, SelectNodes[i]) then
    begin
      Accept := False;
      Exit;
    end;

    if SelectNodes[i]  = Sender.DropTargetNode then
    begin
      Accept := False;
      Exit;
    end;
  end;

//    Accept := Sender.DropTargetNode  <> Sender.FocusedNode; // Drop'ать узел сам на себя нельзя
end;

procedure TAtrChangeFrm.AtrVTFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data:PAtrRec;
begin
  Data:= Sender.GetNodeData(Node);
  if Assigned(Data) then Finalize(Data^);
end;

procedure TAtrChangeFrm.AtrVTGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  Data: PAtrRec;
  s: String;
begin
  Data:= Sender.GetNodeData(Node);

  CellText:= Data^.AtrName;
{  if (Data^.ParentAtrId <> null) then  s:= Data^.ParentAtrId.ToString
  else s:= '';
  CellText:= Data^.AtrId.ToString + '-' + s + '-' + AtrVT.GetNodeLevel(Node).ToString + ' - '
    + Data^.AtrName;
}
end;

procedure TAtrChangeFrm.BitBtn1Click(Sender: TObject);
begin
    AtrChangeFrm.ModalResult:= mrOK;
end;

procedure TAtrChangeFrm.CancelSpeedButtonClick(Sender: TObject);
begin
    AtrChangeFrm.ModalResult:= mrCancel;
end;

function TAtrChangeFrm.FindNode(const APattern: Integer): PVirtualNode;
var
  NextNode: PVirtualNode;
  Data: PAtrRec;
begin
  Result:= nil;
  NextNode:= AtrVT.GetFirst;
  while Assigned(NextNode) do
  begin
    Data:= AtrVT.GetNodeData(NextNode);
    if Data^.AtrId = APattern then
    begin
      Result:= NextNode;
      Exit;
    end;
    NextNode:= AtrVT.GetNext(NextNode);
  end;
end;

procedure TAtrChangeFrm.ToolButton3Click(Sender: TObject);
var i: Integer;
  NextNode: PVirtualNode;
  Data: PAtrRec;
begin
    for i:= 0 to CheckListBox1.Items.Count - 1 do
      CheckListBox1.Checked[i]:= (Sender as TComponent).Tag = 1;

    NextNode:= AtrVT.GetFirst;
    while Assigned(NextNode) do
    begin
      Data:= AtrVT.GetNodeData(NextNode);
      if (Sender as TComponent).Tag = 0 then
      begin
        Data^.AtrChecked:= False;
        AtrVT.CheckState[NextNode]:= csUncheckedNormal;
      end
      else
      begin
        Data^.AtrChecked:= True;
        AtrVT.CheckState[NextNode]:= csCheckedNormal;
      end;
      NextNode:= AtrVT.GetNext(NextNode);
    end;
end;

procedure TAtrChangeFrm.ToolButton5Click(Sender: TObject);
var
  NextNode: PVirtualNode;
  Data: PAtrRec;
begin
   pFIBQuery1.SQL.Clear;
   pFIBQuery1.SQL.Add('update or insert into SPR_TOVAR_ATTR(ATR_ID, ATR_NAME, PARENT_ATR_ID)'
         + ' values(:ATR_ID, :ATR_NAME, :PARENT_ATR_ID) matching(ATR_ID)');
   pFIBQuery1.Prepare;

  NextNode:= AtrVT.GetFirst;
  while Assigned(NextNode) do
  begin
    Data:= AtrVT.GetNodeData(NextNode);
    pFIBQuery1.ParamByName('ATR_ID').AsInteger:= Data^.AtrId;
    pFIBQuery1.ParamByName('ATR_NAME').AsString:= Data^.AtrName;
    pFIBQuery1.ParamByName('PARENT_ATR_ID').AsInteger:= Data^.ParentAtrId;
    pFIBQuery1.ExecQuery; // Добавляем-обновляем справочник атрибутов
    NextNode:= AtrVT.GetNext(NextNode);
  end;
end;

procedure TAtrChangeFrm.ToolButton7Click(Sender: TObject);
begin
   AtrVT.FullCollapse;
end;

procedure TAtrChangeFrm.ToolButton8Click(Sender: TObject);
begin
  AtrVT.FullExpand;
end;

procedure TAtrChangeFrm.FormCreate(Sender: TObject);
var
  NewNode, FNode: PVirtualNode;
  Data: PAtrRec;
  i: Integer;
begin
    AtrVT.NodeDataSize:= SizeOf(TAtrRec);  // Указываем размер данных узла

    AtrVT.Clear;
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select SPR.ATR_ID, SPR.ATR_NAME, SPR.PARENT_ATR_ID, ');
      SelectSQL.Add('(select count(*) from SPR_TOVAR_ATTR where PARENT_ATR_ID = SPR.ATR_ID)');
      SelectSQL.Add('from SPR_TOVAR_ATTR SPR order by 4 desc, SPR.PARENT_ATR_ID, SPR.ATR_NAME');
      Open;
      AtrVT.OnChecked:= nil;
      while not Eof do
      begin
        if (VarIsNull(ShopMainForm.pFIBService['PARENT_ATR_ID'])or ShopMainForm.pFIBService['PARENT_ATR_ID'] = 0) then
          NewNode:= AtrVT.AddChild(nil)
        else
        begin
          if VarIsNull(ShopMainForm.pFIBService['PARENT_ATR_ID']) then
            FNode:= 0
          else
            FNode:= FindNode(ShopMainForm.pFIBService['PARENT_ATR_ID']);
          NewNode:= AtrVT.AddChild(FNode);
        end;
        Data:= AtrVT.GetNodeData(NewNode);
        Data^.AtrName:= ShopMainForm.pFIBService['ATR_NAME'];
        Data^.AtrId:= ShopMainForm.pFIBService['ATR_ID'];
        Data^.Initialized:= FNode <> nil; // Родительский элемент не найден, возможно еще не записан из базы
        if not VarIsNull(ShopMainForm.pFIBService['PARENT_ATR_ID'])then Data^.ParentAtrId:= ShopMainForm.pFIBService['PARENT_ATR_ID'];
//        if Assigned(SprFiterFrm) then
          Data^.AtrChecked:= Pos(',' + ShopMainForm.pFIBService.FieldByName('ATR_ID').AsString + ',', ',' + AtrSelectStr + ',') > 0;
        AtrVT.CheckType[NewNode]:= ctCheckBox;
        if Data^.AtrChecked then
            AtrVT.CheckState[NewNode]:= csCheckedNormal
          else
            AtrVT.CheckState[NewNode]:= csUncheckedNormal;
        Next;
      end;
      Close;
      AtrVT.OnChecked:= AtrVTChecked;

      NewNode:= AtrVT.GetFirst;
      while Assigned(NewNode) do
      begin
        Data:= AtrVT.GetNodeData(NewNode);
        if not Data^.Initialized then
        begin
          FNode:= FindNode(Data^.AtrId);
          if FNode = nil then
          begin
            MessageDlg('Ошибка инициализации списка. Не найден родительский элемент '
              + Data^.AtrId.ToString, mtError, [mbOK], 0);
            Exit;
          end
          else
          begin
            AtrVT.MoveTo(NewNode, FNode, amAddChildLast, False);
            Data^.Initialized:= True;
{
     case Mode of
      dmAbove: AttachMode:= amInsertBefore;
      dmOnNode: AttachMode:= amAddChildLast;
      dmBelow: AttachMode:= amInsertAfter;
    else
      AttachMode:= amNowhere;
    end;
}
          end;
        end;
        NewNode:= AtrVT.GetNext(NewNode);
      end;


    end;

    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select ATR_ID, ATR_NAME from SPR_TOVAR_ATTR');
      SelectSQL.Add('order by ATR_NAME');
      Open;
      CheckListBox1.Items.Clear;
      i:= 0;
      while not Eof do
      begin
        CheckListBox1.Items.Add(ShopMainForm.pFIBService['ATR_NAME']);
        AtrChangeFrm.CheckListBox1.Checked[i]:=
          Pos(',' + ShopMainForm.pFIBService.FieldByName('ATR_ID').AsString
             + ',', ',' + AtrSelectStr + ',') > 0;
        Inc(i);
        Next;
      end;
      Close;
    end;
end;

procedure TAtrChangeFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
     VK_RETURN: OKSpeedButton.Click;
     VK_ESCAPE: CancelSpeedButton.Click;
    end;
end;

procedure TAtrChangeFrm.OKSpeedButtonClick(Sender: TObject);
var i: Integer;
  NextNode: PVirtualNode;
  Data: PAtrRec;
begin
  AtrSelectStr:= '';
  if PageControl1.ActivePageIndex = 0 then
  begin
    ShopMainForm.pFIBService.SelectSQL.Clear;
    ShopMainForm.pFIBService.SelectSQL.Add('select ATR_ID, ATR_NAME from SPR_TOVAR_ATTR');
    ShopMainForm.pFIBService.Open;
    for i:= 0 to AtrChangeFrm.CheckListBox1.Items.Count - 1 do
    if AtrChangeFrm.CheckListBox1.Checked[i] then
      begin
        if ShopMainForm.pFIBService.Locate('ATR_NAME', AtrChangeFrm.CheckListBox1.Items[i], [])then
        begin
          if AtrSelectStr <> '' then AtrSelectStr:= AtrSelectStr + ',';
          AtrSelectStr:= AtrSelectStr + IntToStr(ShopMainForm.pFIBService['ATR_ID']);
        end;
      end;
    ShopMainForm.pFIBService.Close;
  end
  else
  begin
    NextNode:= AtrVT.GetFirst;
    while Assigned(NextNode) do
    begin
      Data:= AtrVT.GetNodeData(NextNode);
      if Data^.AtrChecked = True then
      begin
        if AtrSelectStr <> '' then AtrSelectStr:= AtrSelectStr + ',';
        AtrSelectStr:= AtrSelectStr + Data^.AtrId.ToString;
      end;
      NextNode:= AtrVT.GetNext(NextNode);
    end;
  end;
  AtrChangeFrm.ModalResult:= mrOK;
end;

procedure TAtrChangeFrm.ToolButton2Click(Sender: TObject);
begin
  Application.CreateForm(TEditEnterForm, EditEnterForm);
  EditEnterForm.Edit1.Text:= '';
  EditEnterForm.Edit1.PasswordChar:= #0;
  EditEnterForm.Label1.Caption:= 'Введите атрибут :';
  EditEnterForm.Caption:= 'Добавление';
  if EditEnterForm.ShowModal = idOK then
  begin
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select * from SPR_TOVAR_ATTR');
      SelectSQL.Add('where ATR_NAME = ''' + EditEnterForm.Edit1.Text + '''');
      Open;
      if VarIsNull(ShopMainForm.pFIBService['ATR_NAME'])then
        with ShopMainForm.pFIBQuery1 do
        begin
          SQL.Clear;
          SQL.Add('insert into SPR_TOVAR_ATTR(ATR_NAME)');
          SQL.Add('values(''' + EditEnterForm.Edit1.Text + ''')');
          ExecQuery;
          CheckListBox1.Items.Add(EditEnterForm.Edit1.Text);
        end
      else MessageDlg('Атрибут с именем "' + EditEnterForm.Edit1.Text
                + '" уже зарегистрирован', mtWarning, [mbOK], 0);
      Close;
    end;
  end;
  CheckListBox1.Sorted:= False;
  CheckListBox1.Sorted:= True;
  EditEnterForm.Free;
end;

procedure TAtrChangeFrm.ToolButton10Click(Sender: TObject);
var Data, NextData: PAtrRec;
  NextNode: PVirtualNode;
begin
        Application.CreateForm(TEditEnterForm, EditEnterForm);
        EditEnterForm.Edit1.Text:= '';
        EditEnterForm.Edit1.PasswordChar:= #0;
        EditEnterForm.Label1.Visible:= False;
        EditEnterForm.Caption:= 'Новый';
        if EditEnterForm.ShowModal = idOK then
        begin
          NextNode:= AtrVT.GetFirst;
          while Assigned(NextNode) do
          begin
            NextData:= AtrVT.GetNodeData(NextNode);
            if (NextData^.AtrName = EditEnterForm.Edit1.Text) then
            begin
              MessageDlg('Атрибут с именем "' + EditEnterForm.Edit1.Text
                      + '" уже зарегистрирован', mtWarning, [mbOK], 0);
              EditEnterForm.Free;
              Exit;
            end;
            NextNode:= AtrVT.GetNext(NextNode);
          end;
          with ShopMainForm.pFIBQuery1 do
          begin
            SQL.Clear;
            SQL.Add('insert into SPR_TOVAR_ATTR(ATR_NAME, PARENT_ATR_ID)');
            SQL.Add('values(''' + EditEnterForm.Edit1.Text + ''', 0)');
            ExecQuery;
          end;
          with pFIBDataSet1 do
          begin
            SelectSQL.Clear;
            SelectSQL.Add('select * from SPR_TOVAR_ATTR');
            SelectSQL.Add('where ATR_NAME = ''' + EditEnterForm.Edit1.Text + '''');
            Open;
            if not VarIsNull(pFIBDataSet1['ATR_ID'])then
            begin
              NextNode:= AtrVT.AddChild(nil);
              Data:= AtrVT.GetNodeData(NextNode);
              Data^.AtrName:= pFIBDataSet1['ATR_NAME'];
              Data^.AtrId:= pFIBDataSet1['ATR_ID'];
              if not VarIsNull(pFIBDataSet1['PARENT_ATR_ID'])then
                Data^.ParentAtrId:= pFIBDataSet1['PARENT_ATR_ID'];
              Data^.Initialized:= True;
              AtrVT.CheckType[NextNode]:= ctCheckBox;
              AtrVT.CheckState[NextNode]:= csUncheckedNormal;
              AtrVT.FocusedNode:= NextNode;
              AtrVT.ScrollIntoView(NextNode, true );
            end
            else
              MessageDlg('Ошибка при добавлении', mtError, [mbOK], 0);
            Close;
          end;
        end;
        EditEnterForm.Free;
end;

procedure TAtrChangeFrm.ToolButton11Click(Sender: TObject);
var Data, NextData: PAtrRec;
  NextNode: PVirtualNode;
begin
     if AtrVT.FocusedNode = nil then
        MessageDlg('Атрибут не выбран !!!', mtWarning, [mbOK], 0)
      else
      begin
        Data:= AtrVT.GetNodeData(AtrVT.FocusedNode);

        Application.CreateForm(TEditEnterForm, EditEnterForm);
        EditEnterForm.Edit1.Text:= Data^.AtrName;
        EditEnterForm.Edit1.PasswordChar:= #0;
//        EditEnterForm.Label1.Caption:= 'Редактируйте атрибут :';
        EditEnterForm.Label1.Visible:= False;
        EditEnterForm.Caption:= 'Редактирование';
        if EditEnterForm.ShowModal = idOK then
        begin
          NextNode:= AtrVT.GetFirst;
          while Assigned(NextNode) do
          begin
            NextData:= AtrVT.GetNodeData(NextNode);
            if ((NextData^.AtrName = EditEnterForm.Edit1.Text)and(NextNode <> AtrVT.FocusedNode)) then
            begin
              MessageDlg('Атрибут с именем "' + EditEnterForm.Edit1.Text
                      + '" уже зарегистрирован', mtWarning, [mbOK], 0);
              EditEnterForm.Free;
              Exit;
            end;
            NextNode:= AtrVT.GetNext(NextNode);
          end;
          Data^.AtrName:= EditEnterForm.Edit1.Text;
        end;
        EditEnterForm.Free;
      end;
end;

procedure TAtrChangeFrm.ToolButton1Click(Sender: TObject);
var S: String;
begin
      if CheckListBox1.ItemIndex = -1 then
        MessageDlg('Атрибут не выбран !!!', mtWarning, [mbOK], 0)
      else
      begin
        Application.CreateForm(TEditEnterForm, EditEnterForm);
        EditEnterForm.Edit1.Text:= CheckListBox1.Items[CheckListBox1.ItemIndex];
        S:= CheckListBox1.Items[CheckListBox1.ItemIndex];
        EditEnterForm.Edit1.PasswordChar:= #0;
        EditEnterForm.Label1.Caption:= 'Редактируйте атрибут :';
        EditEnterForm.Caption:= 'Редактирование';
        if EditEnterForm.ShowModal = idOK then
        begin
          with ShopMainForm.pFIBService do
          begin
            SelectSQL.Clear;
            SelectSQL.Add('select * from SPR_TOVAR_ATTR');
            SelectSQL.Add('where ATR_NAME = ''' + EditEnterForm.Edit1.Text + '''');
            Open;
            if VarIsNull(ShopMainForm.pFIBService['ATR_NAME'])then
              with ShopMainForm.pFIBQuery1 do
              begin
                SQL.Clear;
                SQL.Add('update SPR_TOVAR_ATTR');
                SQL.Add('set ATR_NAME = ''' + EditEnterForm.Edit1.Text + '''');
                SQL.Add('where ATR_NAME = ''' + S + '''');
                ExecQuery;
                CheckListBox1.Items[CheckListBox1.ItemIndex]:= EditEnterForm.Edit1.Text;
              end                   
            else MessageDlg('Атрибут с именем "' + EditEnterForm.Edit1.Text
                      + '" уже зарегистрирован', mtWarning, [mbOK], 0);
            Close;
          end;
        end;
        CheckListBox1.Sorted:= False;
        CheckListBox1.Sorted:= True;
        EditEnterForm.Free;
      end;
end;

end.
