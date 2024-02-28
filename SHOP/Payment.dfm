object PaymentFrm: TPaymentFrm
  Left = 249
  Top = 105
  BorderStyle = bsDialog
  Caption = #1054#1087#1083#1072#1090#1072
  ClientHeight = 573
  ClientWidth = 678
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
    Left = 617
    Top = 549
    Width = 43
    Height = 16
    Alignment = taRightJustify
    Caption = 'Label1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 22
    Width = 678
    Height = 513
    Align = alTop
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
        Expanded = False
        FieldName = 'PAYMENT_DATE'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAYMENT_NUMBER'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1087#1083#1072#1090#1077#1078#1082#1080
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAYMENT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAYMENT_SUM'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CASE'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
        Visible = True
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 678
    Height = 22
    AutoSize = True
    Caption = 'ToolBar1'
    Images = ShopMainForm.ImageList1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    ExplicitWidth = 662
    object BitBtn1: TToolButton
      Left = 0
      Top = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      Caption = 'BitBtn1'
      ImageIndex = 30
      OnClick = BitBtn1Click
    end
    object BitBtn3: TToolButton
      Left = 23
      Top = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Caption = 'BitBtn3'
      ImageIndex = 32
      OnClick = BitBtn3Click
    end
    object BitBtn2: TToolButton
      Tag = 1
      Left = 46
      Top = 0
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      Caption = 'BitBtn2'
      ImageIndex = 28
      OnClick = BitBtn1Click
    end
    object ToolButton2: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 26
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 77
      Top = 0
      Hint = #1055#1077#1095#1072#1090#1100
      Caption = 'ToolButton1'
      ImageIndex = 25
      OnClick = ToolButton1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = PayQuery
    OnDataChange = DataSource1DataChange
    Left = 176
    Top = 192
  end
  object PayQuery: TpFIBDataSet
    SelectSQL.Strings = (
      'select P.*, T.PAYMENT_NAME, '
      'case P.PAYMENT_KIND'
      'when  0 then '#39#1054#1055#1051#1040#1058#1040#39
      'when -1 then '#39#1042#1054#1047#1042#1056#1040#1058#39
      'end'
      
        'from PAYMENT P left join SPR_PAYMENT_TYPE T on P.PAYMENT_TYPE = ' +
        'T.PAYMENT_TYPE'
      'where P.VENDOR_CODE = :BUYER_CODE'
      'order by  P.PAYMENT_DATE')
    AfterOpen = PayQueryAfterOpen
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DataSource = SprVendFrm.DataSource4
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Container = DataSetsContainer1
    Left = 176
    Top = 224
    object PayQueryKOD: TFIBIntegerField
      FieldName = 'KOD'
    end
    object PayQueryVENDOR_CODE: TFIBIntegerField
      FieldName = 'VENDOR_CODE'
    end
    object PayQueryPAYMENT_DATE: TFIBDateTimeField
      FieldName = 'PAYMENT_DATE'
      DisplayFormat = 'dd-mmm-yyyy'
    end
    object PayQueryPAYMENT_SUM: TFIBFloatField
      FieldName = 'PAYMENT_SUM'
    end
    object PayQueryPAYMENT_TYPE: TFIBIntegerField
      FieldName = 'PAYMENT_TYPE'
    end
    object PayQueryPAYMENT_KIND: TFIBSmallIntField
      FieldName = 'PAYMENT_KIND'
    end
    object PayQueryPAYMENT_NUMBER: TFIBIntegerField
      FieldName = 'PAYMENT_NUMBER'
      DisplayFormat = '#'
    end
    object PayQueryPAYMENT_NAME: TFIBStringField
      FieldName = 'PAYMENT_NAME'
      Size = 10
      EmptyStrToNull = True
    end
    object PayQueryCASE: TFIBStringField
      FieldName = 'CASE'
      Size = 7
      EmptyStrToNull = True
    end
  end
  object DataSetsContainer1: TDataSetsContainer
    MasterContainer = SprVendFrm.DataSetsContainer1
    Left = 208
    Top = 224
  end
end
