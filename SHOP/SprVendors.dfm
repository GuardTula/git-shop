object SprVendFrm: TSprVendFrm
  Left = 248
  Top = 106
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
  ClientHeight = 611
  ClientWidth = 814
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  PrintScale = poNone
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 13
  object DBGrid3: TDBGrid
    Left = 0
    Top = 22
    Width = 814
    Height = 301
    Align = alClient
    DataSource = DataSource4
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid3DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'VENDOR_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INN'
        Title.Alignment = taCenter
        Title.Caption = #1048#1053#1053
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKOHX'
        Title.Alignment = taCenter
        Title.Caption = #1054#1050#1054#1053#1061
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKPO'
        Title.Alignment = taCenter
        Title.Caption = #1054#1050#1055#1054
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KPP'
        Title.Alignment = taCenter
        Title.Caption = #1050#1055#1055
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRES'
        Title.Alignment = taCenter
        Title.Caption = #1040#1044#1056#1045#1057
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARK'
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANK'
        Title.Alignment = taCenter
        Title.Caption = #1041#1040#1053#1050
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSCHET'
        Title.Alignment = taCenter
        Title.Caption = #1056'/'#1057#1063#1045#1058
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KSCHET'
        Title.Alignment = taCenter
        Title.Caption = #1050'/'#1057#1063#1045#1058
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BIK'
        Title.Alignment = taCenter
        Title.Caption = #1041#1048#1050
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 323
    Width = 814
    Height = 288
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    Visible = False
    ExplicitTop = 332
    ExplicitWidth = 781
    object Label12: TLabel
      Left = 15
      Top = 170
      Width = 31
      Height = 13
      Caption = #1041#1072#1085#1082' :'
    end
    object Label13: TLabel
      Left = 18
      Top = 207
      Width = 100
      Height = 13
      Caption = #1056#1072#1089#1095#1105#1090#1085#1099#1081' '#1089#1095#1105#1090' '#8470' :'
    end
    object Label18: TLabel
      Left = 278
      Top = 207
      Width = 73
      Height = 13
      Caption = #1050#1086#1088#1088'. '#1089#1095#1105#1090' '#8470' :'
    end
    object Label1: TLabel
      Left = 543
      Top = 207
      Width = 28
      Height = 13
      Caption = #1041#1048#1050' :'
    end
    object VNameEdit: TLabeledEdit
      Left = 16
      Top = 28
      Width = 330
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 56
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' :'
      MaxLength = 50
      TabOrder = 0
      Text = ''
      OnChange = VNameEditChange
      OnKeyDown = VNameEditKeyDown
    end
    object NameEdit: TLabeledEdit
      Left = 352
      Top = 28
      Width = 433
      Height = 21
      EditLabel.Width = 95
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' :'
      TabOrder = 1
      Text = ''
      OnKeyDown = VNameEditKeyDown
    end
    object INNEdit: TLabeledEdit
      Left = 168
      Top = 68
      Width = 193
      Height = 21
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1053#1053' :'
      MaxLength = 20
      TabOrder = 3
      Text = ''
      OnKeyDown = VNameEditKeyDown
    end
    object OKOHXEdit: TLabeledEdit
      Left = 368
      Top = 68
      Width = 201
      Height = 21
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = #1054#1050#1054#1053#1061' :'
      MaxLength = 10
      TabOrder = 4
      Text = ''
      OnKeyDown = VNameEditKeyDown
    end
    object OKPOEdit: TLabeledEdit
      Left = 576
      Top = 68
      Width = 209
      Height = 21
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = #1054#1050#1055#1054' :'
      MaxLength = 10
      TabOrder = 5
      Text = ''
      OnKeyDown = VNameEditKeyDown
    end
    object AdresEdit: TLabeledEdit
      Left = 16
      Top = 108
      Width = 553
      Height = 21
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = #1040#1076#1088#1077#1089' :'
      MaxLength = 120
      TabOrder = 6
      Text = ''
      OnKeyDown = VNameEditKeyDown
    end
    object RemarkEdit: TLabeledEdit
      Left = 16
      Top = 148
      Width = 769
      Height = 21
      EditLabel.Width = 69
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' :'
      MaxLength = 200
      TabOrder = 8
      Text = ''
      OnKeyDown = VNameEditKeyDown
    end
    object PhoneEdit: TLabeledEdit
      Left = 16
      Top = 68
      Width = 145
      Height = 21
      EditLabel.Width = 51
      EditLabel.Height = 13
      EditLabel.Caption = #1058#1077#1083#1077#1092#1086#1085' :'
      MaxLength = 15
      TabOrder = 2
      Text = ''
      OnKeyDown = VNameEditKeyDown
    end
    object BitBtn1: TBitBtn
      Left = 20
      Top = 250
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = #1054#1050
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
      NumGlyphs = 2
      TabOrder = 13
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 100
      Top = 250
      Width = 75
      Height = 25
      Cursor = crHandPoint
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
      NumGlyphs = 2
      TabOrder = 14
      OnClick = BitBtn2Click
    end
    object KPPEdit: TLabeledEdit
      Left = 576
      Top = 108
      Width = 209
      Height = 21
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = #1050#1055#1055' :'
      MaxLength = 9
      TabOrder = 7
      Text = ''
      OnKeyDown = VNameEditKeyDown
    end
    object BANKEdit: TEdit
      Left = 16
      Top = 184
      Width = 769
      Height = 21
      MaxLength = 100
      TabOrder = 9
    end
    object RSCHETEdit: TEdit
      Left = 18
      Top = 223
      Width = 250
      Height = 21
      MaxLength = 20
      TabOrder = 10
    end
    object KSCHETEdit: TEdit
      Left = 278
      Top = 223
      Width = 250
      Height = 21
      MaxLength = 20
      TabOrder = 11
    end
    object BIKEdit: TEdit
      Left = 535
      Top = 223
      Width = 250
      Height = 21
      MaxLength = 10
      TabOrder = 12
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 814
    Height = 22
    AutoSize = True
    Caption = 'ToolBar1'
    Images = ShopMainForm.ImageList1
    TabOrder = 2
    ExplicitWidth = 781
    object AddVndBtn: TToolButton
      Tag = 1
      Left = 0
      Top = 0
      Caption = 'AddVndBtn'
      ImageIndex = 30
      OnClick = AddVndBtnClick
    end
    object EditVndBtn: TToolButton
      Tag = 2
      Left = 23
      Top = 0
      Caption = 'EditVndBtn'
      Enabled = False
      ImageIndex = 28
      OnClick = AddVndBtnClick
    end
    object ToolButton4: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object BitBtn3: TToolButton
      Left = 54
      Top = 0
      Caption = 'BitBtn3'
      ImageIndex = 22
      OnClick = BitBtn3Click
    end
    object ToolButton3: TToolButton
      Left = 77
      Top = 0
      Caption = 'ToolButton3'
      ImageIndex = 25
      OnClick = ToolButton3Click
    end
    object ToolButton1: TToolButton
      Left = 100
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 26
      Style = tbsSeparator
    end
    object Edit1: TEdit
      Left = 108
      Top = 0
      Width = 238
      Height = 22
      TabOrder = 0
      OnChange = Edit1Change
    end
    object ToolButton2: TToolButton
      Left = 346
      Top = 0
      Hint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103
      Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103
      Enabled = False
      ImageIndex = 45
      ParentShowHint = False
      ShowHint = False
      Style = tbsCheck
      OnClick = ToolButton2Click
    end
  end
  object DataSource4: TDataSource
    DataSet = SprVendors
    OnDataChange = DataSource4DataChange
    Left = 312
    Top = 408
  end
  object PopupMenu1: TPopupMenu
    Images = ShopMainForm.ImageList1
    Left = 104
    Top = 56
    object N1: TMenuItem
      Caption = #1054#1090#1095#1077#1090' '#1087#1086' '
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1074#1089#1077#1084
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Excel1: TMenuItem
      Caption = #1042#1077#1089#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074' Excel'
      ImageIndex = 38
      OnClick = Excel1Click
    end
  end
  object SprVendors: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from SPR_VENDORS'
      'order by VENDOR_NAME')
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Container = DataSetsContainer1
    Left = 312
    Top = 376
  end
  object DataSetsContainer1: TDataSetsContainer
    Left = 345
    Top = 378
  end
end
