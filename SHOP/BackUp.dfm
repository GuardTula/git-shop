object BackUpForm: TBackUpForm
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = #1056#1077#1079#1077#1088#1074#1085#1086#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 366
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 369
    Height = 366
    Align = alClient
    Caption = 'Panel1'
    Enabled = False
    TabOrder = 0
    ExplicitWidth = 361
    ExplicitHeight = 354
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 367
      Height = 364
      Align = alClient
      BorderStyle = bsNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 359
      ExplicitHeight = 352
    end
  end
  object pFIBBackupService1: TpFIBBackupService
    LibraryName = 'fbclient.dll'
    BlockingFactor = 0
    Options = []
    Left = 256
    Top = 168
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 168
    Top = 80
  end
  object IdFTP1: TIdFTP
    Passive = True
    ConnectTimeout = 0
    TransferType = ftBinary
    Username = 'admin'
    UseMLIS = False
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 288
    Top = 169
  end
end
