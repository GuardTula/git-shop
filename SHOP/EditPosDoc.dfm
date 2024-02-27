object EditDocPosFrm: TEditDocPosFrm
  Left = 252
  Top = 99
  BorderStyle = bsToolWindow
  Caption = 'EditDocPosFrm'
  ClientHeight = 78
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 615
    Top = 4
    Width = 32
    Height = 13
    Caption = #1062#1077#1085#1072' :'
    FocusControl = PosPriceEdit
  end
  object Label4: TLabel
    Left = 490
    Top = 4
    Width = 97
    Height = 13
    Caption = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072' :'
    FocusControl = PosVendPriceEdit
  end
  object Label6: TLabel
    Left = 365
    Top = 4
    Width = 65
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' :'
  end
  object Label8: TLabel
    Left = 160
    Top = 4
    Width = 56
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' :'
  end
  object Label7: TLabel
    Left = 8
    Top = 4
    Width = 48
    Height = 13
    Caption = 'PLU '#1082#1086#1076' :'
  end
  object AddSprBtn: TBitBtn
    Left = 125
    Top = 20
    Width = 21
    Height = 21
    Glyph.Data = {
      42010000424D4201000000000000760000002800000011000000110000000100
      040000000000CC00000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      777770000000777777770000000770000000777777770FFFFF07700000007777
      77770FCCCF0770000000777777770FFFFF0770000000777000000FCCCF077000
      0000777077770FFFFF077000000070007CCC0FCCCF0770000000706077770FFF
      FF077000000070607CCC00000007700000007060777770777777700000007060
      7CCC707777747000000070607777707777444000000070600000007777747000
      0000706666607774777470000000700000007777444770000000777777777777
      777770000000}
    TabOrder = 1
    TabStop = False
    OnClick = AddSprBtnClick
  end
  object NameEdit: TEdit
    Left = 152
    Top = 20
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object PosVendPriceEdit: TEdit
    Left = 490
    Top = 20
    Width = 121
    Height = 21
    Alignment = taRightJustify
    Enabled = False
    TabOrder = 4
    OnKeyPress = PosVendPriceEditKeyPress
  end
  object PosPriceEdit: TEdit
    Tag = 1
    Left = 615
    Top = 20
    Width = 121
    Height = 21
    Alignment = taRightJustify
    Enabled = False
    TabOrder = 5
    OnChange = PosKolvoEditChange
    OnKeyPress = PosVendPriceEditKeyPress
  end
  object BitBtn4: TBitBtn
    Left = 288
    Top = 48
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 6
  end
  object BitBtn3: TBitBtn
    Left = 368
    Top = 48
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
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
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 7
  end
  object PosKolvoEdit: TEdit
    Left = 365
    Top = 20
    Width = 121
    Height = 21
    MaxLength = 10
    TabOrder = 3
    OnChange = PosKolvoEditChange
    OnKeyPress = PosKolvoEditKeyPress
  end
  object PosItemEdit: TEdit
    Left = 5
    Top = 20
    Width = 121
    Height = 21
    MaxLength = 15
    TabOrder = 0
    OnKeyDown = PosItemEditKeyDown
  end
end
