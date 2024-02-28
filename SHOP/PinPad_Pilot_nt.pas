{ ������ ������ � �������� ��������� }
{
  ������� ������ ������� ����������
  ��� ������ (��������) ������� �� ���������� ����� �������� ��������� ������ ������� �� ���������� ��������� ������� card_authorize(), �������� ���� TType � Amount � ������ ������� �������� � ��������� �����.
  �� ��������� ������ ������� ���������� ���������������� ���� RCode. ���� � ��� ���������� �������� �0� ��� �00�, ����������� ��������� ������� �����������, � ��������� ������ � �����������.
  ����� �����, ���������� ��������� �������� ���� Check. ���� ��� �� ����� NULL, ��� ���������� ��������� �� ������ (� ������������ ������) � ����� ������� ������� ������� GlobalFree().
  � ������, ���� ������� ��������� �� ������������ ��������������� ������ ���������� ���� �� ���� Check, ��� ����� ������������ ��������� ������:
  1) ��������� �������  card_authorize().
  2) ����� ���������� ������ ������� card_authorize(), ���� ���������� ��������� �������, ������� ������� SuspendTrx() � ���������� � ������ ����.
  3) ���� ��� ��������� �������, ������� ������� CommitTrx().
  4) ���� �� ����� ������ ���� �������� ������������ ��������, ������� ������� RollbackTrx() ��� ������ �������.
  ���� � ���� ������ ���� ���������� ��������� ��� ��� ���� �������, �� ���������� ��������� � ������������ ���������. ��� ��������� ������ ����� � ������ ��� ������������� ���������.

  ��� �������� ����� �������� ��������� ������ ������� �� ���������� ��������� ������� close_day(), �������� ���� TType = 7 � ������ ������� �������� � ��������� �����.
  �� ��������� ������ ������� ���������� ��������� �������� ���� Check. ���� ���� Check �� ����� NULL, ��� ���������� ��������� �� ������ (� ������������ ������) � ����� ����� ������� ������� ������� GlobaFree().
}

// �������� ��� �������
// Shift + Ctrl + K + R

unit PinPad_Pilot_nt;

interface

uses Classes, Windows, SysUtils, Generics.Collections, IOUtils, IPinpadBase;

const

{$REGION '���������'}
  // ���� ��������
  OP_PURCHASE = 1;
  /// < ������ �������
  OP_CASH = 2;
  /// < ������ ��������
  OP_RETURN = 3;
  /// < ������� ���� ������ �������
  OP_BALANCE = 4;
  /// < ������
  OP_FUNDS = 6;
  // �������� ��� (������ ������)
  OP_CLOSEDAY = 7;
  /// < ������.�������
  OP_ADD_AUTH = 42;
  /// < ���������� ���������������
  OP_CANC_AUTH = 43;
  /// < ������ ���������������
  OP_PREAUTH = 51;
  /// < ���������������
  OP_COMPLETION = 52;
  /// < ���������� �������
  OP_CASHIN = 53;
  /// < ����� ��������
  OP_CASHIN_COMP = 54;
  /// < ������������� ������
  OP_PILOT_START = 55;
  /// < ������ �����������
  OP_PILOT_STATUS = 56;
  /// < ����� �������  �����������
  OP_PILOT_STOP = 57;
  /// < ��������� �����������
  OP_SETPIN = 58;
  /// < ��������� ����
  OP_CHANGEPIN = 59;
  /// < ����� ����

  // ����� ������ ���� �����������
  AUTH_CODE_LEN: integer = 7;
  // ����� ������ ������ �����
  CARD_ID_LEN: integer = 25;
  // ����� ������ ���� �����
  CARD_HASH_LEN: integer = 41;
  // ������ ���� � ������� ��������
  TRANSDATE_LEN: integer = 20;
  // ����� ������ ������ ������ ���������� * /
  RRN_LEN: integer = 13;
  // ����� ������ ������� ������� �����
  CARD_TRACK3_LEN: integer = 104;

  // ������ ������ ����������� ������ ����� � ����� ��������*/
  MAX_ENCR_DATA: integer = 32;

  // ���� ����
  CT_USER = 0; // ����� �� ����

  CT_VISA = 1; // Visa
  CT_EUROCARD = 2; // Eurocard/Mastercard
  CT_CIRRUS = 3; // Cirrus/Maestro
  CT_AMEX = 4; // Amex
  CT_DINERS = 5; // DinersCLub
  CT_ELECTRON = 6; // VisaElectron
  CT_PRO100 = 7; // PRO100
  CT_CASHIER = 8; // Cashier card
  CT_SBERCARD = 9; // Sbercard
  CT_MIR = 10; // ���

  // ** ������������ ������ �������� ���� ��������� �������.*/
  MAX_PAYMENT_ITEM = 128;

  // ** ������������ ������ ������ AID ������� ����� (� ���� ASCIIZ-������)*/
  MAX_AID_ASCII_LEN = (32 + 1);
  // ** ������������ ������ ������ ����� ������� �� �����*/
  MAX_CARD_NAME_LEN = (32 + 1);
  // ** ������������ ������ ������ ������, ������������ UPOS*/
  MAX_FULL_ERROR_TEXT = 128;

{$ENDREGION}

type

