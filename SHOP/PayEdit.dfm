object PayEditFrm: TPayEditFrm
  Left = 448
  Top = 204
  ActiveControl = DateTimePicker1
  BorderStyle = bsDialog
  ClientHeight = 86
  ClientWidth = 654
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 32
    Height = 13
    Caption = #1044#1072#1090#1072' :'
  end
  object Label2: TLabel
    Left = 248
    Top = 8
    Width = 65
    Height = 13
    Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099' :'
  end
  object Label3: TLabel
    Left = 400
    Top = 8
    Width = 40
    Height = 13
    Caption = #1057#1091#1084#1084#1072' :'
  end
  object Label4: TLabel
    Left = 528
    Top = 8
    Width = 74
    Height = 13
    Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' :'
  end
  object Label5: TLabel
    Left = 160
    Top = 8
    Width = 69
    Height = 13
    Caption = #8470' '#1087#1083#1072#1090#1105#1078#1082#1080' :'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 24
    Width = 145
    Height = 21
    Date = 38145.000000000000000000
    Time = 0.625000000000000000
    DateFormat = dfLong
    TabOrder = 0
    OnKeyDown = DateTimePicker1KeyDown
  end
  object ComboBox1: TComboBox
    Left = 249
    Top = 25
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 2
    OnKeyDown = DateTimePicker1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 242
    Top = 53
    Width = 75
    Height = 25
    Caption = 'OK'
    Enabled = False
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 5
  end
  object BitBtn2: TBitBtn
    Left = 322
    Top = 53
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 6
  end
  object MoneyEdit1: TEdit
    Left = 400
    Top = 24
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 3
    OnChange = MoneyEdit1Change
    OnKeyDown = DateTimePicker1KeyDown
    OnKeyPress = MoneyEdit1KeyPress
  end
  object ComboBox2: TComboBox
    Left = 528
    Top = 24
    Width = 121
    Height = 22
    Style = csOwnerDrawFixed
    ItemIndex = 1
    TabOrder = 4
    Text = #1055#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077
    OnKeyDown = DateTimePicker1KeyDown
    Items.Strings = (
      #1042#1086#1079#1074#1088#1072#1090
      #1055#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077)
  end
  object Edit1: TEdit
    Left = 160
    Top = 24
    Width = 81
    Height = 21
    TabOrder = 1
    OnKeyPress = Edit1KeyPress
  end
end
