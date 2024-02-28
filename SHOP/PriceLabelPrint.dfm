object PriceLabelPrintFrm: TPriceLabelPrintFrm
  Left = 249
  Top = 104
  BorderStyle = bsDialog
  Caption = #1062#1077#1085#1085#1080#1082#1080
  ClientHeight = 544
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 13
  object Panel6: TPanel
    Left = 417
    Top = 1
    Width = 369
    Height = 233
    BevelOuter = bvNone
    Caption = 'Panel6'
    ParentBackground = False
    TabOrder = 0
  end
  object CennikDBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 417
    Height = 544
    Align = alLeft
    DataSource = DataSource6
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ITEM'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOVAR_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALE_PRICE'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNT'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE_GROUP'
        Title.Alignment = taCenter
        Title.Caption = #1043#1088#1091#1087#1087#1072
        Width = 36
        Visible = True
      end>
  end
  object Panel5: TPanel
    Left = 424
    Top = 1
    Width = 350
    Height = 216
    BevelOuter = bvNone
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = clWindow
    Ctl3D = False
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 2
    object Shape1: TShape
      Left = -1
      Top = 24
      Width = 350
      Height = 153
    end
    object Label7: TLabel
      Left = 5
      Top = 4
      Width = 137
      Height = 16
      Caption = #1054#1054#1054' "'#1040#1074#1090#1086#1079#1072#1087#1095#1072#1089#1090#1080'"'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 155
      Top = 4
      Width = 62
      Height = 16
      Alignment = taRightJustify
      Caption = '18.08.2002'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 312
      Top = 4
      Width = 32
      Height = 19
      Alignment = taRightJustify
      Caption = 'Item'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label10: TLabel
      Left = 8
      Top = 184
      Width = 47
      Height = 22
      Caption = #1062#1077#1085#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 215
      Top = 182
      Width = 120
      Height = 22
      Alignment = taRightJustify
      Caption = 'SALE_PRICE'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object ProducerEdit: TEdit
      Left = 174
      Top = 159
      Width = 175
      Height = 17
      Cursor = crIBeam
      Alignment = taRightJustify
      BorderStyle = bsNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = 16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 20
      ParentFont = False
      TabOrder = 0
      Text = 'PRODUCER'
      Visible = False
      OnChange = ProducerEditChange
      OnEnter = GR_nameEditEnter
      OnExit = ProducerEditExit
      OnKeyDown = GR_nameEditKeyDown
    end
    object ArtikulEdit: TEdit
      Left = 0
      Top = 159
      Width = 175
      Height = 17
      Cursor = crIBeam
      BorderStyle = bsNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = 16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 20
      ParentFont = False
      TabOrder = 1
      Text = 'ARTIKUL'
      Visible = False
      OnChange = ProducerEditChange
      OnEnter = GR_nameEditEnter
      OnExit = ProducerEditExit
      OnKeyDown = GR_nameEditKeyDown
    end
    object Memo1: TRichEdit
      Left = -2
      Top = 26
      Width = 346
      Height = 136
      Alignment = taCenter
      BorderStyle = bsNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        'Memo1')
      ParentFont = False
      TabOrder = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 424
    Top = 272
    Width = 353
    Height = 113
    Caption = ' '#1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1079#1080#1094#1080#1081' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080' : '
    TabOrder = 3
    object Label12: TLabel
      Left = 8
      Top = 36
      Width = 63
      Height = 13
      Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072' :'
    end
    object Label13: TLabel
      Left = 248
      Top = 36
      Width = 65
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' :'
    end
    object CennikItemNameLabel: TLabel
      Left = 8
      Top = 14
      Width = 337
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'CennikItemNameLabel'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object CennikInsertBtn: TBitBtn
      Left = 112
      Top = 80
      Width = 129
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888800000088888008888888888800000088880FF008888888880000008880
        F00FF008888888000000880F0FF00FF008888800000080F0F78FF00FF0888800
        0000880F70078FF008888800000080F70FB0078FF088880000008800FBFBF007
        088888000000880FBFBFBFB008888800000080FBFBFBFBFBF088880000008800
        BFBFBFBF088888000000888800FBFBF088088800000088888800B80880008800
        0000888888880088000008000000888888888888880888000000888888888888
        880888000000888888888888888888000000}
      TabOrder = 2
      OnClick = CennikInsertBtnClick
    end
    object CennikItemEdit: TEdit
      Left = 8
      Top = 52
      Width = 233
      Height = 21
      Cursor = crIBeam
      AutoSize = False
      TabOrder = 0
      OnKeyDown = CennikItemEditKeyDown
      OnKeyPress = CennikItemEditKeyPress
    end
    object CennikKolvoEdit: TEdit
      Left = 248
      Top = 52
      Width = 97
      Height = 21
      Cursor = crIBeam
      AutoSelect = False
      AutoSize = False
      Enabled = False
      MaxLength = 2
      TabOrder = 1
      OnChange = CennikKolvoEditChange
      OnEnter = CennikKolvoEditEnter
      OnExit = CennikKolvoEditExit
      OnKeyDown = CennikKolvoEditKeyDown
      OnKeyPress = CennikItemEditKeyPress
    end
  end
  object CennikTypeComboBox: TComboBox
    Left = 424
    Top = 474
    Width = 353
    Height = 22
    BevelInner = bvNone
    BevelOuter = bvNone
    Style = csOwnerDrawFixed
    Ctl3D = True
    ItemIndex = 0
    ParentCtl3D = False
    Sorted = True
    TabOrder = 9
    Text = #1062#1077#1085#1085#1080#1082' '#1073#1086#1083#1100#1096#1086#1081' 50'#1084#1084' '#1061' 100'#1084#1084
    Items.Strings = (
      #1062#1077#1085#1085#1080#1082' '#1073#1086#1083#1100#1096#1086#1081' 50'#1084#1084' '#1061' 100'#1084#1084
      #1062#1077#1085#1085#1080#1082' '#1084#1072#1083#1077#1085#1100#1082#1080#1081' 35'#1084#1084' '#1061' 70'#1084#1084
      #1062#1077#1085#1085#1080#1082' '#1084#1072#1083#1077#1085#1100#1082#1080#1081' 35'#1084#1084' '#1061' 70'#1084#1084'('#1089#1086' '#1089#1082#1080#1076#1082#1086#1081' 5%)'
      #1062#1077#1085#1085#1080#1082' '#1086#1095#1077#1085#1100' '#1084#1072#1083#1077#1085#1100#1082#1080#1081' 40'#1084#1084#1061'28'#1084#1084)
  end
  object GroupBox3: TGroupBox
    Left = 424
    Top = 392
    Width = 353
    Height = 65
    Caption = ' '#1043#1088#1091#1087#1087#1099' : '
    TabOrder = 10
    object Label1: TLabel
      Left = 192
      Top = 13
      Width = 92
      Height = 13
      Caption = #1042#1080#1076#1080#1084#1099#1077' '#1075#1088#1091#1087#1087#1099' :'
    end
    object Bevel1: TBevel
      Left = 176
      Top = 6
      Width = 9
      Height = 57
      Shape = bsLeftLine
    end
    object ComboBox1: TComboBox
      Left = 192
      Top = 29
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 23
      Width = 113
      Height = 25
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' >>'
      Enabled = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C30E0000C30E00001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777444777777777777774477700000077774747770FFFF077747777770FF
        FF077477770000FFFF074777770FF00000074777770FFFF077774770000FFFF0
        77774770FF00000077777770FFFF077777770000FFFF077777770FF000000777
        77770FFFF077777777770FFFF077777777770000007777777777}
      Layout = blGlyphRight
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object Edit1: TEdit
      Left = 122
      Top = 24
      Width = 41
      Height = 24
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 2
      OnChange = Edit1Change
      OnKeyPress = CennikItemEditKeyPress
    end
  end
  object PrintCennikBtn: TBitBtn
    Left = 425
    Top = 511
    Width = 80
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F000000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DD000DDDDDDDDDD000DD0000D000
      000000000000000D0000D0F8888888888888880D0000D0F8888888888888880D
      0000D0F8888888822899880D0000D0FFFFFFFFFFFFFFFF0D0000D70077777777
      7777007D0000DDD00000000000000DDD0000DDD00FFFFFFFFFF00DDD0000DDDD
      0F00000000F0DDDD0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00000000F0DDDD
      0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00FFFFFFF0DDDD0000DDDD0FFFFFFF
      FFF0DDDD0000DDDD000000000000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
      DDDDDDDDDDDDDDDD0000}
    TabOrder = 4
    OnClick = PrintCennikBtnClick
  end
  object CennikPriorBtn: TBitBtn
    Left = 424
    Top = 240
    Width = 97
    Height = 25
    Caption = #1053#1072#1079#1072#1076
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      0400000000006800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7000777777077777700077777007777770007777060777777000777066000007
      7000770666666607700070666666660770007706666666077000777066000007
      7000777706077777700077777007777770007777770777777000777777777777
      7000}
    TabOrder = 5
    OnClick = CennikPriorBtnClick
  end
  object CennikNextBtn: TBitBtn
    Left = 680
    Top = 240
    Width = 97
    Height = 25
    Caption = #1042#1087#1077#1088#1105#1076
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      0400000000006800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7000777777077777700077777700777770007777770607777000770000066077
      7000770666666607700077066666666070007706666666077000770000066077
      7000777777060777700077777700777770007777770777777000777777777777
      7000}
    Layout = blGlyphRight
    TabOrder = 6
    OnClick = CennikNextBtnClick
  end
  object DeleteCennikBtn: TBitBtn
    Left = 528
    Top = 240
    Width = 145
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      88888B333333333788888BF8FFFFFF3788888B8FFF88883788888BF8FFF88837
      88888BF7FF80883788888B878F5D5F3788888BF7FF8DD73788888BF7FFF88377
      88888B878888BB3788888BF7FFFFFBB378888BF7FFFFFFBB37888FF000000F3B
      B3788FBB0880BB37BB388000000000088BB88888800888888888}
    TabOrder = 7
    OnClick = DeleteCennikBtnClick
  end
  object EraseCennikBtn: TBitBtn
    Left = 513
    Top = 511
    Width = 112
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1105
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000C30E0000C30E00001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777000000000
      0777770F80F807808077770F80F807808077770F80F807808077770F80F80780
      8077770F80F807808077770F80F807808077770F80F807808077770F80F80780
      8077770F80F807808077770F80F8078080777000000000000007708888888888
      880770FFFF777777770777000000000000777777770000777777}
    TabOrder = 8
    OnClick = EraseCennikBtnClick
  end
  object BitBtn2: TBitBtn
    Left = 632
    Top = 511
    Width = 145
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1090#1089#1091#1090#1074#1091#1102#1097#1080#1077
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      300033FFFFFF3333377739999993333333333777777F3333333F399999933333
      3300377777733333337733333333333333003333333333333377333333333333
      3333333333333333333F333333333333330033333F33333333773333C3333333
      330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
      993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
      333333377F33333333FF3333C333333330003333733333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
    TabOrder = 11
    OnClick = BitBtn2Click
  end
  object DataSource6: TDataSource
    DataSet = pCennikTable
    OnDataChange = DataSource6DataChange
    Left = 256
    Top = 472
  end
  object pCennikTable: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select T.ITEM, T.TOVAR_NAME, P.SALE_PRICE, A.PRICE_GROUP, T.PROD' +
        'UCER, T.ARTIKUL, A.SCLAD, count(*)CNT'
      'from CENNIK_PRN P1 left join SPR_TOVAR T on T.ITEM = P1.ITEM'
      'left join TOVAR_ADD A on A.ITEM = P1.ITEM'
      
        'left join PRICES P on P.ITEM = P1.ITEM and P.MARKET_CODE = (sele' +
        'ct OBJ_ID from INF_CURRENT_OBJ)'
      'where T.ITEM in ( select distinct ITEM from CENNIK_PRN)'
      ''
      
        'group by T.ITEM, T.TOVAR_NAME, P.SALE_PRICE, A.PRICE_GROUP, T.PR' +
        'ODUCER, T.ARTIKUL, A.SCLAD'
      'order by T.ITEM')
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Left = 256
    Top = 440
  end
end