{$REGION '������������ � ������� ��� dll'}
  PPayment_info_item = ^TPayment_info_item;

  TPayment_info_item = packed record
    dwTag: DWORD; // **< ��� ��������� ������� */
    Value: array [0 .. MAX_PAYMENT_ITEM] of char;
    // **< �������� ���� ��������� �������. 128 ����. ::MAX_PAYMENT_ITEM */
    Flags: array of Byte; // **< must be 0x40 for immediate sending    */
    pNextItem: Pointer; // **< ?? */
  end;

  // ��������� ������
  PAuthAnswer = ^TAuthAnswer;

  TAuthAnswer = packed record
    TType: integer;
    // IN ��� ���������� (1 - ������, 3 - �������/������ ������, 7 - ������ ������)
    Amount: UINT; // IN ����� �������� � ��������
    Rcode: array [0 .. 2] of AnsiChar;
    // OUT ��������� ����������� (0 ��� 00 - �������� �����������, ������ �������� - ������)
    AMessage: array [0 .. 15] of AnsiChar;
    // OUT � ������ ������ � ����������� �������� ������� ��������� � ������� ������
    CType: integer;
    { OUT ��� ����������� �����. ��������� ��������:
      1 � VISA
      2 � MasterCard
      3 � Maestro
      4 � American Express
      5 � Diners Club
      6 � VISA Electron
      7 - ���100
      8 - Cashier
      9 - ��������
      10 - ��� }
    Check: PAnsiChar;
    // OUT ��� �������� ����������� �������� ����� ���������� ����, ������� ���������� ��������� ������ ��������� �� ������, � ����� ���������� ������� ������� GlobalFree()
    // ����� ����� �������� nil. � ���� ������ ������� �������� � ��� ���������� ��������� ��������� �� ������.
  end;

  // ����������� ���������
  PAuthAnswer2 = ^TAuthAnswer2;

  TAuthAnswer2 = packed record
    AuthAnswer: TAuthAnswer;
    AuthCode: array [0 .. 6] of AnsiChar;
  end;

  // ��� ���� ����������� ���������
  PAuthAnswer3 = ^TAuthAnswer3;

  TAuthAnswer3 = packed record
    AuthAnswer: TAuthAnswer;
    AuthCode: array [0 .. 6] of AnsiChar;
    CardID: array [0 .. 24] of AnsiChar;
  end;

  // ��� ����� ����������� ���������
  PAuthAnswer4 = ^TAuthAnswer4;

  TAuthAnswer4 = packed record
    AuthAnswer: TAuthAnswer;
    AuthCode: array [0 .. 6] of AnsiChar; // �����: ��� �����������
    CardID: array [0 .. 24] of AnsiChar; // �����: ������������� �����
    ErrorCode: integer; // �����: ��� ������
    TransDate: array [0 .. 19] of AnsiChar; // �����: ���� � ����� ��������
    TransNumber: integer; // �����: ����� ��������
  end;

  // ��� ����� ����������� ���������
  PAuthAnswer5 = ^TAuthAnswer5;

  TAuthAnswer5 = packed record
    AuthAnswer: TAuthAnswer;
    RRN: array [0 .. 12] of AnsiChar;
    AuthCode: array [0 .. 6] of AnsiChar;
  end;

  PAuthAnswer6 = ^TAuthAnswer6;

  TAuthAnswer6 = packed record
    AuthAnswer: TAuthAnswer;
    AuthCode: array [0 .. 6] of AnsiChar; // added after communication with HRS
    CardID: array [0 .. 24] of AnsiChar; // �����: ������������� �����
    ErrorCode: integer;
    TransDate: array [0 .. 19] of AnsiChar; // �����: ���� � ����� ��������
    TransNumber: integer; // �����: ����� ��������
    RRN: Array [0 .. 12] of AnsiChar;
    // ����/�����: ��������� ����� ���������������
  end;

  PAuthAnswer7 = ^TAuthAnswer7;

  TAuthAnswer7 = packed record
    AuthAnswer: TAuthAnswer;
    // ����/�����: �������� ��������� �������� (��.����)
    AuthCode: array [0 .. 6] of AnsiChar; // ��� �����������
    // OUT ��� �������� ����������� (�� ������������� �����) �������� ��� �����������. ��� �������� �� ����� �������� ���� ����� ��������� ��������� �*�.
    CardID: array [0 .. 24] of AnsiChar; // ����� �����
    // OUT ��� �������� ����������� (�� ������������� �����) �������� ����� �����. ��� ������������� ���� ��� �������, ����� ������ 6 � ��������� 4, ����� �������� ��������� �*�.
    SberOwnCard: integer;
    // OUT �������� 1, ���� ����������� ����� ������ ����������, ��� 0 � � ��������� ������
  end;

  PAuthAnswer8 = ^TAuthAnswer8;

  TAuthAnswer8 = packed record
    AuthAnswer: TAuthAnswer;
    // ����/�����: �������� ��������� �������� (��.����)
    AuthCode: array [0 .. 6] of AnsiChar; // ��� �����������
    // OUT ��� �������� ����������� (�� ������������� �����) �������� ��� �����������. ��� �������� �� ����� �������� ���� ����� ��������� ��������� �*�.
    CardID: array [0 .. 24] of AnsiChar; // ����� �����
    // OUT ��� �������� ����������� (�� ������������� �����) �������� ����� �����. ��� ������������� ���� ��� �������, ����� ������ 6 � ��������� 4, ����� �������� ��������� �*�.
    ErrorCode: integer;
    TransDate: array [0 .. 19] of AnsiChar; // �����: ���� � ����� ��������
    TransNumber: integer; // �����: ����� ��������
    RRN: Array [0 .. 12] of AnsiChar;
    EncryptedData: array [0 .. 64] of AnsiChar;
    // ����/�����: ���������� ����� ����� � ���� ��������
  end;

  // ����� ���������������
  PPreauthRec = ^TPreauthRec;

  TPreauthRec = packed record
    Amount: UINT;
    // ����: ����� ��������������� � ��������
    RRN: array [0 .. 12] of AnsiChar; // ����: ��������� ����� ���������������
    Last4Digits: array [0 .. 4] of AnsiChar;
    // ����: ��������� 4 ����� ������ �����
    ErrorCode: UINT; // �����: ��� ����������: 0 - �������.
  end;

  PAuthAnswer9 = ^TAuthAnswer9;

  TAuthAnswer9 = packed record
    AuthAnswer: TAuthAnswer;
    // ����/�����: �������� ��������� �������� (��.����)
    AuthCode: array [0 .. 6] of AnsiChar; // ��� �����������
    // OUT ��� �������� ����������� (�� ������������� �����) �������� ��� �����������. ��� �������� �� ����� �������� ���� ����� ��������� ��������� �*�.
    CardID: array [0 .. 24] of AnsiChar; // ����� �����
    // OUT ��� �������� ����������� (�� ������������� �����) �������� ����� �����. ��� ������������� ���� ��� �������, ����� ������ 6 � ��������� 4, ����� �������� ��������� �*�.
    SberOwnCard: integer;
    // OUT �������� 1, ���� ����������� ����� ������ ����������, ��� 0 � � ��������� ������
    Hash: array [0 .. 40] of AnsiChar;
    // OUT ��� SHA1 �� ������ ����� � ������� ASCIIZ
  end;

  PAuthAnswer10 = ^TAuthAnswer10;

  TAuthAnswer10 = packed record
    AuthAnswer: TAuthAnswer;
    AuthCode: array [0 .. 6] of AnsiChar; // ��� �����������
    CardID: array [0 .. 24] of AnsiChar; // ����� �����
    ErrorCode: integer;
    TransDate: array [0 .. 19] of AnsiChar;
    // �����: ���� � ����� ��������
    TransNumber: integer; // �����: ����� ��������
    SberOwnCard: integer;
    Hash: array [0 .. 40] of AnsiChar;
    // �����: ��� �� ������ �����, � ������� ASCII � ������� ������ � �����
  end;

  PAuthAnswer11 = ^TAuthAnswer11;

  TAuthAnswer11 = packed record
    AuthAnswer: TAuthAnswer;
    AuthCode: array [0 .. 6] of AnsiChar; // ��� �����������
    CardID: array [0 .. 24] of AnsiChar; // ����� �����
    ErrorCode: integer;
    TransDate: array [0 .. 19] of AnsiChar;
    // �����: ���� � ����� ��������
    TransNumber: integer; // �����: ����� ��������
    SberOwnCard: integer;
    Hash: array [0 .. 40] of AnsiChar;
    // �����: ��� �� ������ �����, � ������� ASCII � ������� ������ � �����
    Track3: array [0 .. 103] of AnsiChar; // �����: ������ ������� �����
  end;

  (* * @struct auth_answer12
    *  @brief ���������� card_authorize11 ������������ ������� ����� ������ � ������/�������� ����� ������.
  *)
  PAuthAnswer12 = ^TAuthAnswer12;

  TAuthAnswer12 = packed record
    AuthAnswer: TAuthAnswer;
    // * * < [in , out] �������� ��������� ��������.��.: : auth_answer * /
    AuthCode: array [0 .. 6] of AnsiChar; // ��� �����������
    CardID: array [0 .. 24] of AnsiChar; // ����� �����
    ErrorCode: integer;
    TransDate: array [0 .. 19] of AnsiChar;
    // �����: ���� � ����� ��������
    TransNumber: integer; // �����: ����� ��������
    SberOwnCard: integer;
    Hash: array [0 .. 40] of AnsiChar;
    // �����: ��� �� ������ �����, � ������� ASCII � ������� ������ � �����
    Track3: array [0 .. 103] of AnsiChar; // �����: ������ ������� �����
    RequestID: ULONG;
    // **< [in,out] ���������� ����� ��������. ������ PCI DSS �������.*/
    Department: DWORD;
    (* * < [in] ���������� ����� ������ �� 0 �� 14 - ��,
      ������������.��� ��������� ������ ������ � 0 xFFFFFFFF,
      ����� ������ ����� �������� ����� ��������� ��������� ����� ������� �����.
      ���� ����� ������ ����� ������ ��� ������������ ���������,
      �� �������� ������ ��� ������ 4191. *)
    RRN: array [0 .. 12] of AnsiChar;
    (* * < [in , out] ����� ������ ��������,
      ���������� ������.������������ ��� �������� ������� � �������������
      �����������.�������� ���������� 12 -
      ������� ��������� �����.��� ��������������� ��� ���� �������� ��������
      (��� ��������� ���������� Pilot_nt.dll),
      � ��� ���������� ������� � �������
      (�������� ������ ���� ��������� ���������� ����������;
      ��� ������ ��������� �� ���������, ������������ ��� ���������������). *)
  end;

  // ��������� �������� ������. ��� �������� ���� TType = 0 �����������
  // ������� �����, ����� - ������
  // __declspec(dllexport) int get_statistics(struct auth_answer *auth_answer);
  TGetStatistics = function(auth_ans: PAuthAnswer): integer; cdecl;

  TCardAuthorize = function(track2: Pchar; auth_ans: PAuthAnswer)
    : integer; cdecl;

  {
    ������� ������������ ��� ���������� ����������� �� ���������� �����, � ����� ��� ������������� ��� ��������/������ �������.

    ������� ������:
    track2 - ����� ����� �������� NULL ��� ��������� ������ 2-� ������� �����, ��������� �������� ����������
    TType	-	��� ��������: 1 � ������, 3 ��������/������ ������.
    Amount - ����� �������� � ��������.
    �������� ���������:
    RCode - ��������� �����������. �������� �00� ��� �0� �������� �������� �����������, ����� ������ � ����� � �����������.
    AMessage - � ������ ������ � ����������� �������� ������� ��������� � ������� ������. ��������: ���� �� ����� ������������ ����� 0�00.
    CType
    ��� ����������� �����. ��������� ��������:
    1 � VISA
    2 � MasterCard
    3 � Maestro
    4 � American Express
    5 � Diners Club
    6 � VISA Electron
    �heck
    ��� �������� ����������� �������� ����� ���������� ����, ������� ���������� ��������� ������ ��������� �� ������, � ����� ���������� ������� ������� GlobalFree().
    ����� ����� �������� NULL. � ���� ������ ������� �������� � ��� ���������� ��������� ��������� �� ������.
    AuthCode - ��� �������� ����������� (�� ������������� �����) �������� ��� �����������. ��� �������� �� ����� �������� ���� ����� ��������� ��������� �*�.
    CardID - ��� �������� ����������� (�� ������������� �����) �������� ����� �����. ��� ������������� ���� ��� �������, ����� ������ 6 � ��������� 4, ����� �������� ��������� �*�.
    SberOwnCard - �������� 1, ���� ����������� ����� ������ ����������, ��� 0 � � ��������� ������.
  }
  TCardAuthorize7 = function(track2: Pchar; auth_ans: PAuthAnswer7)
    : integer; cdecl;

  // ���������� �������� �� ������ � ��������� �������������� ������.
  // track2 - ������ ������� ����� � ��������� �������. ���� NULL, ��
  // ����� ���������� ������� �����
  //
  // auth_answer2...auth_answer7 - ��. �������� ����� ���������
  // __declspec(dllexport) int  card_authorize8(char *track2, struct auth_answer8 *auth_answer);

  TCardAuthorize2 = function(track2: Pchar; auth_ans: PAuthAnswer2)
    : integer; cdecl;

  TCardAuthorize3 = function(track2: Pchar; auth_ans: PAuthAnswer3)
    : integer; cdecl;

  TCardAuthorize4 = function(track2: Pchar; auth_ans: PAuthAnswer4)
    : integer; cdecl;

  TCardAuthorize5 = function(track2: Pchar; auth_ans: PAuthAnswer5)
    : integer; cdecl;

  TCardAuthorize6 = function(track2: Pchar; auth_ans: PAuthAnswer6)
    : integer; cdecl;

  TCardAuthorize8 = function(track2: Pchar; auth_ans: PAuthAnswer8)
    : integer; cdecl;

  TCardAuthorize9 = function(track2: Pchar; auth_ans: PAuthAnswer9)
    : integer; cdecl;

  TCardAuthorize10 = function(track2: Pchar; auth_ans: PAuthAnswer10)
    : integer; cdecl;

  TCardAuthorize11 = function(track2: Pchar; auth_ans: PAuthAnswer11)
    : integer; cdecl;

  TCardAuthorize12 = function(track2: Pchar; auth_ans: PAuthAnswer12)
    : integer; cdecl;

  //
  // __declspec(dllexport) int card_complete_multi_auth8(char* track2,
  // struct auth_answer8* auth_ans,
  // struct preauth_rec*  pPreAuthList,
  // int NumAuths);
  TCardCompleteMultiAuth8 = function(track2: Pchar; auth_ans: PAuthAnswer8;
    pPreauthList: PPreauthRec; NumAuths: integer): integer; cdecl;

  // ���������������
  TDone = procedure(); cdecl;

  // ��������� ������ ������
  TGetVer = function(): UINT; cdecl;

  // �������� ����� ���������
  TGetTerminalID = function(pTerminalID: Pchar): integer; cdecl;

  // ������ ����� (������������ 4 ��������� ����� � ��� �� ������ �����)
  TReadCard = function(Last4Digits: Pchar; Hash: Pchar):   integer; cdecl;
  TReadCardSB = function(Last4Digits: Pchar; Hash: Pchar): integer; cdecl;

  {
    ������� ��������� ������� �������. ��� �������� ���������� ���������� 0 (������ ���������),
    ��� ��������� � ��� ������ (������ �� ��������� ��� ����������).
  }
  TTestPinPad = function(): integer; cdecl;

  {
    ������� ������������ ��� ����������� �������� ����� �� ������ � ������������ �������.

    ������� ���������:
    TType - ��� ��������: 7 � �������� ��� �� ������.
    Amount - �� ������������.
    �������� ���������:
    Rcode - �� ������������.
    AMessage - �� ������������.
    CType - �� ������������.
    Check - �������� ����� ������ �� ������, ������� ���������� ��������� ������ ��������� �� ������, � ����� ���������� ������� ������� GlobalFree().
    ����� ����� �������� NULL. � ���� ������ ������� �������� � ��� ���������� ��������� ��������� �� ������.
  }
  TCloseDay = function(auth_ans: PAuthAnswer): integer; cdecl;

  {
    ������ ����� (����������� ������ ����� � ���� �������� ����� � ������� YYMM)

    ����� ����� ����� ����� �� 13 �� 19 ����.
    ����� ����� ������������ ��� ������ ��� �����������, �� ����� �����
    �������������� ���:

    format('Track2 %s=%s', [CardNo, ValidThru])
  }
  TReadCardFull = function(CardNo: PAnsiString; ValidThru: PAnsiString)
    : integer;

  {
    //  ������ ������ ������� ����� ����� ����� �� 40 ��������.
    //  ������ ������� ����� ������:
    //
    //    nnnn...nn=yymmddd...d
    //
    //  ���     '=' - ������-�����������
    //      nnn...n - ����� �����
    //      yymm    - ���� �������� ����� (����)
    //      ddd...d - ��������� ������ �����

    Track2 - �����, ���� ������� ���������� ����������� 2-� �������.
  }
  TReadTrack2 = function(track2: Pchar): integer; cdecl;

  // ������ ����� �����������
  //
  TEnableReader = function(hDestWindow: HWND; msg: UINT): integer; cdecl;
  TDisableReader = function():                            integer; cdecl;

  // SuspendTrx
  {
    ������� ��������� ��������� �������� ���������� � ������������ ���������. ���� ���������� ��������� � ���� ���������, �� ��� ��������� ������ ����� � ������ ��� ����� ��������.
    ������� ���������:
    dwAmount - ����� �������� (� ��������).
    pAuthCode - ��� �����������.
    ������� ������� ���������� ����� ��������� (����� � ��� �����������) �� ���������� � ��������� �������� ��������, ������� ���� ��������� ����� ����������. ���� ���� �� ���� �������� �� ���������, ������� ���������� ��� ������ 4140 � �� ��������� ������� ��������.
  }
  TSuspendTrx = function(dwAmount: DWORD; pAuthCode: PAnsiString)
    : integer; cdecl;

  // CommitTrx
  {
    ������� ���������� ��������� �������� ���������� � ����������� ���������. ����� ����� ���������� ����� �������� � ����� � ��������������� ��� ��������. ��������� �� ����� � ������������ ��������� ����� ��� ������.
    ������� ���������:
    dwAmount - ����� �������� (� ��������).
    pAuthCode - ��� �����������.
    ������� ������� ���������� ����� ��������� (����� � ��� �����������) �� ���������� � ��������� �������� ��������, ������� ���� ��������� ����� ����������. ���� ���� �� ���� �������� �� ���������, ������� ���������� ��� ������ 4140 � �� ��������� ������� ��������.
  }
  TCommitTrx = function(dwAmount: DWORD; pAuthCode: PAnsiString)
    : integer; cdecl;

  // RollBackTrx
  {
    ������� �������� ����������� ������ ��������� �������� �������� (��������, ����� ������������ � ������������ ���������, ���� ��� � �� �����������). ���� ���������� ��� ���� ���������� � ����������� ��������� �������� CommitTrx(), �� ������� RollbackTrx() ���������� � ����� ������ 4141, �� �������� ������� ��������.

    ������� ���������:
    dwAmount - ����� �������� (� ��������).
    pAuthCode - ��� �����������.
    ������� ������� ���������� ����� ��������� (����� � ��� �����������) �� ���������� � ��������� �������� ��������, ������� ���� ��������� ����� ����������. ���� ���� �� ���� �������� �� ���������, ������� ���������� ��� ������ 4140 � �� ��������� ������� ��������.
  }
  TRollBackTrx = function(dwAmount: DWORD; pAuthCode: PAnsiString)
    : integer; cdecl;

  // ����� � ����������� ����.
  // ��� ������ ���� Check ����� ��������� ����� ��������� ��� ������.
  //
  TServiceMenu = function(AuthAnswer: PAuthAnswer): integer; cdecl;

  // ���������� ������ ��� ������ �� �����
  //
  TSetGUIHandles = function(hText: HWND; hEdit: HWND): integer; cdecl;

  TReadCardTrack3 = function(Last4Digits: Pchar; Hash: Pchar; pTrack3: Pchar)
    : integer; cdecl;

  TAbortTransaction = function(): integer; cdecl;

