object RevalFrm: TRevalFrm
  Left = 247
  Top = 106
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1086#1094#1077#1085#1082#1080
  ClientHeight = 453
  ClientWidth = 664
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 664
    Height = 453
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1055#1086' '#1076#1072#1090#1077
      object Label2: TLabel
        Left = 496
        Top = 396
        Width = 43
        Height = 13
        Caption = #1057#1091#1084#1084#1072' : '
        Visible = False
      end
      object Label1: TLabel
        Left = 624
        Top = 396
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Label1'
        Visible = False
      end
      object Label3: TLabel
        Left = 496
        Top = 0
        Width = 44
        Height = 13
        Caption = #1054#1073#1098#1077#1082#1090' :'
      end
      object Label4: TLabel
        Left = 496
        Top = 40
        Width = 32
        Height = 13
        Caption = #1044#1072#1090#1072' :'
      end
      object Label5: TLabel
        Left = 496
        Top = 80
        Width = 88
        Height = 13
        Caption = #1058#1080#1087' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1080' :'
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 489
        Height = 425
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
            FieldName = 'ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'PLU '#1082#1086#1076
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOVAR_NAME'
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 150
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNIT_NAME'
            Title.Alignment = taCenter
            Title.Caption = #1045#1076'.'#1080#1079#1084'.'
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
            FieldName = 'OLD_PRICE'
            Title.Alignment = taCenter
            Title.Caption = #1057#1090#1072#1088#1072#1103' '#1094#1077#1085#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEW_PRICE'
            Title.Alignment = taCenter
            Title.Caption = #1053#1086#1074#1072#1103' '#1094#1077#1085#1072
            Visible = True
          end>
      end
      object ComboBox2: TComboBox
        Left = 495
        Top = 16
        Width = 153
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 1
        OnChange = ComboBox1Change
      end
      object DateTimePicker1: TDateTimePicker
        Left = 495
        Top = 56
        Width = 153
        Height = 21
        Date = 37536.006511875000000000
        Time = 37536.006511875000000000
        DateFormat = dfLong
        TabOrder = 2
        OnChange = ComboBox1Change
      end
      object ComboBox1: TComboBox
        Left = 495
        Top = 96
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 3
        Text = #1059#1094#1077#1085#1082#1072
        OnChange = ComboBox1Change
        Items.Strings = (
          #1059#1094#1077#1085#1082#1072
          #1044#1086#1086#1094#1077#1085#1082#1072)
      end
      object LMDButton1: TBitBtn
        Left = 504
        Top = 128
        Width = 137
        Height = 25
        Caption = #1055#1077#1095#1072#1090#1100
        TabOrder = 4
        OnClick = LMDButton1Click
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
      end
      object LMDButton3: TBitBtn
        Left = 504
        Top = 160
        Width = 137
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1094#1077#1085#1085#1080#1082#1080
        TabOrder = 5
        OnClick = LMDButton3Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777700000077
          777777770BFBF077777777770FBFB077777777770BFBF077777777000FB00077
          7777770B0BF0F0777777770F000000000007770BFBF000070307000FB0000007
          03070B0BF0F0000003070F000000333333070BFBF033000033070FB000307777
          03070BF0F0307777000700000030777707077777700000000007}
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1086' PLU '#1082#1086#1076#1091
      ImageIndex = 1
      object Label6: TLabel
        Left = 496
        Top = 0
        Width = 48
        Height = 13
        Caption = 'PLU '#1082#1086#1076' :'
      end
      object Label7: TLabel
        Left = 496
        Top = 40
        Width = 44
        Height = 13
        Caption = #1054#1073#1098#1077#1082#1090' :'
      end
      object Label8: TLabel
        Left = 496
        Top = 80
        Width = 87
        Height = 13
        Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072' :'
      end
      object Label9: TLabel
        Left = 496
        Top = 120
        Width = 80
        Height = 13
        Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072' :'
      end
      object Label10: TLabel
        Left = 496
        Top = 396
        Width = 43
        Height = 13
        Caption = #1057#1091#1084#1084#1072' : '
        Visible = False
      end
      object Label11: TLabel
        Left = 624
        Top = 396
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Label1'
        Visible = False
      end
      object ComboBox3: TComboBox
        Left = 495
        Top = 56
        Width = 153
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 1
        OnChange = ComboBox3Change
      end
      object DateTimePicker2: TDateTimePicker
        Left = 495
        Top = 96
        Width = 153
        Height = 21
        Date = 37536.006511875000000000
        Time = 37536.006511875000000000
        DateFormat = dfLong
        TabOrder = 2
        OnChange = ComboBox3Change
      end
      object Edit1: TEdit
        Left = 496
        Top = 16
        Width = 153
        Height = 21
        TabOrder = 0
        OnKeyDown = Edit1KeyDown
        OnKeyPress = Edit1KeyPress
      end
      object DateTimePicker3: TDateTimePicker
        Left = 495
        Top = 136
        Width = 153
        Height = 21
        Date = 37536.006511875000000000
        Time = 37536.006511875000000000
        DateFormat = dfLong
        TabOrder = 3
        OnChange = ComboBox3Change
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 489
        Height = 425
        DataSource = DataSource2
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 5
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
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOVAR_NAME'
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 150
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNIT_NAME'
            Title.Alignment = taCenter
            Title.Caption = #1045#1076'.'#1080#1079#1084'.'
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
            FieldName = 'OLD_PRICE'
            Title.Alignment = taCenter
            Title.Caption = #1057#1090#1072#1088#1072#1103' '#1094#1077#1085#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEW_PRICE'
            Title.Alignment = taCenter
            Title.Caption = #1053#1086#1074#1072#1103' '#1094#1077#1085#1072
            Visible = True
          end>
      end
      object LMDButton2: TBitBtn
        Left = 504
        Top = 168
        Width = 137
        Height = 25
        Caption = #1055#1077#1095#1072#1090#1100
        Enabled = False
        TabOrder = 4
        OnClick = LMDButton2Click
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
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 208
    Top = 216
  end
  object DataSource2: TDataSource
    DataSet = pFIBDataSet2
    Left = 208
    Top = 248
  end
  object pFIBDataSet1: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select S.tovar_name, P.item, P.kolvo, P.old_price, P.new_price, ' +
        'U.unit_name'
      'from pereocen P left join spr_tovar S on S.item = P.item'
      '       left join  SPR_UNITS U on U.unit_kod = S.unit_kod')
    AfterOpen = pFIBDataSet1AfterOpen
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Left = 244
    Top = 216
  end
  object pFIBDataSet2: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select S.tovar_name, P.item, P.kolvo, P.old_price, P.new_price, ' +
        'U.unit_name'
      'from pereocen P left join spr_tovar S on S.item = P.item'
      '       left join  SPR_UNITS U on U.unit_kod = S.unit_kod'
      'where P.item = '#39'27240'#39)
    AfterOpen = pFIBDataSet2AfterOpen
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Left = 244
    Top = 248
  end
end
