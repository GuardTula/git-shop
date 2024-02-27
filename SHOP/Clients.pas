//****************************************************************************//
//                            © Guard  2003-2007                              //
//****************************************************************************//
unit Clients;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ComCtrls, ToolWin, StdCtrls, Buttons, ExtCtrls,
  FIBDataSet, pFIBDataSet, Vcl.Mask;

type
  TClientsFrm = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel3: TPanel;
    NCardEdit: TLabeledEdit;
    PhoneEdit: TLabeledEdit;
    AdresEdit: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PriceComboBox: TComboBox;
    Label1: TLabel;
    Panel4: TPanel;
    AddBtn: TBitBtn;
    EditBtn: TBitBtn;
    FamiliaComboBox: TComboBox;
    NameComboBox: TComboBox;
    OtchestvoComboBox: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ControlBar1: TControlBar;
    Edit1: TEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ClientsQuery: TpFIBDataSet;
    ToolButton2: TToolButton;
    ClientsQueryNCARD: TFIBStringField;
    ClientsQueryPRICE: TFIBIntegerField;
    ClientsQueryFAMILIA: TFIBStringField;
    ClientsQueryNAME: TFIBStringField;
    ClientsQueryOTCHESTVO: TFIBStringField;
    ClientsQueryPHONE: TFIBStringField;
    ClientsQueryADRES: TFIBStringField;
    ClientsQueryACTIVE: TFIBIntegerField;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure NCardEditKeyPress(Sender: TObject; var Key: Char);
    procedure NCardEditChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure NCardEditExit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NCardEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientsFrm: TClientsFrm;
  SortP: Boolean;

implementation

uses ShopMain, ClientAutoAdd;

{$R *.dfm}

procedure TClientsFrm.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
     EditBtn.Enabled:= not VarIsNull(ClientsQuery['NCARD']);
end;

procedure TClientsFrm.FormCreate(Sender: TObject);
begin
      ClientsQuery.Open;
      ToolButton2.Visible:= accessAllowed('SprCardAuto', User_ID);  // Автодобавление дисконтных карт
end;

procedure TClientsFrm.AddBtnClick(Sender: TObject);
begin
    // 1 - Добавление , 2 - Редактирование
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select distinct FAMILIA from CLIENTS order by FAMILIA');
          Open;
          FamiliaComboBox.Items.Clear;
          while not Eof do
          begin
            FamiliaComboBox.Items.Add(TrimRight(ShopMainForm.pFIBService['FAMILIA']));
            Next;
          end;
          Close;

          SelectSQL.Clear;
          SelectSQL.Add('select distinct NAME from CLIENTS order by NAME');
          Open;
          NameComboBox.Items.Clear;
          while not Eof do
          begin
            NameComboBox.Items.Add(TrimRight(ShopMainForm.pFIBService['NAME']));
            Next;
          end;
          Close;

          SelectSQL.Clear;
          SelectSQL.Add('select distinct OTCHESTVO from CLIENTS order by OTCHESTVO');
          Open;
          OtchestvoComboBox.Items.Clear;
          while not Eof do
          begin
            OtchestvoComboBox.Items.Add(TrimRight(ShopMainForm.pFIBService['OTCHESTVO']));
            Next;
          end;
          Close;
        end;
        Panel3.Visible:= True;
        Panel4.Visible:= False;
        DBGrid1.Enabled:= False;
        BitBtn1.Tag:= (Sender as TComponent).Tag;
        case (Sender as TComponent).Tag of
         1: begin
              NCardEdit.Text:= '';
              NameComboBox.Text:= '';
              PhoneEdit.Text:= '';
              FamiliaComboBox.Text:= '';
              OtchestvoComboBox.Text:= '';
              AdresEdit.Text:= '';
              PriceComboBox.ItemIndex:= 0;
              NCardEdit.Enabled:= True;
              NCardEdit.SetFocus;
            end;
         2: begin
              if not VarIsNull(ClientsQuery['NAME']) then
                NameComboBox.Text:= TrimRight(ClientsQuery['NAME'])
              else NameComboBox.Text:= '';

              if not VarIsNull(ClientsQuery['FAMILIA'])then
                FamiliaComboBox.Text:= TrimRight(ClientsQuery['FAMILIA'])
              else FamiliaComboBox.Text:= '';

              if not VarIsNull(ClientsQuery['OTCHESTVO'])then
                OtchestvoComboBox.Text:= TrimRight(ClientsQuery['OTCHESTVO'])
              else OtchestvoComboBox.Text:= '';

              if not VarIsNull(ClientsQuery['PHONE'])then
                PhoneEdit.Text:= TrimRight(ClientsQuery['PHONE'])
              else PhoneEdit.Text:= '';

              if not VarIsNull(ClientsQuery['ADRES'])then
                AdresEdit.Text:= TrimRight(ClientsQuery['ADRES'])
              else AdresEdit.Text:= '';

              if not VarIsNull(ClientsQuery['PRICE'])then
                PriceComboBox.ItemIndex:= ClientsQuery['PRICE'] - 1
              else PriceComboBox.ItemIndex:= 0;

              if not VarIsNull(ClientsQuery['NCARD']) then
                NCardEdit.Text:= TrimRight(ClientsQuery['NCARD'])
              else NCardEdit.Text:= '';

              NCardEdit.Enabled:= False;
              FamiliaComboBox.SetFocus;
            end;
        end;