{$ENDREGION}

type
  TPinpadException = class(Exception);

  TPinPad = class(TPinpadBase)
  strict private
    FTerminalID:    string; // ����� ���������
    FGUITextHandle: HWND; // ������ ��� GUI
    FGUIEditHandle: HWND; //
    FAuthAnswer:    TAuthAnswer;
    FAuthAnswer2:   TAuthAnswer2;
    FAuthAnswer3:   TAuthAnswer3;
    FAuthAnswer4:   TAuthAnswer4;
    FAuthAnswer5:   TAuthAnswer5;
    FAuthAnswer6:   TAuthAnswer6;
    FAuthAnswer7:   TAuthAnswer7;
    FAuthAnswer8:   TAuthAnswer8;
    FAuthAnswer9:   TAuthAnswer9;
    FAuthAnswer10:  TAuthAnswer10;
    FAuthAnswer11:  TAuthAnswer11;
    FAuthAnswer12:  TAuthAnswer12;

    FLibHandle: THandle;

    FCheque:   String;
    FAuthCode: String;
    FCardID:   String;
    FRRN:      String;

    FLastError:        integer;
    FLastErrorMessage: string;

    function GetLogFilename: string;
  protected
    // �������� ID ���������
    function GetTerminalID: string;

    function SetGUIHandles(ATextHandle: HWND; AEditHandle: HWND): integer;

    // ���� ������� � ��������, �� ���������� ��� � ���, ����� ����� �������� ��������� �����
    function Initialize(ATextHandle: HWND = 0; AEditHandle: HWND = 0): boolean;

    // �������� ��� ������
    procedure ClearBuffers;
    function GetLastErrorMessage: string;
  public
    // ��������������� (����� _Done �� ����������)
    procedure Done;

    constructor Create(ATextHandle: HWND = 0; AEditHandle: HWND = 0);
      reintroduce;
    destructor Destroy; reintroduce; override;

    // �������� ����� ������ �� ����
    function GetMessageText(ErrorCode: integer): String;

    // ��������� ���������� �������
    function TestPinpad: integer;

    // �����������, ������, �������
    function CardAuth(Summ: Double; Operation: integer): integer;
    function CardAuth2(Summ: Double; Operation: integer): integer;
    function CardAuth3(Summ: Double; Operation: integer): integer;
    function CardAuth4(Summ: Double; Operation: integer): integer;
    function CardAuth5(Summ: Double; Operation: integer): integer;
    function CardAuth6(Summ: Double; Operation: integer;
      ARRN: string = ''): integer;
    function CardAuth7(Summ: Double; Operation: integer): integer;
    function CardAuth8(Summ: Double; Operation: integer): integer;
    function CardAuth9(Summ: Double; Operation: integer): integer;
    function CardAuth10(Summ: Double; Operation: integer): integer;
    function CardAuth11(Summ: Double; Operation: integer): integer;
    function CardAuth12(Summ: Double; Operation: integer): integer;

    function ReadTrack2: string;
    function ReadTrack3: string;

    function SuspendTrx(AAmount: Double; AAuthCode: string = ''): integer;
    function CommitTrx(AAmount: Double; AAuthCode: string = ''): integer;
    function RollBackTrx(AAmount: Double; AAuthCode: string = ''): integer;

    function TryPurchase(AAmount: Double): boolean;
    function TryReturn(AAmount: Double; ARRN: string = ''): boolean;

    function Purchase(Amount: Double): integer;
    function Return(AAmount: Double; ARRN: string = ''): integer;

    // ����������� ������ ���������� � ������������� ����������
    function AbortTransaction: integer;
    // ����������� �����
    function SberShift(IsDetailed: boolean = False): integer;
    // ������ ������
    function CloseDay: integer;
    // ��������� ����
    function ServiceMenu: integer;
  published
    property TerminalID:   string read FTerminalID;
    property AuthAnswer:   TAuthAnswer read FAuthAnswer;
    property AuthAnswer2:  TAuthAnswer2 read FAuthAnswer2;
    property AuthAnswer3:  TAuthAnswer3 read FAuthAnswer3;
    property AuthAnswer4:  TAuthAnswer4 read FAuthAnswer4;
    property AuthAnswer5:  TAuthAnswer5 read FAuthAnswer5;
    property AuthAnswer6:  TAuthAnswer6 read FAuthAnswer6;
    property AuthAnswer7:  TAuthAnswer7 read FAuthAnswer7;
    property AuthAnswer8:  TAuthAnswer8 read FAuthAnswer8;
    property AuthAnswer9:  TAuthAnswer9 read FAuthAnswer9;
    property AuthAnswer10: TAuthAnswer10 read FAuthAnswer10;
    property AuthAnswer11: TAuthAnswer11 read FAuthAnswer11;
    property AuthAnswer12: TAuthAnswer12 read FAuthAnswer12;

    property Cheque:   string read FCheque;
    property CardID:   string read FCardID;
    property AuthCode: string read FAuthCode;
    property RRN:      string read FRRN;

    property LastError:        integer read FLastError;
    property LastErrorMessage: string read GetLastErrorMessage;
  end;

