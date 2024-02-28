//****************************************************************************//
//                              c Guard  2002-2013                            //
//****************************************************************************//
unit Payment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ToolWin, FIBDataSet,
  pFIBDataSet, DSContainer, System.UITypes;

type
  TPaymentFrm = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    BitBtn1: TToolButton;
    BitBtn3: TToolButton;
    BitBtn2: TToolButton;
    PayQuery: TpFIBDataSet;
    PayQueryKOD: TFIBIntegerField;
    PayQueryVENDOR_CODE: TFIBIntegerField;
    PayQueryPAYMENT_DATE: TFIBDateTimeField;
    PayQueryPAYMENT_SUM: TFIBFloatField;
    PayQueryPAYMENT_TYPE: TFIBIntegerField;
    PayQueryPAYMENT_KIND: TFIBSmallIntField;
    PayQueryPAYMENT_NUMBER: TFIBIntegerField;
    PayQueryPAYMENT_NAME: TFIBStringField;
    PayQueryCASE: TFIBStringField;
    DataSetsContainer1: TDataSetsContainer;
    procedure FormCreate(Sender: TObject);
    procedure PayQueryAfterOpen(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentFrm: TPaymentFrm;

implementation

uses ShopMain, PayEdit, SprVendors;

{$R *.dfm}

procedure TPaymentFrm.FormCreate(Sender: TObject);
begin
    BitBtn1.Visible:= accessAllowed('OperNakl', User_ID);
    BitBtn2.Visible:= BitBtn1.Visible;
    BitBtn3.Visible:= BitBtn1.Visible;
end;

procedure TPaymentFrm.PayQueryAfterOpen(DataSet: TDataSet);
var Sum: Double;
begin
      with PayQuery do
      begin
        DisableControls;
        Sum:= 0;
        while not Eof do
        begin
          Sum:= Sum + (1 + 2 * PayQuery['PAYMENT_KIND']) * PayQuery['PAYMENT_SUM'];
          Next;
        end;
        First;
        EnableControls;
        Label1.Caption:= 'Итого : ' + FloatToStrF(Sum, ffCurrency, 15, 2);
      end;
end;

procedure TPaymentFrm.BitBtn3Click(Sender: TObject);
begin
    if MessageDlg('Удалить оплату ?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
      begin
        ShopMainForm.pFIBDatabase1.Execute('delete from PAYMENT'
          + ' where KOD = ' + IntToStr(PayQuery['KOD']));
        DataSetReOpen(PayQuery);
      end;
end;

procedure TPaymentFrm.BitBtn1Click(Sender: TObject);
var i: Integer;
    f: Double;
    SQLStr: String;
begin
  Application.CreateForm(TPayEditFrm, PayEditFrm);
  PayEditFrm.Tag:= (Sender as TComponent).Tag;
  TmpSep:= FormatSettings.DecimalSeparator;
  case (Sender as TComponent).Tag of
  0: begin
       if PayEditFrm.ShowModal = mrOK then
       begin
           i:= FindPaymentCode(PayEditFrm.ComboBox1.Text);
           f:= StrToFloat('0'+PayEditFrm.MoneyEdit1.Text);
           FormatSettings.DecimalSeparator:= '.';
           SQLStr:= 'insert into PAYMENT(VENDOR_CODE, PAYMENT_TYPE, PAYMENT_KIND, '
              + 'PAYMENT_DATE, PAYMENT_SUM, PAYMENT_NUMBER)';
           case SprVendFrm.Tag of
             1: SQLStr:= SQLStr + ' values(' + IntToStr(SprVendFrm.SprVendors['BUYER_CODE'])
                  + ', ' + IntToStr(i) + ', ' + IntToStr(PayEditFrm.ComboBox2.ItemIndex - 1)
                  + ', ''' + DateToStr(PayEditFrm.DateTimePicker1.DateTime) + ''', '
                  + FloatToStr(f) + ', 0' + PayEditFrm.Edit1.Text + ')';
             0: SQLStr:= SQLStr + ' values(' + IntToStr(SprVendFrm.SprVendors['VENDOR_CODE'])
                  + ', ' + IntToStr(i) + ', ' + IntToStr(PayEditFrm.ComboBox2.ItemIndex - 1)
                  + ', ''' + DateToStr(PayEditFrm.DateTimePicker1.DateTime) + ''', '
                  + FloatToStr(f) + ', 0' + PayEditFrm.Edit1.Text + ')';
           end;
           ShopMainForm.pFIBDatabase1.Execute(SQLStr);
      end;
     end;
  1: begin
       PayEditFrm.DateTimePicker1.DateTime:= PayQuery['PAYMENT_DATE'];
       PayEditFrm.ComboBox1.ItemIndex:= FindString(FindPayment(PayQuery['PAYMENT_TYPE']), PayEditFrm.ComboBox1.Items);
       PayEditFrm.ComboBox2.ItemIndex:= PayQuery['PAYMENT_KIND'] + 1;
       PayEditFrm.MoneyEdit1.Text:= FloatToStrF(PayQuery['PAYMENT_SUM'], ffFixed, 15, 2);
       PayEditFrm.Edit1.Text:= IntToStr(PayQuery['PAYMENT_NUMBER']);
       if PayEditFrm.ShowModal = mrOK then
         begin
           i:= FindPaymentCode(PayEditFrm.ComboBox1.Text);
           SQLStr:= 'update PAYMENT'
             + ' set PAYMENT_DATE = ''' + DateToStr(PayEditFrm.DateTimePicker1.DateTime) + ''''
             + ' ,PAYMENT_TYPE = ' + IntToStr(i) + ', PAYMENT_KIND = ' + IntToStr(PayEditFrm.ComboBox2.ItemIndex - 1);
           f:= StrToFloat('0'+PayEditFrm.MoneyEdit1.Text);
           FormatSettings.DecimalSeparator:= '.';
           SQLStr:= SQLStr + ',PAYMENT_SUM = ' + FloatToStr(f)
             + ', PAYMENT_NUMBER = 0' + PayEditFrm.Edit1.Text
             + ' where KOD = ' + IntToStr(PayQuery['KOD']);
           ShopMainForm.pFIBDatabase1.Execute(SQLStr);
         end;
     end;
  end;
  FormatSettings.DecimalSeparator:= TmpSep;
  if PayEditFrm.ModalResult = mrOK then DataSetReOpen(PayQuery);
  PayEditFrm.Free;
end;

procedure TPaymentFrm.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
      BitBtn2.Enabled:= not VarIsNull(PayQuery['PAYMENT_SUM']);
      BitBtn3.Enabled:= not VarIsNull(PayQuery['PAYMENT_SUM']);
end;

procedure TPaymentFrm.ToolButton1Click(Sender: TObject);
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

end.
