object ExpensesAmountFrm: TExpensesAmountFrm
  Left = 248
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1044#1088#1091#1075#1080#1077' '#1088#1072#1089#1093#1086#1076#1099
  ClientHeight = 550
  ClientWidth = 760
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
    Top = 52
    Width = 760
    Height = 498
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'EXPENSES_DATE'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clRed
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPENSES_TYPE'
        Title.Alignment = taCenter
        Title.Caption = #1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1086#1074
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TITLE'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Width = 455
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMOUNT'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHORT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1054#1073#1098#1077#1082#1090
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 52
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 1
    object Label3: TLabel
      Left = 136
      Top = 8
      Width = 44
      Height = 13
      Caption = #1054#1073#1098#1077#1082#1090' :'
    end
    object Label1: TLabel
      Left = 348
      Top = 8
      Width = 43
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1086' :'
    end
    object Label2: TLabel
      Left = 484
      Top = 8
      Width = 61
      Height = 13
      Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' :'
    end
    object ComboBox1: TComboBox
      Left = 136
      Top = 24
      Width = 209
      Height = 22
      Style = csOwnerDrawFixed
      Sorted = True
      TabOrder = 4
      OnChange = ComboBox1Change
    end
    object DateTimePicker1: TDateTimePicker
      Left = 348
      Top = 24
      Width = 129
      Height = 21
      Date = 37501.000000000000000000
      Time = 0.625000000000000000
      DateFormat = dfLong
      TabOrder = 5
    end
    object BitBtn1: TBitBtn
      Left = 96
      Top = 11
      Width = 25
      Height = 33
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555C599999955555555C59999999555555CCC599999955555CCCCC55599
        95555CCCCCCC55999555555CCC5555999555555CCC5555999555555CCC555599
        9555555CCC5555999555555CCC5559999995555CCC5559999955555CCCCCC599
        9555555CCCCCCC5955555555CCCCCCC955555555555555555555}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 21
      Top = 11
      Width = 25
      Height = 33
      Hint = #1053#1086#1074#1099#1081' '#1088#1072#1089#1093#1086#1076
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C30E0000C30E00001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777700000000000077770FFFFFFFFFF077770FFFFFFFFFF077770F000000
        0FF077770FFFFFFFFFF077770F0000000FF077770FFFFFFFFFF077778F000000
        0FF078778BFFFFFFFFF0777F8FF800FFFFF07888FBBFFFF0000077B8BF8888F0
        FF07778B8B8BFFF0F07778B78F78BFF007777B778B7780007777}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Tag = 1
      Left = 46
      Top = 11
      Width = 25
      Height = 33
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1089#1093#1086#1076
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777000077777777777777777777000077777771171177777777000078FF
        FFFFF1FFFFFFFFF70000780000000100000000F70000780FFFFFF1FFFFFFF0F7
        0000780FFFFFF1FFFFFFF0F70000780FCCCCF1FCCCCFF0F70000780FCFCCF1FC
        CFCCF0F70000780FCCCCF1FCCFCCF0F70000780FFFCCF1FCCFCCF0F70000780F
        CCCFF1FCCCCFF0F70000780FFFFFF1FCCFFFF0F70000780FFFFFF1FCCFFFF0F7
        0000780FFFFFF1FFFFFFF0F70000780000000100000000F70000788888888188
        8888888700007777777117117777777700007777777777777777777700007777
        77777777777777770000}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn4: TBitBtn
      Left = 71
      Top = 11
      Width = 25
      Height = 33
      Hint = #1055#1077#1095#1072#1090#1100
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn4Click
    end
    object DateTimePicker2: TDateTimePicker
      Left = 484
      Top = 23
      Width = 129
      Height = 21
      Date = 37501.000000000000000000
      Time = 0.625000000000000000
      DateFormat = dfLong
      TabOrder = 6
    end
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    OnDataChange = DataSource1DataChange
    Left = 200
    Top = 200
  end
  object pFIBDataSet1: TpFIBDataSet
    SelectSQL.Strings = (
      'select E.*, M.SHORT_NAME from EXPENSES E'
      'left join SPR_MARKET M on E.MARKET_CODE = M.MARKET_CODE'
      'order by EXPENSES_TYPE')
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Left = 232
    Top = 200
  end
end