implementation

uses ShopMain;

{ TPinPad }

function TPinPad.AbortTransaction: integer;
var
  Func: TAbortTransaction;
begin
  Result := -1;
  try
    try

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_AbortTransaction'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _AbortTransaction �� ������� � pilot_nt.dll');

      Result := Func;
      FLastError := Result;
    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;

  finally
    Func := nil;
  end;
end;

function TPinPad.CardAuth(Summ: Double; Operation: integer): integer;
var
  Func: TCardAuthorize;
  Sum:  UINT;
begin
  Result := -1;
  ClearBuffers;

  try
    try
      Sum := Round(Summ * 100);
      FAuthAnswer.Amount := Sum;
      FAuthAnswer.TType := Operation;
      FAuthAnswer.CType := 0;

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������', [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_card_authorize'));

      if not Assigned(Func) then
        raise TPinpadException.Create  ('������� _card_authorize �� ������� � pilot_nt.dll');

      Result := Func(nil, @FAuthAnswer);
      FLastError := Result;

      FCheque := PAnsiChar(FAuthAnswer.Check);

      FLastErrorMessage := AnsiString(FAuthAnswer.AMessage);
    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

function TPinPad.CardAuth10(Summ: Double; Operation: integer): integer;
var
  Func: TCardAuthorize10;
  Sum:  UINT;
begin
  Result := -1;
  ClearBuffers;
  try
    try
      Sum := Round(Summ * 100);
      FAuthAnswer.Amount := Sum;
      FAuthAnswer.TType := Operation;
      FAuthAnswer.CType := 0;

      FAuthAnswer10.AuthAnswer := FAuthAnswer;

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_card_authorize10'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _card_authorize10 �� ������� � pilot_nt.dll');

      Result := Func(nil, @FAuthAnswer10);
      FLastError := Result;

      FAuthAnswer := FAuthAnswer10.AuthAnswer;
      FCheque := PAnsiChar(FAuthAnswer.Check);
      FAuthCode := AnsiString(FAuthAnswer10.AuthCode);
      FCardID := AnsiString(FAuthAnswer10.CardID);
      FLastErrorMessage := AnsiString(FAuthAnswer.AMessage);

    except
      on E: Exception do
        raise Exception.Create(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

function TPinPad.CardAuth11(Summ: Double; Operation: integer): integer;
var
  Func: TCardAuthorize11;
  Sum:  UINT;
begin
  Result := -1;
  ClearBuffers;

  try
    try
      Sum := Round(Summ * 100);
      FAuthAnswer.Amount := Sum;
      FAuthAnswer.TType := Operation;
      FAuthAnswer.CType := 0;

      FAuthAnswer11.AuthAnswer := FAuthAnswer;

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_card_authorize11'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _card_authorize11 �� ������� � pilot_nt.dll');

      Result := Func(nil, @FAuthAnswer11);
      FLastError := Result;

      FAuthAnswer := FAuthAnswer11.AuthAnswer;
      FCheque := PAnsiChar(FAuthAnswer.Check);
      FAuthCode := AnsiString(FAuthAnswer11.AuthCode);
      FCardID := AnsiString(FAuthAnswer11.CardID);
      FLastErrorMessage := AnsiString(FAuthAnswer.AMessage);
    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

function TPinPad.CardAuth12(Summ: Double; Operation: integer): integer;
var
  Func: TCardAuthorize12;
  Sum:  UINT;
