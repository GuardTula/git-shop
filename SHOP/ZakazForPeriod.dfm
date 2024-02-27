object ZakazForPeriodForm: TZakazForPeriodForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 294
  ClientWidth = 241
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 40
    Top = 11
    Width = 167
    Height = 15
    Caption = #1044#1080#1072#1087#1072#1079#1086#1085' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080' '#1087#1088#1086#1076#1072#1078' :'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 196
    Width = 237
    Height = 50
    Shape = bsFrame
    Style = bsRaised
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 32
    Width = 105
    Height = 23
    Date = 44768.000000000000000000
    Time = 0.596497835649643100
    TabOrder = 0
    OnChange = LabeledEdit1Change
  end
  object DateTimePicker2: TDateTimePicker
    Left = 136
    Top = 32
    Width = 105
    Height = 23
    Date = 44768.000000000000000000
    Time = 0.596622847224352900
    TabOrder = 1
    OnChange = LabeledEdit1Change
  end
  object LabeledEdit1: TLabeledEdit
    Left = 62
    Top = 88
    Width = 121
    Height = 23
    Alignment = taRightJustify
    EditLabel.Width = 97
    EditLabel.Height = 15
    EditLabel.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081':'
    MaxLength = 3
    NumbersOnly = True
    TabOrder = 2
    Text = '30'
    OnChange = LabeledEdit1Change
  end
  object BitBtn1: TBitBtn
    Left = 51
    Top = 264
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 8
  end
  object BitBtn2: TBitBtn
    Left = 132
    Top = 264
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 9
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 148
    Width = 213
    Height = 17
    Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1073#1077#1079#1085#1072#1083#1100#1085#1099#1077' '#1087#1088#1086#1076#1072#1078#1080
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object CheckBox2: TCheckBox
    Left = 24
    Top = 125
    Width = 209
    Height = 17
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1079#1072#1082#1072#1079
    TabOrder = 3
  end
  object CheckBox3: TCheckBox
    Left = 24
    Top = 171
    Width = 209
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079' '#1076#1086' '#1085#1086#1088#1084#1099
    TabOrder = 5
  end
  object CheckBox4: TCheckBox
    Left = 24
    Top = 202
    Width = 213
    Height = 17
    Caption = #1042#1099#1095#1077#1089#1090#1100' '#1087#1088#1077#1074#1099#1096#1077#1085#1080#1077' '#1085#1086#1088#1084#1099
    TabOrder = 6
    OnClick = CheckBox4Click
  end
  object CheckBox5: TCheckBox
    Left = 24
    Top = 225
    Width = 213
    Height = 17
    Caption = #1042#1099#1095#1077#1089#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
    Checked = True
    State = cbChecked
    TabOrder = 7
    OnClick = CheckBox5Click
  end
end
