unit SprVendors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, CheckLst, Buttons,
  DB, ToolWin, Menus, FIBDataSet, pFIBDataSet, DSContainer, ExcelObj, Vcl.Mask,
  System.UITypes;

type
  TSprVendFrm = class(TForm)
    DBGrid3: TDBGrid;
    Panel3: TPanel;
    VNameEdit: TLabeledEdit;
    NameEdit: TLabeledEdit;
    INNEdit: TLabeledEdit;
    OKOHXEdit: TLabeledEdit;
    OKPOEdit: TLabeledEdit;
    AdresEdit: TLabeledEdit;
    RemarkEdit: TLabeledEdit;
    PhoneEdit: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource4: TDataSource;
    KPPEdit: TLabeledEdit;
    ToolBar1: TToolBar;
    AddVndBtn: TToolButton;
    EditVndBtn: TToolButton;
    ToolButton4: TToolButton;
    BitBtn3: TToolButton;
    ToolButton3: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    SprVendors: TpFIBDataSet;
    DataSetsContainer1: TDataSetsContainer;
    N3: TMenuItem;
    Excel1: TMenuItem;
    Edit1: TEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label12: TLabel;
    BANKEdit: TEdit;
    Label13: TLabel;
    RSCHETEdit: TEdit;
    KSCHETEdit: TEdit;
    Label18: TLabel;
    BIKEdit: TEdit;
    Label1: TLabel;
    procedure AddVndBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure VNameEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataSource4DataChange(Sender: TObject; Field: TField);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure VNameEditChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SprVendFrm: TSprVendFrm;

implementation

uses ShopMain, Payment;

{$R *.dfm}

procedure TSprVendFrm.AddVndBtnClick(Sender: TObject);
begin    // 1 - Добавление , 2 - Редактирование
        Panel3.Visible:= True;
        ToolBar1.Visible:= False;
        DBGrid3.Enabled:= False;
        BitBtn1.Tag:= (Sender as TComponent).Tag;
        case (Sender as TComponent).Tag of
         1: begin
              VNameEdit.Text:= '';
              NameEdit.Text:= '';
              PhoneEdit.Text:= '';
              INNEdit.Text:= '';
              OKOHXEdit.Text:= '';
              OKPOEdit.Text:= '';
              KPPEdit.Text:= '';
              AdresEdit.Text:= '';
              RemarkEdit.Text:= '';
            end;
         2: begin
              if SprVendFrm.Tag = 0 then
              begin
                VNameEdit.Text:= TrimRight(SprVendors['VENDOR_NAME']);
                VNameEdit.Tag:= SprVendors['VENDOR_CODE'];
              end
              else
              begin
                VNameEdit.Text:= TrimRight(SprVendors['BUYER_NAME']);
                VNameEdit.Tag:= SprVendors['BUYER_CODE'];
              end;
              if not VarIsNull(SprVendors['NAME']) then
                NameEdit.Text:= TrimRight(SprVendors['NAME'])
              else NameEdit.Text:= '';
              if not VarIsNull(SprVendors['PHONE']) then
                PhoneEdit.Text:= TrimRight(SprVendors['PHONE'])
              else PhoneEdit.Text:= '';
              if not VarIsNull(SprVendors['INN'])then
                INNEdit.Text:= TrimRight(SprVendors['INN'])
              else INNEdit.Text:= '';
              if not VarIsNull(SprVendors['OKOHX'])then
                OKOHXEdit.Text:= TrimRight(SprVendors['OKOHX'])
              else OKOHXEdit.Text:= '';
              if not VarIsNull(SprVendors['OKPO'])then
                OKPOEdit.Text:= TrimRight(SprVendors['OKPO'])
              else OKPOEdit.Text:= '';
              if not VarIsNull(SprVendors['KPP'])then
                KPPEdit.Text:= TrimRight(SprVendors['KPP'])
              else KPPEdit.Text:= '';
              if not VarIsNull(SprVendors['ADRES'])then
                AdresEdit.Text:= TrimRight(SprVendors['ADRES'])
              else AdresEdit.Text:= '';
              if not VarIsNull(SprVendors['REMARK'])then
                RemarkEdit.Text:= TrimRight(SprVendors['REMARK'])
              else RemarkEdit.Text:= '';
              if not VarIsNull(SprVendors['BANK'])then
                BANKEdit.Text:= TrimRight(SprVendors['BANK'])
              else BANKEdit.Text:= '';
              if not VarIsNull(SprVendors['RSCHET'])then
                RSCHETEdit.Text:= TrimRight(SprVendors['RSCHET'])
              else RSCHETEdit.Text:= '';
              if not VarIsNull(SprVendors['KSCHET'])then
                KSCHETEdit.Text:= TrimRight(SprVendors['KSCHET'])
              else KSCHETEdit.Text:= '';
              if not VarIsNull(SprVendors['BIK'])then
                BIKEdit.Text:= TrimRight(SprVendors['BIK'])
              else BIKEdit.Text:= '';
            end;
        end;
        VNameEdit.SetFocus;
