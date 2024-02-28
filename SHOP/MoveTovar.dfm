object MoveTovarFrm: TMoveTovarFrm
  Left = 249
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
  ClientHeight = 677
  ClientWidth = 1054
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
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1054
    Height = 105
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 1050
    object Label2: TLabel
      Left = 376
      Top = 12
      Width = 44
      Height = 13
      Caption = #1054#1073#1098#1077#1082#1090' :'
    end
    object Label3: TLabel
      Left = 663
      Top = 12
      Width = 64
      Height = 13
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082' :'
    end
    object Label1: TLabel
      Left = 145
      Top = 14
      Width = 82
      Height = 13
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' :'
    end
    object MarketComboBox: TComboBox
      Left = 376
      Top = 31
      Width = 281
      Height = 26
      Style = csOwnerDrawFixed
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 20
      ParentFont = False
      Sorted = True
      TabOrder = 1
      OnChange = VendorComboBoxChange
      OnKeyDown = TypeDocComboBoxKeyDown
    end
    object VendorComboBox: TComboBox
      Left = 663
      Top = 31
      Width = 281
      Height = 26
      Style = csOwnerDrawFixed
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 20
      ParentFont = False
      Sorted = True
      TabOrder = 2
      OnChange = VendorComboBoxChange
      OnKeyDown = TypeDocComboBoxKeyDown
    end
    object TypeDocComboBox: TComboBox
      Left = 144
      Top = 31
      Width = 226
      Height = 26
      Style = csOwnerDrawFixed
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 20
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = #1055#1088#1080#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
      OnChange = TypeDocComboBoxChange
      OnKeyDown = TypeDocComboBoxKeyDown
      Items.Strings = (
        #1055#1088#1080#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
        #1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
        #1055#1077#1088#1077#1073#1088#1086#1089#1082#1072' '#1088#1072#1089#1093#1086#1076
        #1055#1077#1088#1077#1073#1088#1086#1089#1082#1072' '#1087#1088#1080#1093#1086#1076
        #1042#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1097#1080#1082#1091
        #1042#1086#1079#1074#1088#1072#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
        #1056#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072)
    end
    object ToolBar1: TToolBar
      Left = 11
      Top = 18
      Width = 127
      Height = 39
      Align = alNone
      ButtonHeight = 39
      ButtonWidth = 39
      Caption = 'ToolBar1'
      Images = ShopMainForm.ImageList2
      TabOrder = 5
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = NewDocAction
        AutoSize = True
      end
      object ToolButton2: TToolButton
        Left = 39
        Top = 0
        Action = PrintDocAction
      end
      object ToolButton3: TToolButton
        Left = 78
        Top = 0
        Action = EditDocACT
      end
    end
    object LabeledEdit1: TLabeledEdit
      Left = 7
      Top = 78
      Width = 121
      Height = 21
      Alignment = taRightJustify
      EditLabel.Width = 109
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1086#1080#1089#1082' '#8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' :'
      MaxLength = 20
      NumbersOnly = True
      TabOrder = 4
      Text = ''
      OnKeyDown = LabeledEdit1KeyDown
      OnKeyPress = LabeledEdit1KeyPress
    end
    object UpdateChangeUsrBtn: TBitBtn
      Left = 950
      Top = 18
      Width = 39
      Height = 39
      ImageIndex = 51
      Glyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FCE5
        C800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FBDEB900F39A
        2900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FAD3A200F3972300F396
        2100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FFFFFE00F9CA9000F3962100F3962100F396
        2100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FFFDFC00F8BE7600F3962100F3962100F3962100F396
        2100F7B96B00F7B96B00F7B96B00F7B96B00F7B96B00F7B96B00F7B96B00F7B9
        6B00F7B96B00F7B96B00FAD09C00FF00FF00F7B96B00F7B96B00FAD09C00FF00
        FF00F7B96B00F7B96B00FAD09C00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FFFBF600F7B56300F3962100F3962100F3962100F3962100F396
        2100F3962100F3962100F3962100F3962100F3962100F3962100F3962100F396
        2100F3962100F3962100F7B96B00FF00FF00F3962100F3962100F7B96B00FF00
        FF00F3962100F3962100F7B96B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FBD9AF00F3962200F3962100F3962100F3962100F3962100F396
        2100F3962100F3962100F3962100F3962100F3962100F3962100F3962100F396
        2100F3962100F3962100F7B96B00FF00FF00F3962100F3962100F7B96B00FF00
        FF00F3962100F3962100F7B96B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FBD8AD00F3982500F3962100F3962100F3962100F396
        2100F3962100F3962100F3962100F3962100F3962100F3962100F3962100F396
        2100F3962100F3962100F7B96B00FF00FF00F3962100F3962100F7B96B00FF00
        FF00F3962100F3962100F7B96B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FBE0BD00F39A2A00F3962100F3962100F396
        2100FBDCB500FBDCB500FBDCB500FBDCB500FBDCB500FBDCB500FBDCB500FBDC
        B500FBDCB500FBDCB500FCE8CD00FF00FF00FBDCB500FBDCB500FCE8CD00FF00
        FF00FBDCB500FBDCB500FCE8CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FCE9D000F49F3300F3962100F396
        2100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FDF1E100F5A43F00F396
        2100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FEF5E900F5AA
        4B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FEF8
        F100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FEF8F100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00F5A84600FEF3E700FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00F3962100F4A33C00FDEFDC00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00F3962100F3962100F49D3000FCE7
        CC00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FCE8CD00FBDCB500FBDCB500FF00FF00FCE8CD00FBDCB500FBDC
        B500FF00FF00FCE8CD00FBDCB500FBDCB500FBDCB500FBDCB500FBDCB500FBDC
        B500FBDCB500FBDCB500FBDCB500FBDCB500F3962100F3962100F3962100F39A
        2A00FBE0BD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00F7B96B00F3962100F3962100FF00FF00F7B96B00F3962100F396
        2100FF00FF00F7B96B00F3962100F3962100F3962100F3962100F3962100F396
        2100F3962100F3962100F3962100F3962100F3962100F3962100F3962100F396
        2100F3972400FAD5A600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00F7B96B00F3962100F3962100FF00FF00F7B96B00F3962100F396
        2100FF00FF00F7B96B00F3962100F3962100F3962100F3962100F3962100F396
        2100F3962100F3962100F3962100F3962100F3962100F3962100F3962100F396
        2100F3962100F3962200FBD9AF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00F7B96B00F3962100F3962100FF00FF00F7B96B00F3962100F396
        2100FF00FF00F7B96B00F3962100F3962100F3962100F3962100F3962100F396
        2100F3962100F3962100F3962100F3962100F3962100F3962100F3962100F396
        2100F3962100F6B25D00FEFAF400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FAD09C00F7B96B00F7B96B00FF00FF00FAD09C00F7B96B00F7B9
        6B00FF00FF00FAD09C00F7B96B00F7B96B00F7B96B00F7B96B00F7B96B00F7B9
        6B00F7B96B00F7B96B00F7B96B00F7B96B00F3962100F3962100F3962100F396
        2100F8BE7600FFFDFC00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00F3962100F3962100F3962100F8C3
        8100FFFFFE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00F3962100F3962200FAD09B00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00F3992700FBDBB300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FCE5C800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      TabOrder = 3
      OnClick = UpdateChangeUsrBtnClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 1054
    Height = 572
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 1050
    ExplicitHeight = 571
    object Splitter1: TSplitter
      Left = 1
      Top = 185
      Width = 1052
      Height = 8
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      MinSize = 4
      ResizeStyle = rsLine
      ExplicitWidth = 790
    end
    object DBGrid2: TDBGrid
      Left = 1
      Top = 1
      Width = 1052
      Height = 184
      Align = alTop
      Constraints.MinHeight = 150
      DataSource = DataSource2
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = DBGrid2TitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DOC_DATE'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_NUMBER'
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_SUM'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VEND_SUM'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
          Visible = True
        end
        item
          Expanded = False
          Visible = False
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
          FieldName = 'V_NAME'
          Title.Alignment = taCenter
          Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          Width = 148
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Alignment = taCenter
          Title.Caption = #1040#1074#1090#1086#1088
          Width = 139
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
    object Panel4: TPanel
      Left = 1
      Top = 193
      Width = 1052
      Height = 378
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 1048
      ExplicitHeight = 377
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 1050
        Height = 376
        Align = alClient
        DataSource = DataSource1
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
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
            Title.Caption = #1050#1086#1076
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOVAR_NAME'
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 501
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KOLVO'
            Title.Alignment = taCenter
            Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRICE'
            Title.Alignment = taCenter
            Title.Caption = #1062#1077#1085#1072
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VEND_PRICE'
            Title.Caption = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRODUCER'
            Title.Alignment = taCenter
            Title.Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
            Width = 192
            Visible = True
          end>
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = PosTable
    Left = 296
    Top = 192
  end
  object DataSource2: TDataSource
    DataSet = HdrTable
    Left = 296
    Top = 160
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 360
    Top = 160
    object N2: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1094#1077#1085#1085#1080#1082#1080
      OnClick = N2Click
    end
    object N1: TMenuItem
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1089#1091#1084#1084#1099' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      OnClick = N3Click
    end
    object N7: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      OnClick = N7Click
    end
    object N6: TMenuItem
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1082#1072#1082' '#1088#1072#1089#1093#1086#1076#1085#1091#1102
      OnClick = N6Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      OnClick = N4Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 233
    Top = 194
  end
  object ActionManager1: TActionManager
    Images = ShopMainForm.ImageList2
    Left = 360
    Top = 192
    StyleName = 'Platform Default'
    object NewDocAction: TAction
      Tag = 1
      Caption = #1053#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1053#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 24
      ShortCut = 16462
      OnExecute = EditDocBtnClick
    end
    object PrintDocAction: TAction
      Tag = 2
      Caption = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      ImageIndex = 25
      OnExecute = PrintDocBtnClick
      OnUpdate = PrintDocActionUpdate
    end
    object EditDocACT: TAction
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074' '#1095#1077#1088#1085#1086#1074#1080#1082#1080
      Hint = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074' '#1095#1077#1088#1085#1086#1074#1080#1082#1080
      ImageIndex = 26
      OnExecute = EditDocACTExecute
      OnUpdate = AddPosActionUpdate
    end
    object PayDocACT: TAction
      Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      ImageIndex = 22
      OnUpdate = PrintDocActionUpdate
    end
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    GoToFirstRecordOnExecute = False
    SQL.Strings = (
      'EXECUTE PROCEDURE GET_TMP_CODE ')
    StoredProcName = 'GET_TMP_CODE'
    Left = 232
    Top = 161
  end
  object PosTable: TpFIBDataSet
    SelectSQL.Strings = (
      'select P.*, T.*, U.UNIT_NAME'
      'from POS_PRIHOD P, SPR_TOVAR T, SPR_UNITS U'
      #39'where P.ITEM = T.ITEM and T.UNIT_KOD = U.UNIT_KOD')
    AutoCalcFields = False
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DataSource = DataSource2
    Filtered = True
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Container = DataSetsContainer1
    Left = 264
    Top = 192
    WaitEndMasterScroll = True
    object PosTableKOD: TFIBIntegerField
      FieldName = 'KOD'
    end
    object PosTableITEM: TFIBStringField
      FieldName = 'ITEM'
      Size = 14
      EmptyStrToNull = True
    end
    object PosTableKOLVO: TFIBFloatField
      FieldName = 'KOLVO'
    end
    object PosTablePRICE: TFIBFloatField
      FieldName = 'PRICE'
      DisplayFormat = '### ### ##0.00'
    end
    object PosTableVEND_PRICE: TFIBFloatField
      FieldName = 'VEND_PRICE'
      DisplayFormat = '### ### ##0.00'
    end
    object PosTableMARKET_CODE: TFIBIntegerField
      FieldName = 'MARKET_CODE'
    end
    object PosTableVENDOR_CODE: TFIBIntegerField
      FieldName = 'VENDOR_CODE'
    end
    object PosTableITEM1: TFIBStringField
      FieldName = 'ITEM1'
      Size = 14
      EmptyStrToNull = True
    end
    object PosTableTOVAR_NAME: TFIBStringField
      FieldName = 'TOVAR_NAME'
      Size = 80
      EmptyStrToNull = True
    end
    object PosTableT_GROUP: TFIBIntegerField
      FieldName = 'T_GROUP'
    end
    object PosTableLAST_UPD: TFIBDateTimeField
      FieldName = 'LAST_UPD'
    end
    object PosTableKKM_SECT: TFIBIntegerField
      FieldName = 'KKM_SECT'
    end
    object PosTableVENDOR_CODE1: TFIBIntegerField
      FieldName = 'VENDOR_CODE1'
    end
    object PosTableAUTOR_KOD: TFIBIntegerField
      FieldName = 'AUTOR_KOD'
    end
    object PosTableREMARK: TFIBStringField
      FieldName = 'REMARK'
      EmptyStrToNull = True
    end
    object PosTableUNIT_KOD: TFIBIntegerField
      FieldName = 'UNIT_KOD'
    end
    object PosTableARTIKUL: TFIBStringField
      FieldName = 'ARTIKUL'
      Size = 30
      EmptyStrToNull = True
    end
    object PosTablePRODUCER: TFIBStringField
      FieldName = 'PRODUCER'
      Size = 30
      EmptyStrToNull = True
    end
    object PosTableREMARK_1: TFIBStringField
      FieldName = 'REMARK_1'
      Size = 50
      EmptyStrToNull = True
    end
    object PosTableVEND_ITEM: TFIBStringField
      FieldName = 'VEND_ITEM'
      Size = 14
      EmptyStrToNull = True
    end
    object PosTableUNIT_NAME: TFIBStringField
      FieldName = 'UNIT_NAME'
      Size = 5
      EmptyStrToNull = True
    end
  end
  object HdrTable: TpFIBDataSet
    SelectSQL.Strings = (
      'select H.*, M.SHORT_NAME, U.NAME, V.VENDOR_NAME V_NAME'
      'from HDR_PRIHOD H,  SPR_MARKET M,  SPR_USERS U, SPR_VENDORS V'
      'where DOC_TYPE = 1'
      'and H.VENDOR_CODE = V.VENDOR_CODE')
    AfterOpen = HdrTableAfterOpen
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy t'
    DefaultFormats.DisplayFormatTime = 't'
    Container = DataSetsContainer2
    Left = 264
    Top = 160
    object HdrTableKOD: TFIBIntegerField
      FieldName = 'KOD'
    end
    object HdrTableMARKET_CODE: TFIBIntegerField
      FieldName = 'MARKET_CODE'
    end
    object HdrTableDOC_DATE: TFIBDateTimeField
      FieldName = 'DOC_DATE'
      DisplayFormat = 'dd mmmm yyyy'
    end
    object HdrTableDOC_NUMBER: TFIBIntegerField
      FieldName = 'DOC_NUMBER'
    end
    object HdrTableVENDOR_CODE: TFIBIntegerField
      FieldName = 'VENDOR_CODE'
    end
    object HdrTableDOC_SUM: TFIBFloatField
      FieldName = 'DOC_SUM'
      DisplayFormat = '### ### ### ##0.00'
    end
    object HdrTableDOC_TYPE: TFIBIntegerField
      FieldName = 'DOC_TYPE'
    end
    object HdrTableAUTOR_KOD: TFIBIntegerField
      FieldName = 'AUTOR_KOD'
    end
    object HdrTableLAST_UPD: TFIBDateTimeField
      FieldName = 'LAST_UPD'
    end
    object HdrTableVEND_SUM: TFIBFloatField
      FieldName = 'VEND_SUM'
      DisplayFormat = '### ### ### ##0.00'
    end
    object HdrTableSHORT_NAME: TFIBStringField
      FieldName = 'SHORT_NAME'
      Size = 15
      EmptyStrToNull = True
    end
    object HdrTableNAME: TFIBStringField
      FieldName = 'NAME'
      EmptyStrToNull = True
    end
    object HdrTableV_NAME: TFIBStringField
      FieldName = 'V_NAME'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object DataSetsContainer1: TDataSetsContainer
    MasterContainer = DataSetsContainer2
    Left = 328
    Top = 193
  end
  object DataSetsContainer2: TDataSetsContainer
    Left = 328
    Top = 161
  end
end
