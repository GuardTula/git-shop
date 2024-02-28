{ *************************************************************** }
{ ��������� "������������" (�� ������� ���� �������������� �����) }
{ ��������� ����� ��������� ��� �������� ����� � �� ���������     }
{ �������������, ����������� � ���� �� ���������� ������� �����   }
{ (����� ������).                                                 }
{                        �������� �������� (FidoNet: 2:5055/34.3) }
{ Freeware VCL Freeware VCL Freeware VCL Freeware VCL Freeware VCL}
{ *************************************************************** }

{ ������� ����������� �����������...

  ��������� �����������:
   -� SourceStr ����� ���������� �������� ����� � ���� ����������������
    ������ (� ������������� �����, ������� ����� � �.�.), ��� ������ �������
    ������������� ���������� � ������������ TQrExpr.OnPrint QuickReport'�,
    �������� ������������� ����������� � TQrEvResult;
   -����������� � ���������� ������ ����� ��������������� � ��������� Delphi,
    �.�. ���������� �������� ������������������ � Caption ������
    ���������� (�� ������ TLabel), ���������� � �������� LinkControl;
   -���������� �������������� �������� � ��������� �������, ������� �����
    ������������ �������� (� �������������� ����) ��� ����������� ������
    ����������.
  ��������� ����������:
   -�������� ������������ ����������� ������ �������� ���� ��� ����� �����
    ����� � ������ �������� ��� �������, �.�. ��������� ��������� "�������"
    ��� ��������� �������� ������;
   -��� ������������ ������ ������� �������������� ����� ���������� �
    ��������� �������� ���� ������ ��� �������������� ����� "�����" �
    "�������", �� ������ ������ ���� ���������� � ��������� Prefix � Postfix;

  ��������� ���������� ������������ ��������� �������� ��������������,
  ���� ����������, �� ������ ��������� ����.

  ������� �������� ������� (properties):
    LinkControl: TControl - ����� ��������� TControl, � Caption ��������
                            �� ����������� ����� ���������� �����;
    SourceStr: String - �������� ����� � ���� ���������������� ������;
    SourceNum: Extended - �������� ����� � ���� ������������� �����;
    VerbalNum: String - ��������� �������� � ��������� �������������;
    OutRubKop: TOutRubKop - �������� ������ (�� ������) ���./���.;
    property ShowKop: TShowKop - ����� ������ ��������� ������ ���.;
    property UpCaseFirstChar: Boolean - ���������� �� ������ ����� ������
                                        � ������� �������;
    Prefix: String - ���. �����, ������������� �������;
    property Postfix: String - ���. �����, ������������� �����;

 ���������� �� D3, ����� ����������� ������� ������ � ������� Samples,
 ����� ��������� - ������ ������...
                                                         ����.
}

unit VerbSumm;

interface

uses
  Classes, Controls, SysUtils;

type
  TOutRubKop = (orkNone, orkShort, orkFull);
  TShowKop = (skNone, skYes, skAuto);

  TMoneyStr = class(TComponent)
  private
    FSourceNum: Extended;
    FSourceStr: String;
    FVerbalNum: String;
    FOutRubKop: TOutRubKop;
    FShowKop: TShowKop;
    FPrefix: String;
    FPostfix: String;
    FUpCaseFirstChar: Boolean;
    FLinkControl: TControl;
    procedure SetSourceNum(Value: Extended);
    procedure SetSourceStr(Value: String);
    procedure SetOutRubKop(Value: TOutRubKop);
    procedure SetShowKop(Value: TShowKop);
    procedure SetUpCaseFirstChar(Value: Boolean);
    procedure SetPrefix(Value: String);
    procedure SetPostfix(Value: String);
    procedure SetLinkControl(Value: TControl);
    procedure UpdateLinkControl;
    procedure Recalc;
    procedure Notification(AComponent: TComponent;Operation: TOperation); override;
    function GetVerbalNum: String;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property LinkControl: TControl read FLinkControl write SetLinkControl;
    property SourceStr: String read FSourceStr write SetSourceStr;
    property SourceNum: Extended read FSourceNum write SetSourceNum stored False;
    property VerbalNum: String read GetVerbalNum write FVerbalNum stored False;
    property OutRubKop: TOutRubKop read FOutRubKop write SetOutRubKop default orkShort;
    property ShowKop: TShowKop read FShowKop write SetShowKop default skAuto;
    property UpCaseFirstChar: Boolean read FUpCaseFirstChar write SetUpCaseFirstChar default True;
    property Prefix: String read FPrefix write SetPrefix;
    property Postfix: String read FPostfix write SetPostfix;
  end;

{ ���������� ������� �������������� ����� � ������.
  ����� ������������ �������� �� ����������.
' ���������: 1-�����
'            2-����� ���.���.: 0-���;1-����������;2-���������
'            3-�������:        0-���;1-����;2-����
'            4-������ ����� � ������� �������: False-���;True-��
}
function VerbalSum(Sm: Extended; P_s, Cop: Integer; UpCaseFirstChar: Boolean): String;

