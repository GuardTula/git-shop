object DelDocFrm: TDelDocFrm
  Left = 0
  Top = 0
  ClientHeight = 604
  ClientWidth = 1310
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 241
    Width = 1310
    Height = 363
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ITEM'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOVAR_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOLVO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHORT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1054#1073#1098#1077#1082#1090
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_NUMBER'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1076#1086#1082'-'#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_DEL_VENDOR'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_TYPE_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1042#1080#1076' '#1076#1086#1082'-'#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_DATE'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1076#1086#1082'-'#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LAST_UPD'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1091#1076#1072#1083#1077#1085#1080#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1310
    Height = 241
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 1082
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 81
      Height = 13
      Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
    end
    object Label2: TLabel
      Left = 200
      Top = 16
      Width = 43
      Height = 13
      Caption = #1054#1073#1098#1077#1082#1090':'
    end
    object DocTypeCheckListBox: TCheckListBox
      Left = 8
      Top = 32
      Width = 177
      Height = 201
      ItemHeight = 13
      Items.Strings = (
        '1 - '#1055#1088#1080#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
        '2 - '#1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
        '3- '#1055#1077#1088#1077#1073#1088#1086#1089#1082#1072' '#1088#1072#1089#1093#1086#1076
        '4 - '#1055#1077#1088#1077#1089#1086#1088#1090#1080#1094#1072
        '5 - '#1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1077#1076#1086#1089#1090#1072#1095#1080
        '6 - '#1054#1087#1088#1080#1093#1086#1076#1086#1074#1072#1085#1080#1077
        '7 - '#1055#1077#1088#1077#1073#1088#1086#1089#1082#1072' '#1087#1088#1080#1093#1086#1076
        '8 - '#1042#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091
        '9 - '#1057#1087#1080#1089#1072#1085#1080#1077
        '10 - '#1042#1086#1079#1074#1088#1072#1090' '#1086#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
        '11 - '#1055#1088#1086#1076#1072#1078#1072
        '12 - '#1056#1077#1079#1077#1088#1074)
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 400
      Top = 136
      Width = 121
      Height = 25
      Caption = #1053#1072#1081#1090#1080
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object MarketCheckListBox: TCheckListBox
      Left = 200
      Top = 32
      Width = 185
      Height = 201
      ItemHeight = 13
      TabOrder = 2
    end
    object ItemEdit: TLabeledEdit
      Left = 400
      Top = 32
      Width = 121
      Height = 21
      EditLabel.Width = 63
      EditLabel.Height = 13
      EditLabel.Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072':'
      TabOrder = 3
      Text = ''
    end
    object BitBtn2: TBitBtn
      Left = 400
      Top = 198
      Width = 121
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 4
      OnClick = BitBtn2Click
    end
    object Memo1: TMemo
      Left = 527
      Top = 13
      Width = 555
      Height = 220
      Lines.Strings = (
        'Memo1')
      TabOrder = 5
      Visible = False
    end
    object BitBtn3: TBitBtn
      Left = 400
      Top = 167
      Width = 121
      Height = 25
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      TabOrder = 6
      OnClick = BitBtn3Click
    end
  end
  object DelDocDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select p.item, p.kolvo, p.price, h.doc_number, h.doc_date, h.las' +
        't_upd, m.short_name, u.name, p.kod, t.tovar_name,'
      '       case h.doc_type'
      '         when 1 then '#39#1055#1088#1080#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103#39
      '         when 2 then '#39#1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103#39
      '         when 3 then '#39#1055#1077#1088#1077#1073#1088#1086#1089#1082#1072' '#1088#1072#1089#1093#1086#1076#39
      '         when 4 then '#39#1055#1077#1088#1077#1089#1086#1088#1090#1080#1094#1072#39
      '         when 5 then '#39#1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1077#1076#1086#1089#1090#1072#1095#1080#39
      '         when 6 then '#39#1054#1087#1088#1080#1093#1086#1076#1086#1074#1072#1085#1080#1077#39
      '         when 7 then '#39#1055#1077#1088#1077#1073#1088#1086#1089#1082#1072' '#1087#1088#1080#1093#1086#1076#39
      '         when 8 then '#39#1042#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091#39
      '         when 9 then '#39#1057#1087#1080#1089#1072#1085#1080#1077#39
      '         when 10 then '#39#1042#1086#1079#1074#1088#1072#1090' '#1086#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103#39
      '         when 11 then '#39#1055#1088#1086#1076#1072#1078#1072#39
      '         when 12 then '#39#1056#1077#1079#1077#1088#1074#39
      '       end as doc_type_name,'
      '       case h.doc_type'
      
        '         when 1 then /*'#39#1055#1088#1080#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103#39' */ (select v.vendor' +
        '_name from spr_vendors v where v.vendor_code = h.vendor_code)'
      
        '         when 2 then /*'#39#1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103#39'*/ (select b.buyer_n' +
        'ame from spr_buyers b where b.buyer_code = h.vendor_code)'
      
        '         when 3 then /*'#39#1055#1077#1088#1077#1073#1088#1086#1089#1082#1072' '#1088#1072#1089#1093#1086#1076#39'*/  (select spr_market' +
        '.short_name from spr_market where spr_market.market_code = h.ven' +
        'dor_code)'
      
        '         when 4 then /*'#39#1055#1077#1088#1077#1089#1086#1088#1090#1080#1094#1072#39'*/ (select spr_market.short_' +
        'name from spr_market where spr_market.market_code = h.vendor_cod' +
        'e)'
      
        '         when 5 then /*'#39#1057#1087#1080#1089#1072#1085#1080#1077' '#1085#1077#1076#1086#1089#1090#1072#1095#1080#39'*/ (select spr_market' +
        '.short_name from spr_market where spr_market.market_code = h.ven' +
        'dor_code)'
      
        '         when 6 then /*'#39#1054#1087#1088#1080#1093#1086#1076#1086#1074#1072#1085#1080#1077#39'*/ (select spr_market.shor' +
        't_name from spr_market where spr_market.market_code = h.vendor_c' +
        'ode)'
      
        '         when 7 then /*'#39#1055#1077#1088#1077#1073#1088#1086#1089#1082#1072' '#1087#1088#1080#1093#1086#1076#39'*/ (select spr_market.' +
        'short_name from spr_market where spr_market.market_code = h.vend' +
        'or_code)'
      
        '         when 8 then /*'#39#1042#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091#39'*/(select v.vendor_na' +
        'me from spr_vendors v where v.vendor_code = h.vendor_code)'
      
        '         when 9 then /*'#39#1057#1087#1080#1089#1072#1085#1080#1077#39'*/ (select spr_market.short_nam' +
        'e from spr_market where spr_market.market_code = h.vendor_code)'
      
        '         when 10 then /*'#39#1042#1086#1079#1074#1088#1072#1090' '#1086#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103#39'*/ (select b.buye' +
        'r_name from spr_buyers b where b.buyer_code = h.vendor_code)'
      
        '         when 11 then /*'#39#1055#1088#1086#1076#1072#1078#1072#39'*/ (select b.buyer_name from sp' +
        'r_buyers b where b.buyer_code = h.vendor_code)'
      
        '         when 12 then /*'#39#1056#1077#1079#1077#1088#1074#39' */ (select b.buyer_name from sp' +
        'r_buyers b where b.buyer_code = h.vendor_code)'
      '       end as doc_del_vendor'
      'from pos_del_doc p'
      '    left join hdr_del_doc h on p.kod = h.kod'
      '    left join spr_tovar t on p.item = t.item'
      '    left join spr_market m on p.market_code = m.market_code'
      '    left join spr_users u on h.autor_kod = u.autor_kod'
      ''
      ''
      ''
      '')
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    Left = 552
    Top = 136
    object DelDocDataSetKOLVO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'KOLVO'
    end
    object DelDocDataSetDOC_NUMBER: TFIBIntegerField
      FieldName = 'DOC_NUMBER'
    end
    object DelDocDataSetDOC_DATE: TFIBDateTimeField
      FieldName = 'DOC_DATE'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object DelDocDataSetLAST_UPD: TFIBDateTimeField
      FieldName = 'LAST_UPD'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object DelDocDataSetSHORT_NAME: TFIBStringField
      FieldName = 'SHORT_NAME'
      Size = 15
      EmptyStrToNull = True
    end
    object DelDocDataSetDOC_TYPE_NAME: TFIBStringField
      FieldName = 'DOC_TYPE_NAME'
      Size = 21
      EmptyStrToNull = True
    end
    object DelDocDataSetNAME: TFIBStringField
      FieldName = 'NAME'
      EmptyStrToNull = True
    end
    object DelDocDataSetDOC_DEL_VENDOR: TFIBStringField
      FieldName = 'DOC_DEL_VENDOR'
      Size = 50
      EmptyStrToNull = True
    end
    object DelDocDataSetITEM: TFIBStringField
      FieldName = 'ITEM'
      Size = 14
      EmptyStrToNull = True
    end
    object DelDocDataSetKOD: TFIBIntegerField
      FieldName = 'KOD'
    end
    object DelDocDataSetTOVAR_NAME: TFIBStringField
      FieldName = 'TOVAR_NAME'
      Size = 80
      EmptyStrToNull = True
    end
    object DelDocDataSetPRICE: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'PRICE'
      DisplayFormat = '### ### ##0.00'
    end
  end
  object DataSource1: TDataSource
    DataSet = DelDocDataSet
    OnDataChange = DataSource1DataChange
    Left = 552
    Top = 168
  end
  object frxReport1: TfrxReport
    Version = '6.9.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44658.615261597200000000
    ReportOptions.LastChange = 44658.627322199070000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 584
    Top = 136
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DelDocDataSet
    BCDToCurrency = False
    Left = 616
    Top = 136
  end
end
