object ChangeZakazFrm: TChangeZakazFrm
  Left = 411
  Top = 200
  ActiveControl = DBGrid1
  BorderStyle = bsDialog
  Caption = #1053#1086#1088#1084#1099' '#1086#1089#1090#1072#1090#1082#1086#1074
  ClientHeight = 361
  ClientWidth = 586
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
  object Label1: TLabel
    Left = 82
    Top = 335
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 7
    Top = 335
    Width = 69
    Height = 13
    Caption = #1042#1089#1077#1075#1086' '#1079#1072#1082#1072#1079' :'
  end
  object Bevel1: TBevel
    Left = 269
    Top = -4
    Width = 3
    Height = 357
    Shape = bsLeftLine
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 23
    Width = 249
    Height = 298
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'SHORT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1054#1073#1098#1077#1082#1090
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOLVO'
        Title.Caption = #1047#1072#1082#1072#1079
        Width = 78
        Visible = True
      end>
  end
  object BitBtn4: TBitBtn
    Left = 134
    Top = 330
    Width = 129
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F000000000000000000000001000000000000000000000008000
      0000008000008080000000008000800080000080800080808000C0C0C000FF00
      000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF00888888888888
      8888888800008888888888888888888800008888888888888898889800008888
      8888888889988998000088888000888899989998000088880CCC088889988998
      00008880CCCCC088889888980000880CCCCCCC08888888880000880CCCCCCC00
      888888880000880CCCCCC0770888888800008880CCCC07777088888800008888
      0CC077777008888800008888800777770EE0888800008888880F7770EEEE0888
      000088888880F70EEEEEE08800008888888800EEEEEEEE0800008888888880FE
      EEEEEEE0000088888888880FEEEEEEEE0000888888888880FEEEEEEE00008888
      888888880FEEEEEE0000}
    TabOrder = 1
    OnClick = BitBtn4Click
  end
  object HeaderControl1: THeaderControl
    Left = 0
    Top = 0
    Width = 586
    Height = 17
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Sections = <
      item
        Alignment = taCenter
        ImageIndex = -1
        Text = #1047#1072#1082#1072#1079
        Width = 270
      end
      item
        Alignment = taCenter
        ImageIndex = -1
        Text = #1053#1086#1088#1084#1099' '#1086#1089#1090#1072#1090#1082#1086#1074
        Width = 350
      end>
    ParentFont = False
    ExplicitWidth = 582
  end
  object DBGrid2: TDBGrid
    Left = 278
    Top = 23
    Width = 300
    Height = 298
    DataSource = DataSource2
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
    TabOrder = 3
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SHORT_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1054#1073#1098#1077#1082#1090
        Width = 149
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'MIN_OST'
        Title.Alignment = taCenter
        Title.Caption = #1052#1080#1085'.'#1054#1089#1090'.'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'NORM_OST'
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1088#1084#1072' '#1086#1089#1090'.'
        Visible = True
      end>
  end
  object pFIBDataSet1: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted]
    UpdateSQL.Strings = (
      'execute block('
      '  q_item varchar(14) = ?cur_item'
      ' ,q_market_code integer = ?market_code'
      ' ,q_autor_kod integer = ?user_id'
      ' ,q_kolvo numeric(15,3) = ?kolvo'
      ')as'
      'begin'
      '  if(q_kolvo is null)then q_kolvo = 0;'
      '  if(q_kolvo = 0)then'
      
        '    delete from zakaz where item = :q_item and autor_kod = :q_au' +
        'tor_kod and market_code = :q_market_code;'
      '  else'
      '    if(exists(select * from zakaz'
      
        '               where item = :q_item and autor_kod = :q_autor_kod' +
        ' and market_code = :q_market_code))then'
      '      update ZAKAZ set KOLVO = :q_kolvo'
      
        '       where item = :q_item and autor_kod = :q_autor_kod and mar' +
        'ket_code = :q_market_code;'
      '    else '
      '      insert into ZAKAZ(ITEM, MARKET_CODE, AUTOR_KOD, KOLVO)'
      '      values(:q_item, :q_market_code, :q_autor_kod, :q_kolvo);'
      'end')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' SPR_MARKET'
      'WHERE'
      '  MARKET_CODE = -1'
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      ' Z.ITEM,'
      ' M.MARKET_CODE,'
      ' Z.AUTOR_KOD,'
      ' Z.KOLVO,'
      ' M.SHORT_NAME'
      'FROM'
      ' '
      
        'SPR_MARKET M left join ZAKAZ Z on Z.MARKET_CODE = M.MARKET_CODE ' +
        'and Z.ITEM = :CUR_ITEM and Z.AUTOR_KOD = :USER_ID'
      ' '
      ''
      ' WHERE '
      '  M.MARKET_CODE = :OLD_MARKET_CODE'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' cast(:CUR_ITEM as varchar(14)) as ITEM,'
      ' M.MARKET_CODE,'
      ' Z.AUTOR_KOD,'
      ' Z.KOLVO,'
      ' M.SHORT_NAME'
      'FROM'
      ' '
      
        'SPR_MARKET M left join ZAKAZ Z on Z.MARKET_CODE = M.MARKET_CODE ' +
        'and Z.ITEM = :CUR_ITEM'
      'and Z.AUTOR_KOD = :USER_ID'
      'ORDER BY M.SHORT_NAME'
      ' ')
    AutoCalcFields = False
    AfterDelete = pFIBDataSet1AfterDelete
    AfterOpen = pFIBDataSet1AfterOpen
    AfterPost = pFIBDataSet1AfterPost
    AfterRefresh = pFIBDataSet1AfterOpen
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    Left = 96
    Top = 96
    oRefreshAfterDelete = True
    oRefreshDeletedRecord = True
    object pFIBDataSet1ITEM: TFIBStringField
      FieldName = 'ITEM'
      Size = 14
      EmptyStrToNull = True
    end
    object pFIBDataSet1MARKET_CODE: TFIBIntegerField
      FieldName = 'MARKET_CODE'
    end
    object pFIBDataSet1AUTOR_KOD: TFIBIntegerField
      FieldName = 'AUTOR_KOD'
    end
    object pFIBDataSet1KOLVO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'KOLVO'
    end
    object pFIBDataSet1SHORT_NAME: TFIBStringField
      FieldName = 'SHORT_NAME'
      ReadOnly = True
      Size = 15
      EmptyStrToNull = True
    end
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    OnDataChange = DataSource1DataChange
    Left = 111
    Top = 104
  end
  object DataSource2: TDataSource
    DataSet = pFIBDataSet2
    Left = 440
    Top = 192
  end
  object pFIBDataSet2: TpFIBDataSet
    UpdateSQL.Strings = (
      'execute block('
      ' q_item varchar(14) = ?item'
      ' ,q_market_code integer = ?market_code'
      ' ,q_norm_ost numeric(15,3) = ?norm_ost'
      ' ,q_min_ost numeric(15,3) = ?min_ost'
      ' ,q_short_name varchar(15) = ?short_name'
      ')as'
      'begin'
      ' if(q_norm_ost is null)then q_norm_ost = 0;'
      ' if(q_min_ost is null)then q_min_ost = 0;'
      ''
      ' if(q_norm_ost + q_min_ost = 0)then'
      
        '   delete from SPR_NORM_OST where ITEM = :q_item and MARKET_CODE' +
        ' = :q_market_code;'
      ' else'
      
        '   if(exists(select * from SPR_NORM_OST where MARKET_CODE = :q_m' +
        'arket_code and ITEM = :q_item))then'
      '     update SPR_NORM_OST'
      '        set NORM_OST = :Q_NORM_OST, MIN_OST = :Q_MIN_OST'
      '      where ITEM = :Q_ITEM and MARKET_CODE = :Q_MARKET_CODE;'
      '   else'
      
        '     insert into SPR_NORM_OST(MARKET_CODE, ITEM, NORM_OST, MIN_O' +
        'ST)'
      '     values(:q_market_code, :q_item, :q_norm_ost, :q_min_ost);'
      'end  ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' SPR_NORM_OST'
      'WHERE'
      '  MARKET_CODE = :OLD_MARKET_CODE')
    RefreshSQL.Strings = (
      'SELECT'
      ' O.item,'
      ' M.market_code,'
      ' O.norm_ost,'
      ' O.min_ost,'
      ' M.SHORT_NAME'
      'FROM'
      ' '
      
        'SPR_MARKET M left join spr_norm_ost O on O.MARKET_CODE = M.MARKE' +
        'T_CODE and O.ITEM = :ITEM'
      ''
      ''
      ''
      'WHERE '
      '  M.MARKET_CODE = :OLD_MARKET_CODE '
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' O.item,'
      ' M.market_code,'
      ' O.norm_ost,'
      ' O.min_ost,'
      ' M.SHORT_NAME'
      'FROM'
      ' '
      
        'SPR_MARKET M left join spr_norm_ost O on O.MARKET_CODE = M.MARKE' +
        'T_CODE and O.ITEM = :ITEM'
      'ORDER BY M.SHORT_NAME'
      '')
    AfterEdit = pFIBDataSet2AfterEdit
    AfterPost = pFIBDataSet2AfterPost
    AllowedUpdateKinds = [ukModify, ukDelete]
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    Left = 456
    Top = 200
  end
end