implementation
uses TypInfo;

{ ������� ��� ������� Chr � ������ S }
function DelChars(const S: string; Chr: Char): string;
var
  I: Integer;
begin
  Result := S;
  for I := Length(Result) downto 1 do begin
    if Result[I] = Chr then Delete(Result, I, 1);
  end;
end;

{ ������� ���, ��� ������ ���������� ����� }
function DelFracPart(Value: String): String;
begin
  if Pos(FormatSettings.DecimalSeparator,Value) <> 0 then
    Result := Copy(Value,0,Pos(FormatSettings.DecimalSeparator,Value)-1)
  else Result := Value;
end;

{ ��������� ������ ��, ��� ������ ���������� ����� }
function GetFracPart(Value: String): String;
begin
  if Pos(FormatSettings.DecimalSeparator,Value) <> 0 then
    Result := Copy(Value,Pos(FormatSettings.DecimalSeparator,Value)+1,Length(Value)-Pos(FormatSettings.DecimalSeparator,Value))
  else Result := '';
end;

{ ������� ������� �������������� (�������� ����������� �����) }
function DelFormatSymbol(Value: String): String;
var
  I: Integer;
begin
  Result := Value;
  for I := Length(Result) downto 1 do begin
    if not (Result[I] in ['1','2','3','4','5','6','7','8','9','0']) then
      Delete(Result, I, 1);
  end;
end;

{ � ����� ��� PAF ������... }
function PropertyByName(Component: TComponent; const PropName: string): PPropInfo;
var
  PropInfo: PPropInfo;
begin
  Result := nil;
  PropInfo := GetPropInfo(Component.ClassInfo, PropName);
  if Assigned(PropInfo){��� �������� ����} and
    ((PropInfo^.PropType^.Kind = tkString) or
     (PropInfo^.PropType^.Kind = tkLString) or
     (PropInfo^.PropType^.Kind = tkWString){������� ����}) then
  Result:=PropInfo;
end;

constructor TMoneyStr.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOutRubKop:=orkShort;
  FShowKop:=skAuto;
  FUpCaseFirstChar:=True;
  Recalc;
end;

procedure TMoneyStr.SetSourceNum(Value: Extended);
begin
  SetSourceStr(FloatToStr(Value));
end;

procedure TMoneyStr.SetSourceStr(Value: String);
begin
  FSourceStr:=Value;
  Recalc;
  UpdateLinkControl;
end;

procedure TMoneyStr.SetOutRubKop(Value: TOutRubKop);
begin
  FOutRubKop:=Value;
  Recalc;
  UpdateLinkControl;
end;

procedure TMoneyStr.SetShowKop(Value: TShowKop);
begin
  FShowKop:=Value;
  Recalc;
  UpdateLinkControl;
end;

procedure TMoneyStr.SetPrefix(Value: String);
begin
  FPrefix:=Value;
  UpdateLinkControl;
end;

procedure TMoneyStr.SetPostfix(Value: String);
begin
  FPostfix:=Value;
  UpdateLinkControl;
end;

procedure TMoneyStr.SetUpCaseFirstChar(Value: Boolean);
begin
  FUpCaseFirstChar:=Value;
  Recalc;
  UpdateLinkControl;
end;

procedure TMoneyStr.SetLinkControl(Value: TControl);
begin
  FLinkControl:=Value;
  if Value <> nil then
  begin
    Value.FreeNotification(Self);
    UpdateLinkControl;
  end;
end;

procedure TMoneyStr.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FLinkControl) then
    FLinkControl := nil;
end;

function TMoneyStr.GetVerbalNum: String;
begin
  Result:=FPrefix+FVerbalNum+FPostFix;
end;

procedure TMoneyStr.UpdateLinkControl;
var
  PropInfo: PPropInfo;
begin
  if Assigned(FLinkControl) then
  begin
    PropInfo := GetPropInfo(FLinkControl.ClassInfo,'Caption');
    if Assigned(PropInfo){��� �������� ����} and
      ((PropInfo^.PropType^.Kind = tkString) or
       (PropInfo^.PropType^.Kind = tkLString) or
       (PropInfo^.PropType^.Kind = tkWString){������� ����}) then
      SetStrProp(FLinkControl,PropInfo,VerbalNum);
  end;
end;

{ ������� "�������� ������" � ������ ���������� �������������� }
procedure TMoneyStr.Recalc;
var
  SIntPart: String;
  SFracPart: String;
begin
  SIntPart:=DelFormatSymbol(DelFracPart(FSourceStr));
  SFracPart:=DelFormatSymbol(GetFracPart(FSourceStr));

  FSourceNum:=StrToFloat(SIntPart+FormatSettings.DecimalSeparator+SFracPart);
  FVerbalNum:=
    VerbalSum(FSourceNum,ord(FOutRubKop),ord(FShowKop),FUpCaseFirstChar);
end;

