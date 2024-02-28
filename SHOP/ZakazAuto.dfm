object ZakazAutoForm: TZakazAutoForm
  Left = 342
  Top = 149
  BorderStyle = bsDialog
  ClientHeight = 482
  ClientWidth = 406
  Color = clBtnFace
  ParentFont = True
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object DstLabel: TLabel
    Left = 217
    Top = 74
    Width = 145
    Height = 16
    AutoSize = False
    Caption = #1054#1073#1098#1077#1082#1090#1099' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1080':'
  end
  object IncludeBtn: TSpeedButton
    Left = 185
    Top = 106
    Width = 24
    Height = 24
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      0400000000006800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7000777777077777700077777700777770007777770607777000770000066077
      7000770666666607700077066666666070007706666666077000770000066077
      7000777777060777700077777700777770007777770777777000777777777777
      7000}
    OnClick = IncludeBtnClick
  end
  object IncAllBtn: TSpeedButton
    Left = 185
    Top = 136
    Width = 24
    Height = 24
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      0400000000006800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7000777707707777700077770070077770007777060060777000000006606607
      7000066666660660700006666666606600000666666606607000000006606607
      7000777706006077700077770070077770007777077077777000777777777777
      7000}
    OnClick = IncAllBtnClick
  end
  object ExcludeBtn: TSpeedButton
    Left = 185
    Top = 168
    Width = 24
    Height = 24
    Enabled = False
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      0400000000006800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7000777777077777700077777007777770007777060777777000777066000007
      7000770666666607700070666666660770007706666666077000777066000007
      7000777706077777700077777007777770007777770777777000777777777777
      7000}
    OnClick = ExcludeBtnClick
  end
  object ExAllBtn: TSpeedButton
    Left = 185
    Top = 198
    Width = 24
    Height = 24
    Enabled = False
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      04000000000068000000120B0000120B00001000000000000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7000777770770777700077770070077770007770600607777000770660660000
      0000706606666666000006606666666600007066066666660000770660660000
      0000777060060777700077770070077770007777707707777000777777777777
      7000}
    OnClick = ExcAllBtnClick
  end
  object CancelSpeedButton: TSpeedButton
    Left = 217
    Top = 411
    Width = 185
    Height = 55
    Flat = True
    Glyph.Data = {
      361B0000424D361B000000000000360000002800000030000000300000000100
      180000000000001B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFFD4D7FDA0A7FA7881F85964F64450F53B
      47F43B47F44450F55A65F67881F8A1A7FAD5D8FDFDFEFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEBFE959BF94D58F5
      3643F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643
      F43643F44D58F5959CF9EAEBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFF0F1FE8A91F93C48F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43C48F48B93F9
      F1F2FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFBABFFB4652F53643F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43643F43643F44752F5BCC0FBFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFF8890F83643
      F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
      3643F43643F48A92F9FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFF7F8FF707AF73643F43643F43643F43643F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43643F43643F43643F43643F43643F4727BF7F7F8FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFF757EF73643F43643F43643
      F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
      3643F43643F43643F43643F4717AF7FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF878FF83643F43643F43643F43643F43643F43643F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F48A
      92F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABEFB3643F43643F43643F43643F43643
      F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F4BCC0FBFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F2FE46
      52F53643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F44551F5EFF0FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF8890F83643F43643F43643F43643F43643F43643
      F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F48B93F9FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9EAFE3B47F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43844F4
      636DF63643F43643F43643F43643F43643F43643F43643F43643F43643F43643
      F4636DF63844F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43C48F4EAEBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF959BF93643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43844F4B4B9FBFDFDFF7E86F83643F43643F43643F436
      43F43643F43643F43643F43643F47881F8FCFCFFBABEFB3845F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F4959CF9FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFF4D58F53643F436
      43F43643F43643F43643F43643F43643F43643F43643F43844F4B4B9FBFFFFFF
      FFFFFFFDFDFF7E86F83643F43643F43643F43643F43643F43643F47881F8FCFC
      FFFFFFFFFFFFFFBABEFB3845F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F44E59F5FDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFD3D6FD3643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F4636DF6FCFCFFFFFFFFFFFFFFFFFFFFFCFCFF7B83F83643F436
      43F43643F43643F47B83F8FCFCFFFFFFFFFFFFFFFFFFFFFCFCFF636DF63643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F4D5D8FDFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FA5FA3643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F47982F8FCFCFF
      FFFFFFFFFFFFFFFFFFFDFDFF7E86F83643F43643F47881F8FCFCFFFFFFFFFFFF
      FFFFFFFFFDFDFF7F87F83643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F4A1A7FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF767FF73643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43643F47982F8FCFCFFFFFFFFFFFFFFFFFFFFFDFDFF7E
      86F87881F8FCFCFFFFFFFFFFFFFFFFFFFFFDFDFF7F87F83643F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F47881F8FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5863F63643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
      7982F8FCFCFFFFFFFFFFFFFFFFFFFFFEFEFFFDFDFFFFFFFFFFFFFFFFFFFFFDFD
      FF7F87F83643F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F45964F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4450F53643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43643F43643F43643F47982F8FCFCFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFDFDFF7F87F83643F43643F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F44652F5FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B47F43643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
      3643F43643F47982F8FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFF7F87F83643
      F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F43C48F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3B47F43643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43643F43643F43643F43643F47881F8FDFDFFFFFFFFFF
      FFFFFFFFFFFFFFFFFEFEFF7E86F83643F43643F43643F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F43C48F4FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4450F53643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
      3643F47881F8FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFF7E86
      F83643F43643F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F44652F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF5863F63643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43643F43643F47881F8FCFCFFFFFFFFFFFFFFFFFFFFFD
      FEFFFDFDFFFFFFFFFFFFFFFFFFFFFDFDFF7E86F83643F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F45964F6FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF767FF73643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43643F47881F8
      FCFCFFFFFFFFFFFFFFFFFFFFFDFDFF7F87F87982F8FCFCFFFFFFFFFFFFFFFFFF
      FFFDFDFF7E86F83643F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F47881F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF9FA5FA3643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F47881F8FCFCFFFFFFFFFFFFFFFFFFFFFDFDFF7F87F836
      43F43643F47982F8FCFCFFFFFFFFFFFFFFFFFFFFFDFDFF7E86F83643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F4A0A7FAFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D5FD3643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F4636DF6FCFCFFFFFFFF
      FFFFFFFFFFFFFCFCFF7B83F83643F43643F43643F43643F47B83F8FCFCFFFFFF
      FFFFFFFFFFFFFFFCFCFF636DF63643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F4D4D7FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFDFEFF4C58F53643F43643F43643F43643F43643F43643F43643
      F43643F43643F43844F4B4B9FBFFFFFFFFFFFFFDFDFF7F87F83643F43643F436
      43F43643F43643F43643F47982F8FCFCFFFFFFFFFFFFFFBABEFB3946F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F44B57F5FDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF949BF93643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43844F4B4B9FB
      FDFDFF7F87F83643F43643F43643F43643F43643F43643F43643F43643F47982
      F8FCFCFFBABEFB3946F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F4959BF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFE9EAFE3B47F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43643F43844F4636DF63643F43643F43643F43643F436
      43F43643F43643F43643F43643F43643F4636DF63844F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43B47F4E7E9FEFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868EF836
      43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F48A91F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFF0F1FE4652F53643F43643F43643F43643F43643
      F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F44450F5EFF0FEFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7
      BCFB3643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F4BABFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF858DF83643F43643F43643F43643
      F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
      3643F43643F43643F43643F43643F48890F8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFBFBFF7079F73643F43643F43643F43643F43643F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43643F43643F43643F43643F43643F43643F46C75F7FA
      FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F8FF7079F73643F43643
      F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
      3643F43643F43643F4707AF7F7F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFBFBFF858DF83643F43643F43643F43643F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43643F43643F43643F43643F4878FF8FBFBFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8BD
      FB4450F53643F43643F43643F43643F43643F43643F43643F43643F43643F436
      43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
      4551F5BABEFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF0FE868EF83B47F43643F43643F4
      3643F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643
      F43643F43643F43643F43B47F48890F8EFF0FEFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFE8EAFE949BF94B57F53643F43643F43643F43643F43643F436
      43F43643F43643F43643F43643F43643F43643F44C58F5959BF9E9EAFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFF
      D2D5FD9FA5FA777FF85762F64350F53A47F43A47F44350F55863F6777FF89FA5
      FAD3D6FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    OnClick = CancelSpeedButtonClick
  end
  object GetZakazButton: TSpeedButton
    Left = 8
    Top = 411
    Width = 185
    Height = 55
    Flat = True
    Glyph.Data = {
      361B0000424D361B000000000000360000002800000030000000300000000100
      180000000000001B000074120000741200000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFB
      C5E4C38ECC8C6BBC6858B35458B3546BBC688ECC8CC5E5C4FCFDFBFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC8E6C769BA6550AF4C50AF4C50AF4C50AF4C50AF4C50
      AF4C50AF4C50AF4C69BA65C9E6C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEA0D49E50AF4C50AF4C
      50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4CA1D4
      9FFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFA0D39D50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50
      AF4C50AF4C50AF4C50AF4C50AF4C50AF4CA2D4A0FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7E5C550AF4C50AF4C50AF4C50AF4C
      50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF
      4C50AF4CC9E6C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF7872654F47374F47374F4737787266FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFD
      FB69BA6550AF4C50AF4C50AF4C50AF4C50AF4C51AF4D9AD19855B25250AF4C50
      AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C67BA64FBFDFBFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F47374F47374F47
      374F47374F4737FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFC4E4C350AF4C50AF4C50AF4C50AF4C50AF4C
      51AF4DB6DDB4FFFFFFCFE9CE56B25250AF4C50AF4C50AF4C50AF4C50AF4C50AF
      4C50AF4C50AF4CC5E5C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF4F47374F47374F47374F47374F4737FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8DCB
      8A50AF4C50AF4C50AF4C50AF4C51AF4DB6DEB5FFFFFFFFFFFFFFFFFFCFE9CE56
      B25250AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C8FCC8DFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F47374F47374F47
      374F47374F4737FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF6ABB6750AF4C50AF4C50AF4C51AF4DBADFB8
      FFFFFFF0F8F07FC47CE3F2E2FFFFFFCEE9CD55B25250AF4C50AF4C50AF4C50AF
      4C50AF4C50AF4C6BBC68FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFC0CFFF2755E92257FF2257FF2257FF2257FF2257FF2257FF2257FF
      2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF4EAB
      5450AF4C50AF4C50AF4C70BD6CFAFDFAF0F8F06EBD6B50AF4C60B75DE4F2E3FF
      FFFFCEE9CD55B25250AF4C50AF4C50AF4C50AF4C50AF4C5AB356FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A69FF2257FF2257FF2257
      FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF22
      57FF2257FF2257FF2257FF2257FF4EAB5450AF4C50AF4C50AF4C50AF4C82C67F
      6EBD6B50AF4C50AF4C50AF4C60B75DE4F2E3FFFFFFCEE9CD55B25250AF4C50AF
      4C50AF4C50AF4C58B354FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF2257FF2257FF2257FF2257FF2257FF2257FF2257FF4F47374F4737
      4F47374F47374F47374F47374F47374F47374F47374F47374F47374F47374FA0
      4950AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C60
      B65CE2F2E2FFFFFFCFE9CE55B25250AF4C50AF4C50AF4C6BBB67FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2257FF2257FF2257FF2257
      FF2257FF2257FF2257FF4F47374F47374F47374F47374F47374F47374F47374F
      47374F47374F47374F47374F47374F8B4550AF4C50AF4C50AF4C50AF4C50AF4C
      50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C60B65CE2F2E2FFFFFFCFE9CE55B2
      5250AF4C50AF4C8ECC8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF2257FF2257FF2257FF2257FF2257FF2257FF2257FF7A6E547A6E54
      7A6E547A6E547A6E547A6E547A6E547A6E547A6E547A6E547A6E547A6E546B84
      5150AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50
      AF4C50AF4C61B75EE4F3E4EBF6EB65B86150AF4C50AF4CC5E4C3FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2257FF6187FFE7EDFFE6EC
      FF6086FF2257FF2257FF7A6E547A6E547A6E547A6E547A6E547A6E547A6E547A
      6E547A6E547A6E547A6E547A6E54796F5456A64E50AF4C50AF4C50AF4C50AF4C
      50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C61B75E67BA6450AF
      4C50AF4C67B963FBFDFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF2257FFE7EDFFFFFFFFFFFFFFE6ECFF2257FF2257FF4F47374F4737
      4F47374F47374F47374F47374F47374F47374F47374F47374F47374F47374F47
      374F693E50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50
      AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4CC8E6C7FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2257FFE7EDFFFFFFFFFFFF
      FFE6ECFF2257FF2257FF4F47374F47374F47374F47374F47374F47374F47374F
      47374F47374F47374F47374F47374F47374F473750804350AF4C50AF4C50AF4C
      50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF
      4CA1D49FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF2257FF6388FFE8EDFFE7EDFF6187FF2257FF2257FF7A6E547A6E54
      7A6E547A6E547A6E547A6E547A6E547A6E547A6E547A6E547A6E547A6E547A6E
      547A6E547A6F5463925050AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50
      AF4C50AF4C50AF4C50AF4C50AF4CA0D39DFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2257FF2257FF2257FF2257
      FF2257FF2257FF2257FF7A6E547A6E547A6E547A6E547A6E547A6E547A6E547A
      6E547A6E547A6E547A6E547A6E547A6E547A6E547A6E547A6E543174C54AA464
      50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C68BA65C7E5C5FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF3A69FF2257FF2257FF2257FF2257FF2257FF2257FF4F47374F4737
      4F47374F47374F47374F47374F47374F47374F47374F47374F47374F47374F47
      374F47374F47374F47372257FF2359FB3175C240908A49A1674EAB544FAB546B
      BB678DCB8AC4E4C3FBFDFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBECEFF2151F72257FF2257
      FF2257FF2257FF2257FF4F47374F47374F47374F47374F47374F47374F47374F
      47374F47374F47374F47374F47374F47374F47374F47374F47372257FF2257FF
      2257FF2257FF2257FF2150F7C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF1C1CB71C1CB71C1CB72257FF2257FF2257FF2257FF2257FF
      2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257
      FF2257FF2257FF2257FF2257FF2257FF2257FF1C1CB71C1CB71C1CB7FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C1CB71C1CB71C1C
      B72257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF22
      57FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF
      2257FF1C1CB71C1CB71C1CB7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAC7C362
      5A4C4F47374F47374F47374F47374F47372257FF2257FF2257FF2257FF2257FF
      2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257
      FF2257FF2257FF2257FF2257FF2257FF2257FF4F47374F47374F47374F47374F
      4737625A4CCBC8C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF625A4C4F47374F47374F47374F47374F47374F47
      372257FF2257FF0B2899041A7A041A7A041A7A041A7A041A7A041A7A041A7A04
      1A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A0B299A2257FF
      2257FF4F47374F47374F47374F47374F47374F4737625B4DFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F47374F
      4737FFFFFFFFFFFF1C1CB71C1CB71C1CB72257FF2257FF041A7A041A7A041A7A
      041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A
      7A041A7A041A7A041A7A041A7A2257FF2257FF1C1CB71C1CB71C1CB7FFFFFFFF
      FFFF4F47374F4737FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF557EFF2257FF2257FF577FFFFFFFFF1C1CB71C1CB71C1C
      B72257FF2257FF041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A04
      1A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A2257FF
      2257FF1C1CB71C1CB71C1CB7FFFFFF557EFF2257FF2257FF577FFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2257FF2257FF22
      57FF2257FFFFFFFF1C1CB71C1CB71C1CB72257FF2257FF041A7A041A7A041A7A
      041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A
      7A041A7A041A7A041A7A041A7A2257FF2257FF1C1CB71C1CB71C1CB7FFFFFF22
      57FF2257FF2257FF2257FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF2257FF2257FF2257FF2257FFFFFFFF1C1CB71C1CB71C1C
      B72257FF2257FF041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A04
      1A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A2257FF
      2257FF1C1CB71C1CB71C1CB7FFFFFF2257FF2257FF2257FF2257FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2257FF2257FF22
      57FF2257FFFFFFFF1C1CB71C1CB71C1CB72257FF2257FF041A7A041A7A041A7A
      041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A
      7A041A7A041A7A041A7A041A7A2257FF2257FF1C1CB71C1CB71C1CB7FFFFFF22
      57FF2257FF2257FF2257FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF2257FF2257FF2257FF2257FFFFFFFF1C1CB71C1CB71C1C
      B72257FF2257FF041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A04
      1A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A2257FF
      2257FF1C1CB71C1CB71C1CB7FFFFFF2257FF2257FF2257FF2257FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2257FF2257FF22
      57FF2257FFFFFFFF1C1CB71C1CB71C1CB72257FF2257FF041A7A041A7A041A7A
      041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A
      7A041A7A041A7A041A7A041A7A2257FF2257FF1C1CB71C1CB71C1CB7FFFFFF22
      57FF2257FF2257FF2257FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF2257FF2257FF2257FF2257FFFFFFFF1C1CB71C1CB71C1C
      B72257FF2257FF041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A04
      1A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A2257FF
      2257FF1C1CB71C1CB71C1CB7FFFFFF2257FF2257FF2257FF2257FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF547DFF2257FF22
      57FF567FFFFFFFFF1C1CB71C1CB71C1CB72257FF2257FF0B2898041A7A041A7A
      041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A7A041A
      7A041A7A041A7A041A7A0B28992257FF2257FF1C1CB71C1CB71C1CB7FFFFFF54
      7DFF2257FF2257FF567FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C1CB71C1CB71C1C
      B72150F72257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF22
      57FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF
      2150F71C1CB71C1CB71C1CB7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF1C1CB71C1CB71C1CB71E2ECC2151F72257FF2257FF2257FF
      2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257FF2257
      FF2257FF2257FF2257FF2257FF2150F71E2DCC1C1CB71C1CB71C1CB7FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C1CB71C1CB71C1C
      B71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C
      1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB7
      1C1CB71C1CB71C1CB71C1CB7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF1C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB7
      1C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1C
      B71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB7FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C1CB71C1CB71C1C
      B71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C
      1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB7
      1C1CB71C1CB71C1CB71C1CB7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF1C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB7
      1C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1C
      B71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB7FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5050C71C1CB71C1C
      B71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C
      1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB71C1CB7
      1C1CB71C1CB71C1CB75151C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    OnClick = GetZakazButtonClick
  end
  object MoveUpBtn: TSpeedButton
    Left = 391
    Top = 136
    Width = 24
    Height = 24
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      04000000000068000000232E0000232E00001000000010000000C0C0C0000000
      0000BFBF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      0000000000000000000000001111100000000000122210000000000012221000
      0000000012221000000001111222111100000012222222100000000122222100
      0000000012221000000000000121000000000000001000000000000000000000
      0000}
    OnClick = MoveUpBtnClick
  end
  object MoveDownBtn: TSpeedButton
    Left = 391
    Top = 166
    Width = 24
    Height = 24
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      04000000000068000000232E0000232E00001000000010000000C0C0C0000000
      0000BFBF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      0000000000100000000000000121000000000000122210000000000122222100
      0000001222222210000001111222111100000000122210000000000012221000
      0000000012221000000000001111100000000000000000000000000000000000
      0000}
    OnClick = MoveDownBtnClick
  end
  object SpeedButton1: TSpeedButton
    Left = 71
    Top = 66
    Width = 24
    Height = 24
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      04000000000068000000232E0000232E00001000000010000000C0C0C0000000
      0000BFBF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      0000000000000000000000001111100000000000122210000000000012221000
      0000000012221000000001111222111100000012222222100000000122222100
      0000000012221000000000000121000000000000001000000000000000000000
      0000}
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 145
    Height = 16
    AutoSize = False
    Caption = #1054#1073#1098#1077#1082#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082':'
  end
  object SrcList: TListBox
    Left = 8
    Top = 96
    Width = 170
    Height = 257
    ItemHeight = 15
    MultiSelect = True
    Sorted = True
    TabOrder = 0
    OnDblClick = SrcListDblClick
  end
  object DstList: TListBox
    Left = 215
    Top = 96
    Width = 170
    Height = 257
    ItemHeight = 15
    TabOrder = 1
    OnDblClick = DstListDblClick
  end
  object SrcObjEdit: TEdit
    Left = 8
    Top = 32
    Width = 377
    Height = 23
    ReadOnly = True
    TabOrder = 2
  end
  object ClearZakazCheckBox: TCheckBox
    Left = 123
    Top = 369
    Width = 177
    Height = 17
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1082#1072#1079#1099
    TabOrder = 3
  end
  object ZakazSelectDataSet: TpFIBDataSet
    Transaction = ShopMainForm.pFIBTransaction1
    Database = ShopMainForm.pFIBDatabase1
    Left = 176
    Top = 264
  end
end