end;

procedure TSprVendFrm.BitBtn1Click(Sender: TObject);
begin
        case BitBtn1.Tag of
         1: if SprVendFrm.Tag = 0 then
              if SprVendors.Locate('VENDOR_NAME', VNameEdit.Text, [])then
              begin
                MessageDlg('Данное имя уже существует', mtWarning, [mbOK], 0);
                VNameEdit.SetFocus;
                Abort;
              end else
              begin
                ShopMainForm.pFIBDatabase1.Execute('INSERT INTO SPR_VENDORS(VENDOR_NAME, '
                  + 'NAME, PHONE, INN, OKOHX, OKPO, ADRES, REMARK, KPP, BANK, KSCHET, RSCHET, BIK)'
                  + ' VALUES(''' + VNameEdit.Text + ''', ''' + NameEdit.Text + ''', '''
                  + PhoneEdit.Text + ''', ''' + INNEdit.Text + ''', '''
                  + OKOHXEdit.Text + ''', ''' + OKPOEdit.Text + ''', '''
                  + AdresEdit.Text + ''', ''' + RemarkEdit.Text + ''', '''
                  + KPPEdit.Text + ''', ''' + BANKEdit.Text + ''', '''
                  + KSCHETEdit.Text + ''', ''' + RSCHETEdit.Text + ''', '''
                  + BIKEdit.Text + ''')');
                BitBtn2.Click;
              end
            else
              if SprVendors.Locate('BUYER_NAME', VNameEdit.Text, [])then
              begin
                MessageDlg('Данное имя уже существует', mtWarning, [mbOK], 0);
                VNameEdit.SetFocus;
                Abort;
              end else
              begin
                ShopMainForm.pFIBDatabase1.Execute('INSERT INTO SPR_BUYERS(BUYER_NAME, '
                  + 'NAME, PHONE, INN, OKOHX, OKPO, ADRES, REMARK, KPP, BANK, KSCHET, RSCHET, BIK)'
                  + ' VALUES(''' + VNameEdit.Text + ''', ''' + NameEdit.Text + ''', '''
                  + PhoneEdit.Text + ''', ''' + INNEdit.Text + ''', '''
                  + OKOHXEdit.Text + ''', ''' + OKPOEdit.Text + ''', '''
                  + AdresEdit.Text + ''', ''' + RemarkEdit.Text + ''', '''
                  + KPPEdit.Text + ''', ''' + BANKEdit.Text + ''', '''
                  + KSCHETEdit.Text + ''', ''' + RSCHETEdit.Text + ''', '''
                  + BIKEdit.Text + ''')');
                BitBtn2.Click;
              end;
         2: if SprVendFrm.Tag = 0 then
              if SprVendors.Locate('VENDOR_NAME', VNameEdit.Text, [])
                  and(VNameEdit.Tag <> SprVendors['VENDOR_CODE'])then
              begin
                MessageDlg('Данное имя уже существует', mtWarning, [mbOK], 0);
                VNameEdit.SetFocus;
                Abort;
              end else
              begin
                ShopMainForm.pFIBDatabase1.Execute('UPDATE SPR_VENDORS'
                  + ' SET VENDOR_NAME = ''' + VNameEdit.Text + ''''
                  + ', NAME = ''' + NameEdit.Text + ''''
                  + ', PHONE = ''' + PhoneEdit.Text + ''''
                  + ', INN = ''' + INNEdit.Text + ''''
                  + ', OKOHX = ''' + OKOHXEdit.Text + ''''
                  + ', OKPO = ''' + OKPOEdit.Text + ''''
                  + ', ADRES = ''' + AdresEdit.Text + ''''
                  + ', REMARK = ''' + RemarkEdit.Text + ''''
                  + ', KPP = ''' + KPPEdit.Text + ''''
                  + ', BANK = ''' + BANKEdit.Text + ''''
                  + ', RSCHET = ''' + RSCHETEdit.Text + ''''
                  + ', KSCHET = ''' + KSCHETEdit.Text + ''''
                  + ', BIK = ''' + BIKEdit.Text + ''''
                  + ' WHERE VENDOR_CODE = ' + IntToStr(VNameEdit.Tag));
                BitBtn2.Click;
              end
            else
              if SprVendors.Locate('BUYER_NAME', VNameEdit.Text, [])
                  and(VNameEdit.Tag <> SprVendors['BUYER_CODE'])then
              begin
                MessageDlg('Данное имя уже существует', mtWarning, [mbOK], 0);
                VNameEdit.SetFocus;
                Abort;
              end
              else
              begin
                ShopMainForm.pFIBDatabase1.Execute('UPDATE SPR_BUYERS'
                  + ' SET BUYER_NAME = ''' + VNameEdit.Text + ''''
                  + ', NAME = ''' + NameEdit.Text + ''''
                  + ', PHONE = ''' + PhoneEdit.Text + ''''
                  + ', INN = ''' + INNEdit.Text + ''''
                  + ', OKOHX = ''' + OKOHXEdit.Text + ''''
                  + ', OKPO = ''' + OKPOEdit.Text + ''''
                  + ', ADRES = ''' + AdresEdit.Text + ''''
                  + ', REMARK = ''' + RemarkEdit.Text + ''''
                  + ', KPP = ''' + KPPEdit.Text + ''''
                  + ', BANK = ''' + BANKEdit.Text + ''''
                  + ', RSCHET = ''' + RSCHETEdit.Text + ''''
                  + ', KSCHET = ''' + KSCHETEdit.Text + ''''
                  + ', BIK = ''' + BIKEdit.Text + ''''
                  + ' WHERE BUYER_CODE = ' + IntToStr(VNameEdit.Tag));
                BitBtn2.Click;
              end;
         end;
        with SprVendors do
        begin
          DisableControls;
          Close;
          if ShopMainForm.pFIBTransaction1.Active then ShopMainForm.pFIBTransaction1.CommitRetaining;
          Open;
          if SprVendFrm.Tag = 0 then SprVendors.Locate('VENDOR_CODE', VNameEdit.Tag, [])
          else SprVendors.Locate('BUYER_CODE', VNameEdit.Tag, []);
          EnableControls;
//          VendorFltrComboBoxUpdate;
        end;
end;

procedure TSprVendFrm.BitBtn2Click(Sender: TObject);
begin
        Panel3.Visible:= False;
        ToolBar1.Visible:= True;
        DBGrid3.Enabled:= True;
end;

procedure TSprVendFrm.VNameEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then SelectNext(Sender as TWinControl, True, True);
end;

procedure TSprVendFrm.DataSource4DataChange(Sender: TObject;
  Field: TField);
begin
        if SprVendFrm.Tag = 1 then EditVndBtn.Enabled:= not VarIsNull(SprVendors['BUYER_NAME'])
        else EditVndBtn.Enabled:= not VarIsNull(SprVendors['VENDOR_NAME']);
        BitBtn3.Enabled:= EditVndBtn.Enabled;
end;

procedure TSprVendFrm.DBGrid3DblClick(Sender: TObject);
begin
        EditVndBtn.Click;
end;

procedure TSprVendFrm.VNameEditChange(Sender: TObject);
begin
        BitBtn1.Enabled:= VNameEdit.Text <> '';
end;

procedure TSprVendFrm.BitBtn3Click(Sender: TObject);
begin
        Application.CreateForm(TPaymentFrm, PaymentFrm);
        case SprVendFrm.Tag of
          1: begin
               PaymentFrm.PayQuery.SelectSQL[6]:= 'where P.VENDOR_CODE = :BUYER_CODE';
               PaymentFrm.Caption:= 'Оплата по клиенту';
             end;
          0: begin
               PaymentFrm.PayQuery.SelectSQL[6]:= 'where P.VENDOR_CODE = :VENDOR_CODE';
               PaymentFrm.Caption:= 'Оплата по поставщику';
             end;
        end;
        PaymentFrm.PayQuery.Open;
        PaymentFrm.ShowModal;
        PaymentFrm.Free;
end;

procedure TSprVendFrm.ToolButton2Click(Sender: TObject);
begin
  with SprVendors do
  begin
    DisableControls;
    Close;
    if ToolButton2.Down then
      begin
        if SprVendFrm.Tag = 1 then SprVendors.SelectSQL[1]:= 'where BUYER_NAME like ''%' + Edit1.Text + '%'''
        else SprVendors.SelectSQL[1]:= 'where VENDOR_NAME like ''' + Edit1.Text + '''';
        SprVendors.SelectSQL[1]:= SprVendors.SelectSQL[1] + ' or NAME like ''%' + Edit1.Text + '%'' or INN like ''%' + Edit1.Text + '%''';
      end
    else SprVendors.SelectSQL[1]:= '';
    Open;
    EnableControls;
  end;
end;

procedure TSprVendFrm.ToolButton3Click(Sender: TObject);
begin
      PopupMenu1.Popup(SprVendFrm.Left + ToolButton3.Left + 10,
          SprVendFrm.Top + ToolButton3.Top + ToolButton3.Height + 10);
end;

procedure TSprVendFrm.N1Click(Sender: TObject);
begin
       case SprVendFrm.Tag of
         1: begin
              ShopMainForm.frxReport1.LoadFromFile(ShopIni.ReadString('Reports',
                    'ClientPay', ReportsPath + 'ClientPay.fr3'));
              ShopMainForm.frxReport1.Script.Variables['CUR_CLIENT']:= SprVendFrm.SprVendors['BUYER_CODE'];
            end;
         0: begin
              ShopMainForm.frxReport1.LoadFromFile(ShopIni.ReadString('Reports',
                    'VendorPay', ReportsPath + 'VendorPay.fr3'));
              ShopMainForm.frxReport1.Script.Variables['CUR_CLIENT']:= SprVendFrm.SprVendors['VENDOR_CODE'];
            end;
       end;
       ShopMainForm.frxReport1.ShowReport;
end;

procedure TSprVendFrm.N2Click(Sender: TObject);
begin
       case SprVendFrm.Tag of
         1: ShopMainForm.frxReport1.LoadFromFile(ShopIni.ReadString('Reports',
                    'AllClientPay', ReportsPath + 'AllClientPay.fr3'));
         0: ShopMainForm.frxReport1.LoadFromFile(ShopIni.ReadString('Reports',
                    'AllVendorPay', ReportsPath + 'AllVendorPay.fr3'));
       end;
       ShopMainForm.frxReport1.ShowReport;
end;

procedure TSprVendFrm.FormCreate(Sender: TObject);
begin
    Excel1.Visible:= accessAllowed('OperNaklDel', User_ID);
end;

procedure TSprVendFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_INSERT)and not VarIsNull(SprVendors['NAME']) then ModalResult:= mrOK;
end;

