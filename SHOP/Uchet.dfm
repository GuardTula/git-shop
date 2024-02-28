object UchetFrm: TUchetFrm
  Left = 247
  Top = 105
  BorderStyle = bsDialog
  Caption = #1056#1077#1074#1080#1079#1080#1103' '#1090#1086#1074#1072#1088#1085#1086#1075#1086' '#1079#1072#1087#1072#1089#1072
  ClientHeight = 570
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 780
    Height = 569
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1059#1095#1105#1090
      object Label6: TLabel
        Left = 598
        Top = 6
        Width = 44
        Height = 13
        Caption = #1054#1073#1098#1077#1082#1090' :'
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 40
        Width = 585
        Height = 437
        DataSource = DataSource1
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
        Columns = <
          item
            Expanded = False
            FieldName = 'ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'PLU '#1082#1086#1076
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOVAR_NAME'
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 200
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNIT_NAME'
            Title.Caption = #1045#1076'.'#1080#1079#1084
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACOUNT_KOLVO'
            Title.Alignment = taCenter
            Title.Caption = #1059#1095#1105#1090#1085#1086#1077' '#1082#1086#1083'-'#1074#1086
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COUNT_KOLVO'
            Title.Alignment = taCenter
            Title.Caption = #1057#1095#1105#1090#1085#1086#1077' '#1082#1086#1083'-'#1074#1086
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALE_PRICE'
            Title.Alignment = taCenter
            Title.Caption = #1062#1077#1085#1072
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 8
        Top = 484
        Width = 585
        Height = 57
        TabOrder = 7
        Visible = False
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 48
          Height = 13
          Caption = 'PLU '#1082#1086#1076' :'
        end
        object Label2: TLabel
          Left = 112
          Top = 8
          Width = 56
          Height = 13
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' :'
        end
        object Label3: TLabel
          Left = 376
          Top = 8
          Width = 32
          Height = 13
          Caption = #1062#1077#1085#1072' :'
        end
        object Label4: TLabel
          Left = 480
          Top = 8
          Width = 40
          Height = 13
          Caption = #1050#1086#1083'-'#1074#1086' :'
        end
        object LMDEdit1: TEdit
          Left = 6
          Top = 24
          Width = 100
          Height = 21
          Cursor = crIBeam
          AutoSelect = False
          AutoSize = False
          MaxLength = 15
          TabOrder = 0
          OnKeyDown = LMDEdit1KeyDown
          OnKeyPress = LMDEdit1KeyPress
        end
        object LMDEdit2: TEdit
          Left = 112
          Top = 24
          Width = 257
          Height = 21
          Cursor = crIBeam
          AutoSelect = False
          AutoSize = False
          Enabled = False
          TabOrder = 1
        end
        object LMDEdit3: TEdit
          Left = 373
          Top = 24
          Width = 100
          Height = 21
          Cursor = crIBeam
          AutoSelect = False
          AutoSize = False
          Enabled = False
          MaxLength = 15
          TabOrder = 2
        end
        object LMDEdit4: TEdit
          Left = 478
          Top = 24
          Width = 100
          Height = 21
          Cursor = crIBeam
          AutoSize = False
          MaxLength = 15
          TabOrder = 3
          OnKeyDown = LMDEdit4KeyDown
          OnKeyPress = LMDEdit4KeyPress
        end
      end
      object RadioGroup1: TRadioGroup
        Left = 608
        Top = 400
        Width = 169
        Height = 73
        ItemIndex = 0
        Items.Strings = (
          #1042#1089#1077' '#1087#1086#1079#1080#1094#1080#1080
          #1058#1086#1083#1100#1082#1086' '#1085#1077#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103
          #1055#1077#1088#1077#1089#1086#1088#1090#1080#1094#1072)
        TabOrder = 8
        OnClick = RadioGroup1Click
      end
      object LMDButton1: TBitBtn
        Left = 608
        Top = 513
        Width = 169
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1087#1091#1097#1077#1085#1085#1099#1077
        Enabled = False
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADA00000DADADADADAD0FFF0ADADADADADA0FFF0D0DADADADAD00000AD0D0DA
          DADAADADADAD00ADADADDA0ADAD000DADADAAD0DADADAD00000000000ADADA05
          5550AD0DADADAD055550DA0ADADADA000000ADADADA000ADADAD00000ADA00DA
          DADA0FFF0DA0A0ADADAD0FFF0A0ADADADADA00000DADADADADAD}
        TabOrder = 6
        OnClick = LMDButton1Click
      end
      object LMDButton2: TBitBtn
        Left = 8
        Top = 8
        Width = 113
        Height = 25
        Caption = #1053#1072#1095#1072#1090#1100' '#1091#1095#1105#1090
        Enabled = False
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888F778777877777778F888888888888888F8778778F077787888888888F078
          8888F00F000800788888888F000007888888888888F0070088888000F0800000
          88888888800000888888888888FF0788888888000080007888888888888F0088
          888888888888F888888888888888888888888888888888888888}
        TabOrder = 1
        OnClick = LMDButton2Click
      end
      object LMDButton3: TBitBtn
        Left = 128
        Top = 8
        Width = 113
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1091#1095#1105#1090
        Enabled = False
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555550000
          000000550000555555550FFFFFFFF0550000555555550FF7F777F05500005555
          55550FFFFFFFF0550000555555550F777777F0550000555555550FFFFFFFF055
          0000555555550F77F00000550000555555550FFFF0FF05550000555555550FF7
          F0F05555000055000000000FF0055555000050C8C888CC0000595555000050C8
          C888CC0555999555000050C88888CC0559999955000050CCCCCCCC0599999995
          000050CFFFFFFC0555999555000050CFFFFFFC0555999555000050CFFFFFFC05
          59999555000050CFFFFFFC099999555500005000000000055555555500005555
          55555555555555550000}
        TabOrder = 2
        OnClick = LMDButton3Click
      end
      object LMDButton4: TBitBtn
        Left = 368
        Top = 8
        Width = 113
        Height = 25
        Caption = #1055#1077#1095#1072#1090#1100
        Enabled = False
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
        OnClick = LMDButton4Click
      end
      object LMDButton5: TBitBtn
        Left = 608
        Top = 480
        Width = 169
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
        Enabled = False
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777777777777700000007000000007777777700000007FFF
          FFFF07777777700000007FFFFFFF07777777700000007FFFFFFF077777777000
          00007000000000007747700000007EFEFEFEFEF07744700000007FEFEFEFEFE0
          4444400000007EFEFEFEFEF07744700000007000000000007747700000007FFF
          FFFF07777777700000007FFFFFFF07777777700000007FFFFFFF077777777000
          0000700000000777777770000000777777777777777770000000777777777777
          777770000000}
        TabOrder = 5
        OnClick = LMDButton5Click
      end
      object LMDButton6: TBitBtn
        Left = 248
        Top = 8
        Width = 113
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1095#1105#1090
        Enabled = False
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888800008888888888888888889800008898888888888888898800008899
          88777777777798880000889990000000000998880000888990BFFFBFFF998888
          0000888899FCCCCCCF97888800008888999FBFFFB9978888000088888999CCC9
          990788880000888880999FB99F0788880000888880FC9999CF07888800008888
          80FF9999BF0788880000888880FC9999000788880000888880B99F099F078888
          0000888880999F099998888800008888999FBF0F089988880000889999000000
          8889988800008899988888888888898800008888888888888888889800008888
          88888888888888880000}
        TabOrder = 3
        OnClick = LMDButton6Click
      end
      object MarketComboBox: TComboBox
        Left = 600
        Top = 23
        Width = 177
        Height = 22
        Style = csOwnerDrawFixed
        Sorted = True
        TabOrder = 9
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1091#1095#1105#1090#1086#1074
      ImageIndex = 1
      TabVisible = False
      object DBGrid2: TDBGrid
        Left = 0
        Top = 64
        Width = 785
        Height = 313
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1040#1088#1093#1080#1074' '#1091#1095#1105#1090#1086#1074
      ImageIndex = 2
      object Label5: TLabel
        Left = 656
        Top = 496
        Width = 100
        Height = 13
        Caption = #1055#1086#1080#1089#1082' '#1087#1086' PLU '#1082#1086#1076#1091':'
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 417
        Height = 145
        DataSource = DataSource4
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'UCHET_NUM'
            Title.Alignment = taCenter
            Title.Caption = #8470' '#1091#1095#1105#1090#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHORT_NAME'
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1073#1098#1077#1082#1090#1072
            Width = 224
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SAVE_DATE'
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072
            Width = 105
            Visible = True
          end>
      end
      object DBGrid4: TDBGrid
        Left = 0
        Top = 152
        Width = 649
        Height = 385
        DataSource = DataSource5
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
            Title.Caption = 'PLU '#1082#1086#1076
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOVAR_NAME'
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 195
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACOUNT_KOLVO'
            Title.Alignment = taCenter
            Title.Caption = #1059#1095#1105#1090#1085#1086#1077' '#1082#1086#1083'-'#1074#1086
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COUNT_KOLVO'
            Title.Alignment = taCenter
            Title.Caption = #1057#1095#1105#1090#1085#1086#1077' '#1082#1086#1083'-'#1074#1086
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALE_PRICE'
            Title.Alignment = taCenter
            Title.Caption = #1062#1077#1085#1072
            Width = 77
            Visible = True
          end>
      end
      object RadioGroup2: TRadioGroup
        Left = 448
        Top = 64
        Width = 169
        Height = 73
        ItemIndex = 0
        Items.Strings = (
          #1042#1089#1077' '#1087#1086#1079#1080#1094#1080#1080
          #1058#1086#1083#1100#1082#1086' '#1085#1077#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103
          #1055#1077#1088#1077#1089#1086#1088#1090#1080#1094#1072)
        TabOrder = 3
        OnClick = RadioGroup2Click
      end
      object Edit1: TEdit
        Left = 654
        Top = 512
        Width = 129
        Height = 21
        MaxLength = 14
        TabOrder = 4
        OnKeyDown = Edit1KeyDown
        OnKeyPress = LMDEdit1KeyPress
      end
      object LMDButton7: TBitBtn
        Left = 456
        Top = 8
        Width = 113
        Height = 25
        Caption = #1055#1077#1095#1072#1090#1100
        Enabled = False
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
        TabOrder = 2
        OnClick = LMDButton7Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = UchetQuery
    OnDataChange = DataSource1DataChange
    Left = 680
    Top = 376
  end
  object DataSource4: TDataSource
    DataSet = HdrSaveUchet
    OnDataChange = DataSource4DataChange
    Left = 708
    Top = 256
  end
  object DataSource5: TDataSource
    DataSet = PosSaveUchet
    Left = 708
    Top = 288
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    Left = 716
    Top = 376
  end
  object UchetQuery: TpFIBDataSet
    SelectSQL.Strings = (
      'select U.*, N.UNIT_NAME'
      'from UCHET U left join SPR_TOVAR T on U.ITEM = T.ITEM'
      'left join SPR_UNITS N on N.UNIT_KOD = T.UNIT_KOD'
      'WHERE U.SAVE_DATE is null'
      'order by U.TOVAR_NAME')
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Left = 680
    Top = 407
    object UchetQueryMARKET_CODE: TFIBIntegerField
      FieldName = 'MARKET_CODE'
    end
    object UchetQueryUCHET_NUM: TFIBIntegerField
      FieldName = 'UCHET_NUM'
    end
    object UchetQueryITEM: TFIBStringField
      FieldName = 'ITEM'
      Size = 14
      EmptyStrToNull = True
    end
    object UchetQueryACOUNT_KOLVO: TFIBFloatField
      FieldName = 'ACOUNT_KOLVO'
      DisplayFormat = '### ##0.000'
    end
    object UchetQueryCOUNT_KOLVO: TFIBFloatField
      FieldName = 'COUNT_KOLVO'
      DisplayFormat = '### ##0.000'
    end
    object UchetQuerySAVE_DATE: TFIBDateTimeField
      FieldName = 'SAVE_DATE'
    end
    object UchetQuerySALE_PRICE: TFIBFloatField
      FieldName = 'SALE_PRICE'
      currency = True
    end
    object UchetQueryTOVAR_NAME: TFIBStringField
      FieldName = 'TOVAR_NAME'
      Size = 80
      EmptyStrToNull = True
    end
    object UchetQueryVEND_PRICE: TFIBFloatField
      FieldName = 'VEND_PRICE'
      currency = True
    end
    object UchetQueryUNIT_NAME: TFIBStringField
      FieldName = 'UNIT_NAME'
      Size = 5
      EmptyStrToNull = True
    end
  end
  object DataSetsContainer1: TDataSetsContainer
    Left = 740
    Top = 256
  end
  object DataSetsContainer2: TDataSetsContainer
    MasterContainer = DataSetsContainer1
    Left = 740
    Top = 288
  end
  object HdrSaveUchet: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select distinct U.MARKET_CODE, U.UCHET_NUM, U.SAVE_DATE, M.SHORT' +
        '_NAME'
      
        'from UCHET U left join SPR_MARKET M on M.MARKET_CODE = U.MARKET_' +
        'CODE'
      'where not U.SAVE_DATE is null'
      'order by U.SAVE_DATE, U.MARKET_CODE')
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Container = DataSetsContainer1
    Left = 676
    Top = 256
  end
  object PosSaveUchet: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from UCHET'
      'where UCHET_NUM = :UCHET_NUM'
      '   and MARKET_CODE = :MARKET_CODE'
      ''
      'order by TOVAR_NAME')
    AfterOpen = PosSaveUchetAfterOpen
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DataSource = DataSource4
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Container = DataSetsContainer1
    Left = 676
    Top = 288
    object PosSaveUchetMARKET_CODE: TFIBIntegerField
      FieldName = 'MARKET_CODE'
    end
    object PosSaveUchetUCHET_NUM: TFIBIntegerField
      FieldName = 'UCHET_NUM'
    end
    object PosSaveUchetITEM: TFIBStringField
      FieldName = 'ITEM'
      Size = 14
      EmptyStrToNull = True
    end
    object PosSaveUchetACOUNT_KOLVO: TFIBFloatField
      FieldName = 'ACOUNT_KOLVO'
      DisplayFormat = '# ##0.000'
    end
    object PosSaveUchetCOUNT_KOLVO: TFIBFloatField
      FieldName = 'COUNT_KOLVO'
      DisplayFormat = '# ##0.000'
    end
    object PosSaveUchetSAVE_DATE: TFIBDateTimeField
      FieldName = 'SAVE_DATE'
    end
    object PosSaveUchetSALE_PRICE: TFIBFloatField
      FieldName = 'SALE_PRICE'
      currency = True
    end
    object PosSaveUchetTOVAR_NAME: TFIBStringField
      FieldName = 'TOVAR_NAME'
      Size = 80
      EmptyStrToNull = True
    end
    object PosSaveUchetVEND_PRICE: TFIBFloatField
      FieldName = 'VEND_PRICE'
      currency = True
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 736
    Top = 536
    object N1: TMenuItem
      Caption = #1042#1089#1077' '#1090#1086#1074#1072#1088#1099
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077
      OnClick = N2Click
    end
  end
end
