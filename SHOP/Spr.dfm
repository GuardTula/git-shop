object SprFrm: TSprFrm
  Tag = 1
  Left = 248
  Top = 105
  ActiveControl = DBGrid1
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
  ClientHeight = 634
  ClientWidth = 1174
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1174
    Height = 615
    ActivePage = TabSheet1
    Align = alClient
    HotTrack = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1058#1086#1074#1072#1088#1099
      object Panel1: TPanel
        Left = 0
        Top = 57
        Width = 1166
        Height = 530
        Align = alClient
        Caption = 'Panel1'
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 361
          Top = 1
          Width = 804
          Height = 528
          Align = alClient
          Ctl3D = True
          DataSource = DataSource1
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentCtl3D = False
          ParentFont = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid1DrawColumnCell
          OnDblClick = DBGrid1DblClick
          OnKeyDown = DBGrid1KeyDown
          OnTitleClick = DBGrid1TitleClick
          Columns = <
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'ITEM'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1076
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clRed
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MARK_COLOR'
              Title.Alignment = taCenter
              Title.Caption = ' '
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALE_MARK_COLOR'
              Title.Alignment = taCenter
              Title.Caption = #1056#1077#1082#1086#1084#1077#1085#1076#1072#1094#1080#1103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTIKUL'
              Title.Alignment = taCenter
              Title.Caption = #1040#1088#1090#1080#1082#1091#1083
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOVAR_NAME'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '
              Width = 210
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REMARK'
              Title.Alignment = taCenter
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REMARK_1'
              Title.Alignment = taCenter
              Title.Caption = #1044#1086#1087'.'#1087#1088#1080#1084'.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SCLAD'
              Title.Alignment = taCenter
              Title.Caption = #1057#1082#1083#1072#1076
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRODUCER'
              Title.Alignment = taCenter
              Title.Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALE_PRICE'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE_1'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' 1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE_2'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' 2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE_3'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' 3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE_4'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' 4'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE_5'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' 5'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE_6'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' 6'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE_7'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' 7'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE_8'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' 8'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE_9'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' 9'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VEND_PRICE'
              Title.Caption = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHARGE'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1094#1077#1085#1082#1072' %'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EXTRA_CHARGE'
              Title.Alignment = taCenter
              Title.Caption = #1053#1086#1088#1084#1072' '#1085#1072#1094#1077#1085#1082#1080' %'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENDOR_NAME'
              Title.Alignment = taCenter
              Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GROUP_NAME'
              Title.Alignment = taCenter
              Title.Caption = #1043#1088#1091#1087#1087#1072
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VEND_ITEM'
              Title.Alignment = taCenter
              Title.Caption = #1044#1086#1087'.'#1082#1086#1076
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'UNIT_NAME'
              Title.Alignment = taCenter
              Title.Caption = #1045#1076'.'#1080#1079#1084
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KKM_SECT'
              Title.Alignment = taCenter
              Title.Caption = #1057#1077#1082#1094#1080#1103' '#1050#1050#1052
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KOLVO'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Visible = True
            end>
        end
        object PageControl2: TPageControl
          Left = 1
          Top = 1
          Width = 360
          Height = 528
          ActivePage = TabSheet3
          Align = alLeft
          TabOrder = 1
          Visible = False
          object TabSheet3: TTabSheet
            Caption = #1060#1080#1083#1100#1090#1088
            ImageIndex = 1
            PopupMenu = PopupMenu1
          end
          object TabSheet9: TTabSheet
            Caption = #1064#1090#1088#1080#1093'-'#1082#1086#1076#1099
            ImageIndex = 2
            object Label15: TLabel
              Left = 8
              Top = 280
              Width = 58
              Height = 13
              Caption = #1064#1090#1088#1080#1093'-'#1082#1086#1076' :'
            end
            object DBGrid4: TDBGrid
              Left = 0
              Top = 0
              Width = 352
              Height = 273
              Align = alTop
              DataSource = DataSource7
              Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = RUSSIAN_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'BARCODE'
                  Title.Alignment = taCenter
                  Title.Caption = #1064#1090#1088#1080#1093'-'#1082#1086#1076
                  Width = 191
                  Visible = True
                end>
            end
            object BarCodeEdit: TEdit
              Left = 8
              Top = 296
              Width = 201
              Height = 21
              Cursor = crIBeam
              AutoSelect = False
              AutoSize = False
              Color = clWhite
              MaxLength = 15
              TabOrder = 1
              OnChange = BarCodeEditChange
              OnKeyDown = BarCodeEditKeyDown
              OnKeyPress = INNEditKeyPress
            end
            object AddBarCodeButton: TBitBtn
              Left = 48
              Top = 328
              Width = 113
              Height = 25
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              Enabled = False
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888888888888888888888888888888888818888888888
                8888811888888884888881118888848484888111188888444888811111884444
                4448811118888844488881118888848484888118888888848888818888888888
                8888888888888888888888888888888888888888888888888888}
              TabOrder = 2
              OnClick = AddBarCodeButtonClick
            end
            object DelBarCodeButton: TBitBtn
              Left = 48
              Top = 360
              Width = 113
              Height = 25
              Caption = #1059#1076#1072#1083#1080#1090#1100
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888888888888888888888888888888888888817788888
                7788188811778888178811887117888718881118811778117888111187117711
                8888111118111118888811118871117888881118771111778888118711887117
                7888188888888711778888888888888118888888888888888888}
              TabOrder = 3
              OnClick = DelBarCodeButtonClick
            end
          end
          object TabSheet4: TTabSheet
            Caption = #1052#1072#1088#1082#1080#1088#1086#1074#1082#1072' '#1094#1074#1077#1090#1086#1084
            ImageIndex = 2
            object Bevel1: TBevel
              Left = 3
              Top = 0
              Width = 346
              Height = 232
            end
            object Bevel2: TBevel
              Left = 3
              Top = 238
              Width = 346
              Height = 233
            end
            object Label2: TLabel
              Left = 16
              Top = 5
              Width = 63
              Height = 13
              Caption = #1042#1099#1076#1077#1083#1077#1085#1080#1077' :'
            end
            object Label3: TLabel
              Left = 16
              Top = 244
              Width = 81
              Height = 13
              Caption = #1056#1077#1082#1086#1084#1077#1085#1076#1072#1094#1080#1103' :'
            end
            object ColorBox1: TColorBox
              Left = 33
              Top = 24
              Width = 247
              Height = 22
              Style = [cbStandardColors, cbPrettyNames]
              TabOrder = 0
            end
            object MarkCurTovarBitBtn: TBitBtn
              Left = 29
              Top = 52
              Width = 251
              Height = 37
              Caption = #1052#1072#1088#1082#1080#1088#1086#1074#1072#1090#1100
              TabOrder = 1
              OnClick = MarkCurTovarBitBtnClick
            end
            object MarkAllTovarBitBtn: TBitBtn
              Tag = 1
              Left = 28
              Top = 95
              Width = 251
              Height = 38
              Caption = #1052#1072#1088#1082#1080#1088#1086#1074#1072#1090#1100' '#1074#1089#1077
              TabOrder = 2
              OnClick = MarkAllTovarBitBtnClick
            end
            object ClrMarkCurTovarBitBtn: TBitBtn
              Left = 29
              Top = 139
              Width = 251
              Height = 39
              Caption = #1057#1090#1077#1088#1077#1090#1100' '#1084#1072#1088#1082#1080#1088#1086#1074#1082#1091
              TabOrder = 3
              OnClick = ClrMarkCurTovarBitBtnClick
            end
            object ClrMarkAllTovarBitBtn: TBitBtn
              Left = 28
              Top = 184
              Width = 251
              Height = 40
              Caption = #1057#1090#1077#1088#1077#1090#1100' '#1084#1072#1088#1082#1080#1088#1086#1074#1082#1091' '#1091' '#1074#1089#1077#1093
              TabOrder = 4
              OnClick = MarkAllTovarBitBtnClick
            end
            object SaleClrMarkAllTovarBitBtn: TBitBtn
              Left = 34
              Top = 423
              Width = 251
              Height = 40
              Caption = #1057#1090#1077#1088#1077#1090#1100' '#1084#1072#1088#1082#1080#1088#1086#1074#1082#1091' '#1091' '#1074#1089#1077#1093
              TabOrder = 5
              OnClick = SaleMarkAllTovarBitBtnClick
            end
            object SaleClrMarkCurTovarBitBtn: TBitBtn
              Left = 33
              Top = 378
              Width = 251
              Height = 39
              Caption = #1057#1090#1077#1088#1077#1090#1100' '#1084#1072#1088#1082#1080#1088#1086#1074#1082#1091
              TabOrder = 6
              OnClick = SaleClrMarkCurTovarBitBtnClick
            end
            object SaleMarkAllTovarBitBtn: TBitBtn
              Tag = 1
              Left = 34
              Top = 334
              Width = 251
              Height = 38
              Caption = #1052#1072#1088#1082#1080#1088#1086#1074#1072#1090#1100' '#1074#1089#1077
              TabOrder = 7
              OnClick = SaleMarkAllTovarBitBtnClick
            end
            object SaleMarkCurTovarBitBtn: TBitBtn
              Left = 33
              Top = 291
              Width = 251
              Height = 37
              Caption = #1052#1072#1088#1082#1080#1088#1086#1074#1072#1090#1100
              TabOrder = 8
              OnClick = SaleMarkCurTovarBitBtnClick
            end
            object ColorBox2: TColorBox
              Left = 33
              Top = 263
              Width = 251
              Height = 22
              Style = [cbStandardColors, cbPrettyNames]
              TabOrder = 9
            end
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1166
        Height = 57
        Align = alTop
        TabOrder = 1
        DesignSize = (
          1166
          57)
        object SpeedButton1: TSpeedButton
          Left = 1126
          Top = 9
          Width = 34
          Height = 36
          Hint = #1053#1077' '#1086#1073#1085#1086#1074#1083#1103#1090#1100
          AllowAllUp = True
          Anchors = [akRight]
          GroupIndex = 1
          Flat = True
          Glyph.Data = {
            42080000424D4208000000000000420000002800000020000000200000000100
            1000030000000008000000000000000000000000000000000000007C0000E003
            00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000
            00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000EF3DEF3DEF3DEF3DEF3DEF3D
            EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75EF75EF75EF75EF75E
            F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EEF3D0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75EF75EF75EF75EF75E
            F75EFF7FFF7FFF7FF75EF75EF75EF75EF75EF75EEF3D0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75EF75EF75EF75EF75E
            F75E0000EF3DFF7FF75EF75EF75EF75EF75EF75EEF3D0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75EF75EF75EF75EF75E
            F75E0000EF3DFF7FF75EF75EF75EF75EF75EF75EEF3D0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75EF75EF75EF75EF75E
            F75E0000EF3DFF7FF75EF75EF75EF75EF75EF75EEF3D0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75EF75EF75EF75EF75E
            0000EF3DEF3D0000FF7FF75EF75EF75EF75EF75EEF3D0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75EF75EF75EF75EF75E
            0000EF3DEF3D0000FF7FF75EF75EF75EF75EF75EEF3D0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75EF75EF75EF75EF75E
            F75E00000000F75EF75EF75EF75EF75EF75EF75EEF3D0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75EF75EF75EF75EF75E
            F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EEF3D0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75EF75EF75EF75EF75E
            F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EEF3D0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FF75E0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75EF75EF75EF75EF75E
            F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FEF3D00000000EF3D
            F75EF75EF75EF75EF75EEF3D00000000EF3DF75E0000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000F75EEF3DFF7FF75E0000
            F75EF75EF75EF75EF75EEF3DFF7FF75E0000F75E0000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FF75E0000
            EF3D000000000000EF3D0000FF7FF75E00000000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75E0000
            FF7FFF7FFF7FFF7FFF7F0000FF7FF75E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75E0000
            FF7FFF7FFF7FFF7FFF7F0000FF7FF75E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75E0000
            FF7FFF7FFF7FFF7FFF7F0000FF7FF75E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FF75EEF3D
            0000FF7FFF7FFF7F0000FF7FF75EF75E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FF75E
            F75E000000000000FF7FF75EF75EEF3D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            F75EF75EF75EF75EF75EF75EEF3D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
            FF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F}
          ParentShowHint = False
          ShowHint = True
          ExplicitLeft = 1240
        end
        object CodeForVendBtn: TSpeedButton
          Left = 208
          Top = 9
          Width = 26
          Height = 35
          AllowAllUp = True
          GroupIndex = 10
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACC18E97B46D97B46DACC1
            8EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1
            CEAF8CAE5C82A84C82A84C82A84C82A84C8CAE5CC1CEAFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF8CAE5C82A84C82A84CFFFFFFE3ECD882A8
            4C82A84C8CAE5CFF00FFFF00FF939393787878787878888888FF00FFACC18E82
            A84C82A84C82A84CFFFFFFE3ECD882A84C82A84C82A84CACC18EFF00FF7B7B7B
            FFFFFFB3783EBA8857FF00FF97B46D82A84CE3ECD8E3ECD8FFFFFFE3ECD8E3EC
            D8E3ECD882A84C97B46DFF00FF7B7B7BFFFFFFB3783EBB8B5CFF00FF97B46D82
            A84CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF82A84C97B46DFF00FF7B7B7B
            FFFFFFB3783EFAFAFAFF00FFACC18E82A84C82A84C82A84CFFFFFFE3ECD882A8
            4C82A84C82A84CACC18EFF00FF7B7B7BFFFFFFB3783EB67E47D5C6B8FF00FF8C
            AE5C82A84C82A84CFFFFFFE3ECD882A84C82A84C8CAE5CFF00FFFF00FF7B7B7B
            FFFFFFB3783EB3783EB98654FF00FFC1CEAF8CAE5C82A84C82A84C82A84C82A8
            4C8CAE5CC1CEAFFF00FFFF00FF7B7B7BFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FF
            00FFFF00FFACC18E97B46D97B46DACC18EFF00FFFF00FFFF00FFFF00FFBDAB9A
            DBBEA1DFC8B0E2CDB7E2CCB7D3B191E4D4C5FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFB57C44AE6D2DE4D0BCD1AE8BAE7032C99F77F2E9DFC9
            9F77AE7032DBC3ADDFCBB6B6804AB88A5BFF00FFFF00FFFF00FFB57C45AD6D2F
            FFFFFFEAD9C9AE7033E0C9B3FFFFFFE0C9B3AE7033F9F5F1F8F2EEAD6F31B782
            4EFF00FFFF00FFFF00FFD0BBA6AE7032EADBCCFEFEFFAD6F30D8BB9DFFFFFFD8
            BB9DAE7032FFFFFFD9BB9EAF7236FF00FFFF00FFFF00FFFF00FFFF00FFB1773D
            CAA37BFFFFFFAE6F32CBA47DFFFFFFCBA47DB07337FFFFFFB9824EB5824FFF00
            FFFF00FFFF00FFFF00FFFF00FFCDB69FB47A41B17539B57D47B47A40B17539B5
            7C43B57F46B17439B57D44FF00FFFF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphBottom
          OnClick = CodeForVendBtnClick
        end
        object GroupBox1: TGroupBox
          Left = 361
          Top = 0
          Width = 347
          Height = 45
          Caption = ' '#1055#1086#1080#1089#1082'[PLU '#1082#1086#1076']: '
          TabOrder = 7
          object FindTBtn: TSpeedButton
            Left = 255
            Top = 15
            Width = 21
            Height = 21
            Enabled = False
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888888888800000888880000080F000888880F00080F000888880F
              0008000000080000000800F000000F00000800F000800F00000800F000800F00
              00088000000000000088880F00080F0008888800000800000888888000888000
              88888880F08880F0888888800088800088888888888888888888}
            ParentShowHint = False
            ShowHint = True
            OnClick = FindTBtnClick
          end
          object SpeedButton2: TSpeedButton
            Left = 299
            Top = 15
            Width = 21
            Height = 21
            Hint = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000120B0000120B00001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777777777777777777777777777777777777777777770777777777777770
              007777777777770000077700000007700077770FF7FF07700077000F7F770770
              00770F0FFFFF070008770F044444077777770F00000007777777044444077777
              7777000000077777777777777777777777777777777777777777}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton2Click
          end
          object SpeedButton3: TSpeedButton
            Left = 278
            Top = 15
            Width = 21
            Height = 21
            Hint = #1057#1083#1077#1078#1077#1085#1080#1077' '#1079#1072' '#1073#1091#1092#1077#1088#1086#1084' '#1086#1073#1084#1077#1085#1072
            AllowAllUp = True
            GroupIndex = 21
            Flat = True
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDD0000000DDDDD000DDDDD000D0000000DDDDD070DDDDD070D0000000DDDD
              D0008DDD8000D0000000DDDDD00000000000D0000000D444407000070000D000
              0000D4FFF07000070000D0000000D4F8800000000000D0000000D4FFFF000070
              000DD0000000D4F88F80088F00DDD0000000D4FFFFF00FFF00DDD0000000D4F8
              8F80088F00DDD0000000D4FFFFFFFFFF4DDDD0000000D444444444444DDDD000
              0000D474474474474DDDD0000000D444444444444DDDD0000000DDDDDDDDDDDD
              DDDDD0000000}
            ParentShowHint = False
            ShowHint = True
          end
          object SpeedButton4: TSpeedButton
            Left = 323
            Top = 15
            Width = 21
            Height = 21
            Hint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103' '#1087#1086#1080#1089#1082#1072
            AllowAllUp = True
            GroupIndex = 12
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888880088888888888887B0088888888888887B008888888888887FB0
              08888888888887FB008888888880000FB00888888887FBBBBB00888800087FB0
              08888888060887FB00888888080887FBB00888880808887FBB00888088608887
              FBB08808888608888888806FF888608888880000000000088888}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton4Click
          end
          object FindEdit: TEdit
            Left = 5
            Top = 16
            Width = 249
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
            OnChange = FindEditChange
            OnKeyDown = FindEditKeyDown
            OnKeyPress = FindEditKeyPress
          end
        end
        object LMDButton1: TBitBtn
          Left = 7
          Top = 9
          Width = 26
          Height = 35
          Hint = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1080
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555550000555555555557555555550000555555555A777555555500005555
            5555A2A775555555000055555555A2A77755555500005555555A222A77555555
            00005555555A222A777555550000555555A22222A7775555000055555A222222
            2A775555000055555A2222222A77755500005555A222222222A7755500005555
            AAA22222AAA555550000555555A22222A77555550000555555A22222A7755555
            0000555555A22222A77555550000555555A22222A77555550000555555A22222
            A77555550000555555A22222A77555550000555555A22222A775555500005555
            55AAAAAAA55555550000}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = LMDButton1Click
        end
        object BitBtn1: TBitBtn
          Left = 33
          Top = 9
          Width = 26
          Height = 35
          Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1086#1089#1084#1072#1090#1088#1080#1074#1072#1077#1084#1099#1093' '#1082#1086#1083#1086#1085#1086#1082
          Glyph.Data = {
            B6030000424DB603000000000000360000002800000012000000100000000100
            1800000000008003000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF0000000000000000000000000000000000000000000000FF
            00FFFF00FFFF00FFFF00FF000000000000000000000000000000000000000000
            0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF
            FF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFF
            800000800000800000FFFFFF000000FF00FF808080000000FF00FF000000FFFF
            FF800000800000800000FFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF000000FF00FF000000000000FF00FF000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF0000000000000000FFFFFF800000800000800000FFFFFF000000FF
            00FF000000000000FF00FF000000FFFFFF800000800000800000FFFFFF000000
            0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF000000
            FF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFF
            800000800000800000FFFFFF000000FF00FFFF00FFFF00FFFF00FF000000FFFF
            FF800000800000800000FFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF000000FF00FF000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFF000000000000000000FF
            00FF000000000000FF00FF000000FFFFFFFFFFFFFFFFFF000000000000000000
            0000000000FFFFFFFFFFFFFFFFFF000000C8D0D4000000FF00FF000000000000
            FF00FF000000FFFFFFFFFFFFFFFFFF000000C8D0D40000000000000000FFFFFF
            FFFFFFFFFFFF000000000000FF00FFFF00FF000000808080FF00FF000000FFFF
            FFFFFFFFFFFFFF000000000000FF00FF00000000000000000000000000000000
            00FF00FFFF00FFFF00FF808080FF00FFFF00FF00000000000000000000000000
            0000FF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BitBtn1Click
          OnKeyDown = BarCodeEditKeyDown
        end
        object BitBtn2: TBitBtn
          Left = 58
          Top = 9
          Width = 26
          Height = 35
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
          OnClick = BitBtn2Click
        end
        object MoveTovarBtn: TBitBtn
          Tag = 1
          Left = 83
          Top = 9
          Width = 26
          Height = 35
          Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1087#1086' '#1082#1086#1076#1091
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            06020000424D0602000000000000760000002800000028000000140000000100
            0400000000009001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFFFFF333FFFFF3330000000033300000333377777777F337777
            7FF330EFEFEF03307333703337F3FFFF7F37733377F330F4444E033333333033
            37F777737F333333F7F33099999903333330703337F333337F33333777FF309F
            FFF903333330000337F333337F33333777733099999903333330003337F3FF3F
            7F333337773330F44E0003333330033337F7737773333337733330EFEF003333
            3330333337FFFF7733333337333330000003333333333333377777733333FFFF
            FFFF3333333333300000000333333F3333377777777F333303333330EFEFEF03
            33337F333337F3FFFF7F333003333330F4444E0333377F333337F777737F3300
            03333330EFEFEF0333777F333337F3FFFF7F300003333330F4444E0337777F33
            3337F777737F330703333330EFEFEF03337773333337F3FF3F7F330333333330
            F44E0003337FF333FF37F7737773330733370330EFEF00333377FFF77337FFFF
            7733333000003330000003333337777733377777733333333333333333333333
            33333333333333333333}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = MoveTovarBtnClick
        end
        object BitBtn8: TBitBtn
          Tag = 1
          Left = 108
          Top = 9
          Width = 26
          Height = 35
          Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1088#1077#1079#1077#1088#1074#1072
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
            0EEE333377777777777733330FF00FBFB0EE33337F37733F377733330F0BFB0B
            FB0E33337F73FF73337733330FF000BFBFB033337F377733333733330FFF0BFB
            FBF033337FFF733F333733300000BF0FBFB03FF77777F3733F37000FBFB0F0FB
            0BF077733FF7F7FF7337E0FB00000000BF0077F377777777F377E0BFBFBFBFB0
            F0F077F3333FFFF7F737E0FBFB0000000FF077F3337777777337E0BFBFBFBFB0
            FFF077F3333FFFF73FF7E0FBFB00000F000077FF337777737777E00FBFBFB0FF
            0FF07773FFFFF7337F37003000000FFF0F037737777773337F7333330FFFFFFF
            003333337FFFFFFF773333330000000003333333777777777333}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnClick = BitBtn8Click
        end
        object NewTovarAddBtn: TBitBtn
          Tag = 1
          Left = 133
          Top = 9
          Width = 26
          Height = 35
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1090#1086#1074#1072#1088
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            42010000424D4201000000000000760000002800000011000000110000000100
            040000000000CC00000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            777770000000000000077777777770000000FFFFFF077777777770000000FFFF
            FF077777777770000000FFFFFF07777777777000000000000007777777777000
            0000777777774770000070000000777777744770EFEF70000000777777444440
            FEFE70000000777777744770EFEF700000007777777747700000700000000000
            00077777777770000000FFFFFF077777777770000000FFFFFF07777777777000
            0000FFFFFF077777777770000000000000077777777770000000777777777777
            777770000000}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = NewTovarAddBtnClick
        end
        object EditTovarBtn: TBitBtn
          Tag = 2
          Left = 158
          Top = 9
          Width = 26
          Height = 35
          Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1090#1086#1074#1072#1088#1077
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
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
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = NewTovarAddBtnClick
        end
        object ZakazTovarBtn: TBitBtn
          Tag = 1
          Left = 183
          Top = 9
          Width = 26
          Height = 35
          Hint = #1047#1072#1082#1072#1079', '#1085#1086#1088#1084#1099' '#1086#1089#1090#1072#1090#1082#1086#1074
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888870777700888888888888887078888888111111807888888800110010078
            8888899999911017888880999999110170888800000010301078888E66666033
            007888800000000330078880999990B033088888000003BB0337888888880300
            00378888888880BBBB0788888888888888888888888888888888}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = ZakazTovarBtnClick
        end
        object BitBtn6: TBitBtn
          Tag = 1
          Left = 233
          Top = 9
          Width = 26
          Height = 35
          Hint = #1055#1088#1086#1094#1077#1085#1090' '#1072#1089#1089#1086#1088#1090#1080#1084#1077#1085#1090#1072
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888888800888880008888888008880080088888880088008
            0088888888008800088888888880088888888888888800888888888800088008
            8888888008008800888888800800888008888888000888888888080888888888
            8080080888888888808008088888888880808888888888888888}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          OnClick = BitBtn6Click
        end
        object BitBtn9: TBitBtn
          Tag = 1
          Left = 259
          Top = 9
          Width = 26
          Height = 35
          Hint = #1053#1072#1081#1090#1080'  '#1074' '#1040#1042#1058#1054#1050#1040#1058#1040#1051#1054#1043#1045
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            42010000424D4201000000000000760000002800000011000000110000000100
            040000000000CC00000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDD0000000DDDDDDDDDDDDDDDDD0000000DD00000000000DDDD0000000DD0F
            FFFFFFFF0DDDD0000000DD0F0000000F0DDDD0000000DD0FFFFFFFFF0DD4D000
            0000DD0F00000FFF8D4DD0000000DD0FFFFFFF4F74DDD0000000DD0F00000F44
            4DDDD0000000DD0FFFFFFF444DDDD0000000DD0FF0000F4444DDD0000000DD0F
            FFFFFFFFDDDDD0000000DD0F0000000F0DDDD0000000DD0FFFFFFFFF0DDDD000
            0000DD00000000000DDDD0000000DDDDDDDDDDDDDDDDD0000000DDDDDDDDDDDD
            DDDDD0000000}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          OnClick = itBtn9Click
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #1043#1088#1091#1087#1087#1099' '#1090#1086#1074#1072#1088#1086#1074
      ImageIndex = 4
      object Label5: TLabel
        Left = 480
        Top = 16
        Width = 145
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1085#1086#1081' '#1075#1088#1091#1087#1087#1099' :'
      end
      object Label6: TLabel
        Left = 480
        Top = 64
        Width = 85
        Height = 13
        Caption = #1059#1095#1105#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072' :'
      end
      object EditGrBtn: TBitBtn
        Tag = 2
        Left = 480
        Top = 168
        Width = 185
        Height = 41
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF4047402020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020404740000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000303030404740000000FFFFFFFFFFFFFFFFFF6088CF
          00008F00478F00478F00478F00478F00478F00478F00478F00478F00678F0047
          8F40478F00478F00679F00478F40478F00678F00679F40478F40678F00478F40
          679F00678F40678F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFFF
          00478F30578F0020402020400020401030400020402020400020401030400020
          4020205020204010304020204020204000204020304000204020205020204010
          304020204040679F000000303030404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          00478F00478FCFCFDFCFCFCFCFCFDFCFCFDFCFCFCFCFCFCFCFCFCFCFCFDFCFCF
          CFCFCFCFCFCFCFCFDFDFCFDFCFDFCFCFCFDFCFCFDFCFDFDFCFDFDFCFCFDFCFDF
          DFCF00104040478F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          00478F40578FCFCFDFEFEFDFCFCFCFEFDFDFCFCFDFDFEFCFCFCFCFEFDFDFCFCF
          CFDFEFCFCFCFCFEFDFDFCFCFCFDFEFCFCFCFCFEFDFDFCFDFCFDFEFCFDFDFCFEF
          DFCF00204040678F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          00470000578FCFCFDFEFCFDFCFCFDFCFCFDF4047406047404047004010000047
          00404700404700504740404740404740404740405740404740404740CFCFCFCF
          DFCF00104040478F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFFF
          30578F30578FCFCFCFEFDFDFCFCFCFDFEFDF000000EFDFEF0000001030308F88
          8F8F888F0088008F988FAF98AFDFCFCFCFDFDFDFDFCFDFDFDFDFDFDFDFDFCFDF
          DFCF10104040579F000000303030404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          00470030578FCFCFCFEFCFCFEFCFDFCFCFDF4047404047404047400000000000
          00000000000000100010000010001000000020100000400000404740CFCFCFCF
          DFCF00004040478F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          30570040578FEFEFCFEFEFDFEFEFDFEFEFDFEFCFDFEFEFDFEFEFDF8F88AF3047
          70DFEFDF0000006067604047504047304047005057500000009F988F8F88AFDF
          DFCF00204040678F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          304700305700EFCFCFEFEFCFCFCFCFCFEFDF000000EFCFCFCFCFCFAFA89F2020
          0030308F00000000000000300030003000000000201000000040471000000000
          2000102000004700000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          305700305770EFEFCFEFDFEFEFEFCFEFEFDF4047406047404047405057402000
          0020304070DFEF8FA8EF00000060474050474050473000302030202050474030
          4730001000202040000000303030404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          305700205700EFEFCFEFEFCFEFEFCFEFEFCF200000EFCFCFEFEFCF4047402000
          0060474020200070DFEF000000000000200040CFCFDFCFCFCFAF988F8F880020
          2020100000002000000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          30577030578FEFEFCFEFFFDFEFEFCFEFEFEFEFEFCFEFEFDFEFEFCFEFEFEFEFEF
          DFEFEFDFEFEFDF20304070DFEF8FA8EF000000EFEFDFCFCFDFEFEFDFCFEFDFEF
          DFDF000040205760000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          204700305770EFEFEFEFEFCFEFEFCFEFEFCF4047406047404047404047404047
          40604740404740AFA88F20204070DFEF000000000000000040604740CFCFDFCF
          EFDF00004000478F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFFF
          205700205770EFEFEFEFEFEFEFEFEFEFEFEF200020EFEFEFEFEFEFAFA89F4047
          40BF989FAF889FAFA89F20000020304070DFEF8FA8EF000000EFDFEFCFCFCFDF
          EFDF00104030578F000000303030404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          204700305770EFEFCFEFEFEFEFEFCFEFEFEF4047406047404047404047404047
          4060474040474040474040474060474020200070DFEF000000000000200040CF
          EFDF000040304700000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          305770304770EFEFEFEFFFEFEFEFEFFFEFEFEFEFEFEFFFEFEFEFCFFFEFEFEFEF
          CFEFEFDFEFEFCFEFEFEFEFEFCFEFEFDFEFEFCF20304070DFEF8FA8EF000000EF
          EFEF20204030678F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          204770205770EFEFEFEFEFEFEFEFEFEFEFEF200020EFEFCFEFEFEF4047404047
          40AF989FAF888FAFA88F404740604740AF888FAFA88F20204070DFEF00000000
          0000002040304700000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          204770205770EFEFEFFFEFFFEFEFEFEFEFEF4047406047404047405057404047
          4060474040474050574040474060474040474050574040474020304070DFEF8F
          A8EF00000030578F000000303030404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          204760204770EFEFEFEFEFEFEFEFEFCFCFCFCFCFCFEFEFEFEFEFEFEFEFEFEFEF
          EFEFEFEFEFEFEFEFEFEFEFEFCFEFEFCFEFEFCFEFEFEFEFEFCFEFEFCF20204070
          DFEF000000000000000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          204760305770EFEFEFEFFFEFCFCFCF404740102010EFFFEFEFEFEFFFEFEFEFEF
          EFEFFFEFEFEFEFFFEFEFEFEFEFEFEFDFEFEFCFEFEFEFEFEFCFEFFFDFEFEFCF20
          304070DFEF8FA8EF000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          204760204770EFEFEFEFEFEF000000000000000000000000CFCFCFEFEFEFEFEF
          EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFEFEFEFEF
          EFCF200040604740000000000000000000000000FFFFFFFFFFFFFFFFFFEFEFFF
          204770205760EFEFEFFFEFFF000000107750000000300030708870EFFFEFEFEF
          EFFFEFFFEFEFEFEFEFEFEFEFEFEFEFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
          EFEF002020604740BF989F505740000000000000FFFFFFFFFFFFFFFFFFCFEFEF
          204760204760EFEFEFFFEFEF100010000000004740002000202020AFA8AFAFA8
          AFAFA8AFAFA8AFAFA8AFAFA8AFAFA8AFAFA8AFAFA8AFAFA8AFAFA8AFAFA88FAF
          A8AF002000305700204740BFA89F000000000000FFFFFFFFFFFFFFFFFFEFEFEF
          204760304770FFFFEFFFFFEF8F888F6057602020207077708F88008F888F8F88
          8F8F88708F888F8F888F8F88008F88708F88008F888F8F88008F88708F8800BF
          A8BF20204030577000000060474020008F20209F000000FFFFFFFFFFFFCFEFEF
          204760204760EFEFEF0000201000000010100000001010000000000010100010
          00000000001000001010000000101000000000001010001000101000000000AF
          A8AF00200030470000000030303000000020009F000000FFFFFFFFFFFFEFEFEF
          204760204760FFFFFF403030DFCFCFCFCFCFCF888FCFB8BFBFA8BFBFB8AFAFA8
          8FBF98AFAF889FAF988F8F988FAF888F9F888F9F988F8F888F504740000000AF
          B8AF002020304770000000404740000000000000FFFFFFFFFFFFFFFFFFEFCFEF
          204760204760204760004720400000403030400030403030403030EFDFDF8F88
          8F8F889F8F888F8FB8AF00200020102000200000001000000000001000475020
          5770204770304770000000404740000000000000FFFFFFFFFFFFFFFFFFDFEFEF
          204760204760204760205760204760304760204760205760004730FFFFFF0000
          00605740BFB8AFCFB8AF20201020576020476030577020476030576020576030
          4770305770205760000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000
          2000202047602047602047602047602047602047602047602047604020204047
          1000000000000000001020002020476020476020476020476020476020476020
          4760204760204760000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000000000000000000000000000000000000000000000000000000000000000
          0040303040003000000000000000000000000000000000000000000000000000
          0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        TabOrder = 0
        OnClick = AddGrBtnClick
      end
      object AddGrBtn: TBitBtn
        Tag = 1
        Left = 480
        Top = 120
        Width = 185
        Height = 41
        Cursor = crHandPoint
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000000000000000000000000000000000000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          00000000000000000000000000000000000000000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000000000000000000
          0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000000000000000000000000000000000000000000000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000000000000000000
          0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000000000000000000000000000000000000000000000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000000000000000000
          0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        TabOrder = 1
        OnClick = AddGrBtnClick
      end
      object TGroupGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 449
        Height = 587
        Align = alLeft
        DataSource = DataSource5
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = TGroupGridDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'GROUP_NAME'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099
            Width = 225
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACOUNT_NAME'
            Title.Alignment = taCenter
            Title.Caption = #1059#1095#1105#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
            Width = 200
            Visible = True
          end>
      end
      object GrNameEdit: TEdit
        Left = 480
        Top = 32
        Width = 185
        Height = 21
        Cursor = crIBeam
        AutoSelect = False
        AutoSize = False
        Color = clWhite
        MaxLength = 20
        TabOrder = 3
        OnChange = GrNameEditChange
      end
      object ComboBox2: TComboBox
        Left = 480
        Top = 80
        Width = 185
        Height = 22
        Style = csOwnerDrawFixed
        Sorted = True
        TabOrder = 4
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1059#1095#1105#1090#1085#1099#1077' '#1075#1088#1091#1087#1087#1099
      ImageIndex = 2
      object Label1: TLabel
        Left = 432
        Top = 16
        Width = 137
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1095#1105#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099' :'
      end
      object Label7: TLabel
        Left = 432
        Top = 56
        Width = 111
        Height = 13
        Caption = #1059#1095#1105#1090' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1080' :'
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 387
        Height = 587
        Align = alLeft
        DataSource = DataSource3
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid2DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ACOUNT_NAME'
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 210
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACOUNT_TYPE_NAME'
            Title.Alignment = taCenter
            Title.Caption = #1057#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100
            Visible = True
          end>
      end
      object BitBtn3: TBitBtn
        Tag = 1
        Left = 432
        Top = 96
        Width = 185
        Height = 41
        Cursor = crHandPoint
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000000000000000000000000000000000000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          00000000000000000000000000000000000000000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000000000000000000
          0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000000000000000000000000000000000000000000000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000000000000000000
          0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000000000000000000000000000000000000000000000000000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000000000000000000
          0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        TabOrder = 1
        OnClick = BitBtn3Click
      end
      object BitBtn4: TBitBtn
        Tag = 2
        Left = 432
        Top = 144
        Width = 185
        Height = 41
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF4047402020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020404740000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000303030404740000000FFFFFFFFFFFFFFFFFF6088CF
          00008F00478F00478F00478F00478F00478F00478F00478F00478F00678F0047
          8F40478F00478F00679F00478F40478F00678F00679F40478F40678F00478F40
          679F00678F40678F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFFF
          00478F30578F0020402020400020401030400020402020400020401030400020
          4020205020204010304020204020204000204020304000204020205020204010
          304020204040679F000000303030404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          00478F00478FCFCFDFCFCFCFCFCFDFCFCFDFCFCFCFCFCFCFCFCFCFCFCFDFCFCF
          CFCFCFCFCFCFCFCFDFDFCFDFCFDFCFCFCFDFCFCFDFCFDFDFCFDFDFCFCFDFCFDF
          DFCF00104040478F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          00478F40578FCFCFDFEFEFDFCFCFCFEFDFDFCFCFDFDFEFCFCFCFCFEFDFDFCFCF
          CFDFEFCFCFCFCFEFDFDFCFCFCFDFEFCFCFCFCFEFDFDFCFDFCFDFEFCFDFDFCFEF
          DFCF00204040678F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          00470000578FCFCFDFEFCFDFCFCFDFCFCFDF4047406047404047004010000047
          00404700404700504740404740404740404740405740404740404740CFCFCFCF
          DFCF00104040478F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFFF
          30578F30578FCFCFCFEFDFDFCFCFCFDFEFDF000000EFDFEF0000001030308F88
          8F8F888F0088008F988FAF98AFDFCFCFCFDFDFDFDFCFDFDFDFDFDFDFDFDFCFDF
          DFCF10104040579F000000303030404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          00470030578FCFCFCFEFCFCFEFCFDFCFCFDF4047404047404047400000000000
          00000000000000100010000010001000000020100000400000404740CFCFCFCF
          DFCF00004040478F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          30570040578FEFEFCFEFEFDFEFEFDFEFEFDFEFCFDFEFEFDFEFEFDF8F88AF3047
          70DFEFDF0000006067604047504047304047005057500000009F988F8F88AFDF
          DFCF00204040678F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          304700305700EFCFCFEFEFCFCFCFCFCFEFDF000000EFCFCFCFCFCFAFA89F2020
          0030308F00000000000000300030003000000000201000000040471000000000
          2000102000004700000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          305700305770EFEFCFEFDFEFEFEFCFEFEFDF4047406047404047405057402000
          0020304070DFEF8FA8EF00000060474050474050473000302030202050474030
          4730001000202040000000303030404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          305700205700EFEFCFEFEFCFEFEFCFEFEFCF200000EFCFCFEFEFCF4047402000
          0060474020200070DFEF000000000000200040CFCFDFCFCFCFAF988F8F880020
          2020100000002000000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          30577030578FEFEFCFEFFFDFEFEFCFEFEFEFEFEFCFEFEFDFEFEFCFEFEFEFEFEF
          DFEFEFDFEFEFDF20304070DFEF8FA8EF000000EFEFDFCFCFDFEFEFDFCFEFDFEF
          DFDF000040205760000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          204700305770EFEFEFEFEFCFEFEFCFEFEFCF4047406047404047404047404047
          40604740404740AFA88F20204070DFEF000000000000000040604740CFCFDFCF
          EFDF00004000478F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFFF
          205700205770EFEFEFEFEFEFEFEFEFEFEFEF200020EFEFEFEFEFEFAFA89F4047
          40BF989FAF889FAFA89F20000020304070DFEF8FA8EF000000EFDFEFCFCFCFDF
          EFDF00104030578F000000303030404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          204700305770EFEFCFEFEFEFEFEFCFEFEFEF4047406047404047404047404047
          4060474040474040474040474060474020200070DFEF000000000000200040CF
          EFDF000040304700000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          305770304770EFEFEFEFFFEFEFEFEFFFEFEFEFEFEFEFFFEFEFEFCFFFEFEFEFEF
          CFEFEFDFEFEFCFEFEFEFEFEFCFEFEFDFEFEFCF20304070DFEF8FA8EF000000EF
          EFEF20204030678F000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          204770205770EFEFEFEFEFEFEFEFEFEFEFEF200020EFEFCFEFEFEF4047404047
          40AF989FAF888FAFA88F404740604740AF888FAFA88F20204070DFEF00000000
          0000002040304700000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          204770205770EFEFEFFFEFFFEFEFEFEFEFEF4047406047404047405057404047
          4060474040474050574040474060474040474050574040474020304070DFEF8F
          A8EF00000030578F000000303030404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          204760204770EFEFEFEFEFEFEFEFEFCFCFCFCFCFCFEFEFEFEFEFEFEFEFEFEFEF
          EFEFEFEFEFEFEFEFEFEFEFEFCFEFEFCFEFEFCFEFEFEFEFEFCFEFEFCF20204070
          DFEF000000000000000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          204760305770EFEFEFEFFFEFCFCFCF404740102010EFFFEFEFEFEFFFEFEFEFEF
          EFEFFFEFEFEFEFFFEFEFEFEFEFEFEFDFEFEFCFEFEFEFEFEFCFEFFFDFEFEFCF20
          304070DFEF8FA8EF000000202020404740000000FFFFFFFFFFFFFFFFFFEFEFEF
          204760204770EFEFEFEFEFEF000000000000000000000000CFCFCFEFEFEFEFEF
          EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFEFEFEFEF
          EFCF200040604740000000000000000000000000FFFFFFFFFFFFFFFFFFEFEFFF
          204770205760EFEFEFFFEFFF000000107750000000300030708870EFFFEFEFEF
          EFFFEFFFEFEFEFEFEFEFEFEFEFEFEFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
          EFEF002020604740BF989F505740000000000000FFFFFFFFFFFFFFFFFFCFEFEF
          204760204760EFEFEFFFEFEF100010000000004740002000202020AFA8AFAFA8
          AFAFA8AFAFA8AFAFA8AFAFA8AFAFA8AFAFA8AFAFA8AFAFA8AFAFA8AFAFA88FAF
          A8AF002000305700204740BFA89F000000000000FFFFFFFFFFFFFFFFFFEFEFEF
          204760304770FFFFEFFFFFEF8F888F6057602020207077708F88008F888F8F88
          8F8F88708F888F8F888F8F88008F88708F88008F888F8F88008F88708F8800BF
          A8BF20204030577000000060474020008F20209F000000FFFFFFFFFFFFCFEFEF
          204760204760EFEFEF0000201000000010100000001010000000000010100010
          00000000001000001010000000101000000000001010001000101000000000AF
          A8AF00200030470000000030303000000020009F000000FFFFFFFFFFFFEFEFEF
          204760204760FFFFFF403030DFCFCFCFCFCFCF888FCFB8BFBFA8BFBFB8AFAFA8
          8FBF98AFAF889FAF988F8F988FAF888F9F888F9F988F8F888F504740000000AF
          B8AF002020304770000000404740000000000000FFFFFFFFFFFFFFFFFFEFCFEF
          204760204760204760004720400000403030400030403030403030EFDFDF8F88
          8F8F889F8F888F8FB8AF00200020102000200000001000000000001000475020
          5770204770304770000000404740000000000000FFFFFFFFFFFFFFFFFFDFEFEF
          204760204760204760205760204760304760204760205760004730FFFFFF0000
          00605740BFB8AFCFB8AF20201020576020476030577020476030576020576030
          4770305770205760000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000
          2000202047602047602047602047602047602047602047602047604020204047
          1000000000000000001020002020476020476020476020476020476020476020
          4760204760204760000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000000000000000000000000000000000000000000000000000000000000000
          0040303040003000000000000000000000000000000000000000000000000000
          0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        TabOrder = 2
        OnClick = BitBtn3Click
      end
      object Edit1: TEdit
        Left = 432
        Top = 32
        Width = 185
        Height = 21
        Cursor = crIBeam
        AutoSelect = False
        AutoSize = False
        Color = clWhite
        MaxLength = 20
        TabOrder = 3
        OnChange = Edit1Change
      end
      object ComboBox1: TComboBox
        Left = 432
        Top = 72
        Width = 185
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 4
        Text = #1055#1086' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1079#1072#1082#1091#1087#1086#1095#1085#1086#1081
        Items.Strings = (
          #1055#1086' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1079#1072#1082#1091#1087#1086#1095#1085#1086#1081
          #1055#1086' '#1094#1077#1085#1077' '#1087#1086#1089#1090#1072#1074#1082#1080)
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 615
    Width = 1174
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 60
      end
      item
        Width = 100
      end
      item
        Width = 600
      end
      item
        Width = 50
      end>
  end
  object DataSource1: TDataSource
    DataSet = SprTovar
    OnDataChange = DataSource1DataChange
    Left = 344
    Top = 504
  end
  object DataSource2: TDataSource
    DataSet = SprTable
    Left = 376
    Top = 504
  end
  object DataSource5: TDataSource
    DataSet = SprTovarGroup
    Left = 376
    Top = 408
  end
  object DataSource7: TDataSource
    DataSet = BarCode
    Left = 312
    Top = 504
  end
  object PopupMenu1: TPopupMenu
    Left = 412
    Top = 377
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1095#1072#1089#1090#1086' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084#1099#1077
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ShortCut = 112
      OnClick = N2Click
    end
  end
  object DataSource3: TDataSource
    DataSet = SprAcountGroup
    Left = 477
    Top = 406
  end
  object PopupMenu2: TPopupMenu
    Left = 524
    Top = 192
    object FND0: TMenuItem
      AutoCheck = True
      Caption = 'PLU '#1082#1086#1076
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND1: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = #1040#1088#1090#1080#1082#1091#1083
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND2: TMenuItem
      Tag = 2
      AutoCheck = True
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND3: TMenuItem
      Tag = 3
      AutoCheck = True
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND4: TMenuItem
      Tag = 4
      AutoCheck = True
      Caption = #1044#1086#1087'.'#1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND5: TMenuItem
      Tag = 5
      AutoCheck = True
      Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND6: TMenuItem
      Tag = 6
      AutoCheck = True
      Caption = #1062#1077#1085#1072' '#1087#1088#1086#1076#1072#1078#1080
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND7: TMenuItem
      Tag = 7
      AutoCheck = True
      Caption = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND8: TMenuItem
      Tag = 8
      AutoCheck = True
      Caption = #1053#1072#1094#1077#1085#1082#1072
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND9: TMenuItem
      Tag = 9
      AutoCheck = True
      Caption = #1053#1086#1088#1084#1072' '#1085#1072#1094#1077#1085#1082#1080
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND10: TMenuItem
      Tag = 10
      AutoCheck = True
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND11: TMenuItem
      Tag = 11
      AutoCheck = True
      Caption = #1043#1088#1091#1087#1087#1072
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND12: TMenuItem
      Tag = 12
      AutoCheck = True
      Caption = #1044#1086#1087'.'#1082#1086#1076
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND13: TMenuItem
      Tag = 13
      AutoCheck = True
      Caption = #1045#1076'.'#1080#1079#1084#1077#1088#1077#1085#1080#1103
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND14: TMenuItem
      Tag = 14
      AutoCheck = True
      Caption = #1057#1077#1082#1094#1080#1103' '#1050#1050#1052
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND15: TMenuItem
      Tag = 15
      AutoCheck = True
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object FND16: TMenuItem
      Tag = 16
      AutoCheck = True
      Caption = #1057#1082#1083#1072#1076
      GroupIndex = 1
      RadioItem = True
      OnClick = FND15Click
    end
    object N3: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object N4: TMenuItem
      AutoCheck = True
      Caption = #1058#1086#1095#1085#1099#1081' '#1087#1086#1080#1089#1082
      GroupIndex = 2
      OnClick = FND15Click
    end
    object N9: TMenuItem
      AutoCheck = True
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1089#1077#1084
      GroupIndex = 3
    end
  end
  object PopupMenu3: TPopupMenu
    Images = ShopMainForm.ImageList1
    Left = 556
    Top = 193
    object Excel1: TMenuItem
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074' Excel'
      ImageIndex = 38
      OnClick = Excel1Click
    end
    object N5: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
  end
  object PopupMenu4: TPopupMenu
    Left = 587
    Top = 194
    object N7: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1081' '#1090#1086#1074#1072#1088
      OnClick = N7Click
    end
    object N10: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1081' '#1090#1086#1074#1072#1088' '#1074' '#1091#1076#1072#1083#1077#1085#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1093
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #1042#1089#1077' '#1090#1086#1074#1072#1088#1099
      OnClick = N8Click
    end
  end
  object SprTovar: TpFIBDataSet
    InsertSQL.Strings = (
      'INSERT INTO SPR_TOVAR('
      ' ITEM,'
      ' TOVAR_NAME,'
      ' T_GROUP,'
      ' VENDOR_CODE,'
      ' REMARK_1,'
      ' VEND_ITEM,'
      ' KKM_SECT,'
      ' REMARK,'
      ' ARTIKUL,'
      ' PRODUCER'
      ')'
      'VALUES('
      ' ?ITEM,'
      ' ?TOVAR_NAME,'
      ' ?T_GROUP,'
      ' ?VENDOR_CODE,'
      ' ?REMARK_1,'
      ' ?VEND_ITEM,'
      ' ?KKM_SECT,'
      ' ?REMARK,'
      ' ?ARTIKUL,'
      ' ?PRODUCER'
      ')')
    SelectSQL.Strings = (
      
        'select cast(t.item as integer)as int_item, t.item, t.tovar_name,' +
        ' t.t_group, p.sale_price, p.vend_price, p.price_1, p.price_2, p.' +
        'price_3, p.price_4, p.price_5, p.price_6, p.price_7, p.price_8, ' +
        'p.price_9, t.vendor_code, t.remark_1, t.VEND_ITEM, t.kkm_sect, t' +
        'ovar_add.big_remark, spr_group.group_name, spr_vendors.vendor_na' +
        'me, t.remark, spr_units.unit_name, spr_charge.extra_charge, t.ar' +
        'tikul, t.producer, t.marked, tovar_add.sclad, tovar_add.mark_col' +
        'or,  tovar_add.sale_mark_color, cast((((p.sale_price-p.vend_pric' +
        'e)/p.vend_price)*100)as integer)charge, (select sum(kolvo) from ' +
        'tovar_ost where item = t.item and market_code = (select obj_id f' +
        'rom inf_current_obj))kolvo, t.unit_kod UNIT_CODE ,(select sum(ko' +
        'lvo) from tovar_ost where item = t.item and market_code = 202)KO' +
        'LVO202,(select sum(kolvo) from tovar_ost where item = t.item and' +
        ' market_code = 808)KOLVO808,(select sum(kolvo) from tovar_ost wh' +
        'ere item = t.item and market_code = 303)KOLVO303,(select sum(kol' +
        'vo) from tovar_ost where item = t.item and market_code = 707)KOL' +
        'VO707,(select sum(kolvo) from tovar_ost where item = t.item and ' +
        'market_code = 404)KOLVO404,(select sum(kolvo) from tovar_ost whe' +
        're item = t.item and market_code = 606)KOLVO606,(select sum(kolv' +
        'o) from tovar_ost where item = t.item and market_code = 909)KOLV' +
        'O909,(select sum(kolvo) from tovar_ost where item = t.item and m' +
        'arket_code = 505)KOLVO505,(select sum(kolvo)from pos_rashod p1 r' +
        'ight join hdr_rashod h1 on p1.kod = h1.kod where item = t.item a' +
        'nd h1.doc_type = 12)RSRV'
      
        'FROM spr_tovar t LEFT JOIN prices p ON p.item = t.item and p.mar' +
        'ket_code = (select obj_id from inf_current_obj) LEFT JOIN spr_gr' +
        'oup ON spr_group.t_group = t.t_group LEFT JOIN spr_charge ON spr' +
        '_charge.item = t.item LEFT JOIN spr_vendors ON spr_vendors.vendo' +
        'r_code = t.vendor_code LEFT JOIN spr_units on t.unit_kod = spr_u' +
        'nits.unit_kod LEFT JOIN tovar_add ON t.item = tovar_add.item'
      '')
    AfterOpen = SprTovarAfterOpen
    AllowedUpdateKinds = [ukModify, ukInsert]
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    OnFilterRecord = SprTovarFilterRecord
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Container = DataSetsContainer1
    Left = 344
    Top = 472
    poUseBooleanField = False
    poEmptyStrToNull = False
    oFetchAll = True
    object SprTovarINT_ITEM: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'INT_ITEM'
      Origin = '"FULL_TOVAR"."INT_ITEM"'
      ProviderFlags = []
      ReadOnly = True
    end
    object SprTovarITEM: TFIBStringField
      FieldName = 'ITEM'
      Size = 14
      Transliterate = False
    end
    object SprTovarMARK_COLOR: TFIBIntegerField
      Alignment = taCenter
      FieldName = 'MARK_COLOR'
    end
    object SprTovarSALE_MARK_COLOR: TFIBIntegerField
      Alignment = taCenter
      FieldName = 'SALE_MARK_COLOR'
    end
    object SprTovarTOVAR_NAME: TFIBStringField
      FieldName = 'TOVAR_NAME'
      Size = 80
      Transliterate = False
    end
    object SprTovarREMARK: TFIBStringField
      FieldName = 'REMARK'
      Transliterate = False
    end
    object SprTovarREMARK_1: TFIBStringField
      FieldName = 'REMARK_1'
      Size = 50
      Transliterate = False
    end
    object SprTovarSCLAD: TFIBStringField
      FieldName = 'SCLAD'
      Size = 30
    end
    object SprTovarPRODUCER: TFIBStringField
      FieldName = 'PRODUCER'
      Size = 30
      Transliterate = False
    end
    object SprTovarSALE_PRICE: TFloatField
      FieldName = 'SALE_PRICE'
      Origin = '"FULL_TOVAR"."SALE_PRICE"'
      DisplayFormat = '### ### ### ##0.00'
    end
    object SprTovarPRICE_1: TFloatField
      FieldName = 'PRICE_1'
      Origin = '"FULL_TOVAR"."PRICE_1"'
      DisplayFormat = '### ### ### ##0.00'
    end
    object SprTovarPRICE_2: TFloatField
      FieldName = 'PRICE_2'
      Origin = '"FULL_TOVAR"."PRICE_2"'
      DisplayFormat = '### ### ### ##0.00'
    end
    object SprTovarPRICE_3: TFloatField
      FieldName = 'PRICE_3'
      Origin = '"FULL_TOVAR"."PRICE_3"'
      DisplayFormat = '### ### ### ##0.00'
    end
    object SprTovarPRICE_4: TFloatField
      FieldName = 'PRICE_4'
      Origin = '"FULL_TOVAR"."PRICE_4"'
      DisplayFormat = '### ### ### ##0.00'
    end
    object SprTovarPRICE_5: TFloatField
      FieldName = 'PRICE_5'
      Origin = '"FULL_TOVAR"."PRICE_5"'
      DisplayFormat = '### ### ### ##0.00'
    end
    object SprTovarPRICE_6: TFloatField
      FieldName = 'PRICE_6'
      Origin = '"FULL_TOVAR"."PRICE_6"'
      DisplayFormat = '### ### ### ##0.00'
    end
    object SprTovarPRICE_7: TFloatField
      FieldName = 'PRICE_7'
      Origin = '"FULL_TOVAR"."PRICE_7"'
      DisplayFormat = '### ### ### ##0.00'
    end
    object SprTovarPRICE_8: TFloatField
      FieldName = 'PRICE_8'
      Origin = '"FULL_TOVAR"."PRICE_8"'
      DisplayFormat = '### ### ### ##0.00'
    end
    object SprTovarPRICE_9: TFloatField
      FieldName = 'PRICE_9'
      Origin = '"FULL_TOVAR"."PRICE_9"'
      DisplayFormat = '### ### ### ##0.00'
    end
    object SprTovarVEND_PRICE: TFloatField
      FieldName = 'VEND_PRICE'
      Origin = '"FULL_TOVAR"."VEND_PRICE"'
      DisplayFormat = '### ### ### ##0.00'
    end
    object SprTovarVENDOR_CODE: TIntegerField
      FieldName = 'VENDOR_CODE'
      Origin = '"FULL_TOVAR"."VENDOR_CODE"'
      Required = True
    end
    object SprTovarVEND_ITEM: TFIBStringField
      FieldName = 'VEND_ITEM'
      Size = 14
      Transliterate = False
    end
    object SprTovarKKM_SECT: TIntegerField
      FieldName = 'KKM_SECT'
      Origin = '"FULL_TOVAR"."KKM_SECT"'
    end
    object SprTovarGROUP_NAME: TFIBStringField
      FieldName = 'GROUP_NAME'
      Size = 30
      Transliterate = False
    end
    object SprTovarVENDOR_NAME: TFIBStringField
      FieldName = 'VENDOR_NAME'
      Size = 50
      Transliterate = False
    end
    object SprTovarUNIT_NAME: TFIBStringField
      FieldName = 'UNIT_NAME'
      Size = 5
      Transliterate = False
    end
    object SprTovarEXTRA_CHARGE: TIntegerField
      FieldName = 'EXTRA_CHARGE'
      Origin = '"FULL_TOVAR"."EXTRA_CHARGE"'
      Required = True
    end
    object SprTovarARTIKUL: TFIBStringField
      FieldName = 'ARTIKUL'
      Size = 30
      Transliterate = False
    end
    object SprTovarCHARGE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'CHARGE'
      Origin = '"FULL_TOVAR"."CHARGE"'
      ProviderFlags = []
      ReadOnly = True
    end
    object SprTovarKOLVO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'KOLVO'
      Origin = '"FULL_TOVAR"."KOLVO"'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '####0.###'
    end
    object SprTovarUNIT_CODE: TFIBIntegerField
      FieldName = 'UNIT_CODE'
    end
    object SprTovarT_GROUP: TIntegerField
      FieldName = 'T_GROUP'
      Origin = '"FULL_TOVAR"."T_GROUP"'
    end
    object SprTovarMARKED: TFIBIntegerField
      FieldName = 'MARKED'
    end
  end
  object BarCode: TpFIBDataSet
    CachedUpdates = True
    SelectSQL.Strings = (
      'select * from SPR_BARCODES'
      'where ITEM = :ITEM')
    AfterOpen = BarCodeAfterOpen
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DataSource = DataSource1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Container = DataSetsContainer2
    Left = 312
    Top = 472
    WaitEndMasterScroll = True
  end
  object DataSetsContainer1: TDataSetsContainer
    Left = 346
    Top = 441
  end
  object DataSetsContainer2: TDataSetsContainer
    MasterContainer = DataSetsContainer1
    Left = 314
    Top = 442
  end
  object SprTovarGroup: TpFIBDataSet
    SelectSQL.Strings = (
      'select g.*, a.acount_name '
      
        'from spr_group g left join spr_acount a on a.kod_acount = g.kod_' +
        'acount'
      'order by g.group_name')
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Left = 376
    Top = 376
  end
  object pFIBDataSet1: TpFIBDataSet
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Left = 344
    Top = 375
  end
  object SprAcountGroup: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from spr_acount '
      'order by acount_name')
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Left = 476
    Top = 373
    object SprAcountGroupKOD_ACOUNT: TFIBIntegerField
      FieldName = 'KOD_ACOUNT'
    end
    object SprAcountGroupACOUNT_NAME: TFIBStringField
      FieldName = 'ACOUNT_NAME'
      Transliterate = False
      EmptyStrToNull = True
    end
    object SprAcountGroupACOUNT_TYPE: TFIBIntegerField
      FieldName = 'ACOUNT_TYPE'
    end
    object SprAcountGroupACOUNT_TYPE_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'ACOUNT_TYPE_NAME'
      OnGetText = SprAcountGroupACOUNT_TYPE_NAMEGetText
      Size = 25
      Calculated = True
    end
  end
  object SprTable: TpFIBDataSet
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Left = 376
    Top = 470
  end
  object frxReport2: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.Compressed = True
    ReportOptions.CreateDate = 38524.087242071800000000
    ReportOptions.LastChange = 44362.596795300920000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      '     FIBQuery1.SQL[FIBQuery1.SQL.Count - 2]:= SELECT_OPT;'
      '     FIBQuery2.SQL[FIBQuery2.SQL.Count - 2]:= SELECT_OPT;'
      '     FIBQuery3.SQL[FIBQuery3.SQL.Count - 2]:= SELECT_OPT;'
      '     DateEdit1.Date:= Date - 30;'
      
        '     DateEdit2.Date:= Date;                                     ' +
        ' '
      'end.')
    OnBeforePrint = frxReport2BeforePrint
    OnStartReport = 'frxReport1OnStartReport'
    OnStopReport = 'frxReport1OnStopReport'
    Left = 320
    Top = 212
    Datasets = <
      item
        DataSet = frxReport2.FIBQuery1
        DataSetName = 'FIBQuery1'
      end
      item
        DataSet = frxReport2.FIBQuery2
        DataSetName = 'FIBQuery2'
      end
      item
        DataSet = frxReport2.FIBQuery3
        DataSetName = 'FIBQuery3'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object FIBQuery1: TfrxFIBQuery
        UserName = 'FIBQuery1'
        CloseDataSource = True
        BCDToCurrency = False
        DataSetOptions = []
        IgnoreDupParams = False
        Params = <
          item
            Name = 'BD'
            DataType = ftDate
            Expression = 'DateEdit1.Date'
          end
          item
            Name = 'ED'
            DataType = ftDate
            Expression = 'DateEdit2.Date'
          end>
        SQL.Strings = (
          
            'select sum(p.kolvo * p.price) SUM_PRICE, sum(p.kolvo * p.vend_pr' +
            'ice) SUM_VEND'
          'from pos_prihod p left join hdr_prihod h on h.kod = p.kod'
          'where h.doc_type = 1'
          'and h.doc_date between :BD and :ED'
          'and p.item in (select t.item from full_tovar t   '
          ''
          ')')
        pLeft = 60
        pTop = 20
        Parameters = <
          item
            Name = 'BD'
            DataType = ftDate
            Expression = 'DateEdit1.Date'
          end
          item
            Name = 'ED'
            DataType = ftDate
            Expression = 'DateEdit2.Date'
          end>
      end
      object FIBQuery2: TfrxFIBQuery
        UserName = 'FIBQuery2'
        CloseDataSource = True
        BCDToCurrency = False
        DataSetOptions = []
        IgnoreDupParams = False
        Params = <
          item
            Name = 'BD'
            DataType = ftDate
            Expression = 'DateEdit1.Date'
          end
          item
            Name = 'ED'
            DataType = ftDate
            Expression = 'DateEdit2.Date'
          end>
        SQL.Strings = (
          
            'select sum(p.sale_price * p.kolvo)SUM_PRICE, sum(p.vend_price * ' +
            'p.kolvo)VEND_SUM'
          'from pos_sales p'
          'where p.sale_date between :BD and :ED'
          'and p.item in (select t.item from full_tovar t   '
          ''
          ')')
        pLeft = 124
        pTop = 20
        Parameters = <
          item
            Name = 'BD'
            DataType = ftDate
            Expression = 'DateEdit1.Date'
          end
          item
            Name = 'ED'
            DataType = ftDate
            Expression = 'DateEdit2.Date'
          end>
      end
      object FIBQuery3: TfrxFIBQuery
        UserName = 'FIBQuery3'
        CloseDataSource = True
        BCDToCurrency = False
        DataSetOptions = []
        IgnoreDupParams = False
        Params = <
          item
            Name = 'BD'
            DataType = ftDate
            Expression = 'DateEdit1.Date'
          end
          item
            Name = 'ED'
            DataType = ftDate
            Expression = 'DateEdit2.Date'
          end>
        SQL.Strings = (
          
            'select sum(p.kolvo * p.price) SUM_PRICE, sum(p.kolvo * p.vend_pr' +
            'ice) SUM_VEND'
          'from pos_rashod p left join hdr_rashod h on h.kod = p.kod'
          'where h.doc_type = 2'
          'and h.doc_date between :BD and :ED'
          'and p.item in (select t.item from full_tovar t   '
          ''
          ')')
        pLeft = 188
        pTop = 20
        Parameters = <
          item
            Name = 'BD'
            DataType = ftDate
            Expression = 'DateEdit1.Date'
          end
          item
            Name = 'ED'
            DataType = ftDate
            Expression = 'DateEdit2.Date'
          end>
      end
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Memo1: TfrxMemoView
        AllowVectorExport = True
        Left = 340.157700000000000000
        Top = 132.283550000000000000
        Width = 188.976500000000000000
        Height = 18.897650000000000000
        DataSetName = 'IBXQuery1'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.UTF8W = (
          '[FIBQuery1."SUM_VEND"]')
        ParentFont = False
      end
      object Memo3: TfrxMemoView
        AllowVectorExport = True
        Left = 340.157700000000000000
        Top = 151.181200000000000000
        Width = 188.976500000000000000
        Height = 18.897650000000000000
        DataSetName = 'IBXQuery2'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.UTF8W = (
          '[FIBQuery2."SUM_PRICE"]')
        ParentFont = False
      end
      object Memo5: TfrxMemoView
        AllowVectorExport = True
        Left = 45.354360000000000000
        Top = 11.338590000000000000
        Width = 642.520100000000000000
        Height = 75.590600000000000000
        DataSetName = 'CardInfo'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          ''
          #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1076#1074#1080#1078#1077#1085#1080#1080' '#1090#1086#1074#1072#1088#1072
          
            #1079#1072' '#1087#1077#1088#1080#1086#1076' c: [FormatDateTime('#39'd/mmm/yyyy'#39', DateEdit1.Date)] '#1087#1086': ' +
            '[FormatDateTime('#39'd/mmm/yyyy'#39' ,DateEdit2.Date)]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo6: TfrxMemoView
        AllowVectorExport = True
        Left = 185.196970000000000000
        Top = 132.283550000000000000
        Width = 154.960730000000000000
        Height = 18.897650000000000000
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          #1055#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077' :')
        ParentFont = False
      end
      object Memo7: TfrxMemoView
        AllowVectorExport = True
        Left = 185.196970000000000000
        Top = 151.181200000000000000
        Width = 154.960730000000000000
        Height = 18.897650000000000000
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          #1055#1088#1086#1076#1072#1078#1072' '#1088#1086#1079#1085#1080#1095#1085#1072#1103' :')
        ParentFont = False
      end
      object Memo8: TfrxMemoView
        AllowVectorExport = True
        Left = 340.157700000000000000
        Top = 170.078850000000000000
        Width = 188.976500000000000000
        Height = 18.897650000000000000
        DataSetName = 'IBXQuery1'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.UTF8W = (
          '[FIBQuery3."SUM_PRICE"]')
        ParentFont = False
      end
      object Memo10: TfrxMemoView
        AllowVectorExport = True
        Left = 185.196970000000000000
        Top = 170.078850000000000000
        Width = 154.960730000000000000
        Height = 18.897650000000000000
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Memo.UTF8W = (
          #1055#1088#1086#1076#1072#1078#1072' '#1073#1077#1079#1085#1072#1083' :')
        ParentFont = False
      end
    end
    object DialogPage1: TfrxDialogPage
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      DoubleBuffered = False
      Height = 122.000000000000000000
      ClientHeight = 83.000000000000000000
      Left = 397.000000000000000000
      Top = 162.000000000000000000
      Width = 338.000000000000000000
      Scaled = True
      ClientWidth = 322.000000000000000000
      OnActivate = 'DialogPage1OnActivate'
      object DateEdit1: TfrxDateEditControl
        Left = 12.000000000000000000
        Top = 24.000000000000000000
        Width = 145.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        Date = 38524.000000000000000000
        Time = 0.682514351901772900
        WeekNumbers = False
      end
      object DateEdit2: TfrxDateEditControl
        Left = 172.000000000000000000
        Top = 24.000000000000000000
        Width = 145.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        Date = 38524.000000000000000000
        Time = 0.682514583299052900
        WeekNumbers = False
      end
      object Label1: TfrxLabelControl
        Left = 12.000000000000000000
        Top = 8.000000000000000000
        Width = 90.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' :'
        Color = clBtnFace
      end
      object Label2: TfrxLabelControl
        Left = 172.000000000000000000
        Top = 8.000000000000000000
        Width = 109.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1087#1077#1088#1080#1086#1076#1072' :'
        Color = clBtnFace
      end
      object BitBtn1: TfrxBitBtnControl
        Left = 84.000000000000000000
        Top = 60.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
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
        Kind = bkOK
        Caption = 'OK'
        ModalResult = 1
        NumGlyphs = 2
      end
      object BitBtn2: TfrxBitBtnControl
        Left = 168.000000000000000000
        Top = 60.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
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
        Kind = bkCancel
        Caption = #1054#1090#1084#1077#1085#1072
        ModalResult = 2
        NumGlyphs = 2
      end
    end
  end
end
