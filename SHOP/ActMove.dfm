object ActMoveFrm: TActMoveFrm
  Left = 248
  Top = 105
  BorderStyle = bsDialog
  Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1090#1086#1074#1072#1088#1086#1074' '#1087#1086' '#1072#1082#1090#1072#1084
  ClientHeight = 581
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object DBGrid2: TDBGrid
    Left = 16
    Top = 240
    Width = 681
    Height = 326
    DataSource = DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOVAR_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 205
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UNIT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1045#1076'.'#1080#1079#1084'.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOLVO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VEND_PRICE'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072' '#1087#1086#1089#1090'.'
        Width = 100
        Visible = True
      end>
  end
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 713
    Height = 233
    Align = alTop
    HotTrack = True
    MultiLine = True
    TabOrder = 1
    Tabs.Strings = (
      #1055#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084
      #1055#1086' '#1076#1072#1090#1072#1084)
    TabIndex = 0
    OnChange = TabControl1Change
    ExplicitTop = 1
    object Label1: TLabel
      Left = 13
      Top = 30
      Width = 63
      Height = 13
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1072' :'
    end
    object Label2: TLabel
      Left = 177
      Top = 30
      Width = 44
      Height = 13
      Caption = #1054#1073#1098#1077#1082#1090' :'
    end
    object Label3: TLabel
      Left = 84
      Top = 85
      Width = 87
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072' :'
      Visible = False
    end
    object Label4: TLabel
      Left = 91
      Top = 117
      Width = 80
      Height = 13
      Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072' :'
      Visible = False
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 80
      Width = 681
      Height = 145
      DataSource = DataSource1
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
          FieldName = 'SHORT_NAME'
          Title.Alignment = taCenter
          Title.Caption = #1054#1073#1098#1077#1082#1090
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_DATE'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_SUM'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 120
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'NAME'
          Title.Alignment = taCenter
          Title.Caption = #1040#1074#1090#1086#1088
          Width = 135
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'LAST_UPD'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          Visible = True
        end>
    end
    object TypeDocComboBox: TComboBox
      Left = 8
      Top = 49
      Width = 164
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 1
      Text = #1054#1087#1088#1080#1093#1086#1076#1099#1074#1072#1085#1080#1077' '#1080#1079#1083#1080#1096#1082#1086#1074
      OnChange = TypeDocComboBoxChange
      Items.Strings = (
        #1054#1087#1088#1080#1093#1086#1076#1099#1074#1072#1085#1080#1077' '#1080#1079#1083#1080#1096#1082#1086#1074
        #1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1077#1076#1086#1089#1090#1072#1095#1080
        #1057#1087#1080#1089#1072#1085#1080#1077)
    end
    object MarketComboBox: TComboBox
      Left = 174
      Top = 49
      Width = 164
      Height = 22
      Style = csOwnerDrawFixed
      Sorted = True
      TabOrder = 2
      OnChange = TypeDocComboBoxChange
    end
    object DateTimePicker1: TDateTimePicker
      Left = 175
      Top = 80
      Width = 164
      Height = 21
      Date = 37549.000000000000000000
      Time = 37549.000000000000000000
      DateFormat = dfLong
      TabOrder = 5
      Visible = False
    end
    object DateTimePicker2: TDateTimePicker
      Left = 175
      Top = 112
      Width = 164
      Height = 21
      Date = 37549.000000000000000000
      Time = 0.999988425901392500
      DateFormat = dfLong
      TabOrder = 6
      Visible = False
    end
    object UpdateChangeUsrBtn: TBitBtn
      Left = 349
      Top = 45
      Width = 82
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00880000000000
        0008880FFFFFFFFFFF08880FFFFF2FFFFF08880FFFF22FFFFF08880FFF22222F
        FF08880FFFF22FF2FF08880FFFFF2FF2FF08880FF2FFFFF2FF08880FF2FF2FFF
        FF08880FF2FF22FFFF08880FFF22222FFF08880FFFFF22FFFF08880FFFFF2FF0
        0008880FFFFFFFF0F088880FFFFFFFF008888800000000008888}
      TabOrder = 3
      OnClick = UpdateChangeUsrBtnClick
    end
    object PrintDocBtn: TBitBtn
      Tag = 2
      Left = 434
      Top = 45
      Width = 74
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      Enabled = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888800000000000888808888888880808800000000000008080888888BBB88
        0008088888877788080800000000000008800888888888808080800000000008
        0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
        088888880FFFFFFFF08888888000000000888888888888888888}
      TabOrder = 4
      OnClick = PrintDocBtnClick
    end
    object NewDocAddBtn: TBitBtn
      Tag = 1
      Left = 511
      Top = 45
      Width = 74
      Height = 25
      Caption = #1053#1086#1074#1099#1081
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      TabOrder = 7
      OnClick = NewDocAddBtnClick
    end
    object SendDraftBtn: TBitBtn
      Tag = 1
      Left = 588
      Top = 45
      Width = 101
      Height = 25
      Caption = #1042' '#1095#1077#1088#1085#1086#1074#1080#1082#1080
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888800008888888888888888888800008888888888887788888800008877
        7777777077778888000080000000007000777888000080FFFFFFF07000007788
        000080F44F44F07000000778000080FFFFFFF07887000077000080F44444F078
        88870077000080FFFFFFF07888887007000080F44444F07888788007000080FF
        FFFFF07880788007000080F44FFFF07800770078000080FFFF00008000000788
        000080F44F0F088000078888000080FFFF008888007888880000800000088888
        8088888800008888888888888888888800008888888888888888888800008888
        88888888888888880000}
      TabOrder = 8
      OnClick = SendDraftBtnClick
    end
  end
  object DataSource1: TDataSource
    DataSet = ActByDocQry
    Left = 344
    Top = 352
  end
  object DataSource2: TDataSource
    DataSet = PosActByDocQry
    OnDataChange = DataSource2DataChange
    Left = 312
    Top = 352
  end
  object pFIBDataSet2: TpFIBDataSet
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Left = 376
    Top = 320
  end
  object PosActByDocQry: TpFIBDataSet
    SelectSQL.Strings = (
      'select P.*, T.TOVAR_NAME, U.UNIT_NAME'
      'from POS_PRIHOD P, SPR_TOVAR T, SPR_UNITS U'
      'where P.ITEM = T.ITEM and T.UNIT_KOD = U.UNIT_KOD')
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DataSource = DataSource1
    Filtered = True
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Container = DataSetsContainer2
    Left = 312
    Top = 320
    object PosActByDocQryKOD: TFIBIntegerField
      FieldName = 'KOD'
    end
    object PosActByDocQryITEM: TFIBStringField
      FieldName = 'ITEM'
      Size = 14
      EmptyStrToNull = True
    end
    object PosActByDocQryKOLVO: TFIBFloatField
      FieldName = 'KOLVO'
    end
    object PosActByDocQryPRICE: TFIBFloatField
      FieldName = 'PRICE'
      currency = True
    end
    object PosActByDocQryVEND_PRICE: TFIBFloatField
      FieldName = 'VEND_PRICE'
      currency = True
    end
    object PosActByDocQryMARKET_CODE: TFIBIntegerField
      FieldName = 'MARKET_CODE'
    end
    object PosActByDocQryVENDOR_CODE: TFIBIntegerField
      FieldName = 'VENDOR_CODE'
    end
    object PosActByDocQryTOVAR_NAME: TFIBStringField
      FieldName = 'TOVAR_NAME'
      Size = 80
      EmptyStrToNull = True
    end
    object PosActByDocQryUNIT_NAME: TFIBStringField
      FieldName = 'UNIT_NAME'
      Size = 5
      EmptyStrToNull = True
    end
  end
  object ActByDocQry: TpFIBDataSet
    SelectSQL.Strings = (
      'select H.*, M.SHORT_NAME, U.NAME '
      'from HDR_PRIHOD H,  SPR_MARKET M,  SPR_USERS U'
      'where DOC_TYPE = 6'
      'and H.MARKET_CODE = M.MARKET_CODE'
      'and H.AUTOR_KOD  = U.AUTOR_KOD')
    AfterOpen = ActByDocQryAfterOpen
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Container = DataSetsContainer1
    Left = 344
    Top = 320
    object ActByDocQryKOD: TFIBIntegerField
      FieldName = 'KOD'
    end
    object ActByDocQryMARKET_CODE: TFIBIntegerField
      FieldName = 'MARKET_CODE'
    end
    object ActByDocQryDOC_DATE: TFIBDateTimeField
      FieldName = 'DOC_DATE'
    end
    object ActByDocQryDOC_NUMBER: TFIBIntegerField
      FieldName = 'DOC_NUMBER'
    end
    object ActByDocQryVENDOR_CODE: TFIBIntegerField
      FieldName = 'VENDOR_CODE'
    end
    object ActByDocQryDOC_SUM: TFIBFloatField
      FieldName = 'DOC_SUM'
      currency = True
    end
    object ActByDocQryDOC_TYPE: TFIBIntegerField
      FieldName = 'DOC_TYPE'
    end
    object ActByDocQryAUTOR_KOD: TFIBIntegerField
      FieldName = 'AUTOR_KOD'
    end
    object ActByDocQryLAST_UPD: TFIBDateTimeField
      FieldName = 'LAST_UPD'
    end
    object ActByDocQryVEND_SUM: TFIBFloatField
      FieldName = 'VEND_SUM'
      currency = True
    end
    object ActByDocQrySHORT_NAME: TFIBStringField
      FieldName = 'SHORT_NAME'
      Size = 15
      EmptyStrToNull = True
    end
    object ActByDocQryNAME: TFIBStringField
      FieldName = 'NAME'
      EmptyStrToNull = True
    end
  end
  object DataSetsContainer1: TDataSetsContainer
    Left = 344
    Top = 288
  end
  object DataSetsContainer2: TDataSetsContainer
    MasterContainer = DataSetsContainer1
    Left = 312
    Top = 288
  end
end
