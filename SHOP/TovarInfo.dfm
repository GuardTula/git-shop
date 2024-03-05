object TovarInfoFrm: TTovarInfoFrm
  Left = 249
  Top = 106
  ActiveControl = BitBtn2
  BorderStyle = bsDialog
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1090#1086#1074#1072#1088#1077
  ClientHeight = 328
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 118
    Height = 13
    Caption = #1055#1086#1083#1086#1078#1077#1085#1080#1077' '#1085#1072' '#1089#1082#1083#1072#1076#1077' :'
  end
  object Image1: TImage
    Left = 466
    Top = 0
    Width = 344
    Height = 328
    Align = alRight
    Stretch = True
    Transparent = True
    ExplicitLeft = 464
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 295
    Width = 75
    Height = 25
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 233
    Top = 295
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object BitBtn3: TBitBtn
    Left = 383
    Top = 22
    Width = 75
    Height = 25
    Caption = #1057#1090#1077#1088#1077#1090#1100
    Kind = bkAbort
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 26
    Width = 369
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 30
    ParentFont = False
    TabOrder = 3
    OnChange = Edit1Change
  end
  object Memo1: TMemo
    Left = 8
    Top = 53
    Width = 449
    Height = 209
    TabOrder = 4
    OnChange = Edit1Change
    OnKeyPress = Memo1KeyPress
  end
end