begin
  Result := -1;
  ClearBuffers;
  try
    try
      Sum := Round(Summ * 100);
      FAuthAnswer.Amount := Sum;
      FAuthAnswer.TType := Operation;
      FAuthAnswer.CType := 0;

      FAuthAnswer12.AuthAnswer := FAuthAnswer;

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_card_authorize12'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _card_authorize12 �� ������� � pilot_nt.dll');

      Result := Func(nil, @FAuthAnswer12);
      FLastError := Result;

      FAuthAnswer := FAuthAnswer12.AuthAnswer;
      FCheque := PAnsiChar(FAuthAnswer.Check);
      FAuthCode := AnsiString(FAuthAnswer12.AuthCode);
      FCardID := AnsiString(FAuthAnswer12.CardID);
      FLastErrorMessage := AnsiString(FAuthAnswer.AMessage);

    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

function TPinPad.CardAuth2(Summ: Double; Operation: integer): integer;
var
  Func: TCardAuthorize2;
  Sum:  UINT;
begin
  Result := -1;
  ClearBuffers;
  try
    try

      Sum := Round(Summ * 100);
      FAuthAnswer.Amount := Sum;
      FAuthAnswer.TType := Operation;
      FAuthAnswer.CType := 0;

      FAuthAnswer2.AuthAnswer := FAuthAnswer;

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_card_authorize2'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _card_authorize2 �� ������� � pilot_nt.dll');

      Result := Func(nil, @FAuthAnswer2);
      FLastError := Result;

      FAuthAnswer := FAuthAnswer2.AuthAnswer;
      FCheque := PAnsiChar(FAuthAnswer.Check);
      FAuthCode := AnsiString(FAuthAnswer2.AuthCode);
      FLastErrorMessage := AnsiString(FAuthAnswer.AMessage);

    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

function TPinPad.CardAuth3(Summ: Double; Operation: integer): integer;
var
  Func: TCardAuthorize3;
  Sum:  UINT;
begin
  Result := -1;
  ClearBuffers;
  try
    try
      Sum := Round(Summ * 100);
      FAuthAnswer.Amount := Sum;
      FAuthAnswer.TType := Operation;
      FAuthAnswer.CType := 0;

      FAuthAnswer3.AuthAnswer := FAuthAnswer;

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_card_authorize3'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _card_authorize3 �� ������� � pilot_nt.dll');

      Result := Func(nil, @FAuthAnswer3);
      FLastError := Result;

      FAuthAnswer := FAuthAnswer3.AuthAnswer;
      FCheque := PAnsiChar(FAuthAnswer.Check);
      FAuthCode := AnsiString(FAuthAnswer3.AuthCode);
      FCardID := AnsiString(FAuthAnswer3.CardID);
      FLastErrorMessage := AnsiString(FAuthAnswer.AMessage);

    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

function TPinPad.CardAuth4(Summ: Double; Operation: integer): integer;
var
  Func: TCardAuthorize4;
  Sum:  UINT;
begin
  Result := -1;
  ClearBuffers;
  try
    try
      Sum := Round(Summ * 100);
      FAuthAnswer.Amount := Sum;
      FAuthAnswer.TType := Operation;
      FAuthAnswer.CType := 0;

      FAuthAnswer7.AuthAnswer := FAuthAnswer;

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_card_authorize4'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _card_authorize4 �� ������� � pilot_nt.dll');
      Result := Func(nil, @FAuthAnswer4);
      FLastError := Result;

      FAuthAnswer := FAuthAnswer4.AuthAnswer;
      FCheque := PAnsiChar(FAuthAnswer.Check);
      FAuthCode := AnsiString(FAuthAnswer4.AuthCode);
      FCardID := AnsiString(FAuthAnswer4.CardID);
      FLastErrorMessage := AnsiString(FAuthAnswer.AMessage);

    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

function TPinPad.CardAuth5(Summ: Double; Operation: integer): integer;
var
  Func: TCardAuthorize5;
  Sum:  UINT;
begin
  Result := -1;
  ClearBuffers;
  try
    try
      Sum := Round(Summ * 100);
      FAuthAnswer.Amount := Sum;
      FAuthAnswer.TType := Operation;
      FAuthAnswer.CType := 0;

      FAuthAnswer5.AuthAnswer := FAuthAnswer;

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_card_authorize5'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _card_authorize5 �� ������� � pilot_nt.dll');

      Result := Func(nil, @FAuthAnswer5);
      FLastError := Result;

      FAuthAnswer := FAuthAnswer5.AuthAnswer;
      FCheque := PAnsiChar(FAuthAnswer.Check);
      FAuthCode := AnsiString(FAuthAnswer5.AuthCode);
      FLastErrorMessage := AnsiString(FAuthAnswer.AMessage);
      FRRN := AnsiString(FAuthAnswer5.RRN);

    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

function TPinPad.CardAuth6(Summ: Double; Operation: integer;
  ARRN: string): integer;
var
  Func:    TCardAuthorize6;
  Sum:     UINT;
  ATrack2: Pchar;
  i:       integer;
begin
  Result := -1;
  ClearBuffers;
  try
    try
      Sum := Round(Summ * 100);
      FAuthAnswer.Amount := Sum;
      FAuthAnswer.TType := Operation;
      FAuthAnswer.CType := 0;

      FAuthAnswer6.AuthAnswer := FAuthAnswer;

      if ARRN = '' then
      begin
        ATrack2 := Pchar(AnsiString('QSELECT'));
        for i := 0 to length(ARRN) - 1 do
          FAuthAnswer6.RRN[i] := AnsiChar(ARRN[i]);
      end;

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_card_authorize6'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _card_authorize6 �� ������� � pilot_nt.dll');

      if ARRN <> '' then
        Result := Func(ATrack2, @FAuthAnswer6)
      else
        Result := Func(nil, @FAuthAnswer6);

      FLastError := Result;

      FLastError := FAuthAnswer6.ErrorCode;
      FAuthAnswer := FAuthAnswer6.AuthAnswer;
      FCheque := PAnsiChar(FAuthAnswer.Check);
      FAuthCode := AnsiString(FAuthAnswer6.AuthCode);
      FCardID := AnsiString(FAuthAnswer6.CardID);
      FLastErrorMessage := AnsiString(FAuthAnswer.AMessage);
      FRRN := AnsiString(FAuthAnswer6.RRN);

    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

function TPinPad.CardAuth7(Summ: Double; Operation: integer): integer;
var
  Func: TCardAuthorize7;
  Sum:  UINT;
begin
  Result := -1;
  ClearBuffers;
  try
    try
      Sum := Round(Summ * 100);
      FAuthAnswer.Amount := Sum;
      FAuthAnswer.TType := Operation;
      FAuthAnswer.CType := 0;

      FAuthAnswer7.AuthAnswer := FAuthAnswer;

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_card_authorize7'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _card_authorize7 �� ������� � pilot_nt.dll');

      Result := Func(nil, @FAuthAnswer7);
      FLastError := Result;

      FAuthAnswer := FAuthAnswer7.AuthAnswer;
      FCheque := PAnsiChar(FAuthAnswer.Check);
      FAuthCode := AnsiString(FAuthAnswer7.AuthCode);
      FCardID := AnsiString(FAuthAnswer7.CardID);
      FLastErrorMessage := AnsiString(FAuthAnswer.AMessage);

    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

function TPinPad.CardAuth8(Summ: Double; Operation: integer): integer;
var
  Func: TCardAuthorize8;
  Sum:  UINT;
begin
  Result := -1;
  ClearBuffers;
  try
    try
      Sum := Round(Summ * 100);
      FAuthAnswer.Amount := Sum;
      FAuthAnswer.TType := Operation;
      FAuthAnswer.CType := 0;

      FAuthAnswer8.AuthAnswer := FAuthAnswer;

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_card_authorize8'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _card_authorize8 �� ������� � pilot_nt.dll');

      Result := Func(nil, @FAuthAnswer8);
      FLastError := Result;

      FAuthAnswer := FAuthAnswer8.AuthAnswer;
      FCheque := PAnsiChar(FAuthAnswer.Check);
      FAuthCode := AnsiString(FAuthAnswer8.AuthCode);
      FCardID := AnsiString(FAuthAnswer8.CardID);
      FLastErrorMessage := AnsiString(FAuthAnswer.AMessage);
      FRRN := AnsiString(FAuthAnswer8.RRN);

    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

function TPinPad.CardAuth9(Summ: Double; Operation: integer): integer;
var
  Func: TCardAuthorize9;
  Sum:  UINT;
