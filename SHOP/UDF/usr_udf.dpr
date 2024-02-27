library usr_udf;

uses SysUtils, Variants;
{
DECLARE EXTERNAL FUNCTION OKR2
  DOUBLE PRECISION
  RETURNS DOUBLE PRECISION BY VALUE
  ENTRY_POINT 'okr_2dig'
  MODULE_NAME 'USR_UDF.DLL';
}

function okr_2dig(var X: Double): Double; cdecl; export;
var s: string;
begin
  s:= FloatToStrF(X, ffFixed, 12, 3);
  if StrToInt(s[Pos(',', s) + 3]) = 5 then
    if X >= 0 then X:= X + 0.001
    else X:= X - 0.001;
  result:= Round(X * 100) / 100;
end;

{
DECLARE EXTERNAL FUNCTION NULL2ZERO
  DOUBLE PRECISION
  RETURNS DOUBLE PRECISION BY VALUE
  ENTRY_POINT 'null_2zero'
  MODULE_NAME 'USR_UDF.DLL';
}

function null_2zero(var X: Double): Double; cdecl; export;
begin
  if VarIsNull(X)then result:= 0
  else result:= X;
end;

{
DECLARE EXTERNAL FUNCTION TRUNCSTRING
  VARCHAR(20), INTEGER, INTEGER
  RETURNS VARCHAR(20) BY VALUE
  ENTRY_POINT 'trunc_str'
  MODULE_NAME 'USR_UDF.DLL';
}

function trunc_str(var STR: String; START, COUNT: Integer): String; cdecl; export;
begin
  result:= Copy(STR, START, COUNT);
end;

exports
  okr_2dig,
  null_2zero,
  trunc_str;

begin
  System.IsMultiThread:= True;
end.



