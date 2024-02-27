//****************************************************************************//
//                              © Guard  2002-2022                            //
//****************************************************************************//
unit PassEnter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, DB, FIBDataSet, pFIBDataSet;

type
  TPasswEnterForm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    RememberPassCheckBox: TCheckBox;
    PassSeeSpeedButton: TSpeedButton;
    OKSpeedButton: TSpeedButton;
    CancelSpeedButton: TSpeedButton;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PassSeeSpeedButtonClick(Sender: TObject);
    procedure CancelSpeedButtonClick(Sender: TObject);
    procedure OKSpeedButtonClick(Sender: TObject);
    procedure OKSpeedButtonClickEdit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswEnterForm: TPasswEnterForm;

implementation

uses ShopMain, md5;

{$R *.dfm}

procedure TPasswEnterForm.Edit1Change(Sender: TObject);
begin
  OKSpeedButton.Enabled:= (Edit2.Text <> '')and(Edit1.Text <> '');
end;

procedure TPasswEnterForm.FormCreate(Sender: TObject);
begin
{  with ShopMainForm.pFIBService do
  begin
    SelectSQL.Clear;
    SelectSQL.Add('select NAME, AUTOR_KOD from SPR_USERS order by NAME');
    Open;
    ComboBox1.Items.Clear;
    while not Eof do
    begin
      ComboBox1.Items.Add(ShopMainForm.pFIBService['NAME']);
      Next;
    end;
    Locate('AUTOR_KOD', ShopIni.ReadInteger('MAIN', 'LastUser', -1), []);
    ComboBox1.ItemIndex:= FindString(ShopMainForm.pFIBService['NAME'], ComboBox1.Items);
    Close;
  end;}
  RememberPassCheckBox.Checked:= ShopIni.ReadBool('MAIN', 'RememberPass', False);
  if RememberPassCheckBox.Checked then
    Edit1.Text:= ShopIni.ReadString('MAIN', 'LastPass', '');
  Edit2.Text:= ShopIni.ReadString('MAIN', 'LastUser', '');
end;

procedure TPasswEnterForm.FormDestroy(Sender: TObject);
begin
  ShopIni.WriteString('MAIN', 'LastUser', User_Name);
  if RememberPassCheckBox.Checked then
    ShopIni.WriteString('MAIN', 'LastPass', Edit1.Text);
  ShopIni.WriteBool('MAIN', 'RememberPass', RememberPassCheckBox.Checked);
end;

procedure TPasswEnterForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
     VK_RETURN: OKSpeedButton.Click;
     VK_ESCAPE: CancelSpeedButton.Click;
    end;
end;

procedure TPasswEnterForm.PassSeeSpeedButtonClick(Sender: TObject);
begin
   if not PassSeeSpeedButton.Down then Edit1.PasswordChar:= '*'
   else Edit1.PasswordChar:= #0;
end;

procedure TPasswEnterForm.OKSpeedButtonClick(Sender: TObject);
var Pass: String;
begin
{*******************************************************************************
      User_ID   - Код пользователя
      User_Role - Уровень допуска (-1 - Инженерный,0 - Админ, 1 - Менеджер, 2 - Кассир)
      User_Name - Имя пользователя
*******************************************************************************}
  if ShopIni.ReadBool('Main', 'MD5_Code', False) then Pass:= MD5Print(MD5String(Edit1.Text))
  else Pass:= Edit1.Text;
  with ShopMainForm.pFIBService do
  begin
    SelectSQL.Clear;
    SelectSQL.Add('select * from SPR_USERS where NAME = ''' + Edit2.Text + '''');
    Open;
    if not VarIsNull(ShopMainForm.pFIBService['AUTOR_KOD'])then
    begin
      if Pass = ShopMainForm.pFIBService['USR_PASSW'] then
      begin
        User_ID:= ShopMainForm.pFIBService['AUTOR_KOD'];
        User_Role:= ShopMainForm.pFIBService['USR_ROLE'];
        User_Name:= ShopMainForm.pFIBService['NAME'];
        ShopMainForm.StatusBar1.Panels[0].Text:= 'Пользователь: ' + ShopMainForm.pFIBService['NAME'];
        User_KKM_Pass:= ShopMainForm.pFIBService['FR_PASSW'];
        ModalResult:= mrOK;
      end
      else
      begin
        MessageDlg('Пароль набран неверно', mtWarning, [mbOK], 0);
        ModalResult:= mrAbort;
      end;
    end
    else MessageDlg('Пользователь "' + Edit2.Text + '" не найден в справочнике пользователей', mtError, [mbOK], 0);
    Close;
    if User_ID <> -1 then UpdAccessForUser(User_ID); // Обновляем список доступных команд
  end;
end;

procedure TPasswEnterForm.OKSpeedButtonClickEdit(Sender: TObject);
var Pass: String;
begin
{  if ShopIni.ReadBool('Main', 'MD5_Code', False) then Pass:= MD5Print(MD5String(Edit1.Text))
  else Pass:= Edit1.Text;
  with ShopMainForm.pFIBService do
  begin
    SelectSQL.Clear;
    SelectSQL.Add('select * from SPR_USERS where NAME = ''' + Edit2.Text + '''');
    Open;
    if not VarIsNull(ShopMainForm.pFIBService['AUTOR_KOD'])then
    begin
      if Pass = ShopMainForm.pFIBService['USR_PASSW'] then
      begin
        User_ID:= ShopMainForm.pFIBService['AUTOR_KOD'];
        User_Role:= ShopMainForm.pFIBService['USR_ROLE'];
        User_Name:= ShopMainForm.pFIBService['NAME'];
        ShopMainForm.StatusBar1.Panels[0].Text:= 'Пользователь: ' + ShopMainForm.pFIBService['NAME'];
        User_KKM_Pass:= ShopMainForm.pFIBService['FR_PASSW'];
        ModalResult:= mrOK;
      end
      else
      begin
        MessageDlg('Пароль набран неверно', mtWarning, [mbOK], 0);
        ModalResult:= mrAbort;
      end;
    end
    else MessageDlg('Пользователь "' + Edit2.Text + '" не найден в справочнике пользователей', mtError, [mbOK], 0);
    Close;
    if User_ID <> -1 then UpdAccessForUser(User_ID); // Обновляем список доступных команд
  end;
  }
end;


procedure TPasswEnterForm.CancelSpeedButtonClick(Sender: TObject);
begin
  PasswEnterForm.ModalResult:= mrCancel;
end;

end.