procedure TSprVendFrm.Edit1Change(Sender: TObject);
begin
  ToolButton2.Enabled:= Edit1.Text > '';
end;

procedure TSprVendFrm.Excel1Click(Sender: TObject);
var CurPos: TBookmark;
begin
    if MessageDlg('Передать в Excel ?', mtConfirmation, [mbYes,mbNo], 0) = idYes then
    begin
      Screen.Cursor:= crHourGlass;
      if not ExlActive then ExlCreate
      else
        if not Excel.Visible then
        begin
          ExlDestroy;
          ExlCreate;
        end;
      Excel.SheetsInNewWorkbook:= 1;
      Excel.Workbooks.Add;
      Excel.ActiveSheet.PageSetup.LeftMargin:= Excel.CentimetersToPoints(2);
      Excel.ActiveSheet.PageSetup.RightMargin:= Excel.CentimetersToPoints(1);
      Excel.Workbooks[Excel.Workbooks.Count].Worksheets[1].Name:= 'Справочник';
      Excel.DisplayAlerts:= False;
      CurPos:= SprVendors.GetBookmark;
      ExlInsertTable(1, 2, DBGrid3);
      Excel.DisplayAlerts:= True;
      Excel.Visible:= True;
      SprVendors.GotoBookmark(CurPos);
      Screen.Cursor:= crDefault;
    end;
end;

end.
