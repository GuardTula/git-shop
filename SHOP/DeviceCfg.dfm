object DeviceCfgFrm: TDeviceCfgFrm
  Left = 385
  Top = 203
  BorderStyle = bsToolWindow
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
  ClientHeight = 256
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 99
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1057#1054#1052'-'#1087#1086#1088#1090#1072' :'
  end
  object Label7: TLabel
    Left = 16
    Top = 43
    Width = 90
    Height = 13
    Caption = #1050#1086#1076' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072' :'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 40
    Width = 265
    Height = 177
    TabOrder = 3
    object Label2: TLabel
      Left = 10
      Top = 19
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100' ('#1073#1080#1090'/'#1089'):'
    end
    object Label3: TLabel
      Left = 29
      Top = 51
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = #1041#1080#1090#1099' '#1076#1072#1085#1085#1099#1093':'
    end
    object Label4: TLabel
      Left = 47
      Top = 83
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = #1063#1105#1090#1085#1086#1089#1090#1100':'
    end
    object Label5: TLabel
      Left = 17
      Top = 115
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = #1057#1090#1086#1087#1086#1074#1099#1077' '#1073#1080#1090#1099':'
    end
    object Label6: TLabel
      Left = 28
      Top = 147
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1088#1080#1084#1077#1085#1077#1085#1080#1077' :'
    end
    object ComboBox2: TComboBox
      Left = 112
      Top = 14
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 0
      Text = '110'
      Items.Strings = (
        '110'
        '300'
        '600'
        '1200'
        '2400'
        '4800'
        '9600'
        '14400'
        '19200'
        '38400'
        '56000'
        '128000'
        '256000')
    end
    object ComboBox3: TComboBox
      Left = 112
      Top = 46
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 1
      Text = '4'
      Items.Strings = (
        '4'
        '5'
        '6'
        '7'
        '8')
    end
    object ComboBox4: TComboBox
      Left = 112
      Top = 78
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 2
      Text = #1063#1105#1090
      Items.Strings = (
        #1063#1105#1090
        #1052#1072#1088#1082#1077#1088
        #1053#1077#1090
        #1053#1077#1095#1077#1090
        #1055#1088#1086#1073#1077#1083)
    end
    object ComboBox5: TComboBox
      Left = 112
      Top = 110
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 3
      Text = '1'
      Items.Strings = (
        '1'
        '1,5'
        '2')
    end
    object ComboBox6: TComboBox
      Left = 112
      Top = 142
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 4
      Text = #1042#1099#1082#1083#1102#1095#1077#1085#1086
      Items.Strings = (
        #1042#1099#1082#1083#1102#1095#1077#1085#1086
        #1042#1082#1083#1102#1095#1077#1085#1086)
    end
  end
  object ComboBox1: TComboBox
    Left = 120
    Top = 11
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 0
    Text = 'COM1'
    Items.Strings = (
      'COM1'
      'COM2'
      'COM3'
      'COM4')
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 224
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = BitBtn1Click
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
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 88
    Top = 224
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    Kind = bkCancel
  end
  object Edit1: TEdit
    Left = 120
    Top = 40
    Width = 145
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
end
