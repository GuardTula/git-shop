object TovarEditFrm: TTovarEditFrm
  Left = 251
  Top = 106
  BorderStyle = bsDialog
  Caption = #1058#1086#1074#1072#1088
  ClientHeight = 417
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = ItemEditKeyDown
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 328
    Top = 96
    Width = 79
    Height = 13
    Caption = #1062#1077#1085#1072' '#1087#1088#1086#1076#1072#1078#1080' :'
  end
  object Label2: TLabel
    Left = 168
    Top = 96
    Width = 97
    Height = 13
    Caption = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072' :'
  end
  object Label3: TLabel
    Left = 8
    Top = 136
    Width = 92
    Height = 13
    Caption = #1058#1086#1074#1072#1088#1085#1072#1103' '#1075#1088#1091#1087#1087#1072' :'
  end
  object Label4: TLabel
    Left = 328
    Top = 136
    Width = 64
    Height = 13
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082' :'
  end
  object Label5: TLabel
    Left = 9
    Top = 180
    Width = 69
    Height = 13
    Caption = #1057#1077#1082#1094#1080#1103' '#1050#1050#1052' :'
  end
  object Label6: TLabel
    Left = 170
    Top = 181
    Width = 58
    Height = 13
    Caption = #1064#1090#1088#1080#1093' '#1082#1086#1076' :'
  end
  object Label7: TLabel
    Left = 168
    Top = 136
    Width = 78
    Height = 13
    Caption = #1045#1076'.'#1080#1079#1084#1077#1088#1077#1085#1080#1103' :'
  end
  object Label8: TLabel
    Left = 8
    Top = 95
    Width = 102
    Height = 13
    Caption = #1053#1086#1088#1084#1072' '#1085#1072#1094#1077#1085#1082#1080' (%) :'
  end
  object Label9: TLabel
    Left = 328
    Top = 8
    Width = 85
    Height = 13
    Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100' :'
  end
  object SpeedButton1: TSpeedButton
    Left = 480
    Top = 8
    Width = 31
    Height = 384
    AllowAllUp = True
    GroupIndex = 1
    Caption = '>'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 144
    Top = 24
    Width = 23
    Height = 22
    Cursor = crHandPoint
    Flat = True
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFD00000000000000000000000000FDFDFD00FFFFFFFF
      FFFFFFFFFFFFFF00FDFDFD00FFFFFFFFFFFFFFFFFFFFFF00FDFDFD00FFFFFFFF
      FFFFFFFFFFFFFF00FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FDFDFD00FFFFFFFF
      FF01FFFFFFFFFF00FDFDFD00FFFFFFFF0101FFFFFFFFFF00FDFDFD00FFFFFF01
      010101010101FF00FDFDFD00FFFFFFFF0101FFFFFF01FF00FDFDFD00FFFFFFFF
      FF01FFFFFF01FF00FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FDFDFD00FF040404
      040404040404FF00FDFDFD00FFFFFFFFFFFFFFFFFFFFFF00FDFDFD00FFFFFFFF
      FFFFFFFFFFFFFF00FDFDFD00000000000000000000000000FDFD}
    OnClick = SpeedButton2Click
  end
  object Label22: TLabel
    Left = 9
    Top = 263
    Width = 103
    Height = 13
    Caption = #1042#1099#1076#1077#1083#1077#1085#1080#1077' '#1094#1074#1077#1090#1086#1084' :'
  end
  object Label23: TLabel
    Left = 9
    Top = 311
    Width = 121
    Height = 13
    Caption = #1056#1077#1082#1086#1084#1077#1085#1076#1072#1094#1080#1103' '#1094#1074#1077#1090#1086#1084' :'
  end
  object ItemEdit: TLabeledEdit
    Left = 8
    Top = 24
    Width = 137
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'PLU '#1082#1086#1076' :'
    MaxLength = 9
    TabOrder = 0
    Text = ''
    OnKeyDown = ItemEditKeyDown
    OnKeyPress = PriceEditKeyPress
  end
  object TovarNameEdit: TLabeledEdit
    Left = 8
    Top = 68
    Width = 473
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' :'
    MaxLength = 80
    TabOrder = 3
    Text = ''
    OnKeyDown = ItemEditKeyDown
    OnKeyPress = TovarNameEditKeyPress
  end
  object VendorComboBox: TComboBox
    Left = 328
    Top = 152
    Width = 153
    Height = 22
    Style = csOwnerDrawFixed
    Sorted = True
    TabOrder = 10
    OnKeyDown = ItemEditKeyDown
  end
  object TGroupComboBox: TComboBox
    Left = 8
    Top = 152
    Width = 153
    Height = 22
    Style = csOwnerDrawFixed
    Sorted = True
    TabOrder = 8
    OnKeyDown = ItemEditKeyDown
  end
  object KKMComboBox: TComboBox
    Left = 9
    Top = 196
    Width = 153
    Height = 22
    Style = csOwnerDrawFixed
    ItemIndex = 0
    TabOrder = 11
    Text = '0'
    OnKeyDown = ItemEditKeyDown
    Items.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10')
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 366
    Width = 75
    Height = 25
    Action = AddTovar
    Caption = 'OK'
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
    TabOrder = 21
  end
  object BitBtn2: TBitBtn
    Left = 225
    Top = 366
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 22
  end
  object BarCodeEdit: TEdit
    Left = 169
    Top = 196
    Width = 153
    Height = 21
    MaxLength = 15
    TabOrder = 12
    OnKeyDown = ItemEditKeyDown
    OnKeyPress = PriceEditKeyPress
  end
  object RemarkEdit: TLabeledEdit
    Left = 328
    Top = 195
    Width = 153
    Height = 21
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' :'
    MaxLength = 20
    TabOrder = 13
    Text = ''
    OnKeyDown = ItemEditKeyDown
    OnKeyPress = TovarNameEditKeyPress
  end
  object UnitsComboBox: TComboBox
    Left = 168
    Top = 152
    Width = 153
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 9
    OnKeyDown = ItemEditKeyDown
  end
  object ArtikulEdit: TLabeledEdit
    Left = 168
    Top = 24
    Width = 153
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = #1040#1088#1090#1080#1082#1091#1083' :'
    MaxLength = 30
    TabOrder = 1
    Text = ''
    OnKeyDown = ItemEditKeyDown
    OnKeyPress = TovarNameEditKeyPress
  end
  object ProducerEdit: TComboBox
    Left = 328
    Top = 24
    Width = 153
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 30
    Sorted = True
    TabOrder = 2
    OnKeyDown = ProducerEditKeyDown
    OnKeyPress = TovarNameEditKeyPress
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 398
    Width = 825
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Alignment = taRightJustify
        Width = 50
      end>
    ExplicitTop = 392
    ExplicitWidth = 782
  end
  object Rem2Edit: TLabeledEdit
    Left = 9
    Top = 236
    Width = 313
    Height = 21
    EditLabel.Width = 156
    EditLabel.Height = 13
    EditLabel.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1077' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1077' :'
    MaxLength = 50
    TabOrder = 14
    Text = ''
    OnKeyDown = ItemEditKeyDown
    OnKeyPress = TovarNameEditKeyPress
  end
  object VendCodeEdit: TLabeledEdit
    Left = 328
    Top = 236
    Width = 153
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 115
    EditLabel.Height = 13
    EditLabel.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1082#1086#1076' :'
    MaxLength = 14
    TabOrder = 15
    Text = ''
    OnKeyDown = ItemEditKeyDown
    OnKeyPress = TovarNameEditKeyPress
  end
  object ExtraChargeEdit: TEdit
    Left = 8
    Top = 111
    Width = 153
    Height = 21
    MaxLength = 4
    TabOrder = 4
    OnKeyDown = ItemEditKeyDown
    OnKeyPress = PriceEditKeyPress
  end
  object PriceEdit: TEdit
    Left = 328
    Top = 112
    Width = 153
    Height = 21
    TabOrder = 6
    OnChange = PriceEditChange
    OnKeyDown = ItemEditKeyDown
    OnKeyPress = VendorPriceEditKeyPress
  end
  object VendorPriceEdit: TEdit
    Left = 168
    Top = 112
    Width = 153
    Height = 21
    TabOrder = 5
    OnChange = PriceEditChange
    OnKeyDown = VendorPriceEditKeyDown
    OnKeyPress = VendorPriceEditKeyPress
  end
  object Panel1: TPanel
    Left = 506
    Top = 0
    Width = 319
    Height = 398
    Align = alRight
    BevelOuter = bvLowered
    TabOrder = 7
    Visible = False
    ExplicitLeft = 463
    ExplicitHeight = 392
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 317
      Height = 396
      ActivePage = TabSheet2
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      ExplicitHeight = 390
      object TabSheet1: TTabSheet
        Caption = #1062#1077#1085#1072' '#1088#1086#1079#1085#1080#1094#1072
        object Label10: TLabel
          Left = 13
          Top = 52
          Width = 41
          Height = 13
          Caption = #1062#1077#1085#1072' 1 :'
        end
        object Label11: TLabel
          Left = 13
          Top = 96
          Width = 41
          Height = 13
          Caption = #1062#1077#1085#1072' 2 :'
        end
        object Label12: TLabel
          Left = 13
          Top = 181
          Width = 41
          Height = 13
          Caption = #1062#1077#1085#1072' 4 :'
        end
        object Label13: TLabel
          Left = 13
          Top = 136
          Width = 41
          Height = 13
          Caption = #1062#1077#1085#1072' 3 :'
        end
        object Label14: TLabel
          Left = 13
          Top = 220
          Width = 41
          Height = 13
          Caption = #1062#1077#1085#1072' 5 :'
        end
        object Label15: TLabel
          Left = 157
          Top = 52
          Width = 41
          Height = 13
          Caption = #1062#1077#1085#1072' 6 :'
        end
        object Label16: TLabel
          Left = 157
          Top = 96
          Width = 41
          Height = 13
          Caption = #1062#1077#1085#1072' 7 :'
        end
        object Label17: TLabel
          Left = 157
          Top = 136
          Width = 41
          Height = 13
          Caption = #1062#1077#1085#1072' 8 :'
        end
        object Label18: TLabel
          Left = 157
          Top = 181
          Width = 41
          Height = 13
          Caption = #1062#1077#1085#1072' 9 :'
        end
        object Price1Edit: TEdit
          Left = 13
          Top = 68
          Width = 100
          Height = 21
          Enabled = False
          TabOrder = 0
          OnKeyPress = VendorPriceEditKeyPress
        end
        object Price2Edit: TEdit
          Left = 13
          Top = 112
          Width = 100
          Height = 21
          Enabled = False
          TabOrder = 1
          OnKeyPress = VendorPriceEditKeyPress
        end
        object Price4Edit: TEdit
          Left = 13
          Top = 195
          Width = 100
          Height = 21
          Enabled = False
          TabOrder = 2
          OnKeyPress = VendorPriceEditKeyPress
        end
        object Price3Edit: TEdit
          Left = 13
          Top = 152
          Width = 100
          Height = 21
          Enabled = False
          TabOrder = 3
          OnKeyPress = VendorPriceEditKeyPress
        end
        object Price5Edit: TEdit
          Left = 13
          Top = 236
          Width = 100
          Height = 21
          Enabled = False
          TabOrder = 4
          OnKeyPress = VendorPriceEditKeyPress
        end
        object Tag5Edit: TEdit
          Left = 112
          Top = 236
          Width = 35
          Height = 21
          TabOrder = 5
          OnChange = Price1EditChange
          OnKeyPress = PriceEditKeyPress
        end
        object Tag4Edit: TEdit
          Left = 112
          Top = 195
          Width = 35
          Height = 21
          TabOrder = 6
          OnChange = Price1EditChange
          OnKeyPress = PriceEditKeyPress
        end
        object Tag3Edit: TEdit
          Left = 112
          Top = 152
          Width = 35
          Height = 21
          TabOrder = 7
          OnChange = Price1EditChange
          OnKeyPress = PriceEditKeyPress
        end
        object Tag2Edit: TEdit
          Left = 112
          Top = 112
          Width = 35
          Height = 21
          TabOrder = 8
          OnChange = Price1EditChange
          OnKeyPress = PriceEditKeyPress
        end
        object Tag1Edit: TEdit
          Left = 112
          Top = 68
          Width = 35
          Height = 21
          TabOrder = 9
          OnChange = Price1EditChange
          OnKeyPress = PriceEditKeyPress
        end
        object Price6Edit: TEdit
          Left = 157
          Top = 68
          Width = 100
          Height = 21
          Enabled = False
          TabOrder = 10
          OnKeyPress = VendorPriceEditKeyPress
        end
        object Tag6Edit: TEdit
          Left = 256
          Top = 68
          Width = 35
          Height = 21
          TabOrder = 11
          OnChange = Price1EditChange
          OnKeyPress = PriceEditKeyPress
        end
        object Price7Edit: TEdit
          Left = 157
          Top = 112
          Width = 100
          Height = 21
          Enabled = False
          TabOrder = 12
          OnKeyPress = VendorPriceEditKeyPress
        end
        object Tag7Edit: TEdit
          Left = 256
          Top = 112
          Width = 35
          Height = 21
          TabOrder = 13
          OnChange = Price1EditChange
          OnKeyPress = PriceEditKeyPress
        end
        object Price8Edit: TEdit
          Left = 157
          Top = 152
          Width = 100
          Height = 21
          Enabled = False
          TabOrder = 14
          OnKeyPress = VendorPriceEditKeyPress
        end
        object Tag8Edit: TEdit
          Left = 256
          Top = 152
          Width = 35
          Height = 21
          TabOrder = 15
          OnChange = Price1EditChange
          OnKeyPress = PriceEditKeyPress
        end
        object Price9Edit: TEdit
          Left = 157
          Top = 195
          Width = 100
          Height = 21
          Enabled = False
          TabOrder = 16
          OnKeyPress = VendorPriceEditKeyPress
        end
        object Tag9Edit: TEdit
          Left = 256
          Top = 195
          Width = 35
          Height = 21
          TabOrder = 17
          OnChange = Price1EditChange
          OnKeyPress = PriceEditKeyPress
        end
        object ComboBox1: TComboBox
          Left = 7
          Top = 13
          Width = 282
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 18
          Text = #1044#1086#1083#1080' '#1086#1090' '#1085#1072#1094#1077#1085#1082#1080
          Items.Strings = (
            #1044#1086#1083#1080' '#1086#1090' '#1085#1072#1094#1077#1085#1082#1080
            '% '#1086#1090' '#1085#1072#1094#1077#1085#1082#1080
            #1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1074' '#1088#1091#1073'.'
            '% '#1089#1082#1080#1076#1082#1080' '#1086#1090' '#1094#1077#1085#1099' '#1087#1088#1086#1076#1072#1078#1080)
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1044#1086#1087'.'#1062#1077#1085#1099
        ImageIndex = 1
        object Label19: TLabel
          Left = 5
          Top = 21
          Width = 41
          Height = 13
          Caption = #1062#1077#1085#1072' 1 :'
        end
        object Label20: TLabel
          Left = 5
          Top = 63
          Width = 41
          Height = 13
          Caption = #1062#1077#1085#1072' 2 :'
        end
        object Label21: TLabel
          Left = 5
          Top = 111
          Width = 41
          Height = 13
          Caption = #1062#1077#1085#1072' 3 :'
        end
        object CstPriceType1ComboBox: TComboBox
          Left = 111
          Top = 40
          Width = 114
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 1
          Text = #1053#1072#1094#1077#1085#1082#1072' '#1074' %'
          OnChange = CstPriceType1ComboBoxChange
          Items.Strings = (
            #1053#1072#1094#1077#1085#1082#1072' '#1074' %'
            #1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1074' '#1088#1091#1073'.')
        end
        object CstPrice1Edit: TEdit
          Left = 5
          Top = 40
          Width = 100
          Height = 21
          Enabled = False
          TabOrder = 0
          OnKeyPress = VendorPriceEditKeyPress
        end
        object CstPrice2Edit: TEdit
          Left = 5
          Top = 82
          Width = 100
          Height = 21
          Enabled = False
          TabOrder = 3
          OnKeyPress = VendorPriceEditKeyPress
        end
        object CstPrice3Edit: TEdit
          Left = 5
          Top = 130
          Width = 100
          Height = 21
          Enabled = False
          TabOrder = 6
          OnKeyPress = VendorPriceEditKeyPress
        end
        object CstPrice3TagEdit: TEdit
          Left = 231
          Top = 130
          Width = 35
          Height = 21
          MaxLength = 4
          TabOrder = 7
          OnChange = CstPrice3TagEditChange
          OnKeyPress = PriceEditKeyPress
        end
        object CstPrice2TagEdit: TEdit
          Left = 231
          Top = 82
          Width = 35
          Height = 21
          MaxLength = 4
          TabOrder = 5
          OnChange = CstPrice2TagEditChange
          OnKeyPress = PriceEditKeyPress
        end
        object CstPrice1TagEdit: TEdit
          Left = 231
          Top = 40
          Width = 35
          Height = 21
          MaxLength = 4
          TabOrder = 2
          OnChange = CstPrice1TagEditChange
          OnKeyPress = PriceEditKeyPress
        end
        object CstPriceType2ComboBox: TComboBox
          Left = 112
          Top = 82
          Width = 114
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 4
          Text = #1053#1072#1094#1077#1085#1082#1072' '#1074' %'
          OnChange = CstPriceType2ComboBoxChange
          Items.Strings = (
            #1053#1072#1094#1077#1085#1082#1072' '#1074' %'
            #1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1074' '#1088#1091#1073'.')
        end
        object CstPriceType3ComboBox: TComboBox
          Left = 111
          Top = 130
          Width = 114
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 8
          Text = #1053#1072#1094#1077#1085#1082#1072' '#1074' %'
          OnChange = CstPriceType3ComboBoxChange
          Items.Strings = (
            #1053#1072#1094#1077#1085#1082#1072' '#1074' %'
            #1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1074' '#1088#1091#1073'.')
        end
      end
    end
  end
  object TovarMarkedCheckBox: TCheckBox
    Left = 337
    Top = 285
    Width = 137
    Height = 17
    Caption = #1052#1072#1088#1082#1080#1088#1086#1074#1072#1085#1085#1099#1081
    TabOrder = 17
  end
  object ColorBox1: TColorBox
    Left = 8
    Top = 282
    Width = 153
    Height = 22
    AutoDropDown = True
    DefaultColorColor = clWhite
    NoneColorColor = clWhite
    Style = [cbStandardColors, cbPrettyNames]
    TabOrder = 16
  end
  object UseColorMarkCheckBox: TCheckBox
    Left = 167
    Top = 284
    Width = 97
    Height = 17
    Caption = #1042#1099#1076#1077#1083#1103#1090#1100
    TabOrder = 18
  end
  object ColorBox2: TColorBox
    Left = 8
    Top = 330
    Width = 153
    Height = 22
    AutoDropDown = True
    DefaultColorColor = clWhite
    NoneColorColor = clWhite
    Style = [cbStandardColors, cbPrettyNames]
    TabOrder = 20
  end
  object SaleUseColorMarkCheckBox: TCheckBox
    Left = 167
    Top = 332
    Width = 97
    Height = 17
    Caption = #1042#1099#1076#1077#1083#1103#1090#1100
    TabOrder = 19
  end
  object ActionList1: TActionList
    Left = 280
    Top = 72
    object AddTovar: TAction
      Caption = 'AddTovar'
      Enabled = False
      OnExecute = AddTovarExecute
      OnUpdate = AddTovarUpdate
    end
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = PriceEditChange
    Left = 416
    Top = 80
  end
  object IBQuery1: TpFIBDataSet
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Left = 312
    Top = 72
  end
end
