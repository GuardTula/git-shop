object NewPereocenFrm: TNewPereocenFrm
  Left = 240
  Top = 265
  BorderStyle = bsDialog
  Caption = 'NewPereocenFrm'
  ClientHeight = 127
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 8
    Top = 8
    Width = 44
    Height = 13
    Caption = #1054#1073#1098#1077#1082#1090' :'
  end
  object Label8: TLabel
    Left = 168
    Top = 8
    Width = 87
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072' :'
  end
  object Label6: TLabel
    Left = 400
    Top = 8
    Width = 48
    Height = 13
    Caption = 'PLU '#1082#1086#1076' :'
  end
  object ComboBox1: TComboBox
    Left = 7
    Top = 24
    Width = 153
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 167
    Top = 24
    Width = 153
    Height = 21
    Date = 37536.006511875000000000
    Time = 37536.006511875000000000
    DateFormat = dfLong
    TabOrder = 1
  end
  object DateTimePicker1: TDateTimePicker
    Left = 320
    Top = 24
    Width = 73
    Height = 21
    Date = 37794.113701643520000000
    Time = 37794.113701643520000000
    Kind = dtkTime
    TabOrder = 2
    OnChange = DateTimePicker1Change
  end
  object Edit1: TEdit
    Left = 400
    Top = 24
    Width = 153
    Height = 21
    MaxLength = 15
    TabOrder = 3
  end
end
