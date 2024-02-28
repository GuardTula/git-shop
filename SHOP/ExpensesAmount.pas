unit ExpensesAmount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Grids, frxFIBComponents, DB,
  ExtCtrls, DBGrids, FIBDataSet, pFIBDataSet;

type
  TExpensesAmountFrm = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    pFIBDataSet1: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExpensesAmountFrm: TExpensesAmountFrm;

implementation

uses ShopMain, NewExpenses;

{$R *.dfm}

procedure TExpensesAmountFrm.FormCreate(Sender: TObject);
var i,j: Integer;
begin
        DateTimePicker1.DateTime:= Date;
        DateTimePicker2.DateTime:= Date;
        DateTimePicker1.Time:= StrToTime('15:00:00');
        DateTimePicker2.Time:= StrToTime('15:00:00');
//        BitBtn2.Visible:= accessAllowed('OperExpenses', User_ID);
        BitBtn3.Visible:= accessAllowed('OperExpensesEdit', User_ID);  // Редактирование расходов
        i:= 0;
        j:= 0;
        with ShopMainForm.pFIBService do
        begin
          SelectSQL.Clear;
          SelectSQL.Add('select * from SPR_MARKET');
          Open;
          ComboBox1.Items.Clear;
          ComboBox1.Items.Add('!Все объекты');
          while not Eof do
          begin
            j:= ComboBox1.Items.Add(ShopMainForm.pFIBService['SHORT_NAME']);
            if ShopMainForm.pFIBService['MARKET_CODE'] = CurrentMarketCode then i:= j;
            Next;
          end;
          ComboBox1.ItemIndex:= i;
          Close;
        end;
        BitBtn1.Click;
end;

procedure TExpensesAmountFrm.BitBtn1Click(Sender: TObject);
begin
        with pFIBDataSet1 do
        begin
          DisableControls;
          Close;
          SelectSQL.Clear;
          SelectSQL.Add('select E.*, M.SHORT_NAME from EXPENSES E');
          SelectSQL.Add('left join SPR_MARKET M on E.MARKET_CODE = M.MARKET_CODE');
          SelectSQL.Add('where EXPENSES_DATE between ''' + DateTimeToStr(DateTimePicker1.DateTime)
              + ''' and ''' + DateTimeToStr(DateTimePicker2.DateTime) + '''');
          if ComboBox1.ItemIndex > 0 then SelectSQL.Add('and E.MARKET_CODE = '
                                  + IntToStr(FindMarketCode(ComboBox1.Text)));
          SelectSQL.Add('ORDER BY E.EXPENSES_TYPE');
          Open;
          EnableControls;
        end;
end;

procedure TExpensesAmountFrm.BitBtn2Click(Sender: TObject);
var CurSum: Double;
    TmpDSep: Char;
begin
      Application.CreateForm(TNewExpensesFrm, NewExpensesFrm);
      if (Sender as TComponent).Tag = 1 then
      begin
        NewExpensesFrm.DateTimePicker1.DateTime:= pFIBDataSet1['EXPENSES_DATE'];
        NewExpensesFrm.ComboBox1.Text:= pFIBDataSet1['EXPENSES_TYPE'];
        NewExpensesFrm.Edit2.Text:= FloatToStrF(pFIBDataSet1['AMOUNT'], ffFixed, 15, 2);
        NewExpensesFrm.Edit1.Text:= pFIBDataSet1['TITLE'];
      end;
      if NewExpensesFrm.ShowModal = IDOK then
      begin
        CurSum:= StrToFloat(NewExpensesFrm.Edit2.Text);
        TmpDSep:= FormatSettings.DecimalSeparator;
        FormatSettings.DecimalSeparator:= '.';
        if (Sender as TComponent).Tag = 1 then
          ShopMainForm.pFIBDatabase1.Execute('update EXPENSES'
            + ' set EXPENSES_DATE = '''
            + DateTimeToStr(NewExpensesFrm.DateTimePicker1.DateTime) + ''','
            + ' EXPENSES_TYPE = ''' + NewExpensesFrm.ComboBox1.Text + ''','
            + ' TITLE = ''' + NewExpensesFrm.Edit1.Text + ''','
            + ' AMOUNT = ' + FloatToStrF(CurSum, ffFixed, 15, 2)
            + ' where MARKET_CODE = ' + IntToStr(FindMarketCode(ComboBox1.Text))
            + ' and EXPENSES_DATE = ''' + DateTimeToStr(pFIBDataSet1['EXPENSES_DATE']) + ''''
            + ' and EXPENSES_TYPE = ''' + pFIBDataSet1['EXPENSES_TYPE'] + ''''
            + ' and TITLE = ''' + pFIBDataSet1['TITLE'] + ''''
            + ' and AMOUNT = ' + FloatToStrF(pFIBDataSet1['AMOUNT'], ffFixed, 15, 2))
        else
          ShopMainForm.pFIBDatabase1.Execute('insert into EXPENSES(MARKET_CODE, '
            + 'EXPENSES_DATE, EXPENSES_TYPE, TITLE, AMOUNT)'
            + ' values(' + IntToStr(FindMarketCode(ComboBox1.Text)) + ', '''
            + DateTimeToStr(NewExpensesFrm.DateTimePicker1.DateTime) + ''', '''
            + NewExpensesFrm.ComboBox1.Text + ''', '''
            + NewExpensesFrm.Edit1.Text + ''', '
            + FloatToStrF(CurSum, ffFixed, 15, 2) + ')');
        FormatSettings.DecimalSeparator:= TmpDSep;
        DataSetReOpen(pFIBDataSet1);
      end;
      NewExpensesFrm.Free;
end;

procedure TExpensesAmountFrm.ComboBox1Change(Sender: TObject);
begin
    BitBtn2.Enabled:= ComboBox1.ItemIndex > 0;
    BitBtn3.Enabled:= (ComboBox1.ItemIndex > 0)and not VarIsNull(pFIBDataSet1['EXPENSES_DATE']);
end;

procedure TExpensesAmountFrm.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
       ComboBox1Change(Sender);
end;

procedure TExpensesAmountFrm.DBGrid1TitleClick(Column: TColumn);
var i: Integer;
begin
       with pFIBDataSet1 do
       begin
         DisableControls;
         for i:= 0 to DBGrid1.Columns.Count - 1 do
           if DBGrid1.Columns[i].FieldName = Column.FieldName then
           begin
             DBGrid1.Columns[i].Title.Font.Color:= clRed;
             DBGrid1.Columns[i].Title.Font.Style:= [fsBold];
           end
           else
           begin
             DBGrid1.Columns[i].Title.Font.Color:= clWindowText;
             DBGrid1.Columns[i].Title.Font.Style:= [];
           end;
         Close;
         SelectSQL[SelectSQL.Count - 1]:=  'ORDER BY ' + Column.FieldName;
         Open;
         EnableControls;
       end;
end;

procedure TExpensesAmountFrm.BitBtn4Click(Sender: TObject);
var FIBQuery1: TfrxFIBQuery;
begin
        with ShopMainForm.frxReport1 do
        begin
          LoadFromFile(ShopIni.ReadString('Reports', 'Expenses', ReportsPath + 'Expenses.fr3'));
          FIBQuery1:= FindObject('FIBQuery1') as TfrxFIBQuery;
          FIBQuery1.SQL:= pFIBDataSet1.SelectSQL;
          Script.Variables['BEGD']:= DateToStr(DateTimePicker1.Date);
          Script.Variables['ENDD']:= DateToStr(DateTimePicker2.Date);
          Script.Variables['OBJNAME']:= ComboBox1.Text;
          ShowReport;
        end;
end;

end.