//****************************************************************************//
// ��, ��� ���� ��������� � ���������� ������� �������������� ����� � ������ //
//****************************************************************************//

// �������� ��������� ������� Visual Basic'� //
//function Iif(bVal: Boolean; Res1,Res2: Variant): Variant;
function Iif(bVal: Boolean; Res1,Res2: String): String;
begin
  if bVal then
    Result:=Res1
  else
    Result:=Res2;
end;

function MidD(S: string; Index, Count: Integer): String;
begin
  Result:=Copy(S,Index,Count);
end;

function RightD(S: string; Count: Integer): String;
begin
  Result:=Copy(S,Length(S)-Count+1,Count);
end;

function LeftD(S: string; Count: Integer): String;
begin
  Result:=Copy(S,1,Count);
end;

function StringD(Count: Integer; Mask: String): String;
begin
  Result:='';
  while Count > 0 do
  begin
    Result:=Result+Mask;
    Dec(Count);
  end;
end;

// ��������� ��� ������������ ������������ //
const
  ChooseArr1: array[0..9] of String = ('','��� ','������ ','������ ','��������� ','������� ','�������� ','������� ','��������� ','��������� ');
  ChooseArr2: array[0..10] of String = ('','������ ','����������� ','���������� ','���������� ','������������ ','���������� ','����������� ','���������� ','������������ ','������������ ');
  ChooseArr3: array[0..9] of String = ('','������ ','�������� ','�������� ','����� ','��������� ','���������� ','��������� ','����������� ','��������� ');
  ChooseArr4: array[0..9] of String = ('','��','��','��� ','������ ','���� ','����� ','���� ','������ ','������ ');
  ChooseArr5: array[0..3] of String = ('','�������','��������','��������');

{ ���������� ������� �������������� ����� � ������.
  ����� ������������ �������� �� ����������.
  �������� ����������� �� Visual Basic'�, ��� ������
  ������� �� ���������. ���� ���� ������� - ������
  ����������� � �'��������������.
' ���������: 1-�����
'            2-����� ���.���.: 0-���;1-����������;2-���������
'            3-�������:        0-���;1-����;2-����
'            4-������ ����� � ������� �������: False-���;True-��
}
function VerbalSum(Sm: Extended; P_s, Cop: Integer; UpCaseFirstChar: Boolean): String;
var
  Smt,smti,out1: String;
  im,zt,z2,z3,i,j: Integer;
begin
  z2:=0; z3:=0;
  Smt:=IntToStr(Trunc(Sm));
  im:=(Length(Smt)+2) div 3;
  Smt:=StringD(im*3-Length(Smt),'0')+FloatToStr(Sm);
  for i:=1 to im do
  begin
    smti:=MidD(Smt,3*i-2,3);
    z2:=StrToInt(MidD(smti,2,1));
    z3:=StrToInt(RightD(smti,1));
    for j:=1 to 3 do
    begin
      zt:=StrToInt(MidD(smti,j,1));
      case j of
        1: out1:=out1+ChooseArr1[zt];
        2: if z2 = 1 then
             out1:=out1+ChooseArr2[z3 + 1]
           else
             out1:=out1+ChooseArr3[zt];
        3: if z2 <> 1 then
           begin
             out1:=out1+ChooseArr4[zt];
             case zt of
               1: out1:=out1+Iif((im-i) = 1,'�� ','�� ');
               2: out1:=out1+Iif((im-i) = 1,'� ','� ');
             end;
           end;
      end;
    end;
    case im-i of
      1: out1:=out1+Iif(StrToInt(smti) <> 0,'�����'+Iif((z3 = 0) or (z3 > 4) or (z2 = 1),' ',Iif((z3 > 1) and (z3 < 5),'� ','� ')),'');
      2,3,4: out1:=out1+Iif(StrToInt(smti) <> 0,ChooseArr5[im-1-i]+Iif((z3 = 0) or (z3 > 4) or (z2 = 1),'�� ',Iif((z3 > 1) and (z3 < 5),'� ',' ')),'');
    end;
  end;
  if out1 = '' then out1:='���� ';
  if P_s > 0 then out1:=out1+Iif(P_s = 1, '���.', '����' + Iif((z3 = 0) or (z3 > 4) or (z2 = 1), '��', Iif((z3 > 1) and (z3 < 5), '�', '�')));
  smti:=FormatFloat('00',(Sm - Int(Sm))*100);
  if ((P_s > 0) and (Cop = 1)) or ((P_s > 0) and (Cop = 2) and (smti <> '00')) then
  begin
    z2:=StrToInt(LeftD(smti,1));
    z3:=StrToInt(RightD(smti,1));
    out1:=out1+' '+smti+Iif(P_s = 1,' ���.',' ����'+Iif((z3 = 0) or (z3 > 4) or (z2 = 1),'��',Iif((z3 > 1) and (z3 < 5),'���','���')));
  end;
  if UpCaseFirstChar and (Length(out1) > 0) then
    out1[1]:=AnsiUpperCase(out1)[1];
  Result:=out1;
end;

end.
