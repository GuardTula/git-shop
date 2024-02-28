//****************************************************************************//
//                              © Guard  2002-2022                            //
//****************************************************************************//
unit EnterMoney;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask;

type
  TEnterMoneyFrm = class(TForm)
    MoneyEdit: TEdit;
    Panel1: TPanel;
    NameBuyerEdit: TLabeledEdit;
    INNBuyerEdit: TLabeledEdit;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure MoneyEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure MoneyEditKeyPress(Sender: TObject; var Key: Char);
    procedure INNBuyerEditKeyPress(Sender: TObject; var Key: Char);
    procedure MoneyEditEnter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure INNBuyerEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EnterMoneyFrm: TEnterMoneyFrm;

implementation

uses Sale, ShopMain, PinPad_Pilot_nt;

{$R *.dfm}

procedure TEnterMoneyFrm.INNBuyerEditChange(Sender: TObject);
begin
  if CheckINN(INNBuyerEdit.Text) then INNBuyerEdit.Font.Color:= clWindowText
  else INNBuyerEdit.Font.Color:= clRed;
end;

procedure TEnterMoneyFrm.INNBuyerEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in[#8,'0'..'9'])then Key:= #0;
end;

procedure TEnterMoneyFrm.MoneyEditEnter(Sender: TObject);
begin
  MoneyEdit.SelectAll;
end;

procedure TEnterMoneyFrm.MoneyEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: ModalResult:= idCancel;
    VK_RETURN: if StrToFloat('0' + MoneyEdit.Text) >= CheckSum - Discont then ModalResult:= idOK
               else
               begin
                 MessageDlg('Введённая сумма меньше суммы чека', mtWarning, [mbOK], 0);
                 MoneyEdit.Text:= FloatToStrF(CheckSum - Discont, ffGeneral, 12, 2);
                 MoneyEdit.SelectAll;
               end;
  end;
end;

procedure TEnterMoneyFrm.MoneyEditKeyPress(Sender: TObject; var Key: Char);
begin
     if not (Key in[#8,',','0'..'9'])then Key:= #0;
     if(Pos(',', (Sender as TEdit).Text) > 0)then
     begin
       if(Key = ',')then Key:= #0
       else if Key <> #8 then
         if((Sender as TEdit).SelStart >= Pos(',', (Sender as TEdit).Text))and
           (Length((Sender as TEdit).Text) - Pos(',', (Sender as TEdit).Text) >= 2)
         then Key:= #0;
     end;
end;

procedure TEnterMoneyFrm.SpeedButton1Click(Sender: TObject);
var key: Word;
{    PinPad: TPinPad;
    PayType, PinpadOperation, i: Integer;
    PinPad2KKMStr, PinPadStr: TStrings;
    PinPadChek: Boolean;
    }
begin
   key:= VK_RETURN;      // CloseCheckSpeedButton
   MoneyEditKeyDown(Sender,  key, []);


 {   PinPadChek:= False;
    PinPadStr:= TStringList.Create;
    PinPad2KKMStr:= TStringList.Create;
    PinPadStr.Clear;
    PinPad2KKMStr.Clear;
   try
    if SaleFrm.N24.Checked then
      PayType:= 1  // Наличная оплата
    else
    begin
      PayType:= 2; // Оплата картой
      if Pinpad_Enabled then
      begin
        PinPad:= TPinPad.Create;
        if PinPad.TestPinPad <> 0 then
        begin
          MessageDlg('Ошибка при подключении терминала', mtError, [mbOK], 0);
          raise Exception.create('Ошибка при подключении терминала');
        end;
      end;
    end;




    if((PayType = 2)and Pinpad_Enabled)then // Если безналичная оплата и используем терминал
    begin
      if SaleFrm.SaleItem.Checked then
        PinpadOperation:= OP_PURCHASE   // 1 - Оплата покупки
      else
        PinpadOperation:= OP_RETURN;  // 3 - Возврат либо отмена покупки

      PinPadChek:= PinPad.CardAuth9(CheckSum, PinpadOperation) = 0;  // Авторизация карты
      if PinPad.LastError <> 0 then  ShowMessage('CardAuth9 ' + PinPad.LastError.ToString + ' ' + PinPad.GetMessageText(PinPad.LastError)) ;

      if (PinPadChek and (PinpadOperation = OP_PURCHASE)) then
        PinPadChek:= PinPad.SuspendTrx(CheckSum, PinPad.AuthCode) = 0; // Если оплата прошла cтавим транзакцию на паузу
      if PinPad.LastError <> 0 then  ShowMessage('SuspendTrx ' + PinPad.LastError.ToString + ' ' + PinPad.GetMessageText(PinPad.LastError)) ;

      if not PinPadChek then // иначе отменяем транзакцию
      begin
       // PinPad.RollBackTrx(CheckSum, PinPad.AuthCode);
        if (PinPad.LastError = 2000) then // Если не 2000 'Операция прервана нажатием клавиши ОТМЕНА';
            Abort
        else
//          ShowMessage('Не удалось совершить операцию по терминалу (' + PinPad.LastError.ToString + ')');
          raise Exception.create(PinPad.GetMessageText(PinPad.LastError));
      end;

    end;
  //***************************************************************************************************
      if PinPadChek then   // Если есть чек терминала
        begin // Печатаем чек терминала на ККМ
          PinPadStr.Clear;
          PinPad2KKMStr.Clear;
          PinPadStr.Text:= PinPad.Cheque;
          PinPad2KKMStr.Add('--------------------------------');
          PinPad2KKMStr.Add('       БАНКОВСКИЕ ОПЛАТЫ        ');
          PinPad2KKMStr.Add('--------------------------------');
          i:= 4;
          repeat
            PinPad2KKMStr.Add(PinPadStr[i]);
            Inc(i);
          until ((i > PinPadStr.Count)or(PinPadStr[i] = '================================'));
          PinPad2KKMStr.Add('================================');
          KKM_PrintStrings(PinPad2KKMStr.Text);

  //***************************************************************************************************
        // Выделяем чек терминала
          PinPad2KKMStr.Clear;
          i:= 1;
          repeat
            PinPad2KKMStr.Add(PinPadStr[i]);
            Inc(i);
            if i = 4 then PinPad2KKMStr.Add('Копия 1 ');
          until ((i > PinPadStr.Count)or(PinPadStr[i] = '================================'));
          PinPad2KKMStr.Add('================================');
  //***************************************************************************************************

        end;
  //***************************************************************************************************
  finally
    if PinPadChek then // Если есть чек терминала
      begin
        if (PinpadOperation = OP_PURCHASE) then PinPad.CommitTrx(CheckSum, PinPad.AuthCode);   // фиксируем транзакцию в терминале
      if PinPad.LastError <> 0 then  ShowMessage('CommitTrx ' + PinPad.LastError.ToString + ' ' + PinPad.GetMessageText(PinPad.LastError)) ;


        if (PinPad2KKMStr.Text <> '') then
        begin
//          ShowMessage(PinPad2KKMStr.Text);
          KKM_PrintStrings(PinPad2KKMStr.Text, ShopIni.ReadBool('KKM', 'CutCheck', False), 5, 0, 0);
          Drv.PrintCliche;
        end;
      end
      else
      begin
        if (PinpadOperation = OP_PURCHASE) then PinPad.RollBackTrx(CheckSum, PinPad.AuthCode);// Отменяем транзакцию по терминалу
      if PinPad.LastError <> 0 then  ShowMessage('RollBackTrx ' + PinPad.LastError.ToString + ' ' + PinPad.GetMessageText(PinPad.LastError)) ;
      end;
   PinPad.Free;

    PinPad2KKMStr.Free;
    PinPadStr.Free;
  end;
}
end;

procedure TEnterMoneyFrm.SpeedButton2Click(Sender: TObject);
var key: Word;
begin
   key:= VK_ESCAPE;      // CloseCheckSpeedButton
   MoneyEditKeyDown(Sender,  key, []);
end;

procedure TEnterMoneyFrm.FormResize(Sender: TObject);
begin
  MoneyEdit.Width:= EnterMoneyFrm.Width - Panel1.Width - SpeedButton2.Width - 95;
  SpeedButton1.Left:= MoneyEdit.Left + MoneyEdit.Width + 6;
  SpeedButton2.Left:= SpeedButton1.Left;
end;

end.