begin
  Result := -1;
  ClearBuffers;
  try
    try
      Sum := Round(Summ * 100);
      FAuthAnswer.Amount := Sum;
      FAuthAnswer.TType := Operation;
      FAuthAnswer.CType := 0;

      FAuthAnswer9.AuthAnswer := FAuthAnswer;

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_card_authorize9'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _card_authorize9 �� ������� � pilot_nt.dll');

      Result := Func(nil, @FAuthAnswer9);
      FLastError := Result;

      FAuthAnswer := FAuthAnswer9.AuthAnswer;
      FCheque := PAnsiChar(FAuthAnswer.Check);
      FAuthCode := AnsiString(FAuthAnswer9.AuthCode);
      FCardID := AnsiString(FAuthAnswer9.CardID);
      FLastErrorMessage := AnsiString(FAuthAnswer.AMessage);

    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

procedure TPinPad.ClearBuffers;
begin
  try
    try
      ZeroMemory(@FAuthAnswer, SizeOf(FAuthAnswer));
      ZeroMemory(@FAuthAnswer2, SizeOf(FAuthAnswer2));
      ZeroMemory(@FAuthAnswer3, SizeOf(FAuthAnswer3));
      ZeroMemory(@FAuthAnswer4, SizeOf(FAuthAnswer4));
      ZeroMemory(@FAuthAnswer5, SizeOf(FAuthAnswer5));
      ZeroMemory(@FAuthAnswer6, SizeOf(FAuthAnswer6));
      ZeroMemory(@FAuthAnswer7, SizeOf(FAuthAnswer7));
      ZeroMemory(@FAuthAnswer8, SizeOf(FAuthAnswer8));
      ZeroMemory(@FAuthAnswer9, SizeOf(FAuthAnswer9));
      ZeroMemory(@FAuthAnswer10, SizeOf(FAuthAnswer10));
      ZeroMemory(@FAuthAnswer11, SizeOf(FAuthAnswer11));
      ZeroMemory(@FAuthAnswer12, SizeOf(FAuthAnswer12));

    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    FLastError := 0;
    FLastErrorMessage := '';
    FAuthCode := '';
    FRRN := '';
    FCardID := '';
    FCheque := '';
  end;
end;

function TPinPad.CloseDay: integer;
var
  Func: TCloseDay;
begin
  Result := -1;
  ClearBuffers;
  try
    try
      FAuthAnswer.TType := OP_CLOSEDAY;
      FAuthAnswer.Amount := 0;
      FAuthAnswer.CType := 0;
      FAuthAnswer.Check := PAnsiChar('');

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_close_day'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _close_day �� ������� � pilot_nt.dll');

      Result := Func(@FAuthAnswer);
      FLastError := Result;
      FLastErrorMessage := PAnsiChar(@AuthAnswer.AMessage);
      FCheque := PAnsiChar(AuthAnswer.Check);
    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;

  finally
    Func := nil;
  end;
end;

function TPinPad.CommitTrx(AAmount: Double; AAuthCode: string): integer;
var
  Func: TCommitTrx;
  ASum: UINT;
begin
  Result := -1;
  try
    try
      ASum := Round(AAmount * 100);
      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_CommitTrx'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _CommitTrx �� ������� � pilot_nt.dll');

      if AAuthCode = '' then
        Result := Func(ASum, nil)
      else
        Result := Func(ASum, PAnsiString(AnsiString(AAuthCode)));
      FLastError := Result;
      FLastErrorMessage := GetMessageText(Result);

      if FLastError > 0 then
        PinpadLog(FLastErrorMessage);
//        TLogger.Error(FLastErrorMessage);
    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;

  finally
    Func := nil;
  end;
end;

constructor TPinPad.Create(ATextHandle: HWND; AEditHandle: HWND);
begin
  FLibHandle := LoadLibrary(Pchar(LibName));

  if FLibHandle <= 0 then
  begin
    raise TPinpadException.Create(Format('�� ���� ��������� %s', [LibName]));
    Exit;
  end;

  Initialize(ATextHandle, AEditHandle);
//  PinpadLog(Format('���������� %s ���������', [LibName]));
//  TLogger.Info(Format('���������� %s ���������', [LibName]));
  inherited Create;
end;

{ DONE: ���������� }
destructor TPinPad.Destroy;
begin
  ClearBuffers;
  Done;

  if FLibHandle <> 0 then
    FreeLibrary(FLibHandle);

  inherited Destroy;
end;

procedure TPinPad.Done;
var
  Func: TDone;
begin
  try
    try
      @Func := GetProcAddress(FLibHandle, Pchar('_Done'));
      Func;
    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

{$REGION 'GetErrorMessage'}