end;

procedure TClientsFrm.BitBtn2Click(Sender: TObject);
begin
        Panel3.Visible:= False;
        Panel4.Visible:= True;
        DBGrid1.Enabled:= True;
end;

procedure TClientsFrm.DBGrid1DblClick(Sender: TObject);
begin
   EditBtn.Click;
   if((ClientsFrm.Tag = 1)and( not VarIsNull(ClientsQuery['NCARD'])))
     then ClientsFrm.ModalResult:= mrOK;
end;

procedure TClientsFrm.NCardEditKeyPress(Sender: TObject; var Key: Char);
begin
      if not(Key in ['0'..'9', #8])then Key:= #0;
end;

procedure TClientsFrm.NCardEditChange(Sender: TObject);
begin
      BitBtn1.Enabled:= (StrToInt('0' + NCardEdit.Text) > 0)and(FamiliaComboBox.Text > '')
          and(NameComboBox.Text > '')and(OtchestvoComboBox.Text > '');
end;

procedure TClientsFrm.BitBtn1Click(Sender: TObject);
begin  // 1 - Добавление , 2 - Редактирование
    with ShopMainForm.pFIBService do
    begin
      SelectSQL.Clear;
      SelectSQL.Add('select * from CLIENTS where NCARD = ''' + NCardEdit.Text + '''');
      Open;
      if not VarIsNull(ShopMainForm.pFIBService['NCARD'])
        and (NCardEdit.Text <> ClientsQuery['NCARD'])then
      begin
        ShopMainForm.pFIBService.Close;
        MessageDlg('Карта с номером : ' + NCardEdit.Text + ' уже зарегистрирована', mtWarning, [mbOK], 0);
      end
      else
      begin
        ShopMainForm.pFIBService.Close;
        case BitBtn1.Tag of
          1: with ShopMainForm.pFIBQuery1 do
             begin
               SQL.Clear;
               SQL.Add('insert into CLIENTS(NCARD, PRICE, FAMILIA, NAME, OTCHESTVO, PHONE, ADRES)');
               SQL.Add('values(''' + NCardEdit.Text + ''',' + PriceComboBox.Text + ','''
                  + FamiliaComboBox.Text + ''',''' + NameComboBox.Text + ''','''
                  + OtchestvoComboBox.Text + ''',''' + PhoneEdit.Text + ''',''' + AdresEdit.Text + ''')');
               ExecQuery;
             end;
          2: with ShopMainForm.pFIBQuery1 do
             begin
               SQL.Clear;
               SQL.Add('update CLIENTS set NCARD = ''' + NCardEdit.Text + ''',');
               SQL.Add('PRICE = ' + PriceComboBox.Text + ',');
               SQL.Add('FAMILIA = ''' + FamiliaComboBox.Text + ''',');
               SQL.Add('NAME = ''' + NameComboBox.Text + ''',');
               SQL.Add('OTCHESTVO = ''' + OtchestvoComboBox.Text + ''',');
               SQL.Add('PHONE = ''' + PhoneEdit.Text + ''',');
               SQL.Add('ADRES = ''' + AdresEdit.Text + '''');
               SQL.Add('where NCARD = ''' + ClientsQuery['NCARD'] + '''');
               ExecQuery;
             end;
        end;
        Panel3.Visible:= False;
        Panel4.Visible:= True;
        DBGrid1.Enabled:= True;
        ClientsQuery.DisableControls;
        ClientsQuery.Close;
        ClientsQuery.Open;
        ClientsQuery.Locate('NCARD', NCardEdit.Text, []);
        ClientsQuery.EnableControls;
      end;
    end;
end;

procedure TClientsFrm.NCardEditExit(Sender: TObject);
begin
//    while Length(NCardEdit.Text) < 9 do NCardEdit.Text:= '0' + NCardEdit.Text;
end;

procedure TClientsFrm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
      if ClientsQuery.Tag = 0 then // Если поиск по номеру
           while Length(Edit1.Text) < 9 do Edit1.Text:= '0' + Edit1.Text;  // Дополняем нулями слева до 9ти знаков
      case ClientsFrm.Tag of
       0: begin
            ClientsQuery.Locate(DBGrid1.Columns[ClientsQuery.Tag].FieldName, Edit1.Text, [loCaseInsensitive, loPartialKey]);
            Edit1.SelectAll;
          end;
       1: if (Edit1.Text = ClientsQuery['NCARD']) then
            ClientsFrm.ModalResult:= mrOK
          else
          begin
            ClientsQuery.Locate(ClientsQuery.FieldName(ClientsQuery.Tag), Edit1.Text, [loCaseInsensitive, loPartialKey]);
            Edit1.SelectAll;
          end;
      end;
    end;
end;

procedure TClientsFrm.NCardEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then SelectNext(Sender as TWinControl, true, true);
end;

procedure TClientsFrm.ToolButton1Click(Sender: TObject);
begin
       ShopMainForm.frxReport1.LoadFromFile(ShopIni.ReadString('Reports',
                   'MoveCard', ReportsPath + 'OTHER\Покупки по картам.fr3'));
       ShopMainForm.frxReport1.ShowReport;
end;

procedure TClientsFrm.ToolButton2Click(Sender: TObject);
begin
  Application.CreateForm(TClientAutoAddForm, ClientAutoAddForm);
  ClientAutoAddForm.ShowModal;
  ClientAutoAddForm.Free;
end;

procedure TClientsFrm.DBGrid1TitleClick(Column: TColumn);
var i,FieldNo: Integer;
begin
    FieldNo:= ClientsQuery.FieldByName(Column.Field.FieldName).FieldNo - 1;
    with ClientsQuery do
    begin
      Active:= True;
      if ClientsQuery.Tag = FieldNo then SortP:= not SortP
      else SortP:= True;
      ClientsQuery.Tag:= FieldNo;
      ClientsQuery.DoSortEx([FieldNo], [SortP]);
      Edit1.Text:= '';
      for i:= 0 to DBGrid1.Columns.Count - 1 do
        if DBGrid1.Columns[i].FieldName = ClientsQuery.Fields[FieldNo].FieldName then
        begin
          DBGrid1.Columns[i].Title.Font.Color:= clRed;
          DBGrid1.Columns[i].Title.Font.Style:= [fsBold];
        end
        else
        begin
          DBGrid1.Columns[i].Title.Font.Color:= clWindowText;
          DBGrid1.Columns[i].Title.Font.Style:= [];
        end;
    end;
end;

end.
