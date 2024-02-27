object NewExpensesFrm: TNewExpensesFrm
  Left = 221
  Top = 173
  ActiveControl = ComboBox1
  BorderStyle = bsDialog
  Caption = #1056#1072#1089#1093#1086#1076' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
  ClientHeight = 137
  ClientWidth = 553
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
    Top = 8
    Width = 32
    Height = 13
    Caption = #1044#1072#1090#1072' :'
  end
  object Label2: TLabel
    Left = 200
    Top = 8
    Width = 69
    Height = 13
    Caption = #1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1072' :'
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 100
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1088#1072#1089#1093#1086#1076#1072' :'
  end
  object Label4: TLabel
    Left = 400
    Top = 8
    Width = 40
    Height = 13
    Caption = #1057#1091#1084#1084#1072' :'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 24
    Width = 186
    Height = 21
    Date = 37889.625000000000000000
    Time = 37889.625000000000000000
    DateFormat = dfLong
    TabOrder = 0
    OnKeyDown = DateTimePicker1KeyDown
  end
  object ComboBox1: TComboBox
    Left = 200
    Top = 24
    Width = 193
    Height = 21
    ItemHeight = 13
    MaxLength = 40
    TabOrder = 1
    OnChange = ComboBox1Change
    OnKeyDown = DateTimePicker1KeyDown
  end
  object Edit1: TEdit
    Left = 8
    Top = 72
    Width = 537
    Height = 21
    MaxLength = 80
    TabOrder = 3
    OnChange = ComboBox1Change
    OnKeyDown = DateTimePicker1KeyDown
  end
  object Edit2: TEdit
    Left = 400
    Top = 24
    Width = 145
    Height = 21
    TabOrder = 2
    OnChange = ComboBox1Change
    OnKeyDown = DateTimePicker1KeyDown
    OnKeyPress = Edit2KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 200
    Top = 104
    Width = 75
    Height = 25
    Caption = 'OK'
    Enabled = False
    ModalResult = 1
    TabOrder = 4
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
    Left = 280
    Top = 104
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    Kind = bkCancel
  end
end
