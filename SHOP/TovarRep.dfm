object TovarRepFrm: TTovarRepFrm
  Left = 527
  Top = 179
  BorderStyle = bsDialog
  Caption = #1058#1086#1074#1072#1088#1085#1099#1081' '#1079#1072#1087#1072#1089
  ClientHeight = 128
  ClientWidth = 218
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 8
    Width = 44
    Height = 13
    Caption = #1054#1073#1098#1077#1082#1090' :'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 29
    Height = 13
    Caption = #1044#1072#1090#1072':'
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 24
    Width = 201
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 0
    OnKeyDown = ComboBox1KeyDown
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 64
    Width = 137
    Height = 21
    Date = 37728.000000000000000000
    Time = 0.057548738426703490
    DateFormat = dfLong
    TabOrder = 2
  end
  object DateTimePicker2: TDateTimePicker
    Left = 144
    Top = 64
    Width = 65
    Height = 21
    Date = 37728.000000000000000000
    Time = 0.057548738426703490
    DateFormat = dfLong
    Kind = dtkTime
    TabOrder = 3
    OnChange = DateTimePicker2Change
  end
  object LMDButton1: TBitBtn
    Left = 64
    Top = 96
    Width = 89
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      88888800000000000888808888888880808800000000000008080888888BBB88
      0008088888877788080800000000000008800888888888808080800000000008
      0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
      088888880FFFFFFFF08888888000000000888888888888888888}
    TabOrder = 1
    OnClick = LMDButton1Click
  end
end
