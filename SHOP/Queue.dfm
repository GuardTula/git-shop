object QueueFrm: TQueueFrm
  Left = 256
  Top = 106
  ActiveControl = DBGrid1
  BorderStyle = bsDialog
  Caption = #1054#1095#1077#1088#1077#1076#1100
  ClientHeight = 447
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 17
    Width = 329
    Height = 430
    Align = alLeft
    Ctl3D = False
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'QUEUE_NUMBER'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1086#1095#1077#1088#1077#1076#1080
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUEUE_SUM'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 75
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 329
    Top = 17
    Width = 425
    Height = 430
    Align = alClient
    Ctl3D = False
    DataSource = DataSource2
    Enabled = False
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
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
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOVAR_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 254
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOLVO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALE_PRICE'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Width = 58
        Visible = True
      end>
  end
  object HeaderControl1: THeaderControl
    Left = 0
    Top = 0
    Width = 754
    Height = 17
    FullDrag = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Sections = <
      item
        ImageIndex = -1
        Text = #1063#1077#1082#1080' '#1074' '#1086#1095#1077#1088#1077#1076#1080
        Width = 249
      end
      item
        ImageIndex = -1
        Text = #1055#1086#1079#1080#1094#1080#1080' '#1095#1077#1082#1072
        Width = 439
      end>
    Style = hsFlat
    ParentFont = False
    ExplicitWidth = 778
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    OnDataChange = DataSource1DataChange
    Left = 392
    Top = 200
  end
  object DataSource2: TDataSource
    DataSet = pFIBDataSet2
    OnDataChange = DataSource2DataChange
    Left = 392
    Top = 232
  end
  object pFIBDataSet1: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select q.queue_number, u.name, sum(q.kolvo * p.sale_price) as qu' +
        'eue_sum'
      'from queue q left join spr_users u on u.autor_kod = q.autor_kod'
      
        'left join prices p on q.item = p.item and p.market_code = (selec' +
        't obj_id from inf_current_obj)'
      'group by q.queue_number, u.name')
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Container = DataSetsContainer1
    Left = 360
    Top = 200
    object pFIBDataSet1QUEUE_NUMBER: TFIBIntegerField
      FieldName = 'QUEUE_NUMBER'
    end
    object pFIBDataSet1NAME: TFIBStringField
      FieldName = 'NAME'
      EmptyStrToNull = True
    end
    object pFIBDataSet1QUEUE_SUM: TFIBFloatField
      FieldName = 'QUEUE_SUM'
      DisplayFormat = '#######0.00'
    end
  end
  object pFIBDataSet2: TpFIBDataSet
    SelectSQL.Strings = (
      'select q.*, t.tovar_name, p.sale_price '
      'from queue q left join spr_tovar t on t.item = q.item'
      
        'left join prices p on q.item = p.item and p.market_code = (selec' +
        't obj_id from inf_current_obj)'
      'where q.queue_number = :queue_number')
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DataSource = DataSource1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatDate = 't'
    Container = DataSetsContainer2
    Left = 360
    Top = 232
    object pFIBDataSet2QUEUE_NUMBER: TFIBIntegerField
      FieldName = 'QUEUE_NUMBER'
    end
    object pFIBDataSet2ITEM: TFIBStringField
      FieldName = 'ITEM'
      Size = 14
      EmptyStrToNull = True
    end
    object pFIBDataSet2KOLVO: TFIBFloatField
      FieldName = 'KOLVO'
    end
    object pFIBDataSet2AUTOR_KOD: TFIBIntegerField
      FieldName = 'AUTOR_KOD'
    end
    object pFIBDataSet2MARKET_CODE: TFIBIntegerField
      FieldName = 'MARKET_CODE'
    end
    object pFIBDataSet2TOVAR_NAME: TFIBStringField
      FieldName = 'TOVAR_NAME'
      Size = 80
      EmptyStrToNull = True
    end
    object pFIBDataSet2SALE_PRICE: TFIBFloatField
      FieldName = 'SALE_PRICE'
      DisplayFormat = '#######0.00'
    end
  end
  object DataSetsContainer1: TDataSetsContainer
    Left = 328
    Top = 200
  end
  object DataSetsContainer2: TDataSetsContainer
    MasterContainer = DataSetsContainer1
    Left = 328
    Top = 232
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 456
    Top = 264
    object ClientDataSet1ITEM: TStringField
      FieldName = 'ITEM'
      Size = 14
    end
    object ClientDataSet1KOLVO: TFloatField
      FieldName = 'KOLVO'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 64
    Top = 120
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1092#1072#1081#1083
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1095#1077#1082
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077' '#1074' -->'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = pFIBDataSet3
    Left = 424
    Top = 264
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 296
  end
  object pFIBDataSet3: TpFIBDataSet
    SelectSQL.Strings = (
      'select q.item, q.kolvo'
      'from queue q left join spr_tovar t on t.item = q.item'
      
        'left join prices p on q.item = p.item and p.market_code = (selec' +
        't obj_id from inf_current_obj)'
      'where q.queue_number = :queue_number')
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DataSource = DataSource1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatDate = 't'
    Container = DataSetsContainer2
    Left = 360
    Top = 264
  end
  object SaveDialog1: TSaveDialog
    Left = 96
    Top = 120
  end
end