function TPinPad.GetMessageText(ErrorCode: integer): String;
begin
  case ErrorCode of
    - 1:
      Result := '����������� ������. ��. ���';
    12:
      Result := '������ ��������� ������ � ���-�������. ��������� ������ ���: 1. � ���������� ������ �������� ��� �������.'
        + ' ������ ���� ��-2, � ������� ��-3. 2. ���� ������ ��������� �����������, �� ������ ����� ������� ���-����. �� ��� �������������, ��� �����������. ����������� ��������� ������ �� ������ ����, � ����� � �� USB.';
    99:
      Result := '��������� ������� � ��������, ���� ���������� ������� ��������� ���-���� (�� ��� ����������� � �������, ��� �������� ������ ����������).';
    361, 362, 363, 364:
      Result := '��������� ������� � ����� �����. ��� �� ��������. ����������� �������� ������ �����. ���� ������ ��������� �� ���� ������ � ���������� ������� ����� �������.';
    403:
      Result := '������ ������ ��� ����� ���� (��������)';
    405:
      Result := '��� ������� ������������ (��������)';
    444, 507:
      Result := '����� ���� �������� ����� (��������)';
    518:
      Result := '�� ��������� ����������� �������� ����';
    521:
      Result := '�� ����� ������������ ������� (��������)';
    572:
      Result := '����� ���� �������� ����� (��������)';
    574, 579:
      Result := '����� ������������� (��������)';
    584, 585:
      Result := '����� ������ ������������ ����� (��������)';
    705, 706, 707:
      Result := '����� ������������� (��������)';
    708, 709:
      Result := '��� ������� ������������ (��������)';
    2000:
      Result := '�������� �������� �������� ������� ������'; // . ������ ��������� ������� � �� ��������� ��������������� ������ ������, � �� ��������� ��� ��� ��������� ������.
    2002:
      Result := '������ ������� ����� ������ ���. ����� �������.';
    2004, 2005, 2006, 2007, 2405, 2406, 2407:
      Result := '����� ������������� (��������)';
    3001:
      Result := '������������ ������� ��� �������� �� ����� (��������)';
    3002:
      Result := '�� ����� ������� �������� ���������� �������� ������� (��������)';
    3019, 3020, 3021:
      Result := '�� ������� ���������� ������������ ������ (��������)';
    4100:
      Result := '��� ����� � ������ ��� ��������� ��������. ��������, �� ��������� ������� ����� �������� ���� ������� � ��������� ��� ��������� ��������.';
    4101, 4102:
      Result := '����� ��������� �� ����������������';
    4103, 4104:
      Result := '������ ������ � ����� �����';
    4108:
      Result := '����������� ������ ��� �������� ����� ����� (������ ������������ �������)';
    4110, 4111, 4112:
      Result := '��������� ���������������� ����� ��������� (��������)';
    4113, 4114:
      Result := '�������� �����, ���������� ��� ����� � ������ (��������)';
    4115:
      Result := '������ ���� ��� ����� ���� ��������';
    4116:
      Result := '������� �������� 4 ��������� ����� ������ �����';
    4117:
      Result := '������ ��������� �� ����� ����';
    4119:
      Result := '��� ����� � ������. ������ ��������� ������� � �������� ���� KLK ��� ������� Verifone pp1000se ��� ����������� ������� Verifone.'
        + ' ���� �������� Verifone �������� �� Ethernet, �� ������ ���������� �� ������ �����, ������� �������� ����� � 115200 �� 57600 ���.';
    4120:
      Result := '� ������� ��� ����� KLK.';
    4121:
      Result := '������ �������� ��������� ���������. ���������� �������� ���� BTCH.D.';
    4122:
      Result := '������ ����� ������: ���� �� ����� ��� ������� KLK, ���� � ���������� ��������� ������ �������� �������.';
    4123:
      Result := '�� ��������� ��� ��������� ������';
    4124:
      Result := '�� ��������� ��� ������-������';
    4125:
      Result := '�� ����� ���� ���, � ��������� ���� ��������� ������';
    4128:
      Result := '�������� ��� � ��� ��� ������ ������. ��������, �������� ���� KLK.';
    4130:
      Result := '������ ��������� ���������. ���� ������ ������ ������ (����� ��������� ��� ������, ����� ��������� ������ ������).';
    4131:
      Result := '���������� ��� ������� ��-2, �� � ������� ��������� ��������� ���������� ������ ��� ������� (��������� ��� �������� �����). ���������� �������� ���������� TLV-���� ��� ��������� ��������� ��������.';
    4132:
      Result := '�������� ��������� ������. ��������, ����� �������� �� �������� ������ �� ���������� ������ ����. ��������� �������� ������. ���� ������ ��������� ���������, ��������, ����� ����������.';
    4134:
      Result := '������� ����� �� ����������� ������ ������ �� ��������� (������ ����� 5 ���� � ������� ��������� ��������).';
    4135:
      Result := '��� SAM-����� ��� ���������� ������ (��������)';
    4136:
      Result := '��������� ����� ������ ������ �������� � �������.';
    4137:
      Result := '������ ��� ��������� ����� ������ ����.';
    4138:
      Result := '����� ����� ���������� �� ����� ��������� � ������� ����� �����������.';
    4139:
      Result := '� ���������� ��������� ��� �� ������ �������� �����, ���������� ��� ��������� ��������.';
    4140:
      Result := '������� ������� ����� ��� ��� ����������� � ������� SUSPEND �� �������� ���������.';
    4141:
      Result := '���������� ��������� ������� SUSPEND: �� ������ ���� SHCN.D.';
    4142:
      Result := '�� ������� ��������� ������� ROLLBACK �� �������� ��������.';
    4143:
      Result := '�� ��������� ������� ������ ����-����.';
    4144, 4145, 4146, 4147:
      Result := '�������� ������ ����-����� �� ��������� (��� �������� � �������� ��� �����������).';
    4148:
      Result := '����� � ����-�����.';
    4149:
      Result := '�� ����� ��� ������� ���������.';
    4150:
      Result := '�������� �����, ���������� ��� ����� � ������ (��� �������� �� ����� �������� ��� �����������).';
    4151:
      Result := '����� ���� �������� ����� (��� �������� �� ����� �������� ��� �����������).';
    4152:
      Result := '�� ����� ��� ������ ���������� (���100).';
    4153:
      Result := '������ ���������� �� ����� ����� ����������� ������ (���100).';
    4154:
      Result := '���������� ����������� ������ ���������� �����, ������ ��� ��� ����� ������� ������ � ����, � ��������� ��������� ������ (���100).';
    4155:
      Result := '������ ���������� ���� (���100).';
    4160:
      Result := '�������� ����� �� ����� ��� ���������� �������������� ������';
    4161:
      Result := '�� ��������� ��� ����� � �������������� ������������ BSCP.CR';
    4162, 4163, 4164:
      Result := '������ ����������� ��������������� ����������� �����. ��������, �������� ���� BSCP.CR';
    4165, 4166, 4167:
      Result := '������ �������� �������������� ���������� � �����. ��������, �������� ���� BSCP.CR';
    4168, 4169:
      Result := '������ ����������� �������� �������, ��������� � �����.';
    4171:
      Result := '� ������ ����� �� ������ enrollment�a ��� �������������� ������������.';
    4202:
      Result := '���� ��� ��������� ��������: �������� �������� � ������.';
    4203:
      Result := '�� ��������� ��� �������� ��� ��������� ��� ��������� ��������.';
    4208:
      Result := '������ ��������� ��������: �� ������� �� ����������� �����-���� ������ ��� ������� ���������.';
    4209:
      Result := '������ ��������� ��������: �� ������� �������� � �������� � ��.';
    4211:
      Result := '�� ��������� ��� EMV-����� � ������� 62 (�� ����� ��� ��������� ��������).';
    4300:
      Result := '������������ ���������� ��� ������� ������ sb_pilot. � ��������� ������ ������� �� ��� ��������� ���������.';
    4301:
      Result := '�������� ��������� �������� � UPOS ������������ ��� ��������';
    4302:
      Result := '�������� ��������� �������� � UPOS ������������ ��� �����';
    4303:
      Result := '��� �����, ���������� �� �������� ���������, �� �������� � ���������� UPOS. ��������, �� ����� ����� ������� ��������� '
        + ' ��������� � ����������� UPOS. ���������� ������� ���������� ���� ���������, � �������� ��������� ���������� � �������, ��� ������� �������� (� ������, � ����� ����) ���.';
    4305:
      Result := '������ ������������� ���������� sb_kernel.dll. �������� ��������� ������� ���������� � ����� ������ �������.';
    4306:
      Result := '"���������� sb_kernel.dll �� ���� ����������������. ��� ������ ����� ������ ��������� ����� ���������� ���������� ����� ��������� ��������. ����� ������ ��������� ��������."';
    4308:
      Result := '� ������ ������� ���� ����� ������������ ����� �� �������, ������� ������ ������������ ������ 4331-4342';
    4309:
      Result := '�������� ������. ��� ������ ��������� � ��������������� ��������, ������� ��������� �� ������ ���������:'
        + ' � ������ ����� ������ (��� �����, ��� �������, �������� ���� KLK � �.�.) �������� ��������� ��� ����� ����������� � ���������� '
        + ' sb_kernel.dll ����� ���� ��� ������. ��������� �� ��������� ���������� ��� ������� ��� �� ���������, �� �� ������ ���� ��� ���������� �������� ���������'
        + ' ��� 4309 � �������� ������, ��� ��������� ��� ������. �������� ��� ������ (���, ������� ���������� ������� ������) �������� ��������� ��� ���� ��������.';
    4310:
      Result := '�������� ��������� �������� � UPOS ������������ ����2.';
    4313:
      Result := '� �������� ��������� �������� ���� ����� �����, � ����� UPOS ������ ������.';
    4314:
      Result := '�������� ��������� �������� ��� �������� ������� �� ������������� �����, � ��������� ���� ����� ��������.';
    4332:
      Result := '������ ������ �� ��������� (������� ����������, �� �������� � ����� ������).';
    4333:
      Result := '����������� ����������� ����� ���������� (������� ����������, �� �������� � ����� ������).';
    4334:
      Result := '����� �� �������. ���� ���� �������� ����� ������� �������� ������� ESC, ���� ������ ����� �������.';
    4335:
      Result := '����� �� ������� ��� �������� ����� �����.';
    4336:
      Result := '�� �������� ��������� ������� �������� ��� ������.';
    4337:
      Result := '�� �������� ��������� ������� �������� ��� �����.';
    4338:
      Result := '������� �������� �� ����� ��������, �� ��������� ����� �������� �� �������.';
    4339:
      Result := '������� ������������ �������� �� ����� ��������.';
    4340:
      Result := '������ ���������� ���������� ����� ��������.';
    4341:
      Result := '������� �������� �� ����� ��������, �� ��������� ����� ������� ����, ���� �� ��������� �������.';
    4342:
      Result := '������: ���������� ��������� ���������� ���� UPOS (���� ������-�� �� ���������).';
    4400 - 4499:
      Result := Format('�� ����������� ������� ������� ��� ������ %d.',
        [ErrorCode - 4400]);
    5002:
      Result := '����� ����� �������� � ������� ���� ���� �� ����������, �������������� ����� Offline Enciphered PIN.';
    5026:
      Result := '������ �������� RSA-�������. �� ��������� ����������� (��� ������������) ���� �� ������ �� ������� ������ EMV�.';
    5063:
      Result := '�� ����� ���100 ��� ������ ����������.';
    5100 - 5108:
      Result := '�������� ������ �� ���� �����';
    5109:
      Result := '���� �������� ����� �����';
    5110:
      Result := '���� �������� ����� ��� �� �������';
    5111:
      Result := '��� ���� ����� ����� �������� �� ���������';
    5116, 5120:
      Result := '������ ��������� �� ����� ����';
    5133:
      Result := '�������� ��������� ������';
  end;
end;

function TPinPad.GetLastErrorMessage: string;
begin
  if FLastErrorMessage <> '' then
    Result := FLastErrorMessage
  else
    Result := GetMessageText(FLastError);
end;

