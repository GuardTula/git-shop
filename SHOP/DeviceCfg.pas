unit DeviceCfg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles;

type
  TDeviceCfgFrm = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    ComboBox2: TComboBox;
    Label2: TLabel;
    ComboBox3: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox4: TComboBox;
    Label5: TLabel;
    ComboBox5: TComboBox;
    Label6: TLabel;
    ComboBox6: TComboBox;
    Edit1: TEdit;
    Label7: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeviceCfgFrm: TDeviceCfgFrm;

implementation

uses ShopMain;

{$R *.dfm}

procedure TDeviceCfgFrm.BitBtn1Click(Sender: TObject);
begin
  if DeviceCfgFrm.Tag > 0 then
  begin // Если Tag = 0 ККМ
    // Применение
    ShopIni.WriteBool('Devices', 'Device' + IntToStr(DeviceCfgFrm.Tag), ComboBox6.ItemIndex = 1);
    // Установка номера СОМ-порта
    ShopIni.WriteInteger('Devices', 'Device' + IntToStr(DeviceCfgFrm.Tag) + 'Port', ComboBox1.ItemIndex + 1);
    // Установка скорости СОМ-порта
    ShopIni.WriteString('Devices', 'Device' + IntToStr(DeviceCfgFrm.Tag) + 'BoudRate', ComboBox2.Text);
    // Установка бит данных
    ShopIni.WriteString('Devices', 'Device' + IntToStr(DeviceCfgFrm.Tag) + 'DataBits', ComboBox3.Text);
    // Установка стоповых битов
    case ComboBox5.ItemIndex of
     0,2: ShopIni.WriteString('Devices', 'Device' + IntToStr(DeviceCfgFrm.Tag) + 'StopBits', ComboBox5.Text);
       1: ShopIni.WriteInteger('Devices', 'Device' + IntToStr(DeviceCfgFrm.Tag) + 'StopBits', 15);
    end;
    // Установка чётности
    ShopIni.WriteInteger('Devices', 'Device' + IntToStr(DeviceCfgFrm.Tag) + 'Parity', ComboBox4.ItemIndex);
  end
  else
  begin
    ShopIni.WriteInteger('KKM', 'Port', ComboBox1.ItemIndex + 1);
    ShopIni.WriteString('KKM', 'SupplierCode', Edit1.Text);
  end;
end;

procedure TDeviceCfgFrm.FormShow(Sender: TObject);
begin
  if DeviceCfgFrm.Tag > 0 then
  begin // Если Tag = 0 ККМ
    Label7.Visible:= False;
    Edit1.Visible:= False;
    DeviceCfgFrm.Caption:= 'Настройка устройства №' + IntToStr(DeviceCfgFrm.Tag);
    // Установка номера СОМ-порта
    ComboBox1.ItemIndex:= ShopIni.ReadInteger('Devices', 'Device' + IntToStr(DeviceCfgFrm.Tag) + 'Port', 0) - 1;
    // Установка скорости СОМ-порта
    ComboBox2.ItemIndex:= FindString(ShopIni.ReadString('Devices', 'Device' + IntToStr(DeviceCfgFrm.Tag) + 'BoudRate', '9600'), ComboBox2.Items);
    // Установка бит данных
    ComboBox3.ItemIndex:= FindString(ShopIni.ReadString('Devices', 'Device' + IntToStr(DeviceCfgFrm.Tag) + 'DataBits', '8'), ComboBox3.Items);
    // Установка стоповых битов
    if ShopIni.ReadInteger('Devices', 'Device' + IntToStr(DeviceCfgFrm.Tag) + 'StopBits', 1) = 15 then
      ComboBox5.ItemIndex:= 1
    else
      ComboBox5.ItemIndex:= FindString(ShopIni.ReadString('Devices', 'Device' + IntToStr(DeviceCfgFrm.Tag) + 'StopBits', '0'), ComboBox5.Items);
    // Установка чётности
    ComboBox4.ItemIndex:= ShopIni.ReadInteger('Devices', 'Device' + IntToStr(DeviceCfgFrm.Tag) + 'Parity', 2);
    // Применение
    ComboBox6.ItemIndex:= ShopIni.ReadInteger('Devices', 'Device' + IntToStr(DeviceCfgFrm.Tag), 0);
  end
  else
  begin
    DeviceCfgFrm.Caption:= 'Настройка ККМ';
    ComboBox1.ItemIndex:= ShopIni.ReadInteger('KKM', 'Port', 1) - 1;
    Edit1.Text:= ShopIni.ReadString('KKM', 'SupplierCode', '2987885090');
    GroupBox1.Visible:= False;
    ComboBox2.Visible:= False;
    ComboBox3.Visible:= False;
    ComboBox4.Visible:= False;
    ComboBox5.Visible:= False;
    ComboBox6.Visible:= False;
    Edit1.Visible:= True;
    Label2.Visible:= False;
    Label3.Visible:= False;
    Label4.Visible:= False;
    Label5.Visible:= False;
    Label6.Visible:= False;
    Label7.Visible:= True;
    BitBtn1.Top:= 70;
    BitBtn2.Top:= 70;
    DeviceCfgFrm.Height:= 127;
  end;
end;

end.

