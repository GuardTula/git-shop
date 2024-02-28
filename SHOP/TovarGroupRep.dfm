object TovarGroupRepFrm: TTovarGroupRepFrm
  Left = 248
  Top = 105
  BorderStyle = bsDialog
  Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1075#1088#1091#1087#1087#1072#1084' '#1090#1086#1074#1072#1088#1086#1074
  ClientHeight = 257
  ClientWidth = 209
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 88
    Width = 43
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086' :'
  end
  object Label2: TLabel
    Left = 8
    Top = 136
    Width = 61
    Height = 13
    Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' :'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 44
    Height = 13
    Caption = #1054#1073#1098#1077#1082#1090' :'
  end
  object Label4: TLabel
    Left = 8
    Top = 48
    Width = 41
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072' :'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 104
    Width = 129
    Height = 21
    Date = 37501.068643912010000000
    Time = 37501.068643912010000000
    DateFormat = dfLong
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 8
    Top = 152
    Width = 129
    Height = 21
    Date = 37501.068643912010000000
    Time = 37501.068643912010000000
    DateFormat = dfLong
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 24
    Width = 193
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 2
  end
  object DateTimePicker3: TDateTimePicker
    Left = 136
    Top = 104
    Width = 65
    Height = 21
    Date = 37517.603798946800000000
    Time = 37517.603798946800000000
    Kind = dtkTime
    TabOrder = 4
    OnChange = DateTimePicker3Change
  end
  object DateTimePicker4: TDateTimePicker
    Left = 136
    Top = 152
    Width = 65
    Height = 21
    Date = 37517.603798946800000000
    Time = 37517.603798946800000000
    Kind = dtkTime
    TabOrder = 5
    OnChange = DateTimePicker4Change
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 192
    Width = 169
    Height = 25
    Cursor = crHandPoint
    Caption = #1055#1088#1080#1093#1086#1076' '#1086#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
    TabOrder = 6
    OnClick = BitBtn2Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      88888800000000000888808888888880808800000000000008080888888BBB88
      0008088888877788080800000000000008800888888888808080800000000008
      0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
      088888880FFFFFFFF08888888000000000888888888888888888}
  end
  object ComboBox2: TComboBox
    Left = 8
    Top = 64
    Width = 193
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 224
    Width = 169
    Height = 25
    Cursor = crHandPoint
    Caption = #1044#1074#1080#1078#1077#1085#1080#1077
    TabOrder = 7
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      88888800000000000888808888888880808800000000000008080888888BBB88
      0008088888877788080800000000000008800888888888808080800000000008
      0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
      088888880FFFFFFFF08888888000000000888888888888888888}
  end
end