function TPinPad.GetLogFilename: string;
begin
  Result := TPath.Combine(GetCurrentDir,
    'KKM.Log\' + FormatDateTime('YYYY-MM-dd', Date) + '.log');
end;

{$ENDREGION}

function TPinPad.GetTerminalID: string;
var
  Func: TGetTerminalID;
  S:    Pchar;
begin
  Result := '';
  try
    try
      GetMem(S, 255);

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_GetTerminalID'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� GetTerminalID �� ������� � pilot_nt.dll');

      FLastError := Func(S);
      FLastErrorMessage := GetMessageText(FLastError);

      if FLastError = 0 then
        Result := PAnsiChar(S)
      else
        Result := '';
    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    FreeMem(S, SizeOf(S^));
    Func := nil;
  end;
end;

function TPinPad.Initialize(ATextHandle, AEditHandle: HWND): boolean;
begin
  Result := False;
  try
    try
      FGUITextHandle := ATextHandle;
      FGUIEditHandle := AEditHandle;
      FTerminalID := '';
      ClearBuffers;

      FTerminalID := GetTerminalID; // ����� �������� ����� ���������
      if FTerminalID = '' then
        raise Exception.Create('������ �� ���������������');
//      PinpadLog(Format('��������: %s', [FTerminalID]));
//      TLogger.Info(Format('��������: %s', [FTerminalID]));
      if (FGUITextHandle <> 0) and (FGUIEditHandle <> 0) then
        FLastError := SetGUIHandles(ATextHandle, AEditHandle);
    except
      on E: Exception do
        PinpadLog(E.Message + #13 + FLastErrorMessage);
//        TLogger.Error(E.Message + #13 + FLastErrorMessage);
    end;

  finally
    Result := FLastError = 0;
  end;
end;

function TPinPad.Purchase(Amount: Double): integer;
begin
  Result := TestPinpad;
  if Result = 0 then
    Result := CardAuth6(Amount, OP_PURCHASE);
end;

function TPinPad.TryPurchase(AAmount: Double): boolean;
begin
  Result := TestPinpad = 0;
  if Result then
    Result := (CardAuth6(AAmount, OP_PURCHASE) = 0);
  Result := Result and (SuspendTrx(AAmount, FAuthCode) = 0);
  if not Result then
    AbortTransaction;
end;

function TPinPad.ReadTrack2: string;
var
  Func: TReadTrack2;
  Res:  Pchar;
begin
  Result := '';
  try
    try
      GetMem(Res, 255);

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_ReadTrack2'));

      Func(Res);
      Result := PAnsiChar(Res);
    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;

  finally
    FreeMem(Res, SizeOf(Res^));
    Func := nil;
  end;
end;

function TPinPad.ReadTrack3: string;
var
  Func:  TReadCardTrack3;
  Res:   Pchar;
  Last4: Pchar;
  Hash:  Pchar;
begin
  Result := '';
  try
    try
      GetMem(Res, 255);
      GetMem(Last4, 4);
      GetMem(Hash, 255);

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_ReadCardTrack3'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _ReadCardTrack3 �� ������� � pilot_nt.dll');
      FLastError := Func(Last4, Hash, Res);
      Result := PAnsiChar(Res);
      FCardID := PAnsiChar(Last4);
    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;

  finally
    FreeMem(Res, SizeOf(Res^));
    FreeMem(Last4, SizeOf(Last4^));
    FreeMem(Hash, SizeOf(Hash^));
    Func := nil;
  end;
end;

function TPinPad.Return(AAmount: Double; ARRN: string): integer;
begin
  Result := TestPinpad;
  if Result = 0 then
  begin
    if ARRN <> '' then
      Result := CardAuth6(AAmount, OP_RETURN, ARRN)
    else
      Result := CardAuth6(AAmount, OP_RETURN);
  end;
end;

function TPinPad.TryReturn(AAmount: Double; ARRN: string = ''): boolean;
begin
  Result := TestPinpad = 0;
  if ARRN <> '' then
    Result := CardAuth6(AAmount, OP_RETURN, ARRN) = 0
  else
    Result := CardAuth6(AAmount, OP_RETURN) = 0;
end;

function TPinPad.RollBackTrx(AAmount: Double; AAuthCode: string = ''): integer;
var
  Func: TRollBackTrx;
  ASum: UINT;
begin
  Result := -1;
  try
    try
      ASum := Round(AAmount * 100);
      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_RollbackTrx'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _RollbackTrx �� ������� � pilot_nt.dll');

      if AAuthCode = '' then
        Result := Func(ASum, nil)
      else
        Result := Func(ASum, PAnsiString(AnsiString(AAuthCode)));
      FLastError := Result;
      FLastErrorMessage := GetMessageText(Result);

      if FLastError > 0 then
        PinpadLog(FLastErrorMessage);
//        TLogger.Error(FLastErrorMessage);
    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;

  finally
    Func := nil;
  end;
end;

// False - ����������� �����, True - ������� ���
function TPinPad.SberShift(IsDetailed: boolean = False): integer;
var
  Func: TGetStatistics;
begin
  Result := TestPinpad;

  if Result = 0 then
  begin
    Result := -1;
    try
      try
        if FLibHandle <= 0 then
        begin
          raise TPinpadException.Create(Format('���������� %s �� ���������',
              [LibName]));
          Exit;
        end;

        ClearBuffers;

        case IsDetailed of
          True:
            FAuthAnswer.TType := 1;
          False:
            FAuthAnswer.TType := 0;
        end;

        @Func := GetProcAddress(FLibHandle, Pchar('_get_statistics'));

        if not Assigned(Func) then
          raise TPinpadException.Create
            ('������� _get_statistics �� ������� � pilot_nt.dll');

        Result := Func(@FAuthAnswer);
        FLastErrorMessage := PAnsiChar(@FAuthAnswer.AMessage);
        FCheque := PAnsiChar(FAuthAnswer.Check);
        FLastError := Result;
      except
        on E: Exception do
          PinpadLog(E.Message);
//          TLogger.Error(E.Message);
      end;

    finally
      Func := nil;
    end;
  end;
end;

function TPinPad.ServiceMenu: integer;
var
  Func: TServiceMenu;
begin
  Result := -1;
  try
    try
      ClearBuffers;

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_ServiceMenu'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _ServiceMenu �� ������� � pilot_nt.dll');
      Result := Func(@FAuthAnswer);
      FCheque := PAnsiChar(FAuthAnswer.Check);
      FLastError := Result;
    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

function TPinPad.SetGUIHandles(ATextHandle, AEditHandle: HWND): integer;
var
  Func: TSetGUIHandles;
begin
  Result := -1;
  try
    try
      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_SetGUIHandles'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _SetGUIHandles �� ������� � pilot_nt.dll');

      Result := Func(ATextHandle, AEditHandle);
    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;

  finally
    Func := nil;
  end;
end;

function TPinPad.SuspendTrx(AAmount: Double; AAuthCode: string): integer;
var
  Func: TSuspendTrx;
  ASum: UINT;
begin
  Result := -1;
  try
    try
      ASum := Round(AAmount * 100);

      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_SuspendTrx'));

      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� _SuspendTrx �� ������� � pilot_nt.dll');

      if AAuthCode = '' then
        Result := Func(ASum, nil)
      else
        Result := Func(ASum, PAnsiString(AnsiString(AAuthCode)));
      FLastError := Result;
      FLastErrorMessage := GetMessageText(Result);

      if FLastError > 0 then
        PinpadLog(FLastErrorMessage);
//        TLogger.Error(FLastErrorMessage);
    except
      on E: Exception do
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
    end;
  finally
    Func := nil;
  end;
end;

function TPinPad.TestPinpad: integer;
var
  Func: TTestPinPad;
  ret:  integer;
begin
  Result := -1;
  try
    try
      if FLibHandle <= 0 then
      begin
        raise TPinpadException.Create(Format('���������� %s �� ���������',
            [LibName]));
        Exit;
      end;

      @Func := GetProcAddress(FLibHandle, Pchar('_TestPinpad'));
      if not Assigned(Func) then
        raise TPinpadException.Create
          ('������� TestPinpad �� ������� � pilot_nt.dll');

      Result := Func();
      FLastErrorMessage := GetMessageText(Result);
      FLastError := Result;

      if Result <> 0 then
        raise Exception.Create(Format('TestPinpad: %d. %s',
            [Result, GetMessageText(Result)]));
      PinpadLog(Format('TestPinpad: %d. %s', [Result, GetMessageText(Result)]));
 //       TLogger.Error(Format('TestPinpad: %d. %s', [Result, GetMessageText(Result)]));
    except
      on E: Exception do
      begin
        PinpadLog(E.Message);
//        TLogger.Error(E.Message);
        FLastErrorMessage := E.Message;
      end;
    end;

  finally
    Func := nil;
  end;
end;

end.
